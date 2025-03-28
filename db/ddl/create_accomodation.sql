/**
  * 宿泊地テーブル
  */
CREATE TABLE `accommodation` (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `plan_id` BIGINT NOT NULL,
  `name` VARCHAR(100),
  `address` TEXT,
  `url` varchar(255),
  `check_in` DATETIME,
  `check_out` DATETIME
);

ALTER TABLE `accommodation` ADD FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`);