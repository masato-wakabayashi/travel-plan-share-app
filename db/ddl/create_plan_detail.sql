/**
  * 旅行計画詳細テーブル
  */

CREATE TABLE `plan_detail` (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `plan_id` BIGINT NOT NULL,
  `date` DATE,
  `time` TIME,
  `location` VARCHAR(100),
  `category` VARCHAR(50),
  `amount` DECIMAL(10,2),
  `memo` TEXT
);

ALTER TABLE `plan_detail` ADD FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`);