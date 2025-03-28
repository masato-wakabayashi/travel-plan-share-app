/**
  * 旅行計画のヘッダーテーブル
  */
CREATE TABLE `plan` (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `user_id` BIGINT NOT NULL,
  `title` VARCHAR(100),
  `start_date` DATE,
  `end_date` DATE,
  `visibility` ENUM('public','private') NOT NULL DEFAULT 'private',
  `view_count` INT DEFAULT 0,
  `created_at` DATETIME DEFAULT (CURRENT_TIMESTAMP)
);

ALTER TABLE `plan` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);