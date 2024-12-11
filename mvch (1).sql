-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 11, 2024 at 05:10 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mvch`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `adminID` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`adminID`, `username`, `password`, `name`) VALUES
(1, 'Viktor Greg', 'greg', 'Viktor Lim'),
(2, 'Kerth Nathaniel', 'kerth', 'Kerth Canda');

-- --------------------------------------------------------

--
-- Table structure for table `diagnostic_unit`
--

CREATE TABLE `diagnostic_unit` (
  `DiagnosticUnitID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` varchar(100) DEFAULT NULL CHECK (`Type` in ('Radiology','Laboratory','Cardiac Diagnostic Unit','Psychiatric testing')),
  `FacilityID_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `facility`
--

CREATE TABLE `facility` (
  `FacilityID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Location` varchar(255) DEFAULT NULL,
  `Capacity` int(11) DEFAULT NULL CHECK (`Capacity` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicalorder`
--

CREATE TABLE `medicalorder` (
  `OrderID` bigint(20) UNSIGNED NOT NULL,
  `PatientID_FK` int(11) NOT NULL,
  `PhysicianID_FK` int(11) NOT NULL,
  `OrderType` varchar(50) DEFAULT NULL CHECK (`OrderType` in ('Diagnostic Test','Drug')),
  `OrderDate` date DEFAULT curdate(),
  `Status` varchar(50) DEFAULT NULL CHECK (`Status` in ('Pending','Completed','Cancelled'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `medicalsurgicalitem`
--

CREATE TABLE `medicalsurgicalitem` (
  `ItemID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Type` varchar(50) DEFAULT NULL CHECK (`Type` in ('Medical','Surgical')),
  `VendorID` int(11) DEFAULT NULL,
  `Quantity` int(11) NOT NULL,
  `cost` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `medicalsurgicalitem`
--

INSERT INTO `medicalsurgicalitem` (`ItemID`, `Name`, `Type`, `VendorID`, `Quantity`, `cost`) VALUES
(1, 'Scalpel', 'Surgical', NULL, 200, 100),
(2, 'Stethoscope', 'Medical', NULL, 20, 200),
(3, 'Surgical Gloves', 'Surgical', NULL, 30, 200),
(4, 'Surgical Scissors', 'Surgical', NULL, 10, 500),
(5, 'Forceps', 'Surgical', NULL, 30, 300),
(6, 'Needle Holders', 'Surgical', NULL, 30, 300),
(7, 'Bandage', 'Medical', NULL, 15, 300),
(8, 'Masks', 'Medical', NULL, 50, 100),
(9, 'WheelChairs', 'Medical', NULL, 100, 1000),
(10, 'Blood Pressure Monitor', 'Medical', NULL, 100, 1000);

-- --------------------------------------------------------

--
-- Table structure for table `patient`
--

CREATE TABLE `patient` (
  `PatientID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `DateOfBirth` date NOT NULL,
  `Gender` char(1) DEFAULT NULL CHECK (`Gender` in ('M','F')),
  `WardID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `patient`
--

INSERT INTO `patient` (`PatientID`, `Name`, `DateOfBirth`, `Gender`, `WardID`) VALUES
(1, 'Danisa Biliran', '2003-07-14', 'F', NULL),
(2, 'Ombre Hamsirani', '2004-03-24', 'M', NULL),
(3, 'Viktor Greg Lim', '2002-05-31', 'M', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `physician`
--

CREATE TABLE `physician` (
  `PhysicianID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Specialty` varchar(50) DEFAULT NULL,
  `FacilityID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `physicianpatient`
--

CREATE TABLE `physicianpatient` (
  `PhysicianID` int(11) NOT NULL,
  `PatientID` int(11) NOT NULL,
  `DiagnosisDate` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `StaffID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Role` varchar(50) DEFAULT NULL CHECK (`Role` in ('Nurse','Secretary','Technician'))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `staff`
--

INSERT INTO `staff` (`StaffID`, `Name`, `Role`) VALUES
(1, 'Viktor Greg Lim', 'Nurse'),
(2, 'Kerth Nathaniel Canda', 'Nurse'),
(3, 'Danisa Biliran', 'Nurse'),
(4, 'Yvann Neo Capitan', 'Nurse');

-- --------------------------------------------------------

--
-- Table structure for table `staffward`
--

CREATE TABLE `staffward` (
  `StaffID_FK` int(11) NOT NULL,
  `WardID_FK` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `vendor`
--

CREATE TABLE `vendor` (
  `VendorID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `ContactInfo` varchar(255) DEFAULT NULL,
  `Address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ward`
--

CREATE TABLE `ward` (
  `WardID` bigint(20) UNSIGNED NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Specialty` varchar(50) DEFAULT NULL CHECK (`Specialty` in ('Obstetrics','Oncology','Geriatrics','General')),
  `FacilityID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`adminID`);

--
-- Indexes for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  ADD PRIMARY KEY (`DiagnosticUnitID`);

--
-- Indexes for table `facility`
--
ALTER TABLE `facility`
  ADD PRIMARY KEY (`FacilityID`);

--
-- Indexes for table `medicalorder`
--
ALTER TABLE `medicalorder`
  ADD PRIMARY KEY (`OrderID`);

--
-- Indexes for table `medicalsurgicalitem`
--
ALTER TABLE `medicalsurgicalitem`
  ADD PRIMARY KEY (`ItemID`);

--
-- Indexes for table `patient`
--
ALTER TABLE `patient`
  ADD PRIMARY KEY (`PatientID`);

--
-- Indexes for table `physician`
--
ALTER TABLE `physician`
  ADD PRIMARY KEY (`PhysicianID`);

--
-- Indexes for table `physicianpatient`
--
ALTER TABLE `physicianpatient`
  ADD PRIMARY KEY (`PhysicianID`,`PatientID`,`DiagnosisDate`);

--
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`StaffID`);

--
-- Indexes for table `staffward`
--
ALTER TABLE `staffward`
  ADD PRIMARY KEY (`StaffID_FK`,`WardID_FK`);

--
-- Indexes for table `vendor`
--
ALTER TABLE `vendor`
  ADD PRIMARY KEY (`VendorID`);

--
-- Indexes for table `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`WardID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `adminID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `diagnostic_unit`
--
ALTER TABLE `diagnostic_unit`
  MODIFY `DiagnosticUnitID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `facility`
--
ALTER TABLE `facility`
  MODIFY `FacilityID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicalorder`
--
ALTER TABLE `medicalorder`
  MODIFY `OrderID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `medicalsurgicalitem`
--
ALTER TABLE `medicalsurgicalitem`
  MODIFY `ItemID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `patient`
--
ALTER TABLE `patient`
  MODIFY `PatientID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `physician`
--
ALTER TABLE `physician`
  MODIFY `PhysicianID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `StaffID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `vendor`
--
ALTER TABLE `vendor`
  MODIFY `VendorID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `ward`
--
ALTER TABLE `ward`
  MODIFY `WardID` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
