/*
 * Copyright 2025 youngmonkeys.org
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

CREATE TABLE IF NOT EXISTS `ecommerce_shop_tax_settings` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL,
    `country_id` bigint unsigned NOT NULL,
    `currency_id` bigint unsigned NOT NULL,
    `product_category_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `tax_percent` decimal(10,2),
    `payer` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `creator_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `creator_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_all` (`shop_id`, `country_id`, `currency_id`, `product_category_id`, `product_id`),
    INDEX `index_tax_percent` (`tax_percent`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_tax_setting_histories` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_tax_setting_id` bigint unsigned NOT NULL,
    `tax_percent` decimal(10,2),
    `payer` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `by_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `by_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_tax_setting_id` (`shop_tax_setting_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
