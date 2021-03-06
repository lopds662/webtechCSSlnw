--
-- Database: `project_webtech_csslnw`
--

-- --------------------------------------------------------

--
-- Table structure for table `class`
--

CREATE TABLE `class` (
  `id` int(11) NOT NULL,
  `id_subject_semester` int(11) NOT NULL,
  `time_limit` varchar(5) NOT NULL,
  `qr_path` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `class`
--

INSERT INTO `class` (`id`, `id_subject_semester`, `time_limit`, `qr_path`) VALUES
(1, 1, '10.00', NULL),
(2, 3, '13.00', NULL),
(3, 3, '09:00', NULL),
(4, 3, '01:00', NULL),
(5, 3, '11:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `comment`
--

CREATE TABLE `comment` (
  `id` int(11) NOT NULL,
  `username_stu` varchar(10) NOT NULL,
  `username_tea` varchar(10) NOT NULL,
  `id_subject_semester` int(11) NOT NULL,
  `comment_text` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `comment`
--

INSERT INTO `comment` (`id`, `username_stu`, `username_tea`, `id_subject_semester`, `comment_text`) VALUES
(1, '5510404206', '5010400201', 1, 'Good'),
(2, '5510404205', '5010400202', 2, 'very good'),
(3, '5510404207', '5010400202', 3, 'sometime late'),
(4, '5510404209', '5010400202', 4, ' good human relation'),
(5, '5510404205', '5010400202', 5, 'High sense of responsibility'),
(6, '5510404208', '5010400201', 1, 'Proven leadership skills '),
(7, '5510404209', '5010400203', 2, 'Alert, aggressive and willing to work hard'),
(8, '5510404207', '5010400201', 3, 'Good personality and a team player '),
(9, '5010400203', '5510404209', 4, ' innovative and good interpersonal skills.'),
(10, '5510404205', '5010400203', 5, 'Strong personality and hard working.'),
(11, '5510404205', '5610400091', 1418217, 'This is awesome.'),
(12, '5510404205', '5610400091', 2, 'This is also awesome too'),
(13, '5610450080', '5510404205', 1, 'Well done'),
(14, '5610450080', '5510404207', 1, 'Very Good'),
(15, '5610450080', '5510404208', 1, 'Good Job!!!!!');

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `id` int(11) NOT NULL,
  `role_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`id`, `role_name`) VALUES
(1, 'Student'),
(2, 'Teacher'),
(3, 'Laboratory-Teacher'),
(4, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `subject`
--

CREATE TABLE `subject` (
  `id` varchar(8) NOT NULL,
  `name` varchar(255) NOT NULL,
  `credit` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject`
--

INSERT INTO `subject` (`id`, `name`, `credit`) VALUES
('01418114', 'Introduction to Computer Science', 4),
('01418116', 'Computer Programming', 3),
('01418131', 'DigitalComputerLogic', 3),
('01418132', 'FundamentalsofComputing', 4),
('01418217', 'Object Oriented Programming', 3),
('01418221', 'Database System', 3);

-- --------------------------------------------------------

--
-- Table structure for table `subject_semester`
--

CREATE TABLE `subject_semester` (
  `id` int(11) NOT NULL,
  `id_subject` varchar(8) NOT NULL,
  `semester` int(1) NOT NULL,
  `year` int(4) NOT NULL,
  `section` int(3) NOT NULL,
  `time` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_semester`
--

INSERT INTO `subject_semester` (`id`, `id_subject`, `semester`, `year`, `section`, `time`) VALUES
(1, '01418116', 2, 2016, 1, '09.30-11.30'),
(2, '01418114', 1, 2016, 1, '08.00-10.00'),
(3, '01418221', 2, 2016, 200, '08.00-12.00'),
(4, '01418217', 1, 2016, 200, '12.00-16.00'),
(5, '01418131', 1, 2015, 1, '08:00');

-- --------------------------------------------------------

--
-- Table structure for table `subject_teacher`
--

CREATE TABLE `subject_teacher` (
  `username` varchar(10) NOT NULL,
  `id_subject_semester` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `subject_teacher`
--

INSERT INTO `subject_teacher` (`username`, `id_subject_semester`) VALUES
('5010400201', 5),
('5010401204', 5),
('5610400091', 1),
('5610400091', 2),
('5610400091', 3),
('5610400091', 4);

-- --------------------------------------------------------

--
-- Table structure for table `takes`
--

CREATE TABLE `takes` (
  `username` varchar(10) NOT NULL,
  `id_subject_semester` int(11) NOT NULL,
  `grade` float DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `takes`
--

INSERT INTO `takes` (`username`, `id_subject_semester`, `grade`) VALUES
('5510404205', 5, NULL),
('5510404206', 5, NULL),
('5510404209', 1, NULL),
('5510404209', 5, NULL),
('5610450080', 1, NULL),
('5610450080', 2, 4);

-- --------------------------------------------------------

--
-- Table structure for table `take_class`
--

CREATE TABLE `take_class` (
  `id_class` int(11) NOT NULL,
  `username_stu` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `take_class`
--

INSERT INTO `take_class` (`id_class`, `username_stu`) VALUES
(1, '5510404206'),
(1, '5510404207'),
(1, '5510404208'),
(2, '5510404205'),
(2, '5510404206'),
(2, '5510404207'),
(2, '5510404209'),
(4, '5610450080'),
(5, '5610450080');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `username` varchar(10) CHARACTER SET utf8mb4 NOT NULL,
  `password` varchar(64) NOT NULL,
  `fname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `lname` varchar(255) CHARACTER SET utf8mb4 NOT NULL,
  `pic_path` varchar(255) CHARACTER SET utf8mb4 DEFAULT 'files/img/profile/contact-default3.png',
  `role_id` int(1) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `tel` varchar(12) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`username`, `password`, `fname`, `lname`, `pic_path`, `role_id`, `email`, `address`, `tel`) VALUES
('5010400201', '024e4ef7f3c1a12db0b9cd914318c226644c9537', 'Chuleerat', 'Jaruskulchai', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010400202', '6d04a668ccc2166d714a086df60aca8082ed8667', 'Anongnart', 'Srivihok', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010400203', 'e67ea1c73229b4fec8aeb04ba02d8ba092e4569d', 'Sirikorn', 'Channual', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010400211', '2d5760791b83a579633c9eb57f63b0f1127daef9', 'Soontharee', 'Koompairojn', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010400212', 'dd1e4ab55aab789bc3d29e46540739ab435478b4', 'Sukumal', 'Kitisin', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010400213', 'f7bd9ac6946900fc1d9ef166b78449710e65900c', 'Sethavidh', 'Gertphol', 'files/img/profile/contact-default3.png', 2, NULL, NULL, NULL),
('5010401204', '78ae9f6e6a12a1af3c5a87f0f649f73aa2b4c7be', 'Sornchai', 'Laksanapeeti', 'files/img/profile/contact-default3.png', 3, NULL, NULL, NULL),
('5010401243', '6fd599b68b363c01a1296645da4305d3313ebb3f', 'Ratwalan', 'Yonpaladyot', 'files/img/profile/contact-default3.png', 3, NULL, NULL, NULL),
('5010401244', '89ca91e6c9b28bdcfb629b12758f955d21072594', 'Canapat', 'Yostrakul', 'files/img/profile/contact-default3.png', 3, NULL, NULL, NULL),
('5010405210', 'ecacae52b5fb785e1062b2db0471bdc945ba4c11', 'Ronnapat', 'Chatsanguthai', 'files/img/profile/contact-default3.png', 4, NULL, NULL, NULL),
('5010405224', '68ecbf29bc06f656a27369b8fc67a4396c5a9c1a', 'Paksuda', 'Sripraipran', 'files/img/profile/contact-default3.png', 4, NULL, NULL, NULL),
('5510404205', '544a6ce776b846b62f200eedabf8f2d0d0c3558d', 'Ekachai', 'Srivanna', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5510404206', 'd6b921ce93f6474cbbf71f0d9649500cd39e7e41', 'Suriyu', 'Chevasath', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5510404207', '664b0ec2b6bd0af879f7b9f82205e8639159d7fd', 'Chota', 'Takemura', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5510404208', 'e3645f32b13dbf35284ae794893a1b7dc71b0532', 'Tanatath', 'Likhittharakul', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5510404209', 'bc9df7db16d7e5bdda4cc0b9d650014304c67dda', 'Kamonwut', 'Chittrarat', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5610400091', '0ed02142ead58ab9da947e00fa0f416895478618', 'Nattharat', 'Jariyanuntanet', 'files/img/profile/5610400091.jpg', 3, 'nattharat.j@ku.th', 'Nonthaburi Thailand', '085-000-3214'),
('5610404452', '78c84e6895448e0317aa1f06f807c4e22fba5113', 'Boonyaporn', 'Narkjumrussri', 'files/img/profile/contact-default3.png', 4, 'boonyaporn.n@ku.th', 'Bongkok, Thailand', '089-999-9999'),
('5610450063', 'c9dfb3338b461c8662ce7c52f4a28672a75b9fb5', 'Jompol', 'Sermsook', 'files/img/profile/contact-default3.png', 4, 'jompol.s@ku.th', 'Nonthaburi, Thailand', '085-088-1886'),
('5610450080', '817965431c04a46f3af2f982ceff704a9cd0890b', 'Chayamon', 'Kanjanapongsawet', 'files/img/profile/5610450080.png', 1, 'chayamon.ka@ku.th', 'Samyan, Bangkok, Thailand', '081-555-1511'),
('5710404220', 'a726ba86e89d42680f0ea45b4e458de6b4b209c6', 'Napat', 'Samretvit', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5710404221', 'e3be37d663e1af2d8656bd7f81c4212f498ce6ea', 'PatCharapol', 'Chartvivatpornchai', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5710404222', '3fda26f8cff4123ddcad0c1bc89ed1e79977acef', 'Sivakorn', 'Boontawee', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL),
('5710404223', '3751d247493039b964ddd24585934e15aaf753bd', 'Natthapach', 'Anuwattananon', 'files/img/profile/contact-default3.png', 1, NULL, NULL, NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `comment`
--
ALTER TABLE `comment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subject`
--
ALTER TABLE `subject`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `subject_semester`
--
ALTER TABLE `subject_semester`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

--
-- Indexes for table `subject_teacher`
--
ALTER TABLE `subject_teacher`
  ADD PRIMARY KEY (`username`,`id_subject_semester`);

--
-- Indexes for table `takes`
--
ALTER TABLE `takes`
  ADD PRIMARY KEY (`username`,`id_subject_semester`);

--
-- Indexes for table `take_class`
--
ALTER TABLE `take_class`
  ADD PRIMARY KEY (`id_class`,`username_stu`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`username`),
  ADD UNIQUE KEY `username` (`username`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `class`
--
ALTER TABLE `class`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `comment`
--
ALTER TABLE `comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `subject_semester`
--
ALTER TABLE `subject_semester`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
