SHOW DATABASES;
CREATE DATABASE Atten;
USE Atten;
SET GLOBAL local_infile = 'ON';

-- Create a table to store attendances data
DROP TABLE IF EXISTS Computation_Distribution;
CREATE TABLE Computation_Distribution (
    studentid VARCHAR(50) PRIMARY KEY,
    `26-August-2024` VARCHAR(10),
    `27-August-2024` VARCHAR(10),
    `28-August-2024` VARCHAR(10),
    `29-August-2024` VARCHAR(10),
    `30-August-2024` VARCHAR(10),
    `2-September-2024` VARCHAR(10),
    `3-September-2024` VARCHAR(10),
    `4-September-2024` VARCHAR(10),
    `5-September-2024` VARCHAR(10),
    `6-September-2024` VARCHAR(10),
    `9-September-2024` VARCHAR(10),
    `10-September-2024` VARCHAR(10),
    `11-September-2024` VARCHAR(10),
    `12-September-2024` VARCHAR(10),
    `13-September-2024` VARCHAR(10),
    `16-September-2024` VARCHAR(10),
    `17-September-2024` VARCHAR(10),
    `18-September-2024` VARCHAR(10),
    `19-September-2024` VARCHAR(10),
    `20-September-2024` VARCHAR(10)
);

-- Load data from a TSV file into the Attendance table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Computation Distribution - Cohort 1.tsv"
INTO TABLE Computation_Distribution
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

ALTER TABLE Computation_Distribution
ADD COLUMN name VARCHAR(255) DEFAULT 'Computation Distribution',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';


SELECT * FROM Computation_Distribution;

-- Drop the table if it already exists
DROP TABLE IF EXISTS Computer_Vision;

-- Create the Computer_Vision table
CREATE TABLE Computer_Vision (
    studentid VARCHAR(50) PRIMARY KEY,
    `10-June-2024` VARCHAR(10),
    `11-June-2024` VARCHAR(10),
    `12-June-2024` VARCHAR(10),
    `13-June-2024` VARCHAR(10),
    `14-June-2024` VARCHAR(10),
    `24-June-2024` VARCHAR(10),
    `25-June-2024` VARCHAR(10),
    `26-June-2024` VARCHAR(10),
    `27-June-2024` VARCHAR(10),
    `28-June-2024` VARCHAR(10),
    `1-July-2024` VARCHAR(10),
    `2-July-2024` VARCHAR(10),
    `3-July-2024` VARCHAR(10),
    `4-July-2024` VARCHAR(10),
    `5-July-2024` VARCHAR(10),
    `8-July-2024` VARCHAR(10),
    `9-July-2024` VARCHAR(10),
    `10-July-2024` VARCHAR(10),
    `18-July-2024` VARCHAR(10)
);



-- Load data from a TSV file into the Computer_Vision table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Computer Vision - Cohort 1.tsv"
INTO TABLE Computer_Vision
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE Computer_Vision
ADD COLUMN name VARCHAR(255) DEFAULT 'Computer Vision',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Verify the data
SELECT * FROM Computer_Vision;

-- Drop the table if it already exists
DROP TABLE IF EXISTS Computer_VisionC2;

-- Create the Computer_Vision table
CREATE TABLE Computer_VisionC2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `19-September-2024` VARCHAR(10),
    `20-September-2024` VARCHAR(10),
    `23-September-2024` VARCHAR(10),
    `24-September-2024` VARCHAR(10),
    `25-September-2024` VARCHAR(10),
    `26-September-2024` VARCHAR(10),
    `27-September-2024` VARCHAR(10),
    `30-September-2024` VARCHAR(10),
    `1-October-2024` VARCHAR(10),
    `2-October-2024` VARCHAR(10),
    `3-October-2024` VARCHAR(10),
    `4-October-2024` VARCHAR(10),
    `7-October-2024` VARCHAR(10),
    `8-October-2024` VARCHAR(10)
);

-- Load data from a TSV file into the Computer_Vision table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Computer Vision - Cohort 2.tsv"
INTO TABLE Computer_VisionC2
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE Computer_VisionC2
ADD COLUMN name VARCHAR(255) DEFAULT 'Computer Vision',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Verify the data
SELECT * FROM Computer_VisionC2;

-- Drop the table if it already exists
DROP TABLE IF EXISTS DataPreparationforGenAIC1;

-- Create the DataPreparationforGenAIC1 table
CREATE TABLE DataPreparationforGenAIC1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `2/26/2024` VARCHAR(10),
    `2/27/2024` VARCHAR(10),
    `2/28/2024` VARCHAR(10),
    `2/29/2024` VARCHAR(10),
    `03/01/2024` VARCHAR(10),
    `03/04/2024` VARCHAR(10),
    `03/05/2024` VARCHAR(10),
    `03/06/2024` VARCHAR(10),
    `03/07/2024` VARCHAR(10),
    `03/08/2024` VARCHAR(10),
    `03/18/2024` VARCHAR(10),
    `03/19/2024` VARCHAR(10),
    `03/20/2024` VARCHAR(10),
    `03/25/2024` VARCHAR(10)
);

