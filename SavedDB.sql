
CREATE TABLE atmeneti_beosztas (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(255), 
	`fullName` VARCHAR(255), 
	`currDate` DATE, 
	`startH` TIME, 
	`endH` TIME, 
	`isApproved` TINYINT(1) DEFAULT '0', 
	`workSpot` VARCHAR(15), 
	`createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE atmeneti_szabadsag (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(100), 
	`fullName` VARCHAR(150), 
	`startDate` DATE NOT NULL, 
	`endDate` DATE NOT NULL, 
	`isApproved` TINYINT(1) DEFAULT '0', 
	`createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE beosztas (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(100), 
	`fullName` VARCHAR(100), 
	`currDate` DATE, 
	`startH` TIME, 
	`endH` TIME, 
	`workSpot` VARCHAR(15), 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE beosztas_modositasa (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(255) NOT NULL, 
	`fullName` VARCHAR(255) NOT NULL, 
	`currDate` DATE NOT NULL, 
	`oldStartH` TIME NOT NULL, 
	`oldEndH` TIME NOT NULL, 
	`newStartH` TIME NOT NULL, 
	`newEndH` TIME NOT NULL, 
	`createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, 
	`isApproved` TINYINT DEFAULT '0', 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE fixed_holidays (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`holidayName` VARCHAR(255) NOT NULL, 
	`holidayDate` DATE NOT NULL, 
	`isVariable` TINYINT(1) DEFAULT '0', 
	description TEXT, 
	year INTEGER NOT NULL, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE notifications (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`notificationType` VARCHAR(50), 
	message TEXT, 
	`senderId` INTEGER, 
	receivers TEXT, 
	`referenceId` INTEGER, 
	status TINYINT(1) DEFAULT '0', 
	`createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, 
	`updatedAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE oktatas (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(100), 
	`fullName` VARCHAR(100), 
	`eventName` VARCHAR(200), 
	`currDate` DATE, 
	`startH` TIME, 
	`endH` TIME, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE roles (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	role_type VARCHAR(10), 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE szabadsag (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(100), 
	`fullName` VARCHAR(150), 
	`startDate` DATE NOT NULL, 
	`endDate` DATE NOT NULL, 
	`createdAt` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP, 
	`szabadsagType` VARCHAR(20), 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;

CREATE TABLE users (
	id INTEGER NOT NULL AUTO_INCREMENT, 
	`userName` VARCHAR(100), 
	`firstName` VARCHAR(50) NOT NULL, 
	`lastName` VARCHAR(50) NOT NULL, 
	role_id INTEGER, 
	password_hash VARCHAR(100), 
	salt VARCHAR(100), 
	`numOfChild` INTEGER, 
	`workTime` INTEGER, 
	`yearOfBirth` INTEGER, 
	color VARCHAR(20), 
	holidays INTEGER, 
	`workDayOfYear` INTEGER, 
	PRIMARY KEY (id)
)COLLATE utf8mb4_0900_ai_ci ENGINE=InnoDB DEFAULT CHARSET=utf8mb4

;
INSERT INTO atmeneti_beosztas VALUES ('1207', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-01', '18:00:00', '19:00:00', '0', 'homeoffice', '2024-04-25 11:50:37');
INSERT INTO beosztas VALUES ('692', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-02', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('693', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-03', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('694', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-04', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('695', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-05', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('696', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-08', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('697', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-09', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('698', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-10', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('699', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-11', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('700', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-12', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('701', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-15', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('702', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-16', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('703', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-17', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('704', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-18', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('705', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-19', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('706', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-22', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('707', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-23', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('708', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-24', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('709', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-25', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('710', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-26', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('711', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-29', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('734', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-04', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('735', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-05', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('736', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('737', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-09', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('738', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-10', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('739', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-11', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('740', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-12', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('741', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-15', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('742', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-16', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('743', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('744', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-18', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('745', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-19', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('746', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-22', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('747', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-23', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('748', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-24', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('749', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-25', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('750', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-26', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('751', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-29', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('752', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-30', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('753', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-02', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('754', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-03', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('755', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-04', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('756', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-05', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('757', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('758', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-09', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('759', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-10', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('760', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-11', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('761', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-12', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('762', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-15', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('763', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-16', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('764', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('765', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-18', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('766', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-19', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('767', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-22', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('768', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-23', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('769', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-24', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('770', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-25', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('771', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-26', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('772', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-29', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('773', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-30', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('774', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('775', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('776', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-04', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('778', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('779', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('780', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('781', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-11', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('782', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-12', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('783', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('784', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('785', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('786', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-18', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('787', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-19', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('788', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('789', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('790', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('791', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-25', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('792', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('793', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('794', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('816', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('818', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-04', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('819', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-05', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('820', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('821', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('822', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('823', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-11', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('824', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-12', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('825', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('826', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('827', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('828', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-18', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('829', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-19', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('831', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('832', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('833', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-25', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('834', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('835', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('836', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('837', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('839', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-04', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('840', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-05', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('841', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('842', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('843', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('844', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-11', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('845', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-12', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('846', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('847', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('848', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('852', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('853', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('854', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-25', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('855', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('856', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('857', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('871', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-20', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('872', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-21', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('873', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-27', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('874', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-28', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('875', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('876', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('877', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('878', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('879', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('880', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('881', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('882', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('883', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('884', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-08', '8:00:00', '16:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('885', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-15', '8:00:00', '16:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('886', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('887', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-29', '8:00:00', '16:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('888', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-04', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('889', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-11', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('890', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-18', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('891', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-25', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('892', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('893', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-05', '8:00:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('894', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-12', '8:00:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('895', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-19', '8:00:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('896', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-06', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('897', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-04-07', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('955', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-04-30', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('956', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-02', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('957', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-03', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('958', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-06', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('960', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-08', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('961', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-09', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('962', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-10', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('963', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-13', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('964', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-14', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('965', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-15', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('966', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-16', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('967', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-17', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('968', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-21', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('972', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-27', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('973', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-28', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('974', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-29', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('975', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-30', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('976', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-31', '8:30:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('977', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('978', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('979', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-06', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('980', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-07', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('981', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('982', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('983', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('984', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-13', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('985', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-14', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('986', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('987', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-16', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('988', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('989', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-21', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('990', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('991', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('992', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('993', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-27', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('994', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-28', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('995', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('996', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('997', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-31', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('998', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-11', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('999', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-05-12', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1000', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-06', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1001', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-07', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1002', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1003', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-09', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1004', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-10', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1005', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-13', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1006', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-14', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1007', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-15', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1008', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-16', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1009', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1010', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-21', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1011', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-22', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1012', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-23', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1013', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-24', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1014', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-27', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1015', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-28', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1016', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-29', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1017', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-30', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1018', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-31', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1021', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-06', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1022', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-07', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1024', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1025', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1026', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-13', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1027', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-14', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1028', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1029', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1030', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1031', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-21', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1032', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1033', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1034', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1035', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-27', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1036', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-28', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1037', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1038', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1039', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-31', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1040', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1041', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1042', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-06', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1043', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-07', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1044', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1045', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1046', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1047', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-13', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1048', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-14', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1049', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1050', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1051', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1052', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-21', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1053', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1054', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1055', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1056', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-27', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1057', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-28', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1058', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1059', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-30', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1060', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-05-31', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1061', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-02', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1062', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-03', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1063', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-04', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1064', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-05', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1065', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-08', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1066', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-09', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1067', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-10', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1068', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-11', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1069', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-12', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1070', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-15', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1071', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-16', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1072', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-17', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1073', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-18', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1074', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-19', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1075', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-22', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1076', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-23', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1077', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-24', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1078', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-25', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1079', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-26', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1080', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-29', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1081', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-04-30', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1082', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-02', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1083', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-03', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1084', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-06', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1085', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-07', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1086', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-08', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1087', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-09', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1088', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-10', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1089', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-13', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1090', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-14', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1091', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-15', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1092', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-16', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1093', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-17', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1094', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-21', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1095', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-22', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1096', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-23', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1097', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-24', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1098', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-27', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1099', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-28', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1100', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-29', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1101', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-30', '8:00:00', '14:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1102', 'krisztina.kovacs@sagemcom.hu', 'Kovács Krisztina Anita', '2024-05-31', '8:00:00', '14:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1103', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-04', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1104', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-05', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1105', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-25', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1106', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-26', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1107', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-13', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1108', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-14', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1109', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-04-01', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1110', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-18', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1111', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-20', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1113', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-19', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1115', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-03', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1116', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-06', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1117', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-07', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1118', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1119', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-09', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1120', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-10', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1121', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-13', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1122', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-14', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1123', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-15', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1125', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1126', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-21', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1127', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-22', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1128', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-23', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1129', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-24', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1130', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-27', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1131', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-28', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1132', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-29', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1133', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-30', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1134', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-31', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1135', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-01', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1151', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-02', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1152', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1153', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-06', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1154', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-07', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1155', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-08', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1156', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-09', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1157', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1158', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-14', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1159', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-15', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1160', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-16', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1161', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-21', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1162', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-22', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1163', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-23', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1164', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1165', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-27', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1166', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-28', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1167', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-29', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1169', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-31', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1170', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-13', '8:00:00', '16:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1171', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-17', '8:00:00', '17:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1172', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-02', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1173', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-03', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1174', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-04', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1175', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-05', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1176', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1177', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-11', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1178', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-12', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1179', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-15', '8:00:00', '15:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1180', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-18', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1181', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-19', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1182', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-22', '11:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1183', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-23', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1184', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-24', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1185', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-26', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1186', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-04-29', '8:00:00', '14:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1187', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-02', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1188', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-03', '13:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1189', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-07', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1190', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1191', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-09', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1195', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-13', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1197', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-16', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1198', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1199', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-27', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1235', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-02', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1236', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-03', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1237', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-08', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1238', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-09', '8:30:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1239', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-10', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1240', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-13', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1241', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-14', '9:00:00', '17:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1242', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-15', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1244', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-17', '9:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1245', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-07', '8:00:00', '16:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1246', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-07', '8:30:00', '17:00:00', 'iroda');
INSERT INTO beosztas VALUES ('1273', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-11', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1274', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-12', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1275', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-13', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1276', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-14', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1277', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1278', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-18', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1279', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-19', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1280', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-20', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1281', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-21', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1282', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1283', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-25', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1284', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1285', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-27', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1286', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-28', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1326', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-21', '10:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1327', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-22', '8:00:00', '12:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1328', 'bence.zambo@sagemcom.hu', 'Zámbó Bence', '2024-05-23', '10:00:00', '17:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1329', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-03', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1330', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-04', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1331', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-05', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1332', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-06', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1333', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-07', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1334', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-10', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1335', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-11', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1336', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-12', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1337', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-13', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1338', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-14', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1339', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-17', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1340', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-18', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1341', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-19', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1342', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-20', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1343', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-21', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1344', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-24', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1345', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-25', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1346', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-26', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1347', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-27', '8:00:00', '16:30:00', 'iroda');
INSERT INTO beosztas VALUES ('1348', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-28', '8:00:00', '16:30:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1349', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-08', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas VALUES ('1350', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-06-09', '18:00:00', '19:00:00', 'homeoffice');
INSERT INTO beosztas_modositasa VALUES ('10', 'csaba.rohrbacher02@sagemcom.hu', 'Rohrbacher Teszt', '2024-06-03', '8:30:00', '17:00:00', '14:32:00', '16:32:00', '2024-05-07 12:32:14', '0');
INSERT INTO fixed_holidays VALUES ('1', 'ujev', '2024-01-01', '0', 'Újév: Az év első napja.', '2024');
INSERT INTO fixed_holidays VALUES ('2', 'nemzetiUnnep', '2024-03-15', '0', 'Nemzeti ünnep: Az 1848-as forradalom ünnepe.', '2024');
INSERT INTO fixed_holidays VALUES ('3', 'nagypentek', '2024-03-29', '1', 'Nagypéntek.', '2024');
INSERT INTO fixed_holidays VALUES ('4', 'husvet', '2024-04-01', '1', 'Nemzeti ünnep: Az 1848-as forradalom ünnepe.', '2024');
INSERT INTO fixed_holidays VALUES ('5', 'munkaUnnepe', '2024-05-01', '0', 'Munka ünnepe.', '2024');
INSERT INTO fixed_holidays VALUES ('6', 'punkosdHetfo', '2024-05-20', '1', 'Pünkösd hétfő: Pünkösd második napja.', '2024');
INSERT INTO fixed_holidays VALUES ('7', 'nemzetiUnnep', '2024-08-20', '0', 'Nemzeti ünnep: Az államalapítás ünnepe.', '2024');
INSERT INTO fixed_holidays VALUES ('8', 'nemzetiUnnep', '2024-10-23', '0', 'Nemzeti ünnep: Az 1956-os forradalom ünnepe.', '2024');
INSERT INTO fixed_holidays VALUES ('9', 'mindenszentek', '2024-11-01', '0', 'Mindenszentek.', '2024');
INSERT INTO fixed_holidays VALUES ('10', 'karacsony', '2024-12-25', '0', 'Karácsony: Karácsony első napja.', '2024');
INSERT INTO fixed_holidays VALUES ('11', 'karacsony', '2024-12-26', '0', 'Karácsony: Karácsony második napja.', '2024');
INSERT INTO notifications VALUES ('779', 'szabadsag', 'Bene László Ádám szabadságot kért! Kezdés: 2024-04-02, Vége: 2024-04-03', '9', '[1, 2, 11]', '54', '1', '2024-04-23 12:32:40', '2024-04-23 12:38:56');
INSERT INTO notifications VALUES ('780', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-04 - 09:00-17:30', '9', '[1, 2, 11]', '730', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('781', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-05 - 09:00-17:30', '9', '[1, 2, 11]', '731', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('782', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-08 - 09:00-17:30', '9', '[1, 2, 11]', '732', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('783', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-09 - 09:00-17:30', '9', '[1, 2, 11]', '733', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('784', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-10 - 09:00-17:30', '9', '[1, 2, 11]', '734', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('785', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-11 - 09:00-17:30', '9', '[1, 2, 11]', '735', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('786', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-12 - 09:00-17:30', '9', '[1, 2, 11]', '736', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('787', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-15 - 09:00-17:30', '9', '[1, 2, 11]', '737', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('788', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-16 - 09:00-17:30', '9', '[1, 2, 11]', '738', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('789', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-17 - 09:00-17:30', '9', '[1, 2, 11]', '739', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('790', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-18 - 09:00-17:30', '9', '[1, 2, 11]', '740', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('791', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-19 - 09:00-17:30', '9', '[1, 2, 11]', '741', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('792', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-22 - 09:00-17:30', '9', '[1, 2, 11]', '742', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('793', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-23 - 09:00-17:30', '9', '[1, 2, 11]', '743', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('794', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-24 - 09:00-17:30', '9', '[1, 2, 11]', '744', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('795', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-25 - 09:00-17:30', '9', '[1, 2, 11]', '745', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('796', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-26 - 09:00-17:30', '9', '[1, 2, 11]', '746', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('797', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-29 - 09:00-17:30', '9', '[1, 2, 11]', '747', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('798', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-30 - 09:00-17:30', '9', '[1, 2, 11]', '748', '1', '2024-04-23 12:33:29', '2024-04-23 12:39:35');
INSERT INTO notifications VALUES ('823', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-02 - 09:00-17:30', '13', '[1, 2, 11]', '774', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('824', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-03 - 09:00-17:30', '13', '[1, 2, 11]', '775', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('825', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-04 - 09:00-17:30', '13', '[1, 2, 11]', '776', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('826', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-05 - 09:00-17:30', '13', '[1, 2, 11]', '777', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('827', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-08 - 09:00-17:30', '13', '[1, 2, 11]', '778', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('828', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-09 - 09:00-17:30', '13', '[1, 2, 11]', '779', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('829', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-10 - 09:00-17:30', '13', '[1, 2, 11]', '780', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('830', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-11 - 09:00-17:30', '13', '[1, 2, 11]', '781', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('831', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-12 - 09:00-17:30', '13', '[1, 2, 11]', '782', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('832', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-15 - 09:00-17:30', '13', '[1, 2, 11]', '783', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('833', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-16 - 09:00-17:30', '13', '[1, 2, 11]', '784', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('834', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-17 - 09:00-17:30', '13', '[1, 2, 11]', '785', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('835', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-18 - 09:00-17:30', '13', '[1, 2, 11]', '786', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('836', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-19 - 09:00-17:30', '13', '[1, 2, 11]', '787', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('837', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-22 - 09:00-17:30', '13', '[1, 2, 11]', '788', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('838', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-23 - 09:00-17:30', '13', '[1, 2, 11]', '789', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('839', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-24 - 09:00-17:30', '13', '[1, 2, 11]', '790', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('840', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-25 - 09:00-17:30', '13', '[1, 2, 11]', '791', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('841', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-26 - 09:00-17:30', '13', '[1, 2, 11]', '792', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:35');
INSERT INTO notifications VALUES ('842', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-29 - 09:00-17:30', '13', '[1, 2, 11]', '793', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:36');
INSERT INTO notifications VALUES ('843', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-30 - 09:00-17:30', '13', '[1, 2, 11]', '794', '1', '2024-04-23 12:46:47', '2024-04-23 12:50:36');
INSERT INTO notifications VALUES ('846', 'szabadsag', 'Lakó Viktor szabadságot kért! Kezdés: 2024-05-02, Vége: 2024-05-02', '13', '[1, 2, 11]', '55', '1', '2024-04-23 13:00:49', '2024-04-23 13:03:10');
INSERT INTO notifications VALUES ('847', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-02 - 08:00-16:30', '18', '[1, 2, 11]', '797', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('848', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-03 - 08:00-16:30', '18', '[1, 2, 11]', '798', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('849', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-04 - 08:00-16:30', '18', '[1, 2, 11]', '799', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('850', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-05 - 08:00-16:30', '18', '[1, 2, 11]', '800', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('851', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-08 - 08:00-16:30', '18', '[1, 2, 11]', '801', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('852', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-09 - 08:00-16:30', '18', '[1, 2, 11]', '802', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('853', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-10 - 08:00-16:30', '18', '[1, 2, 11]', '803', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('854', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-11 - 08:00-16:30', '18', '[1, 2, 11]', '804', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('855', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-12 - 08:00-16:30', '18', '[1, 2, 11]', '805', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('856', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-15 - 08:00-16:30', '18', '[1, 2, 11]', '806', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('857', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-16 - 08:00-16:30', '18', '[1, 2, 11]', '807', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('858', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-17 - 08:00-16:30', '18', '[1, 2, 11]', '808', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('859', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-18 - 08:00-16:30', '18', '[1, 2, 11]', '809', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('860', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-19 - 08:00-16:30', '18', '[1, 2, 11]', '810', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('861', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-22 - 08:00-16:30', '18', '[1, 2, 11]', '811', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('862', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-23 - 08:00-16:30', '18', '[1, 2, 11]', '812', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('863', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-24 - 08:00-16:30', '18', '[1, 2, 11]', '813', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('864', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-25 - 08:00-16:30', '18', '[1, 2, 11]', '814', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('865', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-26 - 08:00-16:30', '18', '[1, 2, 11]', '815', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('866', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-29 - 08:00-16:30', '18', '[1, 2, 11]', '816', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('867', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor Teszt: 2024-04-30 - 08:00-16:30', '18', '[1, 2, 11]', '817', '1', '2024-04-23 13:25:05', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('868', 'szabadsag', 'Fülöp Sándor Gábor Teszt szabadságot kért! Kezdés: 2024-04-05, Vége: 2024-04-05', '18', '[1, 2, 11]', '56', '1', '2024-04-23 13:25:21', '2024-04-23 13:26:02');
INSERT INTO notifications VALUES ('869', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-02 - 08:00-16:30', '12', '[1, 2, 11]', '818', '1', '2024-04-23 13:47:00', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('870', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-03 - 08:00-16:30', '12', '[1, 2, 11]', '819', '1', '2024-04-23 13:47:00', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('871', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-06 - 08:00-16:30', '12', '[1, 2, 11]', '820', '1', '2024-04-23 13:47:00', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('872', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-07 - 08:00-16:30', '12', '[1, 2, 11]', '821', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('873', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-08 - 08:00-16:30', '12', '[1, 2, 11]', '822', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('874', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-09 - 08:00-16:30', '12', '[1, 2, 11]', '823', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('875', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-10 - 08:00-16:30', '12', '[1, 2, 11]', '824', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('876', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-13 - 08:00-16:30', '12', '[1, 2, 11]', '825', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('877', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-14 - 08:00-16:30', '12', '[1, 2, 11]', '826', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('878', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-15 - 08:00-16:30', '12', '[1, 2, 11]', '827', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('879', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-16 - 08:00-16:30', '12', '[1, 2, 11]', '828', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('880', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-17 - 08:00-16:30', '12', '[1, 2, 11]', '829', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('881', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-21 - 08:00-16:30', '12', '[1, 2, 11]', '830', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('882', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-22 - 08:00-16:30', '12', '[1, 2, 11]', '831', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('883', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-23 - 08:00-16:30', '12', '[1, 2, 11]', '832', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('884', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-24 - 08:00-16:30', '12', '[1, 2, 11]', '833', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('885', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-27 - 08:00-16:30', '12', '[1, 2, 11]', '834', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('886', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-28 - 08:00-16:30', '12', '[1, 2, 11]', '835', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('887', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-29 - 08:00-16:30', '12', '[1, 2, 11]', '836', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('888', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-30 - 08:00-16:30', '12', '[1, 2, 11]', '837', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('889', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-31 - 08:00-16:30', '12', '[1, 2, 11]', '838', '1', '2024-04-23 13:47:01', '2024-04-23 13:47:26');
INSERT INTO notifications VALUES ('890', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-02 - 08:00-16:30', '15', '[1, 2, 11]', '839', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:47');
INSERT INTO notifications VALUES ('891', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-03 - 08:00-16:30', '15', '[1, 2, 11]', '840', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('892', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-04 - 08:00-16:30', '15', '[1, 2, 11]', '841', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('893', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-05 - 08:00-16:30', '15', '[1, 2, 11]', '842', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('894', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-08 - 08:00-16:30', '15', '[1, 2, 11]', '843', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('895', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-09 - 08:00-16:30', '15', '[1, 2, 11]', '844', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('896', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-10 - 08:00-16:30', '15', '[1, 2, 11]', '845', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('897', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-11 - 08:00-16:30', '15', '[1, 2, 11]', '846', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('898', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-12 - 08:00-16:30', '15', '[1, 2, 11]', '847', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('899', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-15 - 08:00-16:30', '15', '[1, 2, 11]', '848', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('900', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-16 - 08:00-16:30', '15', '[1, 2, 11]', '849', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('901', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-17 - 08:00-16:30', '15', '[1, 2, 11]', '850', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('902', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-18 - 08:00-16:30', '15', '[1, 2, 11]', '851', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('903', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-19 - 08:00-16:30', '15', '[1, 2, 11]', '852', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('904', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-22 - 08:00-16:30', '15', '[1, 2, 11]', '853', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('905', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-23 - 08:00-16:30', '15', '[1, 2, 11]', '854', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('906', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-24 - 08:00-16:30', '15', '[1, 2, 11]', '855', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('907', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-25 - 08:00-16:30', '15', '[1, 2, 11]', '856', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('908', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-26 - 08:00-16:30', '15', '[1, 2, 11]', '857', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('909', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-29 - 08:00-16:30', '15', '[1, 2, 11]', '858', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('910', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-30 - 08:00-16:30', '15', '[1, 2, 11]', '859', '1', '2024-04-23 13:48:27', '2024-04-23 13:48:48');
INSERT INTO notifications VALUES ('911', 'szabadsag', 'Bradák Ferenc szabadságot kért! Kezdés: 2024-04-22, Vége: 2024-04-22', '15', '[1, 2, 11]', '57', '1', '2024-04-23 13:48:54', '2024-04-23 13:49:25');
INSERT INTO notifications VALUES ('912', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-02 - 08:00-16:30', '12', '[1, 2, 11]', '860', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('913', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-03 - 08:00-16:30', '12', '[1, 2, 11]', '861', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('914', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-04 - 08:00-16:30', '12', '[1, 2, 11]', '862', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('915', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-05 - 08:00-16:30', '12', '[1, 2, 11]', '863', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('916', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-08 - 08:00-16:30', '12', '[1, 2, 11]', '864', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('917', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-09 - 08:00-16:30', '12', '[1, 2, 11]', '865', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('918', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-10 - 08:00-16:30', '12', '[1, 2, 11]', '866', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('919', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-11 - 08:00-16:30', '12', '[1, 2, 11]', '867', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('920', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-12 - 08:00-16:30', '12', '[1, 2, 11]', '868', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('921', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-15 - 08:00-16:30', '12', '[1, 2, 11]', '869', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('922', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-16 - 08:00-16:30', '12', '[1, 2, 11]', '870', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('923', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-17 - 08:00-16:30', '12', '[1, 2, 11]', '871', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('924', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-18 - 08:00-16:30', '12', '[1, 2, 11]', '872', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('925', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-19 - 08:00-16:30', '12', '[1, 2, 11]', '873', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('926', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-22 - 08:00-16:30', '12', '[1, 2, 11]', '874', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('927', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-23 - 08:00-16:30', '12', '[1, 2, 11]', '875', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('928', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-24 - 08:00-16:30', '12', '[1, 2, 11]', '876', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('929', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-25 - 08:00-16:30', '12', '[1, 2, 11]', '877', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('930', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-26 - 08:00-16:30', '12', '[1, 2, 11]', '878', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('931', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-29 - 08:00-16:30', '12', '[1, 2, 11]', '879', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('932', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-04-30 - 08:00-16:30', '12', '[1, 2, 11]', '880', '1', '2024-04-23 13:49:25', '2024-04-23 13:49:31');
INSERT INTO notifications VALUES ('933', 'szabadsag', 'Bradák Ferenc szabadságot kért! Kezdés: 2024-04-03, Vége: 2024-04-03', '15', '[1, 2, 11]', '58', '1', '2024-04-23 13:49:39', '2024-04-23 13:49:47');
INSERT INTO notifications VALUES ('934', 'szabadsag', 'Wittmann Zsolt szabadságot kért! Kezdés: 2024-04-18, Vége: 2024-04-22', '12', '[1, 2, 11]', '59', '1', '2024-04-23 13:49:49', '2024-04-23 13:49:52');
INSERT INTO notifications VALUES ('935', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-08 - 08:00-16:00', '14', '[1, 2, 11]', '881', '1', '2024-04-23 13:51:50', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('936', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-15 - 08:00-16:00', '14', '[1, 2, 11]', '882', '1', '2024-04-23 13:51:54', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('937', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-22 - 08:00-16:00', '14', '[1, 2, 11]', '883', '1', '2024-04-23 13:51:56', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('938', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-29 - 08:00-16:00', '14', '[1, 2, 11]', '884', '1', '2024-04-23 13:52:01', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('939', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-03 - 08:00-16:30', '14', '[1, 2, 11]', '885', '1', '2024-04-23 13:52:08', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('940', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-10 - 08:00-16:30', '14', '[1, 2, 11]', '886', '1', '2024-04-23 13:52:13', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('941', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-17 - 08:00-16:30', '14', '[1, 2, 11]', '887', '1', '2024-04-23 13:52:17', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('942', 'szabadsag', 'Wittmann Zsolt szabadságot kért! Kezdés: 2024-04-03, Vége: 2024-04-03', '12', '[1, 2, 11]', '60', '1', '2024-04-23 13:52:17', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('943', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-24 - 08:00-16:30', '14', '[1, 2, 11]', '888', '1', '2024-04-23 13:52:28', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('944', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-05 - 08:00-17:00', '14', '[1, 2, 11]', '889', '1', '2024-04-23 13:52:37', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('945', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-12 - 08:00-17:00', '14', '[1, 2, 11]', '890', '1', '2024-04-23 13:52:42', '2024-04-23 13:52:51');
INSERT INTO notifications VALUES ('946', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-19 - 08:00-17:00', '14', '[1, 2, 11]', '891', '1', '2024-04-23 13:52:56', '2024-04-23 13:53:17');
INSERT INTO notifications VALUES ('948', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-29 - 08:00-16:30', '14', '[1, 2, 11]', '893', '1', '2024-04-23 13:53:25', '2024-04-23 13:54:25');
INSERT INTO notifications VALUES ('949', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-26 - 08:00-16:30', '14', '[1, 2, 11]', '894', '1', '2024-04-23 13:53:37', '2024-04-23 13:54:25');
INSERT INTO notifications VALUES ('971', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-02 - 08:00-16:30', '14', '[1, 2, 11]', '916', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('972', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-03 - 08:00-16:30', '14', '[1, 2, 11]', '917', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('976', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-09 - 08:00-16:30', '14', '[1, 2, 11]', '921', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('977', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-10 - 08:00-16:30', '14', '[1, 2, 11]', '922', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('981', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-16 - 08:00-16:30', '14', '[1, 2, 11]', '926', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('982', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-17 - 08:00-16:30', '14', '[1, 2, 11]', '927', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('986', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-23 - 08:00-16:30', '14', '[1, 2, 11]', '931', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('987', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-24 - 08:00-16:30', '14', '[1, 2, 11]', '932', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('991', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-30 - 08:00-16:30', '14', '[1, 2, 11]', '936', '1', '2024-04-23 14:00:47', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('992', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-08 - 08:00-16:00', '14', '[1, 2, 11]', '937', '1', '2024-04-23 14:02:05', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('993', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-15 - 08:00-16:00', '14', '[1, 2, 11]', '938', '1', '2024-04-23 14:02:10', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('995', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-22 - 08:00-16:30', '14', '[1, 2, 11]', '940', '1', '2024-04-23 14:02:37', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('996', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-29 - 08:00-16:30', '14', '[1, 2, 11]', '941', '1', '2024-04-23 14:02:43', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('997', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-04 - 08:30-17:00', '14', '[1, 2, 11]', '942', '1', '2024-04-23 14:03:46', '2024-04-23 14:30:32');
INSERT INTO notifications VALUES ('998', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-11 - 08:30-17:00', '14', '[1, 2, 11]', '943', '1', '2024-04-23 14:03:50', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1000', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-18 - 08:30-17:00', '14', '[1, 2, 11]', '945', '1', '2024-04-23 14:04:08', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1001', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-25 - 08:30-17:00', '14', '[1, 2, 11]', '946', '1', '2024-04-23 14:05:32', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1005', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-26 - 08:00-16:30', '14', '[1, 2, 11]', '950', '1', '2024-04-23 14:06:16', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1006', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-05 - 08:00-17:00', '14', '[1, 2, 11]', '951', '1', '2024-04-23 14:06:46', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1007', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-12 - 08:00-17:00', '14', '[1, 2, 11]', '952', '1', '2024-04-23 14:06:49', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1008', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-19 - 08:00-17:00', '14', '[1, 2, 11]', '953', '1', '2024-04-23 14:07:15', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1009', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-06 - 18:00-19:00', '14', '[1, 2, 11]', '954', '1', '2024-04-23 14:09:59', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1010', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-04-07 - 18:00-19:00', '14', '[1, 2, 11]', '955', '1', '2024-04-23 14:10:03', '2024-04-23 14:30:33');
INSERT INTO notifications VALUES ('1011', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-20 - 18:00-19:00', '15', '[1, 2, 11]', '956', '1', '2024-04-23 14:12:53', '2024-04-23 14:30:20');
INSERT INTO notifications VALUES ('1012', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-04-21 - 18:00-19:00', '15', '[1, 2, 11]', '957', '1', '2024-04-23 14:12:59', '2024-04-23 14:30:20');
INSERT INTO notifications VALUES ('1013', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-27 - 18:00-19:00', '9', '[1, 2, 11]', '958', '1', '2024-04-23 14:24:26', '2024-04-23 14:30:27');
INSERT INTO notifications VALUES ('1014', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-04-28 - 18:00-19:00', '9', '[1, 2, 11]', '959', '1', '2024-04-23 14:24:34', '2024-04-23 14:30:27');
INSERT INTO notifications VALUES ('1131', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-02 - 08:00-16:30', '15', '[1, 2, 18]', '1074', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1132', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-03 - 08:00-16:30', '15', '[1, 2, 18]', '1075', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1133', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-06 - 08:00-16:30', '15', '[1, 2, 18]', '1076', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1134', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-07 - 08:00-16:30', '15', '[1, 2, 18]', '1077', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1135', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-08 - 08:00-16:30', '15', '[1, 2, 18]', '1078', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1136', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-09 - 08:00-16:30', '15', '[1, 2, 18]', '1079', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1137', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-10 - 08:00-16:30', '15', '[1, 2, 18]', '1080', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1138', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-13 - 08:00-16:30', '15', '[1, 2, 18]', '1081', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1139', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-14 - 08:00-16:30', '15', '[1, 2, 18]', '1082', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1140', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-15 - 08:00-16:30', '15', '[1, 2, 18]', '1083', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1141', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-16 - 08:00-16:30', '15', '[1, 2, 18]', '1084', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1142', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-17 - 08:00-16:30', '15', '[1, 2, 18]', '1085', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1143', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-21 - 08:00-16:30', '15', '[1, 2, 18]', '1086', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1144', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-22 - 08:00-16:30', '15', '[1, 2, 18]', '1087', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1145', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-23 - 08:00-16:30', '15', '[1, 2, 18]', '1088', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1146', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-24 - 08:00-16:30', '15', '[1, 2, 18]', '1089', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1147', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-27 - 08:00-16:30', '15', '[1, 2, 18]', '1090', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1148', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-28 - 08:00-16:30', '15', '[1, 2, 18]', '1091', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1149', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-29 - 08:00-16:30', '15', '[1, 2, 18]', '1092', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1150', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-30 - 08:00-16:30', '15', '[1, 2, 18]', '1093', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1151', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-31 - 08:00-16:30', '15', '[1, 2, 18]', '1094', '1', '2024-04-25 11:15:19', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1152', 'szabadsag', 'Bene László Ádám szabadságot kért! Kezdés: 2024-05-02, Vége: 2024-05-03', '9', '[1, 2, 18]', '63', '1', '2024-04-25 11:15:32', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1153', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-06 - 09:00-17:30', '9', '[1, 2, 18]', '1095', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1154', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-07 - 09:00-17:30', '9', '[1, 2, 18]', '1096', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1155', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-08 - 09:00-17:30', '9', '[1, 2, 18]', '1097', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1156', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-09 - 09:00-17:30', '9', '[1, 2, 18]', '1098', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1157', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-10 - 09:00-17:30', '9', '[1, 2, 18]', '1099', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1158', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-13 - 09:00-17:30', '9', '[1, 2, 18]', '1100', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1159', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-14 - 09:00-17:30', '9', '[1, 2, 18]', '1101', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1160', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-15 - 09:00-17:30', '9', '[1, 2, 18]', '1102', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1161', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-16 - 09:00-17:30', '9', '[1, 2, 18]', '1103', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1162', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-17 - 09:00-17:30', '9', '[1, 2, 18]', '1104', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1163', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-21 - 09:00-17:30', '9', '[1, 2, 18]', '1105', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1164', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-22 - 09:00-17:30', '9', '[1, 2, 18]', '1106', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1165', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-23 - 09:00-17:30', '9', '[1, 2, 18]', '1107', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1166', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-24 - 09:00-17:30', '9', '[1, 2, 18]', '1108', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1167', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-27 - 09:00-17:30', '9', '[1, 2, 18]', '1109', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1168', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-28 - 09:00-17:30', '9', '[1, 2, 18]', '1110', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1169', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-29 - 09:00-17:30', '9', '[1, 2, 18]', '1111', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1170', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-30 - 09:00-17:30', '9', '[1, 2, 18]', '1112', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1171', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-31 - 09:00-17:30', '9', '[1, 2, 18]', '1113', '1', '2024-04-25 11:16:02', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1172', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-02 - 08:00-16:30', '12', '[1, 2, 18]', '1114', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1173', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-03 - 08:00-16:30', '12', '[1, 2, 18]', '1115', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1174', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-06 - 08:00-16:30', '12', '[1, 2, 18]', '1116', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1175', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-07 - 08:00-16:30', '12', '[1, 2, 18]', '1117', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1176', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-08 - 08:00-16:30', '12', '[1, 2, 18]', '1118', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1177', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-09 - 08:00-16:30', '12', '[1, 2, 18]', '1119', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1178', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-10 - 08:00-16:30', '12', '[1, 2, 18]', '1120', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1179', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-13 - 08:00-16:30', '12', '[1, 2, 18]', '1121', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1180', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-14 - 08:00-16:30', '12', '[1, 2, 18]', '1122', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1181', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-15 - 08:00-16:30', '12', '[1, 2, 18]', '1123', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1182', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-16 - 08:00-16:30', '12', '[1, 2, 18]', '1124', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1183', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-17 - 08:00-16:30', '12', '[1, 2, 18]', '1125', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1184', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-21 - 08:00-16:30', '12', '[1, 2, 18]', '1126', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1185', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-22 - 08:00-16:30', '12', '[1, 2, 18]', '1127', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1186', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-23 - 08:00-16:30', '12', '[1, 2, 18]', '1128', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1187', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-24 - 08:00-16:30', '12', '[1, 2, 18]', '1129', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1188', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-27 - 08:00-16:30', '12', '[1, 2, 18]', '1130', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1189', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-28 - 08:00-16:30', '12', '[1, 2, 18]', '1131', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1190', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-29 - 08:00-16:30', '12', '[1, 2, 18]', '1132', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1191', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-30 - 08:00-16:30', '12', '[1, 2, 18]', '1133', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1192', 'beosztas', 'Új beosztás érkezett! Azonosító: Wittmann Zsolt: 2024-05-31 - 08:00-16:30', '12', '[1, 2, 18]', '1134', '1', '2024-04-25 11:16:34', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1193', 'szabadsag', 'Wittmann Zsolt szabadságot kért! Kezdés: 2024-05-02, Vége: 2024-05-03', '12', '[1, 2, 18]', '64', '1', '2024-04-25 11:16:57', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1194', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-11 - 18:00-19:00', '15', '[1, 2, 18]', '1135', '1', '2024-04-25 11:18:41', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1195', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-05-12 - 18:00-19:00', '15', '[1, 2, 18]', '1136', '1', '2024-04-25 11:19:14', '2024-04-25 11:25:00');
INSERT INTO notifications VALUES ('1196', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-02 - 08:00-16:30', '11', '[1, 2, 18]', '1137', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1197', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-03 - 08:00-16:30', '11', '[1, 2, 18]', '1138', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1198', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-06 - 08:00-16:30', '11', '[1, 2, 18]', '1139', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1199', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-07 - 08:00-16:30', '11', '[1, 2, 18]', '1140', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1200', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-08 - 08:00-16:30', '11', '[1, 2, 18]', '1141', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1201', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-09 - 08:00-16:30', '11', '[1, 2, 18]', '1142', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1202', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-10 - 08:00-16:30', '11', '[1, 2, 18]', '1143', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1203', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-13 - 08:00-16:30', '11', '[1, 2, 18]', '1144', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1204', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-14 - 08:00-16:30', '11', '[1, 2, 18]', '1145', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1205', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-15 - 08:00-16:30', '11', '[1, 2, 18]', '1146', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1206', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-16 - 08:00-16:30', '11', '[1, 2, 18]', '1147', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1207', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-17 - 08:00-16:30', '11', '[1, 2, 18]', '1148', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1208', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-21 - 08:00-16:30', '11', '[1, 2, 18]', '1149', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1209', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-22 - 08:00-16:30', '11', '[1, 2, 18]', '1150', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1210', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-23 - 08:00-16:30', '11', '[1, 2, 18]', '1151', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1211', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-24 - 08:00-16:30', '11', '[1, 2, 18]', '1152', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1212', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-27 - 08:00-16:30', '11', '[1, 2, 18]', '1153', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1213', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-28 - 08:00-16:30', '11', '[1, 2, 18]', '1154', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1214', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-29 - 08:00-16:30', '11', '[1, 2, 18]', '1155', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1215', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-30 - 08:00-16:30', '11', '[1, 2, 18]', '1156', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1216', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-05-31 - 08:00-16:30', '11', '[1, 2, 18]', '1157', '1', '2024-04-25 11:22:30', '2024-04-25 11:25:01');
INSERT INTO notifications VALUES ('1217', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-02 - 08:00-14:30', '10', '[1, 2, 18]', '1158', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1218', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-03 - 08:00-14:30', '10', '[1, 2, 18]', '1159', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1219', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-04 - 08:00-14:30', '10', '[1, 2, 18]', '1160', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1220', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-05 - 08:00-14:30', '10', '[1, 2, 18]', '1161', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1221', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-08 - 08:00-14:30', '10', '[1, 2, 18]', '1162', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1222', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-09 - 08:00-14:30', '10', '[1, 2, 18]', '1163', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1223', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-10 - 08:00-14:30', '10', '[1, 2, 18]', '1164', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1224', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-11 - 08:00-14:30', '10', '[1, 2, 18]', '1165', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1225', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-12 - 08:00-14:30', '10', '[1, 2, 18]', '1166', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1226', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-15 - 08:00-14:30', '10', '[1, 2, 18]', '1167', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1227', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-16 - 08:00-14:30', '10', '[1, 2, 18]', '1168', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1228', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-17 - 08:00-14:30', '10', '[1, 2, 18]', '1169', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1229', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-18 - 08:00-14:30', '10', '[1, 2, 18]', '1170', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1230', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-19 - 08:00-14:30', '10', '[1, 2, 18]', '1171', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1231', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-22 - 08:00-14:30', '10', '[1, 2, 18]', '1172', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1232', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-23 - 08:00-14:30', '10', '[1, 2, 18]', '1173', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1233', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-24 - 08:00-14:30', '10', '[1, 2, 18]', '1174', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1234', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-25 - 08:00-14:30', '10', '[1, 2, 18]', '1175', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1235', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-26 - 08:00-14:30', '10', '[1, 2, 18]', '1176', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1236', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-29 - 08:00-14:30', '10', '[1, 2, 18]', '1177', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1237', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-04-30 - 08:00-14:30', '10', '[1, 2, 18]', '1178', '1', '2024-04-25 11:30:31', '2024-04-25 11:30:54');
INSERT INTO notifications VALUES ('1238', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-02 - 08:00-14:30', '10', '[1, 2, 18]', '1179', '1', '2024-04-25 11:31:11', '2024-04-25 11:31:59');
INSERT INTO notifications VALUES ('1239', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-03 - 08:00-14:30', '10', '[1, 2, 18]', '1180', '1', '2024-04-25 11:31:11', '2024-04-25 11:31:59');
INSERT INTO notifications VALUES ('1240', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-06 - 08:00-14:30', '10', '[1, 2, 18]', '1181', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1241', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-07 - 08:00-14:30', '10', '[1, 2, 18]', '1182', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1242', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-08 - 08:00-14:30', '10', '[1, 2, 18]', '1183', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1243', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-09 - 08:00-14:30', '10', '[1, 2, 18]', '1184', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1244', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-10 - 08:00-14:30', '10', '[1, 2, 18]', '1185', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1245', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-13 - 08:00-14:30', '10', '[1, 2, 18]', '1186', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1246', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-14 - 08:00-14:30', '10', '[1, 2, 18]', '1187', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1247', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-15 - 08:00-14:30', '10', '[1, 2, 18]', '1188', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1248', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-16 - 08:00-14:30', '10', '[1, 2, 18]', '1189', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1249', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-17 - 08:00-14:30', '10', '[1, 2, 18]', '1190', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1250', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-21 - 08:00-14:30', '10', '[1, 2, 18]', '1191', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1251', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-22 - 08:00-14:30', '10', '[1, 2, 18]', '1192', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1252', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-23 - 08:00-14:30', '10', '[1, 2, 18]', '1193', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1253', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-24 - 08:00-14:30', '10', '[1, 2, 18]', '1194', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1254', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-27 - 08:00-14:30', '10', '[1, 2, 18]', '1195', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1255', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-28 - 08:00-14:30', '10', '[1, 2, 18]', '1196', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1256', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-29 - 08:00-14:30', '10', '[1, 2, 18]', '1197', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1257', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-30 - 08:00-14:30', '10', '[1, 2, 18]', '1198', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1258', 'beosztas', 'Új beosztás érkezett! Azonosító: Kovács Krisztina Anita: 2024-05-31 - 08:00-14:30', '10', '[1, 2, 18]', '1199', '1', '2024-04-25 11:31:11', '2024-04-25 11:32:00');
INSERT INTO notifications VALUES ('1259', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-04 - 18:00-19:00', '14', '[1, 2, 18]', '1200', '1', '2024-04-25 11:34:34', '2024-04-25 11:35:15');
INSERT INTO notifications VALUES ('1260', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-05 - 18:00-19:00', '14', '[1, 2, 18]', '1201', '1', '2024-04-25 11:35:28', '2024-04-25 11:37:18');
INSERT INTO notifications VALUES ('1261', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-25 - 18:00-19:00', '9', '[1, 2, 18]', '1202', '1', '2024-04-25 11:46:19', '2024-04-25 11:47:42');
INSERT INTO notifications VALUES ('1262', 'beosztas', 'Új beosztás érkezett! Azonosító: Bene László Ádám: 2024-05-26 - 18:00-19:00', '9', '[1, 2, 18]', '1203', '1', '2024-04-25 11:46:42', '2024-04-25 11:47:42');
INSERT INTO notifications VALUES ('1263', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-13 - 18:00-19:00', '13', '[1, 2, 18]', '1204', '1', '2024-04-25 11:50:07', '2024-04-25 11:50:28');
INSERT INTO notifications VALUES ('1264', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-14 - 18:00-19:00', '13', '[1, 2, 18]', '1205', '1', '2024-04-25 11:50:22', '2024-04-25 11:50:28');
INSERT INTO notifications VALUES ('1265', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-04-01 - 18:00-19:00', '13', '[1, 2, 18]', '1206', '1', '2024-04-25 11:50:37', '2024-04-25 11:51:24');
INSERT INTO notifications VALUES ('1266', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-18 - 18:00-19:00', '13', '[1, 2, 18]', '1208', '1', '2024-04-25 11:53:25', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1267', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-20 - 18:00-19:00', '13', '[1, 2, 18]', '1209', '1', '2024-04-25 11:53:46', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1268', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-20 - 20:00-21:00', '13', '[1, 2, 18]', '1210', '1', '2024-04-25 11:53:46', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1269', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-19 - 18:00-19:00', '13', '[1, 2, 18]', '1211', '1', '2024-04-25 11:54:08', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1270', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-02 - 09:00-17:30', '13', '[1, 2, 18]', '1212', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1271', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-03 - 09:00-17:30', '13', '[1, 2, 18]', '1213', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1272', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-06 - 09:00-17:30', '13', '[1, 2, 18]', '1214', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1273', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-07 - 09:00-17:30', '13', '[1, 2, 18]', '1215', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1274', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-08 - 09:00-17:30', '13', '[1, 2, 18]', '1216', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1275', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-09 - 09:00-17:30', '13', '[1, 2, 18]', '1217', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1276', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-10 - 09:00-17:30', '13', '[1, 2, 18]', '1218', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1277', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-13 - 09:00-17:30', '13', '[1, 2, 18]', '1219', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1278', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-14 - 09:00-17:30', '13', '[1, 2, 18]', '1220', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1279', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-15 - 09:00-17:30', '13', '[1, 2, 18]', '1221', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1280', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-16 - 09:00-17:30', '13', '[1, 2, 18]', '1222', '1', '2024-04-25 11:54:35', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1281', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-17 - 09:00-17:30', '13', '[1, 2, 18]', '1223', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1282', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-21 - 09:00-17:30', '13', '[1, 2, 18]', '1224', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1283', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-22 - 09:00-17:30', '13', '[1, 2, 18]', '1225', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1284', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-23 - 09:00-17:30', '13', '[1, 2, 18]', '1226', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1285', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-24 - 09:00-17:30', '13', '[1, 2, 18]', '1227', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1286', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-27 - 09:00-17:30', '13', '[1, 2, 18]', '1228', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1287', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-28 - 09:00-17:30', '13', '[1, 2, 18]', '1229', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:48');
INSERT INTO notifications VALUES ('1288', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-29 - 09:00-17:30', '13', '[1, 2, 18]', '1230', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:49');
INSERT INTO notifications VALUES ('1289', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-30 - 09:00-17:30', '13', '[1, 2, 18]', '1231', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:49');
INSERT INTO notifications VALUES ('1290', 'beosztas', 'Új beosztás érkezett! Azonosító: Lakó Viktor: 2024-05-31 - 09:00-17:30', '13', '[1, 2, 18]', '1232', '1', '2024-04-25 11:54:36', '2024-04-25 11:54:49');
INSERT INTO notifications VALUES ('1291', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-01 - 18:00-19:00', '14', '[1, 2, 18]', '1233', '1', '2024-04-25 11:55:38', '2024-04-25 11:56:51');
INSERT INTO notifications VALUES ('1309', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-02 - 08:00-16:30', '14', '[1, 2, 18]', '1250', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1310', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-03 - 08:00-16:30', '14', '[1, 2, 18]', '1251', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1311', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-06 - 08:00-16:30', '14', '[1, 2, 18]', '1252', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1312', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-07 - 08:00-16:30', '14', '[1, 2, 18]', '1253', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1313', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-08 - 08:00-16:30', '14', '[1, 2, 18]', '1254', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1314', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-09 - 08:00-16:30', '14', '[1, 2, 18]', '1255', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1315', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-10 - 08:00-16:30', '14', '[1, 2, 18]', '1256', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1317', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-14 - 08:00-16:30', '14', '[1, 2, 18]', '1258', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1318', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-15 - 08:00-16:30', '14', '[1, 2, 18]', '1259', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1319', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-16 - 08:00-16:30', '14', '[1, 2, 18]', '1260', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1321', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-21 - 08:00-16:30', '14', '[1, 2, 18]', '1262', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1322', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-22 - 08:00-16:30', '14', '[1, 2, 18]', '1263', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1323', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-23 - 08:00-16:30', '14', '[1, 2, 18]', '1264', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1324', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-24 - 08:00-16:30', '14', '[1, 2, 18]', '1265', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1325', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-27 - 08:00-16:30', '14', '[1, 2, 18]', '1266', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1326', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-28 - 08:00-16:30', '14', '[1, 2, 18]', '1267', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1327', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-29 - 08:00-16:30', '14', '[1, 2, 18]', '1268', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1328', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-30 - 08:00-16:30', '14', '[1, 2, 18]', '1269', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1329', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-31 - 08:00-16:30', '14', '[1, 2, 18]', '1270', '1', '2024-04-30 14:20:22', '2024-04-30 14:22:12');
INSERT INTO notifications VALUES ('1330', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-13 - 08:00-16:00', '14', '[1, 2, 18]', '1271', '1', '2024-04-30 14:21:08', '2024-04-30 14:22:13');
INSERT INTO notifications VALUES ('1331', 'beosztas', 'Új beosztás érkezett! Azonosító: Huszta Annabella: 2024-05-17 - 08:00-17:00', '14', '[1, 2, 18]', '1272', '1', '2024-04-30 14:21:33', '2024-04-30 14:22:13');
INSERT INTO notifications VALUES ('1349', 'szabadsag', 'Wittmann Zsolt szabadságot kért! Kezdés: 2024-05-08, Vége: 2024-05-08', '12', '[1, 2, 18]', '68', '1', '2024-05-07 09:04:14', '2024-05-07 09:04:47');
INSERT INTO notifications VALUES ('1360', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-02 - 09:00-17:30', '19', '[1, 2, 18]', '1299', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1361', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-03 - 09:00-17:30', '19', '[1, 2, 18]', '1300', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1364', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-08 - 09:00-17:30', '19', '[1, 2, 18]', '1303', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1365', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-09 - 09:00-17:30', '19', '[1, 2, 18]', '1304', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1366', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-10 - 09:00-17:30', '19', '[1, 2, 18]', '1305', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1367', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-13 - 09:00-17:30', '19', '[1, 2, 18]', '1306', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1368', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-14 - 09:00-17:30', '19', '[1, 2, 18]', '1307', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1369', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-15 - 09:00-17:30', '19', '[1, 2, 18]', '1308', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1370', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-16 - 09:00-17:30', '19', '[1, 2, 18]', '1309', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1371', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-17 - 09:00-17:30', '19', '[1, 2, 18]', '1310', '1', '2024-05-07 09:29:24', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1372', 'beosztas', 'Új beosztás érkezett! Azonosító: Mándoky Kongur Atlan: 2024-05-07 - 08:00-16:00', '19', '[1, 2, 18]', '1311', '1', '2024-05-07 09:29:48', '2024-05-07 09:30:26');
INSERT INTO notifications VALUES ('1373', 'szabadsag', 'Mándoky Kongur Atlan szabadságot kért! Kezdés: 2024-05-06, Vége: 2024-05-06', '19', '[1, 2, 18]', '69', '1', '2024-05-07 09:32:05', '2024-05-07 09:33:06');
INSERT INTO notifications VALUES ('1374', 'szabadsag', 'Mándoky Kongur Atlan szabadságot kért! Kezdés: 2024-05-21, Vége: 2024-05-31', '19', '[1, 2, 18]', '70', '1', '2024-05-07 09:32:49', '2024-05-07 09:33:06');
INSERT INTO notifications VALUES ('1375', 'beosztas_modositas', 'Mándoky Kongur Atlan beosztást módosítást kért! Dátum: 2024-05-09, Kezdés: 08:30, Vége: 17:30', '19', '[1, 2, 18]', '6', '1', '2024-05-07 09:34:54', '2024-05-07 09:35:10');
INSERT INTO notifications VALUES ('1376', 'beosztas_modositas', 'Mándoky Kongur Atlan beosztást módosítást kért! Dátum: 2024-05-09, Kezdés: 08:30, Vége: 17:30', '19', '[1, 2, 18]', '7', '1', '2024-05-07 09:36:32', '2024-05-07 09:36:42');
INSERT INTO notifications VALUES ('1420', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-03 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1352', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:20');
INSERT INTO notifications VALUES ('1421', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-04 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1353', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:20');
INSERT INTO notifications VALUES ('1422', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-05 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1354', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1423', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-06 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1355', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1424', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-07 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1356', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1425', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-10 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1357', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1426', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-11 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1358', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1427', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-12 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1359', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1428', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-13 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1360', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1429', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-14 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1361', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1430', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-17 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1362', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1431', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-18 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1363', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1432', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-19 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1364', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1433', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-20 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1365', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1434', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-21 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1366', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1435', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-24 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1367', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1436', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-25 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1368', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1437', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-26 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1369', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1438', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-27 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1370', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1439', 'beosztas', 'Új beosztás érkezett! Azonosító: Fülöp Sándor Gábor: 2024-06-28 - 08:00-16:30', '11', '[1, 2, 18, 20]', '1371', '1', '2024-05-09 12:10:04', '2024-05-09 12:10:21');
INSERT INTO notifications VALUES ('1440', 'szabadsag', 'Fülöp Sándor Gábor szabadságot kért! Kezdés: 2024-06-03, Vége: 2024-06-10', '11', '[1, 2, 18, 20]', '71', '1', '2024-05-09 12:11:07', '2024-05-09 14:11:11');
INSERT INTO notifications VALUES ('1461', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-02 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1392', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1462', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-03 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1393', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1463', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-06 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1394', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1464', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-07 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1395', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1465', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-08 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1396', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1466', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-09 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1397', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1467', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-10 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1398', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1468', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-13 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1399', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1469', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-14 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1400', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1470', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-15 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1401', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:31');
INSERT INTO notifications VALUES ('1471', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-16 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1402', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1472', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-17 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1403', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1473', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-21 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1404', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1474', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-22 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1405', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1475', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-23 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1406', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1476', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-24 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1407', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1477', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-27 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1408', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1478', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-28 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1409', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1479', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-29 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1410', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1480', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-30 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1411', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1481', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-31 - 09:52-13:52', '7', '[1, 2, 18, 20]', '1412', '1', '2024-05-14 07:52:20', '2024-05-14 07:52:32');
INSERT INTO notifications VALUES ('1482', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-06 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1413', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1483', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-07 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1414', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1484', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-08 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1415', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1485', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-09 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1416', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1486', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-10 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1417', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1487', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-13 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1418', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1488', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-14 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1419', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1489', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-15 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1420', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1490', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-16 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1421', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1491', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-17 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1422', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1492', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-21 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1423', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1493', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-22 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1424', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1494', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-23 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1425', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1495', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-24 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1426', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1496', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-27 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1427', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1497', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-28 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1428', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1498', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-29 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1429', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1499', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-30 - 12:07-15:07', '7', '[1, 2, 18, 20]', '1430', '1', '2024-05-14 10:07:40', '2024-05-14 10:08:56');
INSERT INTO notifications VALUES ('1500', 'beosztas_modositas', 'Bradák Ferenc beosztást módosítást kért! Dátum: 2024-05-16, Kezdés: 08:30, Vége: 17:00', '15', '[1, 2, 18, 20]', '12', '1', '2024-05-16 07:45:38', '2024-05-16 07:46:15');
INSERT INTO notifications VALUES ('1501', 'szabadsag', 'Huszta Annabella szabadságot kért! Kezdés: 2024-05-30, Vége: 2024-05-30', '14', '[1, 2, 18, 20]', '72', '1', '2024-05-27 08:08:01', '2024-05-27 10:08:25');
INSERT INTO notifications VALUES ('1502', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-03 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1431', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1503', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-04 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1432', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1504', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-05 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1433', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1505', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-06 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1434', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1506', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-07 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1435', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1507', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-10 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1436', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1508', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-11 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1437', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1509', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-12 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1438', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1510', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-13 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1439', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1511', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-14 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1440', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1512', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-17 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1441', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1513', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-18 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1442', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1514', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-19 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1443', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1515', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-20 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1444', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1516', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-21 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1445', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1517', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-24 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1446', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1518', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-25 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1447', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1519', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-26 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1448', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1520', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-27 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1449', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1521', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-28 - 08:00-16:30', '15', '[1, 2, 18, 20]', '1450', '1', '2024-05-27 08:52:19', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1522', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-08 - 18:00-19:00', '15', '[1, 2, 18, 20]', '1451', '1', '2024-05-27 08:53:52', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1523', 'beosztas', 'Új beosztás érkezett! Azonosító: Bradák Ferenc: 2024-06-09 - 18:00-19:00', '15', '[1, 2, 18, 20]', '1452', '1', '2024-05-27 08:54:24', '2024-05-27 10:08:34');
INSERT INTO notifications VALUES ('1524', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-21 - 12:53-16:53', '7', '[1, 2, 18, 20]', '1453', '1', '2024-05-27 10:53:32', '2024-05-27 10:53:44');
INSERT INTO notifications VALUES ('1525', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-22 - 12:53-16:53', '7', '[1, 2, 18, 20]', '1454', '1', '2024-05-27 10:53:32', '2024-05-27 10:53:44');
INSERT INTO notifications VALUES ('1526', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-23 - 12:53-16:53', '7', '[1, 2, 18, 20]', '1455', '1', '2024-05-27 10:53:32', '2024-05-27 10:53:44');
INSERT INTO notifications VALUES ('1527', 'beosztas', 'Új beosztás érkezett! Azonosító: Rohrbacher Teszt: 2024-05-24 - 12:53-16:53', '7', '[1, 2, 18, 20]', '1456', '1', '2024-05-27 10:53:32', '2024-05-27 10:53:44');
INSERT INTO oktatas VALUES ('37', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', 'VIZA folyamatok', '2024-03-26', '14:00:00', '15:00:00');
INSERT INTO oktatas VALUES ('40', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', 'PMS', '2024-04-04', '9:30:00', '10:30:00');
INSERT INTO oktatas VALUES ('42', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', 'Viza', '2024-04-17', '16:00:00', '17:00:00');
INSERT INTO roles VALUES ('1', 'admin');
INSERT INTO roles VALUES ('2', 'user');
INSERT INTO roles VALUES ('3', 'trainer');
INSERT INTO szabadsag VALUES ('33', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-04-05', '2024-04-05', '2024-04-23 12:34:41', 'Szabadság');
INSERT INTO szabadsag VALUES ('34', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-04-02', '2024-04-03', '2024-04-23 12:38:56', 'Szabadság');
INSERT INTO szabadsag VALUES ('35', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-02', '2024-05-02', '2024-04-23 13:03:10', 'Szabadság');
INSERT INTO szabadsag VALUES ('36', 'sandor.fulop01@sagemcom.hu', 'Fülöp Sándor Gábor Teszt', '2024-04-05', '2024-04-05', '2024-04-23 13:26:02', 'Szabadság');
INSERT INTO szabadsag VALUES ('37', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-22', '2024-04-22', '2024-04-23 13:49:25', 'Szabadság');
INSERT INTO szabadsag VALUES ('38', 'ferenc.bradak@sagemcom.hu', 'Bradák Ferenc', '2024-04-03', '2024-04-03', '2024-04-23 13:49:47', 'Szabadság');
INSERT INTO szabadsag VALUES ('39', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-18', '2024-04-22', '2024-04-23 13:49:52', 'Szabadság');
INSERT INTO szabadsag VALUES ('40', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-04-03', '2024-04-03', '2024-04-23 13:52:52', 'Szabadság');
INSERT INTO szabadsag VALUES ('43', 'laszlo.bene@sagemcom.hu', 'Bene László Ádám', '2024-05-02', '2024-05-03', '2024-04-25 11:25:00', 'Szabadság');
INSERT INTO szabadsag VALUES ('44', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-02', '2024-05-03', '2024-04-25 11:25:01', 'Szabadság');
INSERT INTO szabadsag VALUES ('51', 'zsolt.wittmann@sagemcom.hu', 'Wittmann Zsolt', '2024-05-08', '2024-05-08', '2024-05-07 09:04:47', 'Szabadság');
INSERT INTO szabadsag VALUES ('52', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-06', '2024-05-06', '2024-05-07 09:33:06', 'Szabadság');
INSERT INTO szabadsag VALUES ('53', 'atlan.mandoky@sagemcom.hu', 'Mándoky Kongur Atlan', '2024-05-21', '2024-05-31', '2024-05-07 09:33:06', 'Szabadság');
INSERT INTO szabadsag VALUES ('54', 'sandor.fulop@sagemcom.hu', 'Fülöp Sándor Gábor', '2024-06-03', '2024-06-10', '2024-05-09 14:11:11', 'Szabadság');
INSERT INTO szabadsag VALUES ('73', 'viktor.lako@sagemcom.hu', 'Lakó Viktor', '2024-05-16', '2024-05-16', '2024-05-16 07:56:12', 'Szabadság');
INSERT INTO szabadsag VALUES ('75', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher Csaba Ákos', '2024-05-22', '2024-05-24', '2024-05-24 13:45:41', 'Betegszabi');
INSERT INTO szabadsag VALUES ('76', 'annabella.huszta@sagemcom.hu', 'Huszta Annabella', '2024-05-30', '2024-05-30', '2024-05-27 10:08:25', 'Szabadság');
INSERT INTO users VALUES ('1', 'bence.zambo@sagemcom.hu', 'Zámbó', 'Bence', '1', '4fd07b7ee04a2a03fb6532dde424637d8d9385120ca379ffc05c7ee0c383fea8', 'f2a46655731d1290db38e50b6a2f903d', '0', '1', '1998', '#3d50a3', '200', NULL);
INSERT INTO users VALUES ('2', 'csaba.rohrbacher@sagemcom.hu', 'Rohrbacher', 'Csaba Ákos', '1', '18fc0d6e876ea66f4cce4257fc333b63c5e479890e672b8a13b4a0be540a944b', '006c9a8b5ef3368998dbd2c4a665946a', '0', '1', '2001', '#d9c5b5', '15', NULL);
INSERT INTO users VALUES ('7', 'csaba.rohrbacher02@sagemcom.hu', 'Rohrbacher', 'Teszt', '3', '313b21581a377ab088ee1dce2ceb53b5469787a26c450e2b3db27e692c3dee6a', '39ca1621ffd8e4be4e744dbcc4aea031', '0', '1', '2001', '#f59ee7', '187', NULL);
INSERT INTO users VALUES ('9', 'laszlo.bene@sagemcom.hu', 'Bene', 'László Ádám', '2', '46a4a34876a50a649be438b0de43a841d57d5fb9c2f5d31aada787176f332f1b', '4fba6ffd4df2587b17037d5c1fb41fe3', '0', '1', '1991', '#f0f160', '22', NULL);
INSERT INTO users VALUES ('10', 'krisztina.kovacs@sagemcom.hu', 'Kovács', 'Krisztina Anita', '2', '66bea77b1d611948294cec888ed2ef3cb99409a97520de6f03a25cb24e14581e', '80263c4c97996b28e35698c5a5c0fb75', '2', '21', '1979', '#f3bbff', '34', NULL);
INSERT INTO users VALUES ('11', 'sandor.fulop@sagemcom.hu', 'Fülöp', 'Sándor Gábor', '2', '556d2a7b4621b23cbc7542e40efdcf1b607e8bff9ef64539ef9cc038eb9d51b1', 'a49b4e8253c77cbf4f89a401d8511dc0', '1', '5', '1980', '#7cf8b0', '24', NULL);
INSERT INTO users VALUES ('12', 'zsolt.wittmann@sagemcom.hu', 'Wittmann', 'Zsolt', '2', '9fd1e51bb28c513dddd4122a7bbff62e1b9202f2f12befff8a45e1e26aad0496', '1819558a639b14c5ff28e3934760373d', '2', '5', '1974', '#c1cdcd', '27', NULL);
INSERT INTO users VALUES ('13', 'viktor.lako@sagemcom.hu', 'Lakó', 'Viktor', '3', '1c10b60683f954ff855eaa15fdb86937a265869d16a9971d623ed6a1a2fc6404', '5887947586b34c07e446123a23a94f84', '0', '4', '1991', '#85dbf2', '23', NULL);
INSERT INTO users VALUES ('14', 'annabella.huszta@sagemcom.hu', 'Huszta', 'Annabella', '2', '52a1d184cfc03c977d8d5b2bc8dc022b9624dcbb1b43a6ebb9347a38bdbbeb58', '0af9f9c61d4b1a4628c6447b0fff2b1b', '0', '1', '2001', '#ffbf00', '20', NULL);
INSERT INTO users VALUES ('15', 'ferenc.bradak@sagemcom.hu', 'Bradák', 'Ferenc', '2', '28a0624814dd0d041c30cf85fe10bef9bf3d549db5098799cdc11c4951ce732a', '36a0f138e47debf7e51105b84bd215be', '1', '2', '1985', '#bd61e8', '27', NULL);
INSERT INTO users VALUES ('18', 'sandor.fulop01@sagemcom.hu', 'Fülöp', 'Sándor Admin', '1', '556d2a7b4621b23cbc7542e40efdcf1b607e8bff9ef64539ef9cc038eb9d51b1', 'a49b4e8253c77cbf4f89a401d8511dc0', '1', '5', '1980', '#fc9d03', '30', NULL);
INSERT INTO users VALUES ('19', 'atlan.mandoky@sagemcom.hu', 'Mándoky', 'Kongur Atlan', '2', '6fea11bbeb88d20f03e85671a0ce5f96171f891c3d276e35c6e2a52136aa32ae', '712892a76cefa2a4419372ba70cfc692', '0', '1', '1993', '#2AA46C', '13', NULL);
INSERT INTO users VALUES ('20', 'daniel.vaszari@tenzortech.hu', 'Vaszari', 'Dániel', '1', 'da6dcfc60c916c33e028fca54a88a6f9467b026adcaaf2825e6d996e836e88f3', '5788ae6526050e6125cacd228dfca582', '1', '10', '1987', '#d8183b', NULL, NULL);
