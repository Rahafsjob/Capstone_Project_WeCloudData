/* ************************************************************************************************* 
                                  lms_raw Database
************************************************************************************************* */ 

SHOW DATABASES;
CREATE DATABASE lms_raw;

USE lms_raw;

SET GLOBAL local_infile = 'ON';

/*
****************************** Centers ******************************
*/

DROP TABLE IF EXISTS Centers;
CREATE TABLE Centers(
	CenterID VARCHAR(10) NOT NULL
);
TRUNCATE Centers;
LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Centers.csv"
INTO TABLE Centers
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT *
FROM Centers;

/*
****************************** Cohort_Schedule ******************************
*/

DROP TABLE IF EXISTS Cohort_Schedule;
CREATE TABLE Cohort_Schedule (
    level INT,
    name VARCHAR(255),
    cohort VARCHAR(50),
    start_date VARCHAR(100),
    end_date VARCHAR(100),
    dependency VARCHAR(255),
    cohort_full_info VARCHAR(255),
    start_date_dateformat VARCHAR(100),
    end_date_dateformat VARCHAR(100)
);
TRUNCATE Cohort_Schedule;

LOAD DATA LOCAL INFILE 'C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Cohort Schedule.tsv'
INTO TABLE Cohort_Schedule
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;
    
SELECT * 
FROM Cohort_Schedule;

/*
****************************** Student_Status ******************************
*/

DROP TABLE IF EXISTS Student_Status;
CREATE TABLE Student_Status (
    StudentID VARCHAR(10) NOT NULL,
    CenterID VARCHAR(10) NOT NULL,
    target_level VARCHAR(10) NOT NULL
);
TRUNCATE Student_Status;
LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Student Status.csv"
INTO TABLE Student_Status
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * 
FROM Student_Status;

/*
****************************** Change_Requests ******************************
*/

DROP TABLE IF EXISTS Change_Requests;
CREATE TABLE Change_Requests (
    StudentID VARCHAR(20) NOT NULL,
    CenterID VARCHAR(20) NOT NULL,
    Level VARCHAR(50),
    Course_Name VARCHAR(100),
    Previous_Cohort VARCHAR(50),
    Request_Date VARCHAR(100),
    Request_Type VARCHAR(50),
    Rescheduled_Cohort VARCHAR(50),
    Withdrawal_Reason VARCHAR(100)
);

LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Change Requests.tsv"
INTO TABLE Change_Requests
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Change_Requests;

/*
****************************** Change_New_Joiners ******************************
*/

DROP TABLE IF EXISTS Change_New_Joiners;
CREATE TABLE Change_New_Joiners (
    StudentID VARCHAR(10) NOT NULL,
    CenterID VARCHAR(10) NOT NULL,
    title VARCHAR(100),
    DateAdded VARCHAR(100),
    Type VARCHAR(50)
);
TRUNCATE Change_New_Joiners;
LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Change New Joiners.csv"
INTO TABLE Change_New_Joiners
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 LINES;

SELECT * 
FROM Change_New_Joiners;

/*
****************************** Cohort_Assignment ******************************
*/

DROP TABLE IF EXISTS Cohort_Assignment;

CREATE TABLE Cohort_Assignment (
    studentID VARCHAR(50),
    centerID VARCHAR(50),
    level VARCHAR(50),
    name VARCHAR(100),
    cohort VARCHAR(50),
    start_date VARCHAR(100),
    end_date VARCHAR(100),
    cohort_schedule VARCHAR(100),
    cohort_status VARCHAR(50),
    enrolment_confirmation VARCHAR(50),
    withdraw_reason1 VARCHAR(100),
    withdraw_reason2 VARCHAR(100),
    level_status_calculated VARCHAR(50),
    new_joiner VARCHAR(50),
    level_graduation_indicator VARCHAR(50),
    attendance_rate VARCHAR(50),
    quiz_complete VARCHAR(50),
    project_submit VARCHAR(50)
);

LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Stage 1 Data/Cohort Assignment.tsv"
INTO TABLE Cohort_Assignment
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

/*
****************************** Attendance_Records ******************************
*/

DROP TABLE IF EXISTS Attendance_Records;
CREATE TABLE Attendance_Records (
    studentid VARCHAR(20),
    name VARCHAR(255),
    dates VARCHAR(50),
    cohort VARCHAR(255),
    attendance_flag CHAR(1)
);

-- Load data into the table
LOAD DATA LOCAL INFILE "C:/Bootcamb_stage1and2/Phase_One1_01_Capstone_Project_Stage_1__rawData (StudentVersion)/Attendance.csv"
INTO TABLE Attendance_Records
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

SELECT * FROM Attendance_Records;
