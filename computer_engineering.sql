-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1:3306
-- Üretim Zamanı: 11 Eki 2019, 17:59:34
-- Sunucu sürümü: 5.7.26
-- PHP Sürümü: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `computer engineering`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `classes`
--

DROP TABLE IF EXISTS `classes`;
CREATE TABLE IF NOT EXISTS `classes` (
  `class-name` varchar(10) NOT NULL,
  `course-id` int(5) NOT NULL,
  `course-name` varchar(50) NOT NULL,
  PRIMARY KEY (`course-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `classes`
--

INSERT INTO `classes` (`class-name`, `course-id`, `course-name`) VALUES
('MF003', 39480, 'Computer Programming'),
('MF303', 43958, 'Circuit Analysis');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `courses`
--

DROP TABLE IF EXISTS `courses`;
CREATE TABLE IF NOT EXISTS `courses` (
  `course-id` int(5) NOT NULL,
  `course-name` varchar(250) NOT NULL,
  `course-code` varchar(250) NOT NULL,
  `course-credit` int(1) NOT NULL,
  `grade` int(1) NOT NULL,
  `teacher-id` int(9) NOT NULL,
  PRIMARY KEY (`course-id`,`teacher-id`),
  KEY `teacher-id` (`teacher-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `courses`
--

INSERT INTO `courses` (`course-id`, `course-name`, `course-code`, `course-credit`, `grade`, `teacher-id`) VALUES
(39480, 'Computer Programming', 'COME 103', 4, 1, 253847234),
(43958, 'Circuit Analysis', 'COME 213', 4, 2, 983479384);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `exams`
--

DROP TABLE IF EXISTS `exams`;
CREATE TABLE IF NOT EXISTS `exams` (
  `std-id` int(9) NOT NULL,
  `std-name` varchar(250) NOT NULL,
  `std-surname` varchar(250) NOT NULL,
  `course-code` varchar(10) NOT NULL,
  `midterm` int(11) NOT NULL,
  `final` int(11) NOT NULL,
  `transcript` varchar(2) NOT NULL,
  PRIMARY KEY (`std-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `exams`
--

INSERT INTO `exams` (`std-id`, `std-name`, `std-surname`, `course-code`, `midterm`, `final`, `transcript`) VALUES
(171501004, 'Batuhan', 'Keskin', 'COME 213', 94, 90, 'AA'),
(171501012, 'Selin', 'Arslan', 'COME 103', 92, 90, 'AA');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `students`
--

DROP TABLE IF EXISTS `students`;
CREATE TABLE IF NOT EXISTS `students` (
  `std-id` int(9) NOT NULL,
  `std-name` varchar(250) NOT NULL,
  `std-surname` varchar(250) NOT NULL,
  `std-grade` int(1) NOT NULL,
  `std-gender` varchar(20) NOT NULL,
  `std-city` varchar(20) NOT NULL,
  `std-mail` varchar(30) NOT NULL,
  `std-phone` double NOT NULL,
  PRIMARY KEY (`std-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `students`
--

INSERT INTO `students` (`std-id`, `std-name`, `std-surname`, `std-grade`, `std-gender`, `std-city`, `std-mail`, `std-phone`) VALUES
(171501004, 'Batuhan', 'Keskin', 2, 'male', 'Adana', 'batuhankeskin@gmail.com', 5053945802),
(171501012, 'Selin', 'Arslan', 1, 'female', 'Gaziantep', 'selinarslan@gmail.com', 5068753565);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `student_courses`
--

DROP TABLE IF EXISTS `student_courses`;
CREATE TABLE IF NOT EXISTS `student_courses` (
  `std-id` int(9) NOT NULL,
  `course-id` int(5) NOT NULL,
  PRIMARY KEY (`std-id`,`course-id`),
  KEY `course-id` (`course-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `student_courses`
--

INSERT INTO `student_courses` (`std-id`, `course-id`) VALUES
(171501012, 39480),
(171501004, 43958);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `teachers`
--

DROP TABLE IF EXISTS `teachers`;
CREATE TABLE IF NOT EXISTS `teachers` (
  `teacher-id` int(9) NOT NULL,
  `teacher-name` varchar(250) NOT NULL,
  `teacher-surname` varchar(250) NOT NULL,
  `teacher-gender` varchar(20) NOT NULL,
  `teacher-city` varchar(20) NOT NULL,
  `teacher-mail` varchar(50) NOT NULL,
  `teacher-phone` double NOT NULL,
  PRIMARY KEY (`teacher-id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Tablo döküm verisi `teachers`
--

INSERT INTO `teachers` (`teacher-id`, `teacher-name`, `teacher-surname`, `teacher-gender`, `teacher-city`, `teacher-mail`, `teacher-phone`) VALUES
(253847234, 'Fatih ', 'Hasoglu', 'male', 'Gaziantep', 'fatih_hasoglu@gmail.com', 5043984753),
(983479384, 'Hasan Selcuk', 'Selek', 'male', 'Gaziantep', 'hasanselek@gmail.com', 5053290483);

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `classes`
--
ALTER TABLE `classes`
  ADD CONSTRAINT `classes_ibfk_1` FOREIGN KEY (`course-id`) REFERENCES `courses` (`course-id`);

--
-- Tablo kısıtlamaları `courses`
--
ALTER TABLE `courses`
  ADD CONSTRAINT `courses_ibfk_1` FOREIGN KEY (`teacher-id`) REFERENCES `teachers` (`teacher-id`);

--
-- Tablo kısıtlamaları `exams`
--
ALTER TABLE `exams`
  ADD CONSTRAINT `exams_ibfk_1` FOREIGN KEY (`std-id`) REFERENCES `students` (`std-id`);

--
-- Tablo kısıtlamaları `student_courses`
--
ALTER TABLE `student_courses`
  ADD CONSTRAINT `student_courses_ibfk_1` FOREIGN KEY (`std-id`) REFERENCES `students` (`std-id`),
  ADD CONSTRAINT `student_courses_ibfk_2` FOREIGN KEY (`course-id`) REFERENCES `courses` (`course-id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