-- Load data from a TSV file into the DataPreparationforGenAIC1 table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Data Preparation for GenAI - Cohort 1.tsv"
INTO TABLE DataPreparationforGenAIC1
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE DataPreparationforGenAIC1
ADD COLUMN name VARCHAR(255) DEFAULT 'Data Preparation for GenAI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Verify the data
SELECT * FROM DataPreparationforGenAIC1;


-- Drop the table if it already exists
DROP TABLE IF EXISTS DataPreparationforGenAIC2;

-- Create the DataPreparationforGenAIC2 table
CREATE TABLE DataPreparationforGenAIC2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `6-May-2024` VARCHAR(10),
    `7-May-2024` VARCHAR(10),
    `8-May-2024` VARCHAR(10),
    `9-May-2024` VARCHAR(10),
    `10-May-2024` VARCHAR(10),
    `13-May-2024` VARCHAR(10),
    `14-May-2024` VARCHAR(10),
    `15-May-2024` VARCHAR(10),
    `16-May-2024` VARCHAR(10),
    `17-May-2024` VARCHAR(10),
    `27-May-2024` VARCHAR(10),
    `28-May-2024` VARCHAR(10),
    `3-June-2024` VARCHAR(10)
);

-- Load data from a TSV file into the DataPreparationforGenAIC2 table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Data Preparation for GenAI - Cohort 2.tsv"
INTO TABLE DataPreparationforGenAIC2
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE DataPreparationforGenAIC2
ADD COLUMN name VARCHAR(255) DEFAULT 'Data Preparation for GenAI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Verify the data
SELECT * FROM DataPreparationforGenAIC2;

-- Drop the table if it already exists
DROP TABLE IF EXISTS DataPreparationforGenAIC3;

-- Create the DataPreparationforGenAIC3 table
CREATE TABLE DataPreparationforGenAIC3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `1-July-2024` VARCHAR(10),
    `2-July-2024` VARCHAR(10),
    `3-July-2024` VARCHAR(10),
    `4-July-2024` VARCHAR(10),
    `5-July-2024` VARCHAR(10),
    `8-July-2024` VARCHAR(10),
    `9-July-2024` VARCHAR(10),
    `10-July-2024` VARCHAR(10),
    `11-July-2024` VARCHAR(10),
    `12-July-2024` VARCHAR(10),
    `15-July-2024` VARCHAR(10),
    `16-July-2024` VARCHAR(10)
);

-- Load data from a TSV file into the DataPreparationforGenAIC3 table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Data Preparation for GenAI - Cohort 3.tsv"
INTO TABLE DataPreparationforGenAIC3
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE DataPreparationforGenAIC3
ADD COLUMN name VARCHAR(255) DEFAULT 'Data Preparation for GenAI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Verify the data
SELECT * FROM DataPreparationforGenAIC3;

-- Drop the table if it already exists
DROP TABLE IF EXISTS DataPreparationforGenAIC4;

-- Create the DataPreparationforGenAIC4 table
CREATE TABLE DataPreparationforGenAIC4 (
    studentid VARCHAR(50) PRIMARY KEY,
    `20-September-2024` VARCHAR(10),
    `23-September-2024` VARCHAR(10),
    `24-September-2024` VARCHAR(10),
    `25-September-2024` VARCHAR(10),
    `26-September-2024` VARCHAR(10),
    `27-September-2024` VARCHAR(10),
    `30-September-2024` VARCHAR(10),
    `1-October-2024` VARCHAR(10),
    `2-October-2024` VARCHAR(10),
    `3-October-2024` VARCHAR(10),
    `4-October-2024` VARCHAR(10)
);

-- Load data from a TSV file into the DataPreparationforGenAIC4 table
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Data Preparation for GenAI - Cohort 4.tsv"
INTO TABLE DataPreparationforGenAIC4
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values
ALTER TABLE DataPreparationforGenAIC4
ADD COLUMN name VARCHAR(255) DEFAULT 'Data Preparation for GenAI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C4';

-- Verify the data
SELECT * FROM DataPreparationforGenAIC4;

-- Drop the tables if they already exist
DROP TABLE IF EXISTS GenerativeAI_Cohort1;
DROP TABLE IF EXISTS GenerativeAI_Cohort2;
DROP TABLE IF EXISTS GenerativeAI_Cohort3;
DROP TABLE IF EXISTS GenerativeAI_Cohort4;
DROP TABLE IF EXISTS GenerativeAI_Cohort5;

-- Create the table for Cohort 1
CREATE TABLE GenerativeAI_Cohort1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `19/12/23` VARCHAR(10),
    `20/12/23` VARCHAR(10),
    `21/12/23` VARCHAR(10),
    `22/12/23` VARCHAR(10),
    `18/12/23` VARCHAR(10),
    `1/10/2024` VARCHAR(10),
    `1/11/2024` VARCHAR(10),
    `1/12/2024` VARCHAR(10)
);

