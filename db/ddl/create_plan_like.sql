/**
  * 旅行計画の「いいね」を管理するテーブル
  */
CREATE TABLE `plan_like` (
  `id` BIGINT PRIMARY KEY AUTO_INCREMENT,
  `plan_id` BIGINT NOT NULL,
  `user_id` BIGINT NOT NULL,
  `liked_at` DATETIME
);

ALTER TABLE `plan_like` ADD FOREIGN KEY (`plan_id`) REFERENCES `plan` (`id`);

ALTER TABLE `plan_like` ADD FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
