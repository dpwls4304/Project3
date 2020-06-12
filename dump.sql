-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.5.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- suamil_db 데이터베이스 구조 내보내기
DROP DATABASE IF EXISTS `dpwls4304`;
CREATE DATABASE IF NOT EXISTS `dpwls4304` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dpwls4304`;

-- 테이블 suamil_db.membership 구조 내보내기
DROP TABLE IF EXISTS `membership`;
CREATE TABLE IF NOT EXISTS `membership` (
  `name` varchar(30) NOT NULL,
  `id` varchar(30) NOT NULL,
  `pass` varchar(30) NOT NULL,
  `tel` varchar(15) NOT NULL,
  `mobile` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `address` varchar(50) NOT NULL,
  `regidate` datetime DEFAULT current_timestamp(),
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- 테이블 데이터 suamil_db.membership:~12 rows (대략적) 내보내기
DELETE FROM `membership`;
/*!40000 ALTER TABLE `membership` DISABLE KEYS */;
INSERT INTO `membership` (`name`, `id`, `pass`, `tel`, `mobile`, `email`, `address`, `regidate`) VALUES
	('', 'aaa2', '', '--', '--', '@', ',,,', '2020-06-04 14:56:05'),
	('', 'aaa3', '', '--', '--', '@', ',,,', '2020-06-04 14:57:05'),
	('', 'aaa4', '', '--', '--', '@', ',,,', '2020-06-04 15:02:14'),
	('', 'aaa5', '', '--', '--', '@', ',,,', '2020-06-04 15:05:12'),
	('', 'aaa6', '', '--', '--', '@', ',,,', '2020-06-04 15:09:16'),
	('', 'aaa7', '', '--', '--', '@', ',,,', '2020-06-04 15:10:17'),
	('', 'aaaa1', '', '--', '--', '@', ',,,', '2020-06-04 14:54:44'),
	('박예진', 'test1', '1234', '010-2210-9604', '010-2210-9604', 'tego14@naver.com', '서울시 성북구 보문동6가', '2020-06-04 12:41:19'),
	('박길동', 'test2', '1234', '010-2210-9604', '010-2210-9604', 'xx21ccvv@', '02873,서울 성북구 보문동6가 322, (보문동6가),1층', '2020-06-04 14:42:27'),
	('', 'test35', '', '--', '--', '@', ',,,', '2020-06-08 20:43:46'),
	('', 'test36', '1234', '--', '--', '@', ',,,', '2020-06-08 20:44:06'),
	('', '중복확인을 눌러주세요', '', '--', '--', '@', ',,,', '2020-06-04 14:51:32');
/*!40000 ALTER TABLE `membership` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