-- Load data from the CSV file for Cohort 1
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Generative AI Introduction&Large Language Model Introduction - Cohort 1.csv"
INTO TABLE GenerativeAI_Cohort1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 1
ALTER TABLE GenerativeAI_Cohort1
ADD COLUMN name VARCHAR(255) DEFAULT 'Generative AI Introduction & Large Language Model Introduction',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

SHOW DATABASES;
USE atten;
SELECT * FROM GenerativeAI_Cohort1;

-- Create the table for Cohort 2
CREATE TABLE GenerativeAI_Cohort2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `03/18/2024` VARCHAR(10),
    `03/19/2024` VARCHAR(10),
    `03/20/2024` VARCHAR(10),
    `03/21/2024` VARCHAR(10),
    `03/22/2024` VARCHAR(10),
    `03/25/2024` VARCHAR(10),
    `03/26/2024` VARCHAR(10),
    `03/27/2024` VARCHAR(10),
    `03/28/2024` VARCHAR(10)
);

-- Load data from the CSV file for Cohort 2
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Generative AI Introduction&Large Language Model Introduction - Cohort 2.csv"
INTO TABLE GenerativeAI_Cohort2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 2
ALTER TABLE GenerativeAI_Cohort2
ADD COLUMN name VARCHAR(255) DEFAULT 'Generative AI Introduction & Large Language Model Introduction',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Create the table for Cohort 3
CREATE TABLE GenerativeAI_Cohort3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `20-May-24` VARCHAR(10),
    `21-May-24` VARCHAR(10),
    `22-May-24` VARCHAR(10),
    `23-May-24` VARCHAR(10),
    `24-May-24` VARCHAR(10),
    `27-May-24` VARCHAR(10),
    `28-May-24` VARCHAR(10),
    `29-May-24` VARCHAR(10),
    `30-May-24` VARCHAR(10),
    `31-May-24` VARCHAR(10),
    `10-Jun-24` VARCHAR(10)
);

-- Load data from the CSV file for Cohort 3
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Generative AI Introduction&Large Language Model Introduction - Cohort 3.csv"
INTO TABLE GenerativeAI_Cohort3
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 3
ALTER TABLE GenerativeAI_Cohort3
ADD COLUMN name VARCHAR(255) DEFAULT 'Generative AI Introduction & Large Language Model Introduction',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Create the table for Cohort 4
CREATE TABLE GenerativeAI_Cohort4 (
    studentid VARCHAR(50) PRIMARY KEY,
    `15-July-2024` VARCHAR(10),
    `16-July-2024` VARCHAR(10),
    `17-July-2024` VARCHAR(10),
    `18-July-2024` VARCHAR(10),
    `19-July-2024` VARCHAR(10),
    `22-July-2024` VARCHAR(10),
    `23-July-2024` VARCHAR(10),
    `24-July-2024` VARCHAR(10),
    `25-July-2024` VARCHAR(10),
    `26-July-2024` VARCHAR(10),
    `5-August-2024` VARCHAR(10),
    `6-August-2024` VARCHAR(10),
    `7-August-2024` VARCHAR(10),
    `8-August-2024` VARCHAR(10),
    `9-August-2024` VARCHAR(10),
    `12-August-2024` VARCHAR(10),
    `13-August-2024` VARCHAR(10),
    `14-August-2024` VARCHAR(10),
    `28-August-2024` VARCHAR(10)
);

-- Load data from the CSV file for Cohort 4
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Generative AI Introduction&Large Language Model Introduction - Cohort 4.csv"
INTO TABLE GenerativeAI_Cohort4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 4
ALTER TABLE GenerativeAI_Cohort4
ADD COLUMN name VARCHAR(255) DEFAULT 'Generative AI Introduction & Large Language Model Introduction',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C4';

-- Create the table for Cohort 5
CREATE TABLE GenerativeAI_Cohort5 (
    studentid VARCHAR(50) PRIMARY KEY,
    `9-September-2024` VARCHAR(10),
    `10-September-2024` VARCHAR(10),
    `11-September-2024` VARCHAR(10),
    `12-September-2024` VARCHAR(10),
    `13-September-2024` VARCHAR(10),
    `16-September-2024` VARCHAR(10),
    `17-September-2024` VARCHAR(10),
    `18-September-2024` VARCHAR(10),
    `19-September-2024` VARCHAR(10),
    `20-September-2024` VARCHAR(10),
    `30-September-2024` VARCHAR(10),
    `1-October-2024` VARCHAR(10),
    `2-October-2024` VARCHAR(10),
    `3-October-2024` VARCHAR(10),
    `4-October-2024` VARCHAR(10),
    `7-October-2024` VARCHAR(10),
    `8-October-2024` VARCHAR(10),
    `9-October-2024` VARCHAR(10)
);

