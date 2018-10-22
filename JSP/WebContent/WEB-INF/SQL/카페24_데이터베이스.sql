-- --------------------------------------------------------
-- 호스트:                          gusgmlans.cafe24.com
-- 서버 버전:                        10.1.13-MariaDB - MariaDB Server
-- 서버 OS:                        Linux
-- HeidiSQL 버전:                  9.4.0.5125
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- gusgmlans 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `gusgmlans` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `gusgmlans`;

-- 테이블 gusgmlans.answer 구조 내보내기
CREATE TABLE IF NOT EXISTS `answer` (
  `answer_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '답변 번호',
  `question_no` int(10) NOT NULL COMMENT '질문 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  `answer_title` varchar(20) NOT NULL COMMENT '답변 제목',
  `answer_content` varchar(500) NOT NULL COMMENT '답변 내용',
  `answer_date` date NOT NULL COMMENT '등록 일시',
  PRIMARY KEY (`answer_no`),
  KEY `FK_answer_question` (`question_no`),
  KEY `FK_answer_trainer` (`trainer_no`),
  CONSTRAINT `FK_answer_question` FOREIGN KEY (`question_no`) REFERENCES `question` (`question_no`),
  CONSTRAINT `FK_answer_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='답변 관리(피드백)			\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.answer:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `answer` DISABLE KEYS */;
/*!40000 ALTER TABLE `answer` ENABLE KEYS */;

-- 테이블 gusgmlans.exercise_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `exercise_plan` (
  `health_program_exercise_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 일차별 계획 번호',
  `health_program_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 일차 번호',
  `health_program_exercise_course` varchar(50) NOT NULL COMMENT '운동종목',
  `health_program_exercise_score` varchar(20) NOT NULL COMMENT '운동량',
  `health_program_consumed_calorie` int(10) NOT NULL COMMENT '분/횟수 소모 칼로리',
  `health_program_goal_consumed_calorie` int(10) NOT NULL COMMENT '목표 소모칼로리',
  PRIMARY KEY (`health_program_exercise_plan_no`),
  KEY `FK_exercise_plan_health_program_plan` (`health_program_plan_no`),
  CONSTRAINT `FK_exercise_plan_health_program_plan` FOREIGN KEY (`health_program_plan_no`) REFERENCES `health_program_plan` (`health_program_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 운동 종목 계획	\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.exercise_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exercise_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.exercise_progress 구조 내보내기
CREATE TABLE IF NOT EXISTS `exercise_progress` (
  `health_program_exercise_progress_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 운동종목 실행 번호',
  `health_program_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 번호',
  `health_program_exercise_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 운동종목 계획 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `health_program_exercise_course` varchar(50) NOT NULL COMMENT '실제 운동종목',
  `health_program_actual_exercise` varchar(20) NOT NULL COMMENT '실제 운동량',
  `health_program_actual_consumed_calorie` int(10) NOT NULL COMMENT '실제 소모칼로리',
  `health_program_progress_date` date NOT NULL COMMENT '실행날짜',
  PRIMARY KEY (`health_program_exercise_progress_no`),
  KEY `FK_exercise_progress_health_program_recruitment` (`health_program_recruitment_no`),
  KEY `FK_exercise_progress_exercise_plan` (`health_program_exercise_plan_no`),
  KEY `FK_exercise_progress_member` (`member_no`),
  CONSTRAINT `FK_exercise_progress_exercise_plan` FOREIGN KEY (`health_program_exercise_plan_no`) REFERENCES `exercise_plan` (`health_program_exercise_plan_no`),
  CONSTRAINT `FK_exercise_progress_health_program_recruitment` FOREIGN KEY (`health_program_recruitment_no`) REFERENCES `health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_exercise_progress_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 운동 종목 실행			\r\n';

-- 테이블 데이터 gusgmlans.exercise_progress:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exercise_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_progress` ENABLE KEYS */;

-- 테이블 gusgmlans.exercise_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `exercise_result` (
  `health_program_exercise_result_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 운동 결과 번호',
  `health_program_exercise_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 운동종목 계획 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `result_for_plan` enum('Y','N') NOT NULL COMMENT '계획대비결과(Y/N)',
  `compared_calorie` int(10) NOT NULL COMMENT '소모 칼로리 비교',
  `health_program_result_date` date NOT NULL COMMENT '결과 날짜',
  PRIMARY KEY (`health_program_exercise_result_no`),
  KEY `FK_exercise_result_exercise_plan` (`health_program_exercise_plan_no`),
  KEY `FK_exercise_result_member` (`member_no`),
  CONSTRAINT `FK_exercise_result_exercise_plan` FOREIGN KEY (`health_program_exercise_plan_no`) REFERENCES `exercise_plan` (`health_program_exercise_plan_no`),
  CONSTRAINT `FK_exercise_result_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 운동 종목 결과			\r\n\r\n';

-- 테이블 데이터 gusgmlans.exercise_result:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `exercise_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercise_result` ENABLE KEYS */;

-- 테이블 gusgmlans.facilities_maintenance 구조 내보내기
CREATE TABLE IF NOT EXISTS `facilities_maintenance` (
  `facilities_maintenance_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 시설 관리 번호',
  `healthclubs_facilities_no` int(10) NOT NULL COMMENT '헬스장 시설 번호',
  `maintenance_selection` varchar(50) NOT NULL COMMENT '관리 항목',
  `maintenance_reason` varchar(50) NOT NULL COMMENT '관리 사유',
  `maintenance_date` date NOT NULL COMMENT '관리 날짜',
  PRIMARY KEY (`facilities_maintenance_no`),
  KEY `FK_facilities_maintenance_healthclubs_facilities` (`healthclubs_facilities_no`),
  CONSTRAINT `FK_facilities_maintenance_healthclubs_facilities` FOREIGN KEY (`healthclubs_facilities_no`) REFERENCES `healthclubs_facilities` (`healthclubs_facilities_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스장 시설 관리	\r\n\r\n';

-- 테이블 데이터 gusgmlans.facilities_maintenance:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `facilities_maintenance` DISABLE KEYS */;
/*!40000 ALTER TABLE `facilities_maintenance` ENABLE KEYS */;

-- 테이블 gusgmlans.head_require 구조 내보내기
CREATE TABLE IF NOT EXISTS `head_require` (
  `head_require_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '본사 건의사항 번호',
  `name` varchar(20) NOT NULL COMMENT '이름',
  `phone` varchar(20) NOT NULL COMMENT '전화번호',
  `require_title` varchar(20) NOT NULL COMMENT '건희사항 제목',
  `require_content` varchar(50) NOT NULL COMMENT '건의사항 내용',
  `require_date` date NOT NULL COMMENT '등록일시',
  `writer_level` int(10) NOT NULL COMMENT '작성자 권한',
  `serial_no` int(10) NOT NULL COMMENT '건의사항 고유번호',
  PRIMARY KEY (`head_require_no`)
) ENGINE=InnoDB AUTO_INCREMENT=95 DEFAULT CHARSET=utf8 COMMENT='본사 건의사항			\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.head_require:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `head_require` DISABLE KEYS */;
/*!40000 ALTER TABLE `head_require` ENABLE KEYS */;

-- 테이블 gusgmlans.healthclubs 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthclubs` (
  `healthclubs_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 번호',
  `healthclubs_name` varchar(20) NOT NULL COMMENT '헬스장 이름',
  `healthclubs_address` varchar(50) NOT NULL COMMENT '헬스장 주소',
  `healthclubs_representative` varchar(20) NOT NULL COMMENT '헬스장 대표자',
  `healthclubs_phone` varchar(20) NOT NULL COMMENT '헬스장 전화번호',
  `healthclubs_opening_date` date NOT NULL COMMENT '헬스장 개업날짜',
  `healthclubs_business_number` varchar(20) NOT NULL COMMENT '헬스장 사업자번호',
  `healthclubs_joindate` date NOT NULL COMMENT '헬스장 등록날짜',
  PRIMARY KEY (`healthclubs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='헬스장 등록 관리 ';

-- 테이블 데이터 gusgmlans.healthclubs:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthclubs` DISABLE KEYS */;
INSERT INTO `healthclubs` (`healthclubs_no`, `healthclubs_name`, `healthclubs_address`, `healthclubs_representative`, `healthclubs_phone`, `healthclubs_opening_date`, `healthclubs_business_number`, `healthclubs_joindate`) VALUES
	(1, '본사', '서울특별시', '현희문', '02-111-1111', '2018-10-22', '11111111', '2018-10-22'),
	(2, '전주', '전라북도', '현희문', '063-222-2222', '2018-10-22', '22222222', '2018-10-22'),
	(3, '광주광역시', '광주광역시', '현희문', '062-333-3333', '2018-10-22', '33333333', '2018-10-22'),
	(4, '대전광역시', '대전광역시', '현희문', '042-444-4444', '2018-10-22', '44444444', '2018-10-22');
/*!40000 ALTER TABLE `healthclubs` ENABLE KEYS */;

-- 테이블 gusgmlans.healthclubs_admin 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthclubs_admin` (
  `healthclubs_admin_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 관리자 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `healthclubs_admin_id` varchar(20) NOT NULL COMMENT '관리자 아이디',
  `healthclubs_admin_pw` varchar(20) NOT NULL COMMENT '관리자 비밀번호',
  `healthclubs_admin_name` varchar(20) NOT NULL COMMENT '관리자 이름',
  `healthclubs_admin_phone` varchar(15) NOT NULL COMMENT '관리자 전화번호',
  `healthclubs_admin_joindate` date NOT NULL COMMENT '관리자 등록날짜',
  PRIMARY KEY (`healthclubs_admin_no`),
  KEY `FK_healthclubs_admin_healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_healthclubs_admin_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='헬스장 관리자 관리			\r\n';

-- 테이블 데이터 gusgmlans.healthclubs_admin:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthclubs_admin` DISABLE KEYS */;
INSERT INTO `healthclubs_admin` (`healthclubs_admin_no`, `healthclubs_no`, `healthclubs_admin_id`, `healthclubs_admin_pw`, `healthclubs_admin_name`, `healthclubs_admin_phone`, `healthclubs_admin_joindate`) VALUES
	(1, 1, 'id001', 'pw001', '현희문', '010-1111-1111', '2018-10-22'),
	(2, 2, 'id002', 'pw002', '현희문', '010-2222-2222', '2018-10-22'),
	(3, 3, 'id003', 'pw003', '현희문', '010-3333-3333', '2018-10-22'),
	(4, 4, 'id004', 'pw004', '현희문', '010-4444-4444', '2018-10-22');
/*!40000 ALTER TABLE `healthclubs_admin` ENABLE KEYS */;

-- 테이블 gusgmlans.healthclubs_facilities 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthclubs_facilities` (
  `healthclubs_facilities_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 시설 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `healthclubs_admin_no` int(10) NOT NULL COMMENT '헬스장 관리자 번호',
  `healthclubs_facilities_name` varchar(20) NOT NULL COMMENT '헬스장 시설명',
  `facilities_detail_content` varchar(20) NOT NULL COMMENT '세부내용',
  `healthclubs_facilities_cost` int(10) NOT NULL COMMENT '비용',
  `facilities_purchase_date` date NOT NULL COMMENT '구입날짜',
  PRIMARY KEY (`healthclubs_facilities_no`),
  KEY `FK_healthclubs_facilities_healthclubs` (`healthclubs_no`),
  KEY `FK_healthclubs_facilities_healthclubs_admin` (`healthclubs_admin_no`),
  CONSTRAINT `FK_healthclubs_facilities_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_healthclubs_facilities_healthclubs_admin` FOREIGN KEY (`healthclubs_admin_no`) REFERENCES `healthclubs_admin` (`healthclubs_admin_no`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='헬스장 시설	';

-- 테이블 데이터 gusgmlans.healthclubs_facilities:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthclubs_facilities` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthclubs_facilities` ENABLE KEYS */;

-- 테이블 gusgmlans.healthclubs_paymentdetails 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthclubs_paymentdetails` (
  `healthclubs_paymentdetails_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 결제 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `payment_method` varchar(20) NOT NULL COMMENT '결제 방식',
  `payment_total` int(10) NOT NULL COMMENT '총 결제 금액',
  `payment_date` date NOT NULL COMMENT '결제 일시',
  `payment_check` enum('Y','N') NOT NULL COMMENT '결제 여부(Y/N)',
  `healthclubs_joindate` date NOT NULL COMMENT '헬스장 이용 시작 일시',
  `healthclubs_expireddate` date NOT NULL COMMENT '헬스장 이용 종료 일시',
  PRIMARY KEY (`healthclubs_paymentdetails_no`),
  KEY `FK_healthclubs_paymentdetails_member` (`member_no`),
  KEY `FK_healthclubs_paymentdetails_healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_healthclubs_paymentdetails_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_healthclubs_paymentdetails_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스장 결제	\r\n';

-- 테이블 데이터 gusgmlans.healthclubs_paymentdetails:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthclubs_paymentdetails` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthclubs_paymentdetails` ENABLE KEYS */;

-- 테이블 gusgmlans.healthclubs_refund 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthclubs_refund` (
  `healthclubs_refund_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스장 환불 번호',
  `healthclubs_paymentdetails_no` int(10) NOT NULL COMMENT '헬스장 결제 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `refund_reason` varchar(50) NOT NULL COMMENT '환불 사유',
  `refund_method` varchar(20) NOT NULL COMMENT '환불 방식',
  `refund_money` int(10) NOT NULL COMMENT '환불 금액',
  `refund_date` date NOT NULL COMMENT '환불 일시',
  PRIMARY KEY (`healthclubs_refund_no`),
  KEY `FK_healthclubs_refound_healthclubs_paymentdetails` (`healthclubs_paymentdetails_no`),
  KEY `FK_healthclubs_refound_member` (`member_no`),
  CONSTRAINT `FK_healthclubs_refound_healthclubs_paymentdetails` FOREIGN KEY (`healthclubs_paymentdetails_no`) REFERENCES `healthclubs_paymentdetails` (`healthclubs_paymentdetails_no`),
  CONSTRAINT `FK_healthclubs_refound_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스장 환불 관리	';

-- 테이블 데이터 gusgmlans.healthclubs_refund:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthclubs_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthclubs_refund` ENABLE KEYS */;

-- 테이블 gusgmlans.healthprogram_preview 구조 내보내기
CREATE TABLE IF NOT EXISTS `healthprogram_preview` (
  `healthprogram_preview_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 후기 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `health_program_no` int(10) NOT NULL COMMENT '헬스 프로그램 번호',
  `preview_title` varchar(20) NOT NULL COMMENT '후기 제목',
  `preview_content` varchar(20) NOT NULL COMMENT '후기 내용',
  `preview_date` varchar(20) NOT NULL COMMENT '등록 일시',
  PRIMARY KEY (`healthprogram_preview_no`),
  KEY `FK_healthprogram_preview_member` (`member_no`),
  KEY `FK_healthprogram_preview_health_program` (`health_program_no`),
  CONSTRAINT `FK_healthprogram_preview_health_program` FOREIGN KEY (`health_program_no`) REFERENCES `health_program` (`health_program_no`),
  CONSTRAINT `FK_healthprogram_preview_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 후기 등록관리	';

-- 테이블 데이터 gusgmlans.healthprogram_preview:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `healthprogram_preview` DISABLE KEYS */;
/*!40000 ALTER TABLE `healthprogram_preview` ENABLE KEYS */;

-- 테이블 gusgmlans.health_pay 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_pay` (
  `health_pay_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 결제 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `health_program_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 번호',
  `payment_method` varchar(20) NOT NULL COMMENT '결제 방식',
  `payment_total` int(10) NOT NULL COMMENT '총 결제금액',
  `payment_date` date NOT NULL COMMENT '결제 일시',
  `payment_check` enum('Y','N') NOT NULL COMMENT '결제 여부(Y/N)',
  `health_program_startdate` date NOT NULL COMMENT '헬스 프로그램 시작일',
  `health_program_enddate` date NOT NULL COMMENT '헬스 프로그램 종료일',
  PRIMARY KEY (`health_pay_no`),
  KEY `FK_health_pay_member` (`member_no`),
  KEY `FK_health_pay_healthclubs` (`healthclubs_no`),
  KEY `FK_health_pay_health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_health_pay_health_program_recruitment` FOREIGN KEY (`health_program_recruitment_no`) REFERENCES `health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_health_pay_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_health_pay_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 결제 관리			\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.health_pay:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `health_pay` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_pay` ENABLE KEYS */;

-- 테이블 gusgmlans.health_program 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_program` (
  `health_program_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 개발 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `health_program_title` varchar(20) NOT NULL COMMENT '헬스 프로그램 명',
  `health_program_goal` varchar(20) NOT NULL COMMENT '헬스 프로그램 목표',
  `health_program_content` varchar(500) NOT NULL COMMENT '프로그램 상세내용',
  `health_program_term` int(10) NOT NULL COMMENT '총 기간',
  `health_program_totaldate` int(10) NOT NULL COMMENT '총 일차수',
  `health_program_issue_date` date NOT NULL COMMENT '헬스 프로그램 개발 등록 날짜',
  PRIMARY KEY (`health_program_no`),
  KEY `FK_health_program_healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_health_program_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 개발			\r\n';

-- 테이블 데이터 gusgmlans.health_program:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `health_program` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_program` ENABLE KEYS */;

-- 테이블 gusgmlans.health_program_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_program_plan` (
  `health_program_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 일차별 계획 번호',
  `health_program_no` int(10) NOT NULL COMMENT '헬스 프로그램 개발 번호',
  `health_program_countdate` int(10) NOT NULL COMMENT '일차',
  PRIMARY KEY (`health_program_plan_no`),
  KEY `FK_health_program_plan_health_program` (`health_program_no`),
  CONSTRAINT `FK_health_program_plan_health_program` FOREIGN KEY (`health_program_no`) REFERENCES `health_program` (`health_program_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='프로그램 일차별 계획			\r\n';

-- 테이블 데이터 gusgmlans.health_program_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `health_program_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_program_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.health_program_recruitment 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_program_recruitment` (
  `health_program_recruitment_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 모집 공고 번호',
  `health_program_no` int(10) NOT NULL COMMENT '헬스 프로그램 개발 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  `recruitment_number` int(10) NOT NULL COMMENT '모집 인원',
  `health_program_price` int(10) NOT NULL COMMENT '가격',
  `recruitment_startdate` date NOT NULL COMMENT '모집 시작일',
  `recruitment_enddate` date NOT NULL COMMENT '모집 종료일',
  `health_program_startdate` date NOT NULL COMMENT '헬스 프로그램 시작일',
  `health_program_enddate` date NOT NULL COMMENT '헬스 프로그램 종료일',
  PRIMARY KEY (`health_program_recruitment_no`),
  KEY `FK_health_program_recruitment_health_program` (`health_program_no`),
  KEY `FK_health_program_recruitment_trainer` (`trainer_no`),
  CONSTRAINT `FK_health_program_recruitment_health_program` FOREIGN KEY (`health_program_no`) REFERENCES `health_program` (`health_program_no`),
  CONSTRAINT `FK_health_program_recruitment_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 모집 공고';

-- 테이블 데이터 gusgmlans.health_program_recruitment:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `health_program_recruitment` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_program_recruitment` ENABLE KEYS */;

-- 테이블 gusgmlans.health_refund 구조 내보내기
CREATE TABLE IF NOT EXISTS `health_refund` (
  `health_refund_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 환불 번호',
  `health_pay_no` int(10) NOT NULL COMMENT '헬스 프로그램 결제 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `health_program_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 번호',
  `refund_reason` varchar(20) NOT NULL COMMENT '환불 사유',
  `refund_method` varchar(20) NOT NULL COMMENT '환불 방식',
  `refund_money` int(10) NOT NULL COMMENT '환불 금액',
  `refund_date` date NOT NULL COMMENT '환불 일시',
  PRIMARY KEY (`health_refund_no`),
  KEY `FK_health_refound_health_pay` (`health_pay_no`),
  KEY `FK_health_refound_member` (`member_no`),
  KEY `FK_health_refound_health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_health_refound_health_pay` FOREIGN KEY (`health_pay_no`) REFERENCES `health_pay` (`health_pay_no`),
  CONSTRAINT `FK_health_refound_health_program_recruitment` FOREIGN KEY (`health_program_recruitment_no`) REFERENCES `health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_health_refound_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 환불 관리			\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.health_refund:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `health_refund` DISABLE KEYS */;
/*!40000 ALTER TABLE `health_refund` ENABLE KEYS */;

-- 테이블 gusgmlans.lotation_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `lotation_plan` (
  `member_lotation_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '일차별 계획 번호',
  `health_program_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 번호',
  `lotation` int(10) NOT NULL COMMENT '일차',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  PRIMARY KEY (`member_lotation_plan_no`),
  KEY `FK_lotation_plan_health_program_recruitment` (`health_program_recruitment_no`),
  KEY `FK_lotation_plan_member` (`member_no`),
  KEY `FK_lotation_plan_trainer` (`trainer_no`),
  CONSTRAINT `FK_lotation_plan_health_program_recruitment` FOREIGN KEY (`health_program_recruitment_no`) REFERENCES `health_program_recruitment` (`health_program_recruitment_no`),
  CONSTRAINT `FK_lotation_plan_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `FK_lotation_plan_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원 일차별 계획			\r\n';

-- 테이블 데이터 gusgmlans.lotation_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `lotation_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `lotation_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.meal_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `meal_plan` (
  `health_program_meal_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 식단 계획 번호',
  `health_program_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 일차별 계획 번호',
  `meal_time` varchar(20) NOT NULL COMMENT '식단 시간',
  `meal_content` varchar(50) NOT NULL COMMENT '식단 내용(계획)',
  `intake_calorie` int(10) NOT NULL COMMENT '예상 섭취 칼로리',
  PRIMARY KEY (`health_program_meal_plan_no`),
  KEY `FK_meal_plan_health_program_plan` (`health_program_plan_no`),
  CONSTRAINT `FK_meal_plan_health_program_plan` FOREIGN KEY (`health_program_plan_no`) REFERENCES `health_program_plan` (`health_program_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 식단 계획			\r\n';

-- 테이블 데이터 gusgmlans.meal_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `meal_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.meal_progress 구조 내보내기
CREATE TABLE IF NOT EXISTS `meal_progress` (
  `health_program_meal_progress_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 식단 실행 번호',
  `health_program_meal_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 식단 번호',
  `health_program_no` int(10) NOT NULL COMMENT '헬스 프로그램 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `meal_time` varchar(20) NOT NULL COMMENT '식단 시간',
  `meal_content` varchar(20) NOT NULL COMMENT '식단 내용',
  `actual_intake_calorie` int(10) NOT NULL COMMENT '실제 섭취 칼로리',
  `health_program_meal_date` date NOT NULL COMMENT '식단날짜',
  PRIMARY KEY (`health_program_meal_progress_no`),
  KEY `FK_meal_progress_meal_plan` (`health_program_meal_plan_no`),
  KEY `FK_meal_progress_health_program` (`health_program_no`),
  KEY `FK_meal_progress_member` (`member_no`),
  CONSTRAINT `FK_meal_progress_health_program` FOREIGN KEY (`health_program_no`) REFERENCES `health_program` (`health_program_no`),
  CONSTRAINT `FK_meal_progress_meal_plan` FOREIGN KEY (`health_program_meal_plan_no`) REFERENCES `meal_plan` (`health_program_meal_plan_no`),
  CONSTRAINT `FK_meal_progress_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 식단 실행			\r\n';

-- 테이블 데이터 gusgmlans.meal_progress:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `meal_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_progress` ENABLE KEYS */;

-- 테이블 gusgmlans.meal_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `meal_result` (
  `health_program_meal_result_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 식단 결과번호',
  `health_program_meal_plan_no` int(10) NOT NULL COMMENT '헬스 프로그램 식단 번호',
  `health_program_meal_progress_no` int(10) NOT NULL COMMENT '헬스 프로그램 식단 실행번호',
  `result_for_plan` enum('Y','N') NOT NULL COMMENT '계획대비결과(Y/N)',
  `compared_calorie` int(10) NOT NULL COMMENT '섭취 칼로리(비교)',
  `health_program_meal_result_date` date NOT NULL COMMENT '결과날짜',
  PRIMARY KEY (`health_program_meal_result_no`),
  KEY `FK_meal_result_meal_plan` (`health_program_meal_plan_no`),
  KEY `FK_meal_result_meal_progress` (`health_program_meal_progress_no`),
  CONSTRAINT `FK_meal_result_meal_plan` FOREIGN KEY (`health_program_meal_plan_no`) REFERENCES `meal_plan` (`health_program_meal_plan_no`),
  CONSTRAINT `FK_meal_result_meal_progress` FOREIGN KEY (`health_program_meal_progress_no`) REFERENCES `meal_progress` (`health_program_meal_progress_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 식단 결과			\r\n';

-- 테이블 데이터 gusgmlans.meal_result:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `meal_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `meal_result` ENABLE KEYS */;

-- 테이블 gusgmlans.member 구조 내보내기
CREATE TABLE IF NOT EXISTS `member` (
  `member_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `member_id` varchar(20) NOT NULL COMMENT '회원 아이디',
  `member_pw` varchar(20) NOT NULL COMMENT '회원 비밀번호',
  `member_name` varchar(10) NOT NULL COMMENT '회원 이름',
  `member_gender` varchar(5) NOT NULL COMMENT '회원 성별',
  `member_address` varchar(50) NOT NULL COMMENT '회원 주소',
  `member_phone` varchar(15) NOT NULL COMMENT '회원 전화번호',
  `member_birthday` date NOT NULL COMMENT '회원 생년월일',
  `member_joindate` date NOT NULL COMMENT '회원 가입날짜',
  `member_email` varchar(50) NOT NULL COMMENT '회원 이메일',
  `member_tall` int(10) NOT NULL COMMENT '회원 키',
  `member_weight` int(10) NOT NULL COMMENT '회원 몸무게',
  `member_goal_weight` int(10) NOT NULL COMMENT '회원 목표 몸무게',
  `member_usage_status` varchar(50) DEFAULT NULL COMMENT '헬스장 이용 현황',
  PRIMARY KEY (`member_no`),
  UNIQUE KEY `member_id` (`member_id`),
  KEY `FK_member_healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_member_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='회원 관리';

-- 테이블 데이터 gusgmlans.member:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` (`member_no`, `healthclubs_no`, `member_id`, `member_pw`, `member_name`, `member_gender`, `member_address`, `member_phone`, `member_birthday`, `member_joindate`, `member_email`, `member_tall`, `member_weight`, `member_goal_weight`, `member_usage_status`) VALUES
	(1, 1, 'id001', 'pw001', '현희문', '남', '서울특별시', '010-1111-1111', '1993-07-31', '2018-10-22', 'example1@naver.com', 180, 80, 60, NULL),
	(2, 2, 'id002', 'pw002', '현희문', '남', '전라북도', '010-2222-2222', '1993-07-31', '2018-10-22', 'example2@naver.com', 180, 80, 60, NULL),
	(3, 3, 'id003', 'pw003', '현희문', '남', '광주광역시', '010-3333-3333', '1993-07-31', '2018-10-22', 'example3@naver.com', 180, 80, 60, NULL),
	(4, 4, 'id004', 'pw004', '현희문', '남', '대전광역시', '010-4444-4444', '1993-07-31', '2018-10-22', 'example4@naver.com', 180, 80, 60, NULL);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;

-- 테이블 gusgmlans.member_body 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_body` (
  `member_body_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원 신체정보 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `tall` int(10) NOT NULL COMMENT '키',
  `weight` int(10) NOT NULL COMMENT '몸무게',
  `BMI` int(10) NOT NULL COMMENT '체질량(BMI)',
  `exercise_date` date NOT NULL COMMENT '운동날짜',
  `consumed_calorie` int(10) NOT NULL COMMENT '칼로리 소모량(회차)',
  `health_program_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 번호',
  `lotation` int(10) NOT NULL COMMENT '일차',
  PRIMARY KEY (`member_body_no`),
  KEY `FK_member_body_member` (`member_no`),
  CONSTRAINT `FK_member_body_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 신체 정보	\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.member_body:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_body` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_body` ENABLE KEYS */;

-- 테이블 gusgmlans.member_exercise_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_exercise_plan` (
  `member_exercise_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 운동종목 계획 번호',
  `member_lotation_plan_no` int(10) NOT NULL COMMENT '회원 일차별 계획 번호',
  `exercise_course` varchar(50) NOT NULL COMMENT '운동종목',
  `exercise_plan` varchar(20) NOT NULL COMMENT '운동량(시간,횟수)',
  `consume_calorie_expect` int(10) NOT NULL COMMENT '예상 소모칼로리',
  `health_program_countdate` date NOT NULL COMMENT '계획 날짜',
  PRIMARY KEY (`member_exercise_plan_no`),
  KEY `FK_member_exercise_plan_lotation_plan` (`member_lotation_plan_no`),
  CONSTRAINT `FK_member_exercise_plan_lotation_plan` FOREIGN KEY (`member_lotation_plan_no`) REFERENCES `lotation_plan` (`member_lotation_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 운동종목 계획			\r\n';

-- 테이블 데이터 gusgmlans.member_exercise_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_exercise_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_exercise_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.member_exercise_progress 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_exercise_progress` (
  `member_exercise_progress_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 운동종목 실행 번호',
  `member_exercise_plan_no` int(10) NOT NULL COMMENT '회원별 운동종목 계획 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `actual_exercise_course` varchar(20) NOT NULL COMMENT '실제 운동 종목',
  `actual_exercise` varchar(20) NOT NULL COMMENT '실제 운동량',
  `actual_consumed_calorie` int(10) NOT NULL COMMENT '실제 소모칼로리',
  `member_weight` int(10) NOT NULL COMMENT '회원 몸무게',
  `member_progress_date` date NOT NULL COMMENT '실행 날짜',
  PRIMARY KEY (`member_exercise_progress_no`),
  KEY `FK_member_exercise_progress_member_exercise_plan` (`member_exercise_plan_no`),
  KEY `FK_member_exercise_progress_member` (`member_no`),
  CONSTRAINT `FK_member_exercise_progress_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `FK_member_exercise_progress_member_exercise_plan` FOREIGN KEY (`member_exercise_plan_no`) REFERENCES `member_exercise_plan` (`member_exercise_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 운동종목 실행			\r\n';

-- 테이블 데이터 gusgmlans.member_exercise_progress:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_exercise_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_exercise_progress` ENABLE KEYS */;

-- 테이블 gusgmlans.member_exercise_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_exercise_result` (
  `member_exercise_result_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 운동종목 결과 번호',
  `member_exercise_plan_no` int(10) NOT NULL COMMENT '회원별 운동종목 계획 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `result_for_plan` enum('Y','N') NOT NULL COMMENT '계획 대비 결과(Y/N)',
  `compared_calorie` int(10) NOT NULL COMMENT '소모 칼로리 비교',
  `member_weight` int(10) NOT NULL COMMENT '회원 몸무게',
  `member_result_date` date NOT NULL COMMENT '결과 날짜',
  PRIMARY KEY (`member_exercise_result_no`),
  KEY `FK_member_exercise_result_member_exercise_plan` (`member_exercise_plan_no`),
  KEY `FK_member_exercise_result_member` (`member_no`),
  CONSTRAINT `FK_member_exercise_result_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `FK_member_exercise_result_member_exercise_plan` FOREIGN KEY (`member_exercise_plan_no`) REFERENCES `member_exercise_plan` (`member_exercise_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 운동종목 결과			\r\n';

-- 테이블 데이터 gusgmlans.member_exercise_result:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_exercise_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_exercise_result` ENABLE KEYS */;

-- 테이블 gusgmlans.member_meal_plan 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_meal_plan` (
  `member_meal_plan_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 식단 계획 번호',
  `member_lotation_plan_no` int(10) NOT NULL COMMENT '회원별 ',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `meal_time` varchar(20) NOT NULL COMMENT '식단 시간',
  `meal_content` varchar(50) NOT NULL COMMENT '식단 내용(계획)',
  `intake_calorie` int(10) NOT NULL COMMENT '예상 섭취 칼로리',
  `member_meal_countdate` int(10) NOT NULL COMMENT '식단 일차',
  PRIMARY KEY (`member_meal_plan_no`),
  KEY `FK_member_meal_plan_member` (`member_no`),
  KEY `FK_member_meal_plan_lotation_plan` (`member_lotation_plan_no`),
  CONSTRAINT `FK_member_meal_plan_lotation_plan` FOREIGN KEY (`member_lotation_plan_no`) REFERENCES `lotation_plan` (`member_lotation_plan_no`),
  CONSTRAINT `FK_member_meal_plan_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 식단 계획			\r\n';

-- 테이블 데이터 gusgmlans.member_meal_plan:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_meal_plan` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_meal_plan` ENABLE KEYS */;

-- 테이블 gusgmlans.member_meal_progress 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_meal_progress` (
  `member_meal_progress_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 식단 실행 번호',
  `member_meal_plan_no` int(10) NOT NULL COMMENT '회원별 식단 계획 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `meal_time` int(10) NOT NULL COMMENT '식단 시간',
  `meal_content` varchar(20) NOT NULL COMMENT '식단 내용(실행)',
  `actual_intake_calorie` varchar(50) NOT NULL COMMENT '실제 섭취 칼로리',
  `member_meal_countdate` int(10) NOT NULL COMMENT '식단 일차',
  PRIMARY KEY (`member_meal_progress_no`),
  KEY `FK_member_meal_progress_member_meal_plan` (`member_meal_plan_no`),
  KEY `FK_member_meal_progress_member` (`member_no`),
  CONSTRAINT `FK_member_meal_progress_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `FK_member_meal_progress_member_meal_plan` FOREIGN KEY (`member_meal_plan_no`) REFERENCES `member_meal_plan` (`member_meal_plan_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 식단 실행	';

-- 테이블 데이터 gusgmlans.member_meal_progress:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_meal_progress` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_meal_progress` ENABLE KEYS */;

-- 테이블 gusgmlans.member_meal_result 구조 내보내기
CREATE TABLE IF NOT EXISTS `member_meal_result` (
  `member_meal_result_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '회원별 식단 결과 번호',
  `member_meal_plan_no` int(10) NOT NULL COMMENT '회원별 식단 계획 번호',
  `member_meal_progress_no` int(10) NOT NULL COMMENT '회원별 식단 실행 번호',
  `result_for_plan` enum('Y','N') NOT NULL COMMENT '계획대비결과(Y/N)',
  `compared_calorie` int(10) NOT NULL COMMENT '결과(섭취 칼로리 비교)',
  `member_meal_result_date` date NOT NULL COMMENT '결과 날짜',
  PRIMARY KEY (`member_meal_result_no`),
  KEY `FK_member_meal_result_member_meal_plan` (`member_meal_plan_no`),
  KEY `FK_member_meal_result_member_meal_progress` (`member_meal_progress_no`),
  CONSTRAINT `FK_member_meal_result_member_meal_plan` FOREIGN KEY (`member_meal_plan_no`) REFERENCES `member_meal_plan` (`member_meal_plan_no`),
  CONSTRAINT `FK_member_meal_result_member_meal_progress` FOREIGN KEY (`member_meal_progress_no`) REFERENCES `member_meal_progress` (`member_meal_progress_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='회원별 식단 결과	\r\n\r\n\r\n\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.member_meal_result:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `member_meal_result` DISABLE KEYS */;
/*!40000 ALTER TABLE `member_meal_result` ENABLE KEYS */;

-- 테이블 gusgmlans.preview_attached_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `preview_attached_file` (
  `preview_attached_file_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '첨부 파일 번호',
  `healthprogram_preview_no` int(10) NOT NULL COMMENT '헬스 프로그램 후기 번호',
  `preview_attached_file_name` varchar(50) NOT NULL COMMENT '첨부 파일 이름',
  `preview_attached_file_type` varchar(50) NOT NULL COMMENT '첨부 파일 타입',
  `preview_attached_file_size` varchar(50) NOT NULL COMMENT '첨부 파일 사이즈',
  PRIMARY KEY (`preview_attached_file_no`),
  KEY `FK_preview_attached_file_healthprogram_preview` (`healthprogram_preview_no`),
  CONSTRAINT `FK_preview_attached_file_healthprogram_preview` FOREIGN KEY (`healthprogram_preview_no`) REFERENCES `healthprogram_preview` (`healthprogram_preview_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 후기 첨부파일';

-- 테이블 데이터 gusgmlans.preview_attached_file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `preview_attached_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `preview_attached_file` ENABLE KEYS */;

-- 테이블 gusgmlans.question 구조 내보내기
CREATE TABLE IF NOT EXISTS `question` (
  `question_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '질문 번호',
  `member_no` int(10) NOT NULL COMMENT '회원 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  `question_title` varchar(20) NOT NULL COMMENT '질문 제목',
  `question_content` varchar(500) NOT NULL COMMENT '질문 내용',
  `question_date` date NOT NULL COMMENT '등록 일시',
  PRIMARY KEY (`question_no`),
  KEY `FK_question_member` (`member_no`),
  KEY `FK_question_trainer` (`trainer_no`),
  CONSTRAINT `FK_question_member` FOREIGN KEY (`member_no`) REFERENCES `member` (`member_no`),
  CONSTRAINT `FK_question_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8 COMMENT='질문 관리(피드백)	';

-- 테이블 데이터 gusgmlans.question:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `question` DISABLE KEYS */;
/*!40000 ALTER TABLE `question` ENABLE KEYS */;

-- 테이블 gusgmlans.recruitment_attached_file 구조 내보내기
CREATE TABLE IF NOT EXISTS `recruitment_attached_file` (
  `recruitment_attached_file_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '헬스 프로그램 모집 첨부 파일 번호',
  `healthprogram_recruitment_no` int(10) NOT NULL COMMENT '헬스 프로그램 모집 공고 번호',
  `recruitment_attached_file_name` varchar(50) NOT NULL COMMENT '헬스 프로그램 모집 파일 이름',
  `recruitment_attached_file_type` varchar(50) NOT NULL COMMENT '헬스 프로그램 모집 파일 타입',
  `recruitment_attached_file_size` varchar(50) NOT NULL COMMENT '헬스 프로그램 모집 파일 사이즈',
  PRIMARY KEY (`recruitment_attached_file_no`),
  KEY `FK_recruitment_attached_file_health_program_recruitment` (`healthprogram_recruitment_no`),
  CONSTRAINT `FK_recruitment_attached_file_health_program_recruitment` FOREIGN KEY (`healthprogram_recruitment_no`) REFERENCES `health_program_recruitment` (`health_program_recruitment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='헬스 프로그램 모집 첨부 파일\r\n\r\n\r\n';

-- 테이블 데이터 gusgmlans.recruitment_attached_file:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `recruitment_attached_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `recruitment_attached_file` ENABLE KEYS */;

-- 테이블 gusgmlans.tb_goods 구조 내보내기
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

-- 테이블 데이터 gusgmlans.tb_goods:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_goods` DISABLE KEYS */;
INSERT INTO `tb_goods` (`g_code`, `u_id`, `g_name`, `g_cate`, `g_price`, `g_color`, `g_size`, `g_date`, `g_desc`) VALUES
	('goods_1', 'id001', '상품명1', '카테고리1', '가격1', '색상1', '사이즈1', '2018-10-21 19:29:59', '상세설명1'),
	('goods_2', 'id001', '상품명2', '카테고리2', '가격2', '색상2', '사이즈2', '2018-10-21 19:31:16', '상세설명2'),
	('goods_3', 'id001', '상품명3', '카테고리3', '가격3', '색상3', '사이즈3', '2018-10-21 19:31:49', '상세설명3');
/*!40000 ALTER TABLE `tb_goods` ENABLE KEYS */;

-- 테이블 gusgmlans.tb_user 구조 내보내기
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

-- 테이블 데이터 gusgmlans.tb_user:~3 rows (대략적) 내보내기
/*!40000 ALTER TABLE `tb_user` DISABLE KEYS */;
INSERT INTO `tb_user` (`u_id`, `u_pw`, `u_level`, `u_name`, `u_email`, `u_phone`, `u_addr`) VALUES
	('id001', 'pw001', '관리자', '이름1', '이메일1', '전화번호1', '주소1'),
	('id002', 'pw002', '판매자', '이름2', '이메일2', '전화번호2', '주소2'),
	('id003', 'pw003', '구매자', '이름3', '이메일3', '전화번호3', '주소3');
/*!40000 ALTER TABLE `tb_user` ENABLE KEYS */;

-- 테이블 gusgmlans.trainer 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer` (
  `trainer_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '트레이너 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `trainer_id` varchar(20) NOT NULL COMMENT '트레이너 아이디',
  `trainer_pw` varchar(20) NOT NULL COMMENT '트레이너 비밀번호',
  `trainer_name` varchar(20) NOT NULL COMMENT '트레이너 이름',
  `trainer_gender` varchar(5) NOT NULL COMMENT '트레이너 성별',
  `trainer_address` varchar(50) NOT NULL COMMENT '트레이너 주소',
  `trainer_phone` varchar(15) NOT NULL COMMENT '트레이너 전화번호',
  `trainer_birthday` date NOT NULL COMMENT '트레이너 생년월일',
  `trainer_email` varchar(50) NOT NULL COMMENT '트레이너 이메일',
  `trainer_entrydate` date NOT NULL COMMENT '트레이너 입사일',
  `trainer_joindate` date NOT NULL COMMENT '트레이너 등록날짜',
  PRIMARY KEY (`trainer_no`),
  KEY `FK_trainer_healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_trainer_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='트레이너 관리			\r\n';

-- 테이블 데이터 gusgmlans.trainer:~4 rows (대략적) 내보내기
/*!40000 ALTER TABLE `trainer` DISABLE KEYS */;
INSERT INTO `trainer` (`trainer_no`, `healthclubs_no`, `trainer_id`, `trainer_pw`, `trainer_name`, `trainer_gender`, `trainer_address`, `trainer_phone`, `trainer_birthday`, `trainer_email`, `trainer_entrydate`, `trainer_joindate`) VALUES
	(1, 1, 'id001', 'pw001', '현희문', '남', '서울특별시', '010-1111-1111', '1993-07-31', 'example1@naver.com', '2018-10-22', '2018-10-22'),
	(2, 2, 'id002', 'pw002', '현희문', '남', '전라북도', '010-2222-2222', '1993-07-31', 'example2@naver.com', '2018-10-22', '2018-10-22'),
	(3, 3, 'id003', 'pw003', '현희문', '남', '광주광역시', '010-3333-3333', '1993-07-31', 'example3@naver.com', '2018-10-22', '2018-10-22'),
	(4, 4, 'id004', 'pw004', '현희문', '남', '대전광역시', '010-4444-4444', '1993-07-31', 'example4@naver.com', '2018-10-22', '2018-10-22');
/*!40000 ALTER TABLE `trainer` ENABLE KEYS */;

-- 테이블 gusgmlans.trainer_attendance 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer_attendance` (
  `trainer_attendance_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '트레이너 근태 직권 입력 번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  `absenteesism_type` varchar(50) NOT NULL COMMENT '결근 유형',
  `absenteesism_reason` varchar(50) NOT NULL COMMENT '신청 사유',
  `absenteesism_start` date NOT NULL COMMENT '시작일',
  `absenteesism_end` date NOT NULL COMMENT '종료일',
  `apply_date` date NOT NULL COMMENT '신청 날짜',
  `approve_date` date NOT NULL COMMENT '승인날짜',
  PRIMARY KEY (`trainer_attendance_no`),
  KEY `FK_trainer_attendance_healthclubs` (`healthclubs_no`),
  KEY `FK_trainer_attendance_trainer` (`trainer_no`),
  CONSTRAINT `FK_trainer_attendance_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_trainer_attendance_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='트레이너 근태 직권 입력 관리			\r\n';

-- 테이블 데이터 gusgmlans.trainer_attendance:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `trainer_attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_attendance` ENABLE KEYS */;

-- 테이블 gusgmlans.trainer_work 구조 내보내기
CREATE TABLE IF NOT EXISTS `trainer_work` (
  `trainer_work_no` int(10) NOT NULL AUTO_INCREMENT COMMENT '트레이너 출퇴근 관리번호',
  `healthclubs_no` int(10) NOT NULL COMMENT '헬스장 번호',
  `trainer_no` int(10) NOT NULL COMMENT '트레이너 번호',
  `trainer_work_start` time NOT NULL COMMENT '트레이너 출근시간',
  `trainer_work_end` time NOT NULL COMMENT '트레이너 퇴근시간',
  `trainer_work_date` date NOT NULL COMMENT '트레이너 출퇴근 날짜',
  PRIMARY KEY (`trainer_work_no`),
  KEY `FK_trainer_work_healthclubs` (`healthclubs_no`),
  KEY `FK_trainer_work_trainer` (`trainer_no`),
  CONSTRAINT `FK_trainer_work_healthclubs` FOREIGN KEY (`healthclubs_no`) REFERENCES `healthclubs` (`healthclubs_no`),
  CONSTRAINT `FK_trainer_work_trainer` FOREIGN KEY (`trainer_no`) REFERENCES `trainer` (`trainer_no`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='트레이너 출퇴근 관리			\r\n';

-- 테이블 데이터 gusgmlans.trainer_work:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `trainer_work` DISABLE KEYS */;
/*!40000 ALTER TABLE `trainer_work` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
