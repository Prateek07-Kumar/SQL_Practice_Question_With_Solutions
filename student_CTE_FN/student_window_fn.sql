create Database students;
use students;
--

-- --------------------------------------------------------

--
-- Table structure for table `student_marks`
--
CREATE TABLE `student_marks` (
  `student_id` int(2) DEFAULT NULL,
  `name` varchar(8) DEFAULT NULL,
  `branch` varchar(4) DEFAULT NULL,
  `marks` int(2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Dumping data for table `student_marks`
--
INSERT INTO `student_marks` (`student_id`, `name`, `branch`, `marks`) VALUES
(1, 'Nitish', 'EEE', 82),
(2, 'Rishabh', 'EEE', 91),
(3, 'Anukant', 'EEE', 69),
(4, 'Rupesh', 'EEE', 55),
(5, 'Shubham', 'CSE', 78),
(6, 'Ved', 'CSE', 43),
(7, 'Deepak', 'CSE', 98),
(8, 'Arpan', 'CSE', 95),
(9, 'Vinay', 'ECE', 95),
(10, 'Ankit', 'ECE', 88),
(11, 'Anand', 'ECE', 81),
(12, 'Rohit', 'ECE', 95),
(13, 'Prashant', 'MECH', 75),
(14, 'Amit', 'MECH', 69),
(15, 'Sunny', 'MECH', 39),
(16, 'Gautam', 'MECH', 51),
(17, 'Abhi', 'EEE', 1);
COMMIT;

SELECT *, 
PERCENTILE_DISC(0.5) WITHIN GROUP (ORDER BY marks) OVER () AS 'median_marks'
FROM student_marks;

select * from student_marks;

SELECT *, 
PERCENTILE_DISC(0.5) WITHIN GROUP(ORDER BY marks) OVER(partition by branch) AS 'median_marks'
PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY marks) OVER(partition by branch) AS 'median_marks'
FROM student_marks;



SELECT *, 
PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY marks) OVER() AS 'median_marks',
PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY marks) OVER() AS 'median_marks'
FROM student_marks;


SELECT * from (select *, 
    PERCENTILE_CONT(0.25) WITHIN GROUP(ORDER BY marks) OVER () AS 'Q1',
    PERCENTILE_CONT(0.75) WITHIN GROUP(ORDER BY marks) OVER () AS 'Q2'
FROM student_marks) t

SELECT *,
    PERCENTILE_CONT(0.25) OVER (ORDER BY marks) AS 'Q1',
    PERCENTILE_CONT(0.75) OVER (ORDER BY marks) AS 'Q3'
FROM student_marks;




