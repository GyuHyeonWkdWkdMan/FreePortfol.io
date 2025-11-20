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