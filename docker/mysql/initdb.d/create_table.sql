ALTER DATABASE portfolio CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci;

CREATE TABLE `user` (
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `username` varchar(255) NOT NULL UNIQUE,
    `password` varchar(255) NOT NULL,
    `name` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by` bigint,
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `modified_by` bigint,
    `permission` bigint, -- 1: root, 2: user
    `is_active` boolean NOT NULL DEFAULT TRUE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `introdution` (
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` varchar(255) NOT NULL,
    `content` TEXT,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by` bigint,
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `modified_by` bigint,
    `is_active` boolean NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `board` (
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `title` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by` bigint,
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `modified_by` bigint,
    `is_active` boolean NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `board_post` (
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `board_id` bigint NOT NULL,
    `title` varchar(255) NOT NULL,
    `content` varchar(255) NOT NULL,
    `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
    `created_by` bigint,
    `modified_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    `modified_by` bigint,
    `is_active` boolean NOT NULL DEFAULT FALSE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci; 

CREATE TABLE `file` (
  `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
  `file_name` varchar(255) NOT NULL,
  `file_path` varchar(255) NOT NULL,
  `file_size` float NOT NULL,
  `extension` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_by` bigint
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `board_file`(
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `board_id` bigint NOT NULL,
    `file_id` bigint NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE `post_file`(
    `id` bigint NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `post_id` bigint NOT NULL,
    `file_id` bigint NOT NULL
)ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

ALTER TABLE `board_post` ADD FOREIGN KEY (`board_id`) REFERENCES `board` (`id`);
ALTER TABLE `board_file` ADD FOREIGN KEY (`board_id`) REFERENCES `board` (`id`);
ALTER TABLE `board_file` ADD FOREIGN KEY (`file_id`) REFERENCES `file`(`id`);
ALTER TABLE `post_file` ADD FOREIGN KEY (`post_id`) REFERENCES `board_post` (`id`);
ALTER TABLE `post_file` ADD FOREIGN KEY (`file_id`) REFERENCES `file`(`id`);