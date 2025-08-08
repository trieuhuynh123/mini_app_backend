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

CREATE TABLE IF NOT EXISTS `ecommerce_shop_seller_customers` (
    `shop_id` bigint unsigned NOT NULL,
    `seller_id` bigint unsigned NOT NULL,
    `customer_id` bigint unsigned NOT NULL,
    `commission_percent` decimal(10,2),
    `linked_at` datetime NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`shop_id`, `seller_id`, `customer_id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_seller_id` (`seller_id`),
    INDEX `index_customer_id` (`customer_id`),
    INDEX `index_commission_percent` (`commission_percent`),
    INDEX `index_linked_at` (`linked_at`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_seller_customer_commissions` (
    `shop_id` bigint unsigned NOT NULL,
    `seller_id` bigint unsigned NOT NULL,
    `customer_id` bigint unsigned NOT NULL,
    `from_source_type` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `commission_percent` decimal(10,2),
    `commission_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `calculation_time_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `formula_name` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `start_at` datetime NOT NULL,
    `end_at` datetime,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`shop_id`, `seller_id`, `customer_id`, `from_source_type`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_seller_id` (`seller_id`),
    INDEX `index_customer_id` (`customer_id`),
    INDEX `index_from_source_type` (`from_source_type`),
    INDEX `index_commission_percent` (`commission_percent`),
    INDEX `index_commission_type` (`commission_type`),
    INDEX `index_calculation_time_type` (`calculation_time_type`),
    INDEX `index_formula_name` (`formula_name`),
    INDEX `index_start_at` (`start_at`),
    INDEX `index_end_at` (`end_at`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_user_balance_histories (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_balance_id` bigint unsigned NOT NULL,
    `change_amount` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `remaining_balance` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_user_balance_id` (`user_balance_id`),
    INDEX `index_change_amount` (`change_amount`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
