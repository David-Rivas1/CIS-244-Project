CREATE DATABASE IF NOT EXISTS `E-LearningPlatform`;
USE `E-LearningPlatform`;

#
# Table structure for table 'Categories'
#

DROP TABLE IF EXISTS `Categories`;

CREATE TABLE `Categories` (
  `CategoryID` INTEGER NOT NULL AUTO_INCREMENT, 
  `CategoryName` VARCHAR(255), 
  `CategoryDescription` LONGTEXT, 
  PRIMARY KEY (`CategoryID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Categories'
#

INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CategoryDescription`) VALUES (1, 'Science', '…');
INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CategoryDescription`) VALUES (2, 'History', '…');
INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CategoryDescription`) VALUES (3, 'Mathematics', '…');
INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CategoryDescription`) VALUES (4, 'Art', '…');
INSERT INTO `Categories` (`CategoryID`, `CategoryName`, `CategoryDescription`) VALUES (5, 'Computer Science', '…');
# 5 records

#
# Table structure for table 'Classes'
#

DROP TABLE IF EXISTS `Classes`;

CREATE TABLE `Classes` (
  `ClassID` INTEGER NOT NULL AUTO_INCREMENT, 
  `CourseID` INTEGER DEFAULT 0, 
  `TeacherUserID` INTEGER DEFAULT 0, 
  `StartDate` DATETIME, 
  `EndDate` DATETIME, 
  INDEX (`CourseID`), 
  PRIMARY KEY (`ClassID`), 
  INDEX (`TeacherUserID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Classes'
#

INSERT INTO `Classes` (`ClassID`, `CourseID`, `TeacherUserID`, `StartDate`, `EndDate`) VALUES (1, 1, 1, '2025-01-07 00:00:00', '2025-05-14 00:00:00');
INSERT INTO `Classes` (`ClassID`, `CourseID`, `TeacherUserID`, `StartDate`, `EndDate`) VALUES (2, 2, 4, '2025-01-16 00:00:00', '2025-05-22 00:00:00');
INSERT INTO `Classes` (`ClassID`, `CourseID`, `TeacherUserID`, `StartDate`, `EndDate`) VALUES (3, 3, 5, '2024-05-22 00:00:00', '2024-08-10 00:00:00');
INSERT INTO `Classes` (`ClassID`, `CourseID`, `TeacherUserID`, `StartDate`, `EndDate`) VALUES (4, 4, 7, '2024-07-16 00:00:00', '2024-09-11 00:00:00');
INSERT INTO `Classes` (`ClassID`, `CourseID`, `TeacherUserID`, `StartDate`, `EndDate`) VALUES (5, 5, 9, '2024-06-11 00:00:00', '2024-07-09 00:00:00');
# 5 records

#
# Table structure for table 'Courses'
#

DROP TABLE IF EXISTS `Courses`;

