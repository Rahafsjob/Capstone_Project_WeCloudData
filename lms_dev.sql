/* ************************************************************************************************* 
                                  lms_dev Database
************************************************************************************************* */ 
DROP DATABASE IF EXISTS lms_dev;
CREATE DATABASE lms_dev;
USE lms_dev;

-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;

/*
****************************** Attendance_Records ******************************
*/
DROP TABLE IF EXISTS cleaned_Attendance_Records;
CREATE TABLE cleaned_Attendance_Records LIKE lms_raw.Attendance_Records;

INSERT INTO cleaned_Attendance_Records
SELECT * FROM lms_raw.Attendance_Records;

ALTER TABLE cleaned_Attendance_Records
MODIFY COLUMN dates DATE;

DESCRIBE cleaned_Attendance_Records;
SELECT * FROM cleaned_Attendance_Records;

ALTER TABLE cleaned_Attendance_Records 
ADD COLUMN level VARCHAR(50),
ADD COLUMN Total_Present INT DEFAULT 0,
ADD COLUMN Total_Absent INT DEFAULT 0,
ADD COLUMN attendance_percentage DECIMAL(5,2);

-- Disable safe update mode
SET SQL_SAFE_UPDATES = 0;


UPDATE cleaned_Attendance_Records ar
JOIN (
    SELECT ca.name, ca.cohort, MAX(ca.level) AS max_level
    FROM lms_raw.Cohort_Assignment ca
    GROUP BY ca.name, ca.cohort
) ca_max ON ar.name = ca_max.name AND ar.cohort = ca_max.cohort
SET ar.level = ca_max.max_level;

select* from cleaned_Attendance_Records;


-- Update specific course level
UPDATE cleaned_Attendance_Records
SET level = 'L2'
WHERE name = 'Generative AI Introduction & Large Language Model Introduction';

UPDATE cleaned_Attendance_Records
SET attendance_flag = TRIM(REPLACE(attendance_flag, '"', ''));



UPDATE cleaned_Attendance_Records
SET attendance_flag = 'L'
WHERE studentid = 'Stud0080' AND (name = 'Generative AI Introduction & Large Language Model Introduction' AND cohort = 'C4');

SELECT DISTINCT attendance_flag FROM cleaned_Attendance_Records;

-- Calculate attendance summary
UPDATE cleaned_Attendance_Records ar
JOIN (
    SELECT 
        studentid,
        SUM(attendance_flag = 'P') AS Total_Present,
        SUM(attendance_flag = 'X') AS Total_Absent,
        ROUND(SUM(attendance_flag = 'P') / COUNT(*) * 100, 2) AS attendance_percentage
    FROM lms_raw.Attendance_Records
    GROUP BY studentid
) attendance_summary
ON ar.studentid = attendance_summary.studentid
SET ar.Total_Present = attendance_summary.Total_Present,
    ar.Total_Absent = attendance_summary.Total_Absent,
    ar.attendance_percentage = attendance_summary.attendance_percentage;
    
SELECT * FROM cleaned_Attendance_Records;

-- create index
CREATE INDEX idx_studentID ON cleaned_Attendance_Records(studentid);
-- example
SELECT * FROM cleaned_Attendance_Records 
FORCE INDEX (idx_studentID) 
WHERE studentid = 'Stud0186';
-- create index
CREATE INDEX idx_name_level_dates 
ON cleaned_Attendance_Records(name, level, dates);
-- example
SELECT * FROM cleaned_Attendance_Records 
FORCE INDEX (idx_name_level_dates)
WHERE name = 'Python Fundamentals' 
AND level = 'L2' 
AND dates = '2024-01-15';
-- create index
CREATE INDEX idx_attendance_flag ON cleaned_Attendance_Records(attendance_flag);
-- example
SELECT COUNT(*) FROM cleaned_Attendance_Records 
FORCE INDEX (idx_attendance_flag)
WHERE attendance_flag = 'P';

-- Re-enable safe update mode
SET SQL_SAFE_UPDATES = 1;

SELECT * FROM cleaned_Attendance_Records;

/*
****************************** Student_Status ******************************
*/

CREATE VIEW cleaned_student_status AS
SELECT DISTINCT 
    StudentID, 
    CenterID, 
    CONCAT('L', MAX(CAST(Target_Level AS SIGNED))) AS Target_Level  
