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

CREATE TABLE IF NOT EXISTS ecommerce_product_packages (
	`id` bigint unsigned NOT NULL AUTO_INCREMENT,
	`creator_admin_id` bigint unsigned NOT NULL DEFAULT 0,
	`creator_user_id` bigint unsigned NOT NULL DEFAULT 0,
	`agency_id` bigint unsigned NOT NULL DEFAULT 0,
	`package_name` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `package_label` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `current_warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
	`number_of_products` bigint unsigned NOT NULL,
    `weight_in_gram` decimal(10,2) DEFAULT NULL,
    `width_in_millimeter` decimal(10,2) DEFAULT NULL,
    `height_in_millimeter` decimal(10,2) DEFAULT NULL,
    `length_in_millimeter` decimal(10,2) DEFAULT NULL,
    `fragile` tinyint NOT NULL DEFAULT 0,
    `luxury` tinyint NOT NULL DEFAULT 0,
    `delivery_required` tinyint NOT NULL DEFAULT 1,
    `document` tinyint NOT NULL DEFAULT 0,
    `liquid` tinyint NOT NULL DEFAULT 0,
    `agricultural` tinyint NOT NULL DEFAULT 0,
    `food` tinyint NOT NULL DEFAULT 0,
    `dried_food` tinyint NOT NULL DEFAULT 0,
    `short_shelf_life` tinyint NOT NULL DEFAULT 0,
    `requiring_proper_orientation` tinyint NOT NULL DEFAULT 0,
    `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime,
    PRIMARY KEY (`id`),
    INDEX `index_creator_admin_id` (`creator_admin_id`),
    INDEX `index_creator_user_id` (`creator_user_id`),
    INDEX `index_agency_id` (`agency_id`),
    INDEX `index_package_name` (`package_name`),
    INDEX `index_package_label` (`package_label`),
    INDEX `index_current_warehouse_id` (`current_warehouse_id`),
    INDEX `index_delivery_required` (`delivery_required`),
    INDEX `index_number_of_products` (`number_of_products`),
    INDEX `index_weight_in_gram` (`weight_in_gram`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_product_package_products (
	`package_id` bigint unsigned NOT NULL,
	`product_id` bigint unsigned NOT NULL,
	`delivery_order_id` bigint unsigned NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`package_id`, `product_id`),
    INDEX `index_package_id` (`package_id`),
    INDEX `index_product_id` (`product_id`),
    INDEX `index_delivery_order_id` (`delivery_order_id`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