CREATE TABLE `Courses` (
  `CourseID` INTEGER NOT NULL AUTO_INCREMENT, 
  `CourseName` VARCHAR(255), 
  `CategoryID` INTEGER DEFAULT 0, 
  `TeacherUserID` INTEGER DEFAULT 0, 
  `Price` DECIMAL(19,4) DEFAULT 0, 
  `CourseDescription` LONGTEXT, 
  PRIMARY KEY (`CourseID`), 
  INDEX (`TeacherUserID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Courses'
#

INSERT INTO `Courses` (`CourseID`, `CourseName`, `CategoryID`, `TeacherUserID`, `Price`, `CourseDescription`) VALUES (1, 'Calculus 1', 3, 4, 90, 'Learning the fundamentals of Calculus…');
INSERT INTO `Courses` (`CourseID`, `CourseName`, `CategoryID`, `TeacherUserID`, `Price`, `CourseDescription`) VALUES (2, 'CIS 345', 5, 5, 80, 'Learning about Operating Systems and how to use them…');
INSERT INTO `Courses` (`CourseID`, `CourseName`, `CategoryID`, `TeacherUserID`, `Price`, `CourseDescription`) VALUES (3, 'HIS 234', 2, 7, 40, 'The Historical Events and Importance of…');
INSERT INTO `Courses` (`CourseID`, `CourseName`, `CategoryID`, `TeacherUserID`, `Price`, `CourseDescription`) VALUES (4, 'Chemistry', 1, 1, 70, 'Learning about Chemistry...');
INSERT INTO `Courses` (`CourseID`, `CourseName`, `CategoryID`, `TeacherUserID`, `Price`, `CourseDescription`) VALUES (5, 'Art History', 4, 9, 65, 'The History of Art…');
# 5 records

#
# Table structure for table 'CourseWork'
#

DROP TABLE IF EXISTS `CourseWork`;

CREATE TABLE `CourseWork` (
  `WorkID` INTEGER NOT NULL AUTO_INCREMENT, 
  `CreatorUserID` INTEGER DEFAULT 0, 
  `ClassID` INTEGER DEFAULT 0, 
  `NumOfQuestions` INTEGER DEFAULT 0, 
  `AllowedAttempts` INTEGER DEFAULT 0, 
  `OpenDate` DATETIME, 
  `DueDate` DATETIME, 
  `WorkName` VARCHAR(255), 
  `WorkType` VARCHAR(255), 
  `TimeLimit` INTEGER DEFAULT 0, 
  `MaxPoints` INTEGER DEFAULT 0, 
  INDEX (`ClassID`), 
  INDEX (`CreatorUserID`), 
  INDEX (`NumOfQuestions`), 
  PRIMARY KEY (`WorkID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'CourseWork'
#

INSERT INTO `CourseWork` (`WorkID`, `CreatorUserID`, `ClassID`, `NumOfQuestions`, `AllowedAttempts`, `OpenDate`, `DueDate`, `WorkName`, `WorkType`, `TimeLimit`, `MaxPoints`) VALUES (1, 1, 1, 120, 1, '2025-05-11 00:00:00', '2025-05-11 00:00:00', 'Calculus Quiz 1', 'Quiz', 120, 120);
INSERT INTO `CourseWork` (`WorkID`, `CreatorUserID`, `ClassID`, `NumOfQuestions`, `AllowedAttempts`, `OpenDate`, `DueDate`, `WorkName`, `WorkType`, `TimeLimit`, `MaxPoints`) VALUES (2, 4, 2, 50, 3, '2025-01-23 00:00:00', '2025-01-31 00:00:00', 'Operating Systems', 'Assignment', 9999, 50);
INSERT INTO `CourseWork` (`WorkID`, `CreatorUserID`, `ClassID`, `NumOfQuestions`, `AllowedAttempts`, `OpenDate`, `DueDate`, `WorkName`, `WorkType`, `TimeLimit`, `MaxPoints`) VALUES (3, 5, 3, 30, 2, '2024-06-10 00:00:00', '2024-06-14 00:00:00', 'History Test', 'Test', 60, 60);
INSERT INTO `CourseWork` (`WorkID`, `CreatorUserID`, `ClassID`, `NumOfQuestions`, `AllowedAttempts`, `OpenDate`, `DueDate`, `WorkName`, `WorkType`, `TimeLimit`, `MaxPoints`) VALUES (4, 7, 4, 36, 3, '2024-08-12 00:00:00', '2024-08-14 00:00:00', 'Chem Test', 'Test', 60, 36);
INSERT INTO `CourseWork` (`WorkID`, `CreatorUserID`, `ClassID`, `NumOfQuestions`, `AllowedAttempts`, `OpenDate`, `DueDate`, `WorkName`, `WorkType`, `TimeLimit`, `MaxPoints`) VALUES (5, 9, 5, 20, 5, '2024-06-28 00:00:00', '2024-06-30 00:00:00', 'Art History', 'Assignment', 9999, 25);
# 5 records

#
# Table structure for table 'Enrollment'
#

DROP TABLE IF EXISTS `Enrollment`;

CREATE TABLE `Enrollment` (
  `EnrollmentID` INTEGER NOT NULL AUTO_INCREMENT, 
  `CourseID` INTEGER DEFAULT 0, 
  `StudentUserID` INTEGER DEFAULT 0, 
  `EnrollmentDate` DATETIME, 
  INDEX (`CourseID`), 
  PRIMARY KEY (`EnrollmentID`), 
  INDEX (`StudentUserID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Enrollment'
#

INSERT INTO `Enrollment` (`EnrollmentID`, `CourseID`, `StudentUserID`, `EnrollmentDate`) VALUES (1, 1, 2, '2025-01-07 00:00:00');
INSERT INTO `Enrollment` (`EnrollmentID`, `CourseID`, `StudentUserID`, `EnrollmentDate`) VALUES (2, 2, 3, '2025-01-16 00:00:00');
INSERT INTO `Enrollment` (`EnrollmentID`, `CourseID`, `StudentUserID`, `EnrollmentDate`) VALUES (3, 3, 6, '2024-05-22 00:00:00');
INSERT INTO `Enrollment` (`EnrollmentID`, `CourseID`, `StudentUserID`, `EnrollmentDate`) VALUES (4, 4, 8, '2024-07-16 00:00:00');
INSERT INTO `Enrollment` (`EnrollmentID`, `CourseID`, `StudentUserID`, `EnrollmentDate`) VALUES (5, 5, 10, '2024-06-11 00:00:00');
# 5 records

#
# Table structure for table 'StudentOverallGrade'
#

DROP TABLE IF EXISTS `StudentOverallGrade`;

CREATE TABLE `StudentOverallGrade` (
  `StudentOverAllGradeID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ClassID` INTEGER NOT NULL DEFAULT 0, 
  `Grade` VARCHAR(255), 
  `StudentUserID` INTEGER DEFAULT 0, 
  INDEX (`ClassID`), 
  PRIMARY KEY (`StudentOverAllGradeID`), 
  INDEX (`StudentUserID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'StudentOverallGrade'
#

INSERT INTO `StudentOverallGrade` (`StudentOverAllGradeID`, `ClassID`, `Grade`, `StudentUserID`) VALUES (1, 1, '86', 2);
INSERT INTO `StudentOverallGrade` (`StudentOverAllGradeID`, `ClassID`, `Grade`, `StudentUserID`) VALUES (2, 2, '97', 3);
INSERT INTO `StudentOverallGrade` (`StudentOverAllGradeID`, `ClassID`, `Grade`, `StudentUserID`) VALUES (4, 3, '67', 6);
INSERT INTO `StudentOverallGrade` (`StudentOverAllGradeID`, `ClassID`, `Grade`, `StudentUserID`) VALUES (5, 4, '78', 8);
INSERT INTO `StudentOverallGrade` (`StudentOverAllGradeID`, `ClassID`, `Grade`, `StudentUserID`) VALUES (6, 5, '100', 10);
# 5 records

#
# Table structure for table 'StudentWorkOverview'
#

DROP TABLE IF EXISTS `StudentWorkOverview`;

CREATE TABLE `StudentWorkOverview` (
  `StudentWorkOverviewID` INTEGER NOT NULL AUTO_INCREMENT, 
  `StudentUserID` INTEGER DEFAULT 0, 
  `ClassID` INTEGER DEFAULT 0, 
  `WorkGrade` VARCHAR(255), 
  `Feedback` LONGTEXT, 
  `NumOfAttemptsUsed` INTEGER DEFAULT 0, 
  `SubmissionDate` DATETIME, 
  `WorkID` INTEGER DEFAULT 0, 
  INDEX (`ClassID`), 
  INDEX (`NumOfAttemptsUsed`), 
  PRIMARY KEY (`StudentWorkOverviewID`), 
  INDEX (`StudentUserID`), 
  INDEX (`WorkID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'StudentWorkOverview'
#

INSERT INTO `StudentWorkOverview` (`StudentWorkOverviewID`, `StudentUserID`, `ClassID`, `WorkGrade`, `Feedback`, `NumOfAttemptsUsed`, `SubmissionDate`, `WorkID`) VALUES (1, 2, 1, '89', '…', 2, '2025-05-10 00:00:00', 1);
INSERT INTO `StudentWorkOverview` (`StudentWorkOverviewID`, `StudentUserID`, `ClassID`, `WorkGrade`, `Feedback`, `NumOfAttemptsUsed`, `SubmissionDate`, `WorkID`) VALUES (2, 3, 3, '78', '…', 5, '2025-01-30 00:00:00', 2);
INSERT INTO `StudentWorkOverview` (`StudentWorkOverviewID`, `StudentUserID`, `ClassID`, `WorkGrade`, `Feedback`, `NumOfAttemptsUsed`, `SubmissionDate`, `WorkID`) VALUES (3, 6, 4, '68', '…', 4, '2024-06-12 00:00:00', 3);
INSERT INTO `StudentWorkOverview` (`StudentWorkOverviewID`, `StudentUserID`, `ClassID`, `WorkGrade`, `Feedback`, `NumOfAttemptsUsed`, `SubmissionDate`, `WorkID`) VALUES (4, 8, 2, '94', '….', 8, '2024-08-14 00:00:00', 4);
INSERT INTO `StudentWorkOverview` (`StudentWorkOverviewID`, `StudentUserID`, `ClassID`, `WorkGrade`, `Feedback`, `NumOfAttemptsUsed`, `SubmissionDate`, `WorkID`) VALUES (5, 10, 5, '100', '…', 1, '2024-06-30 00:00:00', 5);
# 5 records

#
# Table structure for table 'UploadedContent'
#

DROP TABLE IF EXISTS `UploadedContent`;

CREATE TABLE `UploadedContent` (
  `ContentID` INTEGER NOT NULL AUTO_INCREMENT, 
  `ContentTitle` VARCHAR(255), 
  `UploadedDate` DATETIME, 
  `ContentDescription` LONGTEXT, 
  `ContentType` VARCHAR(255), 
  `FilePathOrURL` LONGTEXT, 
  `ClassID` INTEGER DEFAULT 0, 
  `UploaderID` INTEGER DEFAULT 0, 
  INDEX (`ClassID`), 
  PRIMARY KEY (`ContentID`), 
  INDEX (`UploaderID`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'UploadedContent'
#

INSERT INTO `UploadedContent` (`ContentID`, `ContentTitle`, `UploadedDate`, `ContentDescription`, `ContentType`, `FilePathOrURL`, `ClassID`, `UploaderID`) VALUES (1, 'Calculus Examples', '2025-04-17 00:00:00', NULL, 'pdf', 'User/Desktop/Calc.pdf#http://user/Desktop/Calc.pdf#', 1, 1);
INSERT INTO `UploadedContent` (`ContentID`, `ContentTitle`, `UploadedDate`, `ContentDescription`, `ContentType`, `FilePathOrURL`, `ClassID`, `UploaderID`) VALUES (2, 'Operating System Types', '2025-01-18 00:00:00', NULL, 'pdf', 'User/Desktop/OS.pdf#http://User/Desktop/OS.pdf#', 2, 4);
INSERT INTO `UploadedContent` (`ContentID`, `ContentTitle`, `UploadedDate`, `ContentDescription`, `ContentType`, `FilePathOrURL`, `ClassID`, `UploaderID`) VALUES (3, 'HIS Lesson 1', '2024-05-23 00:00:00', NULL, 'pdf', 'User/Desktop/History.pdf#http://User/Desktop/History.pdf#', 3, 5);
INSERT INTO `UploadedContent` (`ContentID`, `ContentTitle`, `UploadedDate`, `ContentDescription`, `ContentType`, `FilePathOrURL`, `ClassID`, `UploaderID`) VALUES (4, 'Chemistry Lesson 1', '2024-07-17 00:00:00', NULL, 'pdf', 'User/Desktop/Chem.pdf#http://User/Desktop/Chem.pdf#', 4, 7);
INSERT INTO `UploadedContent` (`ContentID`, `ContentTitle`, `UploadedDate`, `ContentDescription`, `ContentType`, `FilePathOrURL`, `ClassID`, `UploaderID`) VALUES (5, 'Art Lesson 2', '2024-06-26 00:00:00', NULL, 'video', 'User/Desktop/Art.mp4#http://User/Desktop/Art.mp4#', 5, 9);
# 5 records

#
# Table structure for table 'Users'
#

DROP TABLE IF EXISTS `Users`;

CREATE TABLE `Users` (
  `UserID` INTEGER NOT NULL AUTO_INCREMENT, 
  `FirstName` VARCHAR(255), 
  `LastName` VARCHAR(255), 
  `Email` VARCHAR(255), 
  `PhoneNumber` VARCHAR(255), 
  `DateOfBirth` DATETIME, 
  `Password` VARCHAR(255), 
  `RegistrationDate` TIMESTAMP DEFAULT CURRENT_TIMESTAMP, 
  `Role` VARCHAR(255), 
  UNIQUE (`Email`), 
  PRIMARY KEY (`UserID`), 
  INDEX (`FirstName`)
) ENGINE=myisam DEFAULT CHARSET=utf8;

SET autocommit=1;

#
# Dumping data for table 'Users'
#

INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (1, 'John', 'Smith', 'JohnSmith@gmail.com', '945-637-4663', '1987-05-16 00:00:00', '*************', '2022-10-10 00:00:00', 'Teacher');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (2, 'Mark', 'Cuban', 'MarkCuban32@gmail.com', '637-743-5784', '2002-05-15 00:00:00', '*************', '2023-08-09 19:37:43', 'Student');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (3, 'Juan', 'Jose', 'JuanJose48@gmail.com', '457-432-4583', '2006-10-10 00:00:00', '*************', '2024-01-17 20:21:52', 'Student');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (4, 'Zoe', 'Perez', 'ZoePerez65@gmail.com', '433-754-6543', '1967-03-11 00:00:00', '*************', '2024-06-11 20:31:55', 'Teacher');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (5, 'Destiny', 'Mendez', 'DestinyM@gmail.com', '905-543-6453', '1988-08-13 00:00:00', '*************', '2024-02-05 20:32:29', 'Teacher');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (6, 'Kayla', 'Brown', 'KaylaB@gmail.com', '953-432-5432', '2001-09-17 00:00:00', '*************', '2024-05-26 20:50:19', 'Student');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (7, 'Yusef', 'Muhammed', 'Yusef@gmail.com', '132-432-5323', '1977-08-22 00:00:00', '*************', '2024-04-14 20:55:37', 'Teacher');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (8, 'Layla', 'Cortez', 'Layla364@gmail.com', '573-654-5423', '2004-01-22 00:00:00', '*************', '2024-04-15 21:33:34', 'Student');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (9, 'Jacob', 'Burrough', 'JacobBB@gmail.com', '134-654-6543', '1997-08-22 00:00:00', '*************', '2024-02-11 22:16:54', 'Teacher');
INSERT INTO `Users` (`UserID`, `FirstName`, `LastName`, `Email`, `PhoneNumber`, `DateOfBirth`, `Password`, `RegistrationDate`, `Role`) VALUES (10, 'Pamela', 'Chapman', 'Pamela93Chap@gmail.com', '564-765-5463', '2008-10-23 00:00:00', '*************', '2025-05-13 22:17:19', 'Student');
# 10 records