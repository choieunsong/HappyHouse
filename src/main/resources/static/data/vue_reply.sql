CREATE SCHEMA IF NOT EXISTS `happyhouse` DEFAULT CHARACTER SET utf8 ;
USE `happyhouse` ;

-- -----------------------------------------------------
-- Table `ssafyweb`.`ssafy_member`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `happyhouse`.`vue_reply` ;

CREATE TABLE IF NOT EXISTS `happyhouse`.`vue_reply` (
  `no` INT NOT NULL AUTO_INCREMENT,
  `bno` INT NOT NULL,
  `writer` VARCHAR(20) NOT NULL,
  `content` VARCHAR(200) NOT NULL,
  `writetime` TIMESTAMP NULL DEFAULT current_timestamp,
	PRIMARY KEY(`no`),	
	FOREIGN KEY(bno) references vue_board(no)
    on delete cascade
  )
ENGINE = InnoDB;


INSERT INTO vue_reply (no, bno, writer, content)
values(1, 1, 'eunsong', 'reply');

