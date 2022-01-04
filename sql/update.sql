INSERT INTO `config` (`name`, `value`) VALUES
('enable_token188', 0),
('token188_key', ''),
('token188_mchid', ''),
('token188_url', 'https://api.token188.com/utg/pay/address'),
('token188_callback', ''),
('token188_currency_code', 'CNY');

ALTER TABLE `servers` CHANGE `tfo` `sni` LONGTEXT NULL DEFAULT NULL;
ALTER TABLE `alive_ip` ADD `username` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `login_ip` ADD `username` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `user_traffic_log` ADD `username` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `rule_log` ADD `username` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `orders` ADD `email` VARCHAR(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL;
ALTER TABLE `login_ip` CHANGE `type` `type` VARCHAR(11) NULL DEFAULT NULL;
ALTER TABLE `coupon` CHANGE `usage_no` `usage_no` INT(20) NULL DEFAULT '0';

CREATE TABLE `faqs` (
  `id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `question` varchar(250) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `faqs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`);

ALTER TABLE `faqs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

