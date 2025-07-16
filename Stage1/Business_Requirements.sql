-- Count records in each table
SELECT 'Centers' AS Table_Name, COUNT(*) AS Row_Count FROM lms_raw.Centers
UNION ALL
SELECT 'Cohort_Schedule', COUNT(*) FROM lms_raw.Cohort_Schedule
UNION ALL
SELECT 'Student_Status', COUNT(*) FROM lms_raw.Student_Status
UNION ALL
SELECT 'Change_Requests', COUNT(*) FROM lms_raw.Change_Requests
UNION ALL
SELECT 'Change_New_Joiners', COUNT(*) FROM lms_raw.Change_New_Joiners
UNION ALL
SELECT 'Cohort_Assignment', COUNT(*) FROM lms_raw.Cohort_Assignment
UNION ALL
SELECT 'Attendance_Records', COUNT(*) FROM lms_raw.Attendance_Records;



-- ******************************  Summary Tables ****************************** --

-- Total_Students
 SELECT COUNT(DISTINCT StudentID) AS Total_Students
FROM temp_cohort_Assignment
WHERE cohort_status IN ('Enrolled', 'In-Progress');

-- Withdrawal Percentage
SELECT 
    CONCAT(ROUND((withdrawn_students * 100.0 / total_students), 2), ' %') AS Withdrawal_Percentage
FROM (
    SELECT 
        COUNT(CASE WHEN cohort_status = 'Withdraw' THEN 1 END) AS withdrawn_students,
        COUNT(*) AS total_students
    FROM temp_cohort_Assignment
) AS subquery;

-- Completed_Percentage
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN cohort_status = 'Completed' THEN 1 END) * 100.0 / COUNT(*)), 2), ' %') AS Completed_Percentage
FROM temp_cohort_Assignment;
  
 -- Attendance Percentage   
SELECT  
  CONCAT(ROUND(COUNT(DISTINCT StudentID) * 100.0 / (SELECT COUNT(DISTINCT StudentID) FROM cleaned_Attendance_Records),2),'%') AS Regular_Attendance_Percentage  
FROM  
    (  
        SELECT  
            StudentID,  
            (SUM(CASE WHEN attendance_flag = 'P' THEN 1 ELSE 0 END) * 100.0 / COUNT(dates)) AS Attendance_Percentage  
        FROM cleaned_Attendance_Records  
        GROUP BY StudentID  
        HAVING (SUM(CASE WHEN attendance_flag = 'P' THEN 1 ELSE 0 END) * 100.0 / COUNT(dates)) >= 80  
    ) AS RegularStudents;
    
-- Enrolled Percentage
SELECT 
    CONCAT(ROUND((COUNT(CASE WHEN cohort_status = 'Enrolled' THEN 1 END) * 100.0 / COUNT(*)), 2), ' %') AS Enrolled_Percentage
FROM temp_cohort_Assignment;