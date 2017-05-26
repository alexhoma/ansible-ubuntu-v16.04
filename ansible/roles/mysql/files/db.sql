CREATE DATABASE IF NOT EXISTS `mpwar_performance_blog`;

USE mpwar_performance_blog;

CREATE TABLE IF NOT EXISTS `authors`
(
	`id` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`username` VARCHAR(255) NOT NULL,
	`password` VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS `articles`
(
	`id` INT(10) PRIMARY KEY AUTO_INCREMENT,
	`title` VARCHAR(255) NOT NULL,
	`author_id` INT(10) NOT NULL,
	`content` TEXT NOT NULL,
	`tags` VARCHAR(255),
	`created_at` INT(10) NOT NULL,
	FOREIGN KEY (author_id)
        REFERENCES authors(id)
        ON DELETE CASCADE
);