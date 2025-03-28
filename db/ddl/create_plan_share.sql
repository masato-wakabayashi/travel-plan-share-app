/**
  * 旅行計画の公開範囲を管理するテーブル
  */ 
CREATE TABLE `plan_share` (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `plan_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `permission` ENUM('view','edit'),
  `invited_at` DATETIME
);

ALTER TABLE `plan_share` ADD FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`);

ALTER TABLE `plan_share` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);