FROM (
    SELECT
        StudentID,
        CenterID,
        CASE
            WHEN LOWER(Target_Level) LIKE '%3_only%' OR LOWER(Target_Level) LIKE '%only_3%' THEN '3'
            WHEN TRIM(Target_Level) REGEXP '^[0-9]+\\.[0-9]+$' THEN CAST(Target_Level AS UNSIGNED)
            WHEN TRIM(Target_Level) REGEXP '^[0-9]+$' THEN CAST(Target_Level AS SIGNED)
            ELSE NULL
        END AS Target_Level
    FROM lms_raw.student_status
    UNION ALL
    SELECT StudentID, CenterID, CAST(TRIM(SUBSTRING_INDEX(Target_Level, '+', 1)) AS SIGNED) AS Target_Level
    FROM lms_raw.student_status
    WHERE Target_Level LIKE '%+%'
    UNION ALL
    SELECT StudentID, CenterID, CAST(TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(Target_Level, '+', -2), '+', 1)) AS SIGNED) AS Target_Level
    FROM lms_raw.student_status
    WHERE Target_Level LIKE '%+%'
    UNION ALL
    SELECT StudentID, CenterID, CAST(TRIM(SUBSTRING_INDEX(Target_Level, '+', -1)) AS SIGNED) AS Target_Level
    FROM lms_raw.student_status
    WHERE Target_Level LIKE '%+%'
    UNION ALL
    SELECT StudentID, CenterID, 1
    FROM lms_raw.student_status
    WHERE Target_Level IS NULL OR Target_Level = '' OR Target_Level = CHAR(13)
    UNION ALL
    SELECT StudentID, CenterID, 2
    FROM lms_raw.student_status
    WHERE Target_Level IS NULL OR Target_Level = '' OR Target_Level = CHAR(13)
) AS temp_table
WHERE Target_Level IS NOT NULL
GROUP BY StudentID, CenterID;

SELECT * FROM cleaned_student_status;

/*
****************************** change_new_joiners ******************************
*/

CREATE VIEW cleaned_change_new_joiners AS
WITH date_conversion AS (
    SELECT 
        studentid,
        centerid,
        title AS job_title,
        type,
        CASE 
            WHEN dateadded LIKE '%/%/%' THEN 
                STR_TO_DATE(dateadded, '%m/%d/%Y')
            ELSE 
                NULL 
        END AS converteddate
    FROM lms_raw.change_new_joiners
),
deduplicated_data AS (
    SELECT DISTINCT
        studentid,
        centerid,
        CASE
            WHEN job_title IS NULL OR job_title = '' 
            THEN 'doesn’t have a job'
            ELSE LOWER(job_title)
        END AS job_title,
        converteddate,
        CASE
            WHEN type LIKE '%L1 > L2%L3%' THEN 'up: L1 to L2 or L3'  
            WHEN type LIKE '%L2 > L3%' THEN 'up: L2 to L3'         
            ELSE 'new joiner'
        END AS type
    FROM date_conversion
)
SELECT 
    studentid,
    centerid,
    job_title,
    DATE_FORMAT(converteddate, '%Y-%m-%d') AS dateadded,
    type
FROM deduplicated_data
ORDER BY centerid;

SELECT * FROM cleaned_change_new_joiners;

/*
****************************** change_requests ******************************
*/

DROP view IF EXISTS Cleaned_change_requests ;
 CREATE VIEW Cleaned_change_requests AS
SELECT 
    TRIM(StudentID) AS StudentID,  
    TRIM(CenterID) AS CenterID,  
    TRIM(Level) AS Level,  
    TRIM(Course_Name) AS Course_Name,  
    TRIM(Previous_Cohort) AS Previous_Cohort,  
	DATE_FORMAT(STR_TO_DATE(NULLIF(Request_Date, ''), '%m/%d/%Y'), '%m/%d/%Y') AS Request_Date  , 

    CASE
        WHEN StudentID = 'Stud0311' AND Previous_Cohort IN ('C7', 'C6') AND Request_Type = 'Need rescheduling' 
        THEN 'Need to withdraw' 
        ELSE TRIM(Request_Type)   END AS Request_Type,
      CASE 
    when Rescheduled_Cohort ='""' then '  ' else Rescheduled_Cohort end as Rescheduled_Cohort ,
    CASE
    WHEN LOWER(TRIM(Withdrawal_Reason)) LIKE '%workload%'  
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%too busy%'  
     THEN 'Workload'  

    WHEN LOWER(TRIM(Withdrawal_Reason)) LIKE '%c4 conflicting with vacation%' 
     OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%attend%' 
     OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%requested to be pushed%'
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%assigned wrongly%'  
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%skip%'   
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%finish before leave%'  
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%Wants%'  
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%in%'   
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%with%'  
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%part of%'  
         OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%confirm%' 
        OR LOWER(TRIM(Withdrawal_Reason)) LIKE '%sick leave%' THEN 'Left (Other Reasons)'  

    WHEN LOWER(TRIM(Withdrawal_Reason)) LIKE '%left unit%' THEN 'Left Company'  
    ELSE 'No Reason Mentioned'  
END AS Withdrawal_Reason
from lms_raw.change_requests
 WHERE 
    NOT (StudentID LIKE '%110%')  
    and trim(lower(Request_Type)) <> 'Fix Wrong Path' Order by StudentID;
select * from  Cleaned_change_requests;

/*
****************************** cohort_Assignment ******************************
*/

DROP TABLE IF EXISTS Cleaned_Cohort_Assignment;

CREATE  TABLE Cleaned_Cohort_Assignment LIKE lms_raw.Cohort_Assignment;

-- Insert data into the temporary table
INSERT INTO Cleaned_Cohort_Assignment SELECT * FROM lms_raw.Cohort_Assignment;

-- Remove unnecessary columns
ALTER TABLE Cleaned_Cohort_Assignment
DROP COLUMN cohort_schedule,
DROP COLUMN enrolment_confirmation,
DROP COLUMN attendance_rate,
DROP COLUMN quiz_complete,
DROP COLUMN project_submit;


SET SQL_SAFE_UPDATES = 0;

-- Clean empty values in withdrawal reasons
UPDATE Cleaned_Cohort_Assignment
SET withdraw_reason1 = NULL
WHERE withdraw_reason1 = '' OR withdraw_reason1 = '""';

UPDATE Cleaned_Cohort_Assignment
SET withdraw_reason2 = NULL
WHERE withdraw_reason2 = '' OR withdraw_reason2 = '""';

-- Convert date formats
UPDATE Cleaned_Cohort_Assignment
SET start_date = STR_TO_DATE(start_date, '%d-%b-%Y'),
    end_date = STR_TO_DATE(end_date, '%d-%b-%Y');

-- Trim data to remove extra spaces
UPDATE Cleaned_Cohort_Assignment
SET 
    studentID = TRIM(studentID),
    centerID = TRIM(centerID),
    level = TRIM(level),
    name = TRIM(name),
    start_date = TRIM(start_date),
    end_date = TRIM(end_date),
    level_status_calculated = TRIM(level_status_calculated);
    
-- Format text to capitalize the first letter of each word
SELECT  
    TRIM(REGEXP_REPLACE(cohort, '(^|\s)([a-z])', UPPER('$1$2'))) AS cleaned_cohort,
    TRIM(REGEXP_REPLACE(cohort_status, '(^|\s)([a-z])', UPPER('$1$2'))) AS cleaned_cohort_status,
    TRIM(REGEXP_REPLACE(withdraw_reason1, '(^|\s)([a-z])', UPPER('$1$2'))) AS cleaned_withdraw_reason1,
    TRIM(REGEXP_REPLACE(withdraw_reason2, '(^|\s)([a-z])', UPPER('$1$2'))) AS cleaned_withdraw_reason2,
    TRIM(REGEXP_REPLACE(new_joiner, '(^|\s)([a-z])', UPPER('$1$2'))) AS cleaned_new_joiner,
    TRIM(UPPER(level_graduation_indicator)) AS cleaned_level_graduation_indicator
FROM Cleaned_Cohort_Assignment;

-- Identify the last course for each student at each level
WITH LastCourse AS (
    SELECT 
        studentID, 
        level, 
        cohort,
        MAX(end_date) AS last_end_date
    FROM Cleaned_Cohort_Assignment
    GROUP BY studentID, level, cohort
)

-- Determine the final status of each student
SELECT 
    c.studentID,
    c.level,
    c.cohort,
    c.cohort_status,
    c.end_date,
    CASE 
        WHEN c.level = lc.level 
         AND c.cohort = lc.cohort 
         AND c.end_date = lc.last_end_date 
         AND c.cohort_status IN ('Withdraw', 'Skipped') THEN 4
        
        WHEN c.level = lc.level 
         AND c.cohort = lc.cohort 
         AND c.end_date = lc.last_end_date 
         AND c.cohort_status = 'Completed' THEN 5
        
        WHEN c.cohort_status IN ('Withdraw', 'Skipped') THEN 1
        WHEN c.cohort_status = 'Enrolled' THEN 2
        WHEN c.cohort_status IN ('Failed', 'In-Progress', 'Completed') THEN 3
        ELSE NULL
    END AS level_status_calculated_2
FROM Cleaned_Cohort_Assignment c
LEFT JOIN LastCourse lc 
    ON c.studentID = lc.studentID 
    AND c.level = lc.level 
    AND c.cohort = lc.cohort;

ALTER TABLE Cleaned_Cohort_Assignment ADD COLUMN level_status_calculated_2 INT;

-- Check the total number of records
SELECT COUNT(*) AS total_rows FROM Cleaned_Cohort_Assignment;

-- Count students who withdrew
SELECT COUNT(*) AS withdraw_count 
FROM lms_raw.Cohort_Assignment
WHERE cohort_status = 'Withdraw';


-- index
SELECT * FROM Cleaned_Cohort_Assignment
FORCE INDEX (idx_studentID) 
WHERE studentID = 'Stud0186';

-- create index
-- example
SELECT * FROM Cleaned_Cohort_Assignment
FORCE INDEX (idx_level_cohort_enddate)
WHERE level = 'L2' 
AND cohort = 'C4'
AND cohort_status ='Completed' ;

WITH LastCourse AS (
    SELECT 
        studentID, 
        level, 
        cohort,
        MAX(end_date) AS last_end_date
    FROM Cleaned_Cohort_Assignment
    GROUP BY studentID, level, cohort
)
UPDATE Cleaned_Cohort_Assignment c
LEFT JOIN LastCourse lc 
    ON c.studentID = lc.studentID 
    AND c.level = lc.level 
    AND c.cohort = lc.cohort
SET c.level_status_calculated_2 = 
    CASE 
        WHEN c.level = lc.level 
         AND c.cohort = lc.cohort 
         AND c.end_date = lc.last_end_date 
         AND c.cohort_status IN ('Withdraw', 'Skipped') THEN 4
        
        WHEN c.level = lc.level 
         AND c.cohort = lc.cohort 
         AND c.end_date = lc.last_end_date 
         AND c.cohort_status = 'Completed' THEN 5
        
        WHEN c.cohort_status IN ('Withdraw', 'Skipped') THEN 1
        WHEN c.cohort_status = 'Enrolled' THEN 2
        WHEN c.cohort_status IN ('Failed', 'In-Progress', 'Completed') THEN 3
        ELSE NULL
    END;

SELECT * FROM Cleaned_Cohort_Assignment;

ALTER TABLE Cleaned_Cohort_Assignment DROP COLUMN level_status_calculated;
UPDATE Cleaned_Cohort_Assignment
SET level_graduation_indicator = NULL
WHERE level_graduation_indicator = '' OR level_graduation_indicator = '""';

use lms_dev;
SELECT * FROM Cleaned_Cohort_Assignment; -- dev

SELECT * FROM  lms_raw.Cohort_Assignment; -- raw 

-- **************************** cohort_schedule ********************************* --
DROP view IF EXISTS Cleaned_cohort_schedule ;
CREATE VIEW Cleaned_cohort_schedule AS
SELECT 
    level,
    name,
    cohort,
    STR_TO_DATE(start_date, "%d-%b-%Y") AS start_date,
    STR_TO_DATE(end_date, "%d-%b-%Y") AS end_date,
    CASE
        WHEN dependency = 'no-dep' THEN 'no-dep'
        WHEN dependency LIKE '%Introduction to AI%' THEN 'no-dep'
        ELSE 
            CASE 
                WHEN REGEXP_REPLACE(dependency, '^C[0-9]+-?', '') = '' 
                THEN 'no-dep' 
                ELSE REGEXP_REPLACE(dependency, '^C[0-9]+-?', '') 
            END
    END AS dependency,
    DATEDIFF(
        STR_TO_DATE(end_date, "%d-%b-%Y"),
        STR_TO_DATE(start_date, "%d-%b-%Y")
    ) AS duration_days
FROM 
    lms_raw.cohort_schedule
ORDER BY 
    level ASC;
   SELECT * FROM Cleaned_cohort_schedule;
   create table M_cohort_schedulAS_tt as
   select * from lms_dev.Cleaned_cohort_schedule;
   SELECT * FROM M_cohort_schedulAS_tt;