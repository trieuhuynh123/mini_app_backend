/*
 * Copyright 2024 youngmonkeys.org
 * 
 * Licensed under the ezyplatform, Version 1.0.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 * 
 *     https://youngmonkeys.org/licenses/ezyplatform-1.0.0.txt
 * 
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
*/

CREATE TABLE IF NOT EXISTS `ecommerce_affiliate_tokens` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `affiliate_token` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `category_name` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `shop_id` bigint unsigned NOT NULL,
    `creator_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `creator_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `voucher_id` bigint unsigned NOT NULL DEFAULT 0,
    `limited` tinyint NOT NULL DEFAULT 0,
    `quantity` bigint unsigned NOT NULL DEFAULT 0,
    `quantity_per_user` bigint unsigned NOT NULL DEFAULT 0,
    `for_currency_id` bigint unsigned NOT NULL DEFAULT 0,
    `commission_percent` decimal(10,2),
    `commission_amount` char(85) COLLATE utf8mb4_unicode_520_ci,
    `affiliate_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `affiliate_token_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'COMMISSION',
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    `valid_from` datetime,
    `expired_at` datetime,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_affiliate_token` (`affiliate_token`),
    INDEX `index_category_name` (`category_name`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_shop_id_affiliate_token` (`shop_id`, `affiliate_token`),
    INDEX `index_voucher_id` (`voucher_id`),
    INDEX `index_for_currency_id` (`for_currency_id`),
    INDEX `index_affiliate_user_id` (`affiliate_user_id`),
    INDEX `index_affiliate_token_type` (`affiliate_token_type`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_valid_from` (`valid_from`),
    INDEX `index_expired_at` (`expired_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_affiliate_token_targets` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `affiliate_token_id` bigint unsigned NOT NULL,
    `for_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `for_product_id` bigint unsigned NOT NULL DEFAULT 0,
    `for_product_category_id` bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_all` (`affiliate_token_id`, `for_user_id`, `for_product_id`, `for_product_category_id`),
    INDEX `index_affiliate_token_id` (`affiliate_token_id`),
    INDEX `index_for_user_id` (`for_user_id`),
    INDEX `index_for_product_category_id` (`for_product_category_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_affiliate_token_usages` (
    `affiliate_token_id` bigint unsigned NOT NULL,
    `used_quantity` bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`affiliate_token_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_affiliate_token_user_usages` (
    `affiliate_token_id` bigint unsigned NOT NULL,
    `user_id` bigint unsigned NOT NULL,
    `used_quantity` bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`affiliate_token_id`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_affiliate_token_usage_histories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `affiliate_token_id` bigint unsigned NOT NULL,
    `user_id` bigint unsigned NOT NULL,
    `order_id` bigint unsigned NOT NULL,
    `quantity` bigint unsigned NOT NULL DEFAULT 0,
    `discount_amount` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `used_quantity` bigint unsigned NOT NULL DEFAULT 0,
    `user_used_quantity` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_affiliate_token_id` (`affiliate_token_id`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_order_id` (`order_id`),
    INDEX `index_status` (`status`),
    INDEX `index_affiliate_token_user_order_status_id` (`affiliate_token_id`, `user_id`, `order_id`, `status`, `id`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
