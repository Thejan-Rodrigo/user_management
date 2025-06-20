USE user_management;

--Created Table
CREATE TABLE `user` (
  `ID` int NOT NULL ,
  `FirstName` varchar(100) NOT NULL,
  `LastName` varchar(100) NOT NULL,
  `Age` int NOT NULL,
  PRIMARY KEY (`ID`)
);