-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.3.10-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- db14hhm 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `db14hhm` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `db14hhm`;

-- 테이블 db14hhm.tb_goods 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_goods` (
  `g_code` varchar(50) NOT NULL COMMENT '상품코드',
  `u_id` varchar(50) NOT NULL COMMENT '아이디',
  `g_name` varchar(50) NOT NULL COMMENT '상품이름',
  `g_cate` varchar(50) NOT NULL COMMENT '상품카테고리',
  `g_price` varchar(50) NOT NULL COMMENT '상품가격',
  `g_color` varchar(50) NOT NULL COMMENT '상품색상',
  `g_size` varchar(50) NOT NULL COMMENT '상품사이즈',
  `g_date` varchar(50) NOT NULL COMMENT '상품등록날짜',
  `g_desc` varchar(50) NOT NULL COMMENT '상품상세정보',
  PRIMARY KEY (`g_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='상품';

-- 테이블 데이터 db14hhm.tb_goods:~1 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_goods` DISABLE KEYS */;
INSERT INTO `tb_goods` (`g_code`, `u_id`, `g_name`, `g_cate`, `g_price`, `g_color`, `g_size`, `g_date`, `g_desc`) VALUES
	('goods_1', '1', '1', '1', '1', '1', '1', '2018-10-17 11:46:46', '1'),
	('goods_2', '2', '2', '2', '2', '2', '2', '2018-10-17 11:50:40', '2'),
	('goods_3', '2', '3', '3', '3', '3', '3', '2018-10-17 11:50:47', '3');
/*!40000 ALTER TABLE `tb_goods` ENABLE KEYS */;

-- 테이블 db14hhm.tb_user 구조 내보내기
CREATE TABLE IF NOT EXISTS `tb_user` (
  `u_id` varchar(50) NOT NULL COMMENT '아이디',
  `u_pw` varchar(50) NOT NULL COMMENT '비밀번호',
  `u_level` varchar(50) NOT NULL COMMENT '권한',
  `u_name` varchar(50) NOT NULL COMMENT '이름',
  `u_email` varchar(50) NOT NULL COMMENT '이메일',
  `u_phone` varchar(50) NOT NULL COMMENT '전화번호',
  `u_addr` varchar(50) NOT NULL COMMENT '주소',
  PRIMARY KEY (`u_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원';

-- 테이블 데이터 db14hhm.tb_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`u_id`, `u_pw`, `u_level`, `u_name`, `u_email`, `u_phone`, `u_addr`) VALUES
	('1', '1', '관리자', '1', '1', '1', '1'),
	('2', '2', '판매자', '2', '2', '2', '2'),
	('3', '3', '구매자', '3', '3', '3', '3');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
