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

CREATE TABLE IF NOT EXISTS `ecommerce_order_histories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_id` bigint unsigned NOT NULL,
    `order_status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_order_id_order_status_id` (`order_id`, `order_status`, `id`),
    INDEX `index_order_status_created_at_id` (`order_status`, `created_at`, `id`),
    INDEX `index_created_at_id` (`created_at`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_sellers` (
    `shop_id` bigint unsigned NOT NULL,
    `user_id` bigint unsigned NOT NULL,
    `commission_percent` decimal(10,2),
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`shop_id`, `user_id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_commission_percent` (`commission_percent`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_seller_commission_histories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL DEFAULT 0,
    `user_id` bigint unsigned NOT NULL DEFAULT 0,
    `order_id` bigint unsigned NOT NULL DEFAULT 0,
    `order_history_id` bigint unsigned NOT NULL DEFAULT 0,
    `voucher_id` bigint unsigned NOT NULL DEFAULT 0,
    `commission_percent` decimal(10,2) NOT NULL,
    `currency_id` bigint unsigned NOT NULL DEFAULT 0,
    `commission_amount` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `order_status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `from_source_id` bigint unsigned NOT NULL DEFAULT 0,
    `from_source_type` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ecommerce_vouchers',
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `issue_date` datetime NOT NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_order_id_id` (`order_id`, `id`),
    INDEX `index_voucher_id` (`voucher_id`),
    INDEX `index_currency_id` (`currency_id`),
    INDEX `index_order_status` (`order_status`),
    INDEX `index_from_source_type_user_id_order_id_id` (`from_source_type`, `user_id`, `order_id`, `id`),
    INDEX `index_from_source_type_id_id` (`from_source_type`, `from_source_id`, `id`),
    INDEX `index_issue_date` (`issue_date`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_shop_user_currency_issue_date_id` (`shop_id`, `user_id`, `currency_id`, `issue_date`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_seller_monthly_commissions` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL DEFAULT 0,
    `user_id` bigint unsigned NOT NULL DEFAULT 0,
    `year` int unsigned NOT NULL,
    `month` int unsigned NOT NULL,
    `currency_id` bigint unsigned NOT NULL DEFAULT 0,
    `total_commission` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE key_shop_user_year_month_currency (`shop_id`, `user_id`, `year`, `month`, `currency_id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_year` (`year`),
    INDEX `index_month` (`month`),
    INDEX `index_currency_id` (`currency_id`),
    INDEX `index_total_commission` (`total_commission`),
    INDEX `index_shop_id_user_id_year` (`shop_id`, `user_id`, `year`),
    INDEX `index_shop_id_user_id_year_currency_id` (`shop_id`, `user_id`, `year`, `currency_id`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