-- Load data from the CSV file for Cohort 5
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Generative AI Introduction&Large Language Model Introduction - Cohort 5.csv"
INTO TABLE GenerativeAI_Cohort5
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 5
ALTER TABLE GenerativeAI_Cohort5
ADD COLUMN name VARCHAR(255) DEFAULT 'Generative AI Introduction & Large Language Model Introduction',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C5';

-- Verify the data for all cohorts
SELECT * FROM GenerativeAI_Cohort1;
SELECT * FROM GenerativeAI_Cohort2;
SELECT * FROM GenerativeAI_Cohort3;
SELECT * FROM GenerativeAI_Cohort4;
SELECT * FROM GenerativeAI_Cohort5;

-- Drop the tables if they already exist
DROP TABLE IF EXISTS IntroductionToAI_Cohort1;
DROP TABLE IF EXISTS IntroductionToAI_Cohort2;
DROP TABLE IF EXISTS IntroductionToAI_Cohort3;
DROP TABLE IF EXISTS IntroductionToAI_Cohort4;
DROP TABLE IF EXISTS IntroductionToAI_Cohort5;
DROP TABLE IF EXISTS IntroductionToAI_Cohort6;
DROP TABLE IF EXISTS IntroductionToAI_Cohort7;
DROP TABLE IF EXISTS IntroductionToAI_Cohort8;
DROP TABLE IF EXISTS IntroductionToAI_Cohort9;
DROP TABLE IF EXISTS IntroductionToAI_Cohort10;

-- Create the table for Cohort 1
CREATE TABLE IntroductionToAI_Cohort1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `18-December-2023` VARCHAR(10),
    `19-December-2023` VARCHAR(10),
    `20-December-2023` VARCHAR(10),
    `21-December-2023` VARCHAR(10),
    `22-December-2023` VARCHAR(10),
    `10-January-2024` VARCHAR(10),
    `11-January-2024` VARCHAR(10),
    `12-January-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 1
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 1.tsv"
INTO TABLE IntroductionToAI_Cohort1
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 1
ALTER TABLE IntroductionToAI_Cohort1
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Create the table for Cohort 2
CREATE TABLE IntroductionToAI_Cohort2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `18-December-2023` VARCHAR(10),
    `19-December-2023` VARCHAR(10),
    `20-December-2023` VARCHAR(10),
    `21-December-2023` VARCHAR(10),
    `22-December-2023` VARCHAR(10),
    `10-January-2024` VARCHAR(10),
    `11-January-2024` VARCHAR(10),
    `12-January-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 2
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 2.tsv"
INTO TABLE IntroductionToAI_Cohort2
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 2
ALTER TABLE IntroductionToAI_Cohort2
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Create the table for Cohort 3
CREATE TABLE IntroductionToAI_Cohort3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `22-January-2024` VARCHAR(10),
    `23-January-2024` VARCHAR(10),
    `24-January-2024` VARCHAR(10),
    `25-January-2024` VARCHAR(10),
    `29-January-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 3
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 3.tsv"
INTO TABLE IntroductionToAI_Cohort3
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 3
ALTER TABLE IntroductionToAI_Cohort3
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Create the table for Cohort 4
CREATE TABLE IntroductionToAI_Cohort4 (
    studentid VARCHAR(50) PRIMARY KEY,
    `12-February-2024` VARCHAR(10),
    `15-February-2024` VARCHAR(10),
    `16-February-2024` VARCHAR(10),
    `19-February-2024` VARCHAR(10),
    `20-February-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 4
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 4.tsv"
INTO TABLE IntroductionToAI_Cohort4
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 4
ALTER TABLE IntroductionToAI_Cohort4
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C4';

-- Create the table for Cohort 5
CREATE TABLE IntroductionToAI_Cohort5 (
    studentid VARCHAR(50) PRIMARY KEY,
    `11-March-2024` VARCHAR(10),
    `12-March-2024` VARCHAR(10),
    `13-March-2024` VARCHAR(10),
    `14-March-2024` VARCHAR(10),
    `15-March-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 5
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 5.tsv"
INTO TABLE IntroductionToAI_Cohort5
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 5
ALTER TABLE IntroductionToAI_Cohort5
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C5';

-- Create the table for Cohort 6
CREATE TABLE IntroductionToAI_Cohort6 (
    studentid VARCHAR(50) PRIMARY KEY,
    `27-May-2024` VARCHAR(10),
    `3-June-2024` VARCHAR(10),
    `4-June-2024` VARCHAR(10),
    `5-June-2024` VARCHAR(10),
    `7-June-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 6
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 6.tsv"
INTO TABLE IntroductionToAI_Cohort6
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 6
ALTER TABLE IntroductionToAI_Cohort6
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C6';

-- Create the table for Cohort 7
CREATE TABLE IntroductionToAI_Cohort7 (
    studentid VARCHAR(50) PRIMARY KEY,
    `24-June-2024` VARCHAR(10),
    `25-June-2024` VARCHAR(10),
    `26-June-2024` VARCHAR(10),
    `27-June-2024` VARCHAR(10),
    `28-June-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 7
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 7.tsv"
INTO TABLE IntroductionToAI_Cohort7
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 7
ALTER TABLE IntroductionToAI_Cohort7
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C7';

-- Create the table for Cohort 8
CREATE TABLE IntroductionToAI_Cohort8 (
    studentid VARCHAR(50) PRIMARY KEY,
    `15-July-2024` VARCHAR(10),
    `16-July-2024` VARCHAR(10),
    `17-July-2024` VARCHAR(10),
    `18-July-2024` VARCHAR(10),
    `19-July-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 8
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 8.tsv"
INTO TABLE IntroductionToAI_Cohort8
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 8
ALTER TABLE IntroductionToAI_Cohort8
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C8';

-- Create the table for Cohort 9
CREATE TABLE IntroductionToAI_Cohort9 (
    studentid VARCHAR(50) PRIMARY KEY,
    `19-August-2024` VARCHAR(10),
    `20-August-2024` VARCHAR(10),
    `21-August-2024` VARCHAR(10),
    `22-August-2024` VARCHAR(10),
    `23-August-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 9
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 9.tsv"
INTO TABLE IntroductionToAI_Cohort9
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 9
ALTER TABLE IntroductionToAI_Cohort9
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C9';

-- Create the table for Cohort 10
CREATE TABLE IntroductionToAI_Cohort10 (
    studentid VARCHAR(50) PRIMARY KEY,
    `21-October-2024` VARCHAR(10),
    `22-October-2024` VARCHAR(10),
    `23-October-2024` VARCHAR(10),
    `24-October-2024` VARCHAR(10),
    `25-October-2024` VARCHAR(10)
);

-- Load data from the TSV file for Cohort 10
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Introduction to AI - Cohort 10.tsv"
INTO TABLE IntroductionToAI_Cohort10
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Cohort 10
ALTER TABLE IntroductionToAI_Cohort10
ADD COLUMN name VARCHAR(255) DEFAULT 'Introduction to AI',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C10';

-- Verify the data for all cohorts
SELECT * FROM IntroductionToAI_Cohort1;
SELECT * FROM IntroductionToAI_Cohort2;
SELECT * FROM IntroductionToAI_Cohort3;
SELECT * FROM IntroductionToAI_Cohort4;
SELECT * FROM IntroductionToAI_Cohort5;
SELECT * FROM IntroductionToAI_Cohort6;
SELECT * FROM IntroductionToAI_Cohort7;
SELECT * FROM IntroductionToAI_Cohort8;
SELECT * FROM IntroductionToAI_Cohort9;
SELECT * FROM IntroductionToAI_Cohort10;


-- Drop the tables if they already exist
DROP TABLE IF EXISTS MLFundamentals_Cohort1;
DROP TABLE IF EXISTS MLFundamentals_Cohort2;
DROP TABLE IF EXISTS MLFundamentals_Cohort3;
DROP TABLE IF EXISTS MLFundamentals_Cohort4;
DROP TABLE IF EXISTS MLFundamentals_Cohort5;
DROP TABLE IF EXISTS NLP_LLMFinetuning_Cohort1;
DROP TABLE IF EXISTS NLP_LLMFinetuning_Cohort2;
DROP TABLE IF EXISTS NLP_LLMFinetuning_Cohort3;

-- Create the table for ML Fundamentals Cohort 1
CREATE TABLE MLFundamentals_Cohort1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `20/11/2023` VARCHAR(10),
    `22/11/2023` VARCHAR(10),
    `24/11/2023` VARCHAR(10),
    `28/11/2023` VARCHAR(10),
    `12/05/2023` VARCHAR(10),
    `13/12/2023` VARCHAR(10),
    `23/11/2023` VARCHAR(10),
    `27/11/2023` VARCHAR(10),
    `29/11/2023` VARCHAR(10),
    `30/11/2023` VARCHAR(10),
    `12/01/2023` VARCHAR(10),
    `12/06/2023` VARCHAR(10),
    `22/12/2023` VARCHAR(10),
    `21/12/2023` VARCHAR(10),
    `20/12/2023` VARCHAR(10),
    `19/12/2023` VARCHAR(10),
    `18/12/2023` VARCHAR(10),
    `15/12/2023` VARCHAR(10),
    `14/12/2023` VARCHAR(10),
    `12/12/2023` VARCHAR(10),
    `08/12/2023` VARCHAR(10),
    `1/10/2024` VARCHAR(10),
    `1/11/2024` VARCHAR(10),
    `1/12/2024` VARCHAR(10)
);

-- Load data from the CSV file for ML Fundamentals Cohort 1
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - ML Fundamentals - Cohort 1.csv"
INTO TABLE MLFundamentals_Cohort1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for ML Fundamentals Cohort 1
ALTER TABLE MLFundamentals_Cohort1
ADD COLUMN name VARCHAR(255) DEFAULT 'ML Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Create the table for ML Fundamentals Cohort 2
CREATE TABLE MLFundamentals_Cohort2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `2/5/2024` VARCHAR(10),
    `2/6/2024` VARCHAR(10),
    `2/7/2024` VARCHAR(10),
    `2/8/2024` VARCHAR(10),
    `2/9/2024` VARCHAR(10),
    `02/12/2024` VARCHAR(10),
    `02/13/2024` VARCHAR(10),
    `02/14/2024` VARCHAR(10),
    `02/15/2024` VARCHAR(10),
    `02/16/2024` VARCHAR(10),
    `2/26/2024` VARCHAR(10),
    `2/27/2024` VARCHAR(10),
    `2/28/2024` VARCHAR(10),
    `2/29/2024` VARCHAR(10),
    `3/1/2024` VARCHAR(10),
    `3/4/2024` VARCHAR(10),
    `3/5/2024` VARCHAR(10),
    `3/6/2024` VARCHAR(10),
    `3/7/2024` VARCHAR(10),
    `3/8/2024` VARCHAR(10),
    `3/18/2024` VARCHAR(10),
    `3/19/2024` VARCHAR(10),
    `3/20/2024` VARCHAR(10),
    `3/21/2024` VARCHAR(10),
    `3/22/2024` VARCHAR(10),
    `3/25/2024` VARCHAR(10)
);

-- Load data from the CSV file for ML Fundamentals Cohort 2
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - ML Fundamentals - Cohort 2.csv"
INTO TABLE MLFundamentals_Cohort2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for ML Fundamentals Cohort 2
ALTER TABLE MLFundamentals_Cohort2
ADD COLUMN name VARCHAR(255) DEFAULT 'ML Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Create the table for ML Fundamentals Cohort 3
CREATE TABLE MLFundamentals_Cohort3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `6-May-2024` VARCHAR(10),
    `7-May-2024` VARCHAR(10),
    `8-May-2024` VARCHAR(10),
    `9-May-2024` VARCHAR(10),
    `10-May-2024` VARCHAR(10),
    `13-May-2024` VARCHAR(10),
    `14-May-2024` VARCHAR(10),
    `15-May-2024` VARCHAR(10),
    `16-May-2024` VARCHAR(10),
    `17-May-2024` VARCHAR(10),
    `27-May-2024` VARCHAR(10),
    `28-May-2024` VARCHAR(10),
    `29-May-2024` VARCHAR(10),
    `30-May-2024` VARCHAR(10),
    `31-May-2024` VARCHAR(10),
    `3-June-2024` VARCHAR(10),
    `4-June-2024` VARCHAR(10),
    `5-June-2024` VARCHAR(10),
    `6-June-2024` VARCHAR(10),
    `7-June-2024` VARCHAR(10),
    `24-June-2024` VARCHAR(10),
    `25-June-2024` VARCHAR(10),
    `26-June-2024` VARCHAR(10),
    `27-June-2024` VARCHAR(10),
    `28-June-2024` VARCHAR(10),
    `9-July-2024` VARCHAR(10)
);

-- Load data from the CSV file for ML Fundamentals Cohort 3
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - ML Fundamentals - Cohort 3.csv"
INTO TABLE MLFundamentals_Cohort3
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for ML Fundamentals Cohort 3
ALTER TABLE MLFundamentals_Cohort3
ADD COLUMN name VARCHAR(255) DEFAULT 'ML Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Create the table for ML Fundamentals Cohort 4
CREATE TABLE MLFundamentals_Cohort4 (
    studentid VARCHAR(50) PRIMARY KEY,
    `3-July-2024` VARCHAR(10),
    `4-July-2024` VARCHAR(10),
    `5-July-2024` VARCHAR(10),
    `8-July-2024` VARCHAR(10),
    `9-July-2024` VARCHAR(10),
    `10-July-2024` VARCHAR(10),
    `11-July-2024` VARCHAR(10),
    `12-July-2024` VARCHAR(10),
    `15-July-2024` VARCHAR(10),
    `16-July-2024` VARCHAR(10),
    `17-July-2024` VARCHAR(10),
    `18-July-2024` VARCHAR(10),
    `19-July-2024` VARCHAR(10),
    `22-July-2024` VARCHAR(10),
    `23-July-2024` VARCHAR(10),
    `24-July-2024` VARCHAR(10),
    `25-July-2024` VARCHAR(10),
    `26-July-2024` VARCHAR(10),
    `29-July-2024` VARCHAR(10),
    `30-July-2024` VARCHAR(10),
    `31-July-2024` VARCHAR(10),
    `1-August-2024` VARCHAR(10),
    `2-August-2024` VARCHAR(10),
    `5-August-2024` VARCHAR(10),
    `6-August-2024` VARCHAR(10),
    `7-August-2024` VARCHAR(10)
);

-- Load data from the CSV file for ML Fundamentals Cohort 4
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - ML Fundamentals - Cohort 4.csv"
INTO TABLE MLFundamentals_Cohort4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for ML Fundamentals Cohort 4
ALTER TABLE MLFundamentals_Cohort4
ADD COLUMN name VARCHAR(255) DEFAULT 'ML Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C4';

-- Create the table for ML Fundamentals Cohort 5
CREATE TABLE MLFundamentals_Cohort5 (
    studentid VARCHAR(50) PRIMARY KEY,
    `26-August-2024` VARCHAR(10),
    `27-August-2024` VARCHAR(10),
    `28-August-2024` VARCHAR(10),
    `29-August-2024` VARCHAR(10),
    `30-August-2024` VARCHAR(10),
    `2-September-2024` VARCHAR(10),
    `3-September-2024` VARCHAR(10),
    `4-September-2024` VARCHAR(10),
    `5-September-2024` VARCHAR(10),
    `6-September-2024` VARCHAR(10),
    `9-September-2024` VARCHAR(10),
    `10-September-2024` VARCHAR(10),
    `11-September-2024` VARCHAR(10),
    `12-September-2024` VARCHAR(10),
    `13-September-2024` VARCHAR(10),
    `16-September-2024` VARCHAR(10),
    `17-September-2024` VARCHAR(10),
    `18-September-2024` VARCHAR(10),
    `19-September-2024` VARCHAR(10),
    `20-September-2024` VARCHAR(10),
    `23-September-2024` VARCHAR(10),
    `24-September-2024` VARCHAR(10),
    `25-September-2024` VARCHAR(10),
    `26-September-2024` VARCHAR(10),
    `27-September-2024` VARCHAR(10),
    `30-September-2024` VARCHAR(10)
);

-- Load data from the CSV file for ML Fundamentals Cohort 5
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - ML Fundamentals - Cohort 5.csv"
INTO TABLE MLFundamentals_Cohort5
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for ML Fundamentals Cohort 5
ALTER TABLE MLFundamentals_Cohort5
ADD COLUMN name VARCHAR(255) DEFAULT 'ML Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C5';

-- Create the table for NLP and LLM Finetuning Cohort 1
CREATE TABLE NLP_LLMFinetuning_Cohort1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `22-Apr-24` VARCHAR(10),
    `23-Apr-24` VARCHAR(10),
    `24-Apr-24` VARCHAR(10),
    `25-Apr-24` VARCHAR(10),
    `26-Apr-24` VARCHAR(10),
    `29-Apr-24` VARCHAR(10),
    `30-Apr-24` VARCHAR(10),
    `1-May-24` VARCHAR(10),
    `2-May-24` VARCHAR(10),
    `3-May-24` VARCHAR(10),
    `13-May-24` VARCHAR(10),
    `14-May-24` VARCHAR(10),
    `15-May-24` VARCHAR(10),
    `16-May-24` VARCHAR(10),
    `17-May-24` VARCHAR(10)
);

-- Load data from the TSV file for NLP and LLM Finetuning Cohort 1
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - NLP and LLM Finetuning - Cohort 1.tsv"
INTO TABLE NLP_LLMFinetuning_Cohort1
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for NLP and LLM Finetuning Cohort 1
ALTER TABLE NLP_LLMFinetuning_Cohort1
ADD COLUMN name VARCHAR(255) DEFAULT 'NLP and LLM Finetuning',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Create the table for NLP and LLM Finetuning Cohort 2
CREATE TABLE NLP_LLMFinetuning_Cohort2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `24-June-2024` VARCHAR(10),
    `25-June-2024` VARCHAR(10),
    `26-June-2024` VARCHAR(10),
    `27-June-2024` VARCHAR(10),
    `28-June-2024` VARCHAR(10),
    `1-July-2024` VARCHAR(10),
    `2-July-2024` VARCHAR(10),
    `3-July-2024` VARCHAR(10),
    `4-July-2024` VARCHAR(10),
    `5-July-2024` VARCHAR(10),
    `8-July-2024` VARCHAR(10),
    `10-July-2024` VARCHAR(10),
    `11-July-2024` VARCHAR(10)
);

-- Load data from the TSV file for NLP and LLM Finetuning Cohort 2
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - NLP and LLM Finetuning - Cohort 2.tsv"
INTO TABLE NLP_LLMFinetuning_Cohort2
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for NLP and LLM Finetuning Cohort 2
ALTER TABLE NLP_LLMFinetuning_Cohort2
ADD COLUMN name VARCHAR(255) DEFAULT 'NLP and LLM Finetuning',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Create the table for NLP and LLM Finetuning Cohort 3
CREATE TABLE NLP_LLMFinetuning_Cohort3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `5-August-2024` VARCHAR(10),
    `6-August-2024` VARCHAR(10),
    `7-August-2024` VARCHAR(10),
    `8-August-2024` VARCHAR(10),
    `9-August-2024` VARCHAR(10),
    `12-August-2024` VARCHAR(10),
    `13-August-2024` VARCHAR(10),
    `14-August-2024` VARCHAR(10),
    `15-August-2024` VARCHAR(10),
    `16-August-2024` VARCHAR(10),
    `19-August-2024` VARCHAR(10),
    `20-August-2024` VARCHAR(10),
    `26-August-2024` VARCHAR(10)
);

-- Load data from the TSV file for NLP and LLM Finetuning Cohort 3
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - NLP and LLM Finetuning - Cohort 3.tsv"
INTO TABLE NLP_LLMFinetuning_Cohort3
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for NLP and LLM Finetuning Cohort 3
ALTER TABLE NLP_LLMFinetuning_Cohort3
ADD COLUMN name VARCHAR(255) DEFAULT 'NLP and LLM Finetuning',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Verify the data for all cohorts
SELECT * FROM MLFundamentals_Cohort1;
SELECT * FROM MLFundamentals_Cohort2;
SELECT * FROM MLFundamentals_Cohort3;
SELECT * FROM MLFundamentals_Cohort4;
SELECT * FROM MLFundamentals_Cohort5;
SELECT * FROM NLP_LLMFinetuning_Cohort1;
SELECT * FROM NLP_LLMFinetuning_Cohort2;
SELECT * FROM NLP_LLMFinetuning_Cohort3;


-- Drop the tables if they already exist
DROP TABLE IF EXISTS PythonFundamentals_Cohort1;
DROP TABLE IF EXISTS PythonFundamentals_Cohort2;
DROP TABLE IF EXISTS PythonFundamentals_Cohort3;
DROP TABLE IF EXISTS PythonFundamentals_Cohort4;

-- Create the table for Python Fundamentals Cohort 1
CREATE TABLE PythonFundamentals_Cohort1 (
    studentid VARCHAR(50) PRIMARY KEY,
    `15-January-2024` VARCHAR(10),
    `16-January-2024` VARCHAR(10),
    `17-January-2024` VARCHAR(10),
    `18-January-2024` VARCHAR(10)
);

-- Load data from the CSV file for Python Fundamentals Cohort 1
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Python Fundamentals - Cohort 1.csv"
INTO TABLE PythonFundamentals_Cohort1
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Python Fundamentals Cohort 1
ALTER TABLE PythonFundamentals_Cohort1
ADD COLUMN name VARCHAR(255) DEFAULT 'Python Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C1';

-- Create the table for Python Fundamentals Cohort 2
CREATE TABLE PythonFundamentals_Cohort2 (
    studentid VARCHAR(50) PRIMARY KEY,
    `15-January-2024` VARCHAR(10),
    `16-January-2024` VARCHAR(10),
    `17-January-2024` VARCHAR(10),
    `18-January-2024` VARCHAR(10)
);

-- Load data from the CSV file for Python Fundamentals Cohort 2
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Python Fundamentals - Cohort 2.csv"
INTO TABLE PythonFundamentals_Cohort2
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Python Fundamentals Cohort 2
ALTER TABLE PythonFundamentals_Cohort2
ADD COLUMN name VARCHAR(255) DEFAULT 'Python Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C2';

-- Create the table for Python Fundamentals Cohort 3
CREATE TABLE PythonFundamentals_Cohort3 (
    studentid VARCHAR(50) PRIMARY KEY,
    `10-June-2024` VARCHAR(10),
    `11-June-2024` VARCHAR(10),
    `12-June-2024` VARCHAR(10),
    `13-June-2024` VARCHAR(10)
);

-- Load data from the CSV file for Python Fundamentals Cohort 3
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Python Fundamentals - Cohort 3.csv"
INTO TABLE PythonFundamentals_Cohort3
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Python Fundamentals Cohort 3
ALTER TABLE PythonFundamentals_Cohort3
ADD COLUMN name VARCHAR(255) DEFAULT 'Python Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C3';

-- Create the table for Python Fundamentals Cohort 4
CREATE TABLE PythonFundamentals_Cohort4 (
    studentid VARCHAR(50) PRIMARY KEY,
    `2-July-2024` VARCHAR(10),
    `3-July-2024` VARCHAR(10),
    `4-July-2024` VARCHAR(10),
    `5-July-2024` VARCHAR(10)
);

-- Load data from the CSV file for Python Fundamentals Cohort 4
LOAD DATA LOCAL INFILE "C:/py/Stage 1 Data/Attendance/Attendance Register - Python Fundamentals - Cohort 4.csv"
INTO TABLE PythonFundamentals_Cohort4
FIELDS TERMINATED BY ','
LINES TERMINATED BY '\n'
IGNORE 1 ROWS;

-- Add the name and cohort columns with default values for Python Fundamentals Cohort 4
ALTER TABLE PythonFundamentals_Cohort4
ADD COLUMN name VARCHAR(255) DEFAULT 'Python Fundamentals',
ADD COLUMN cohort VARCHAR(50) DEFAULT 'C4';

-- Verify the data for all cohorts
SELECT * FROM PythonFundamentals_Cohort1;
SELECT * FROM PythonFundamentals_Cohort2;
SELECT * FROM PythonFundamentals_Cohort3;
SELECT * FROM PythonFundamentals_Cohort4;