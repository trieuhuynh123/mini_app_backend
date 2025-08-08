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

CREATE TABLE IF NOT EXISTS `ecommerce_product_bonuses` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL DEFAULT 0,
    `bonus_type` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'NOTHING',
    `bonus_item_type` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `bonus_item_id` bigint unsigned NOT NULL DEFAULT 0,
    `bonus_item_quantity` bigint unsigned NOT NULL DEFAULT 0,
    `bonus_item_color_id` bigint unsigned NOT NULL DEFAULT 0,
    `bonus_item_size_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    INDEX `index_pagination` (`product_id`, `bonus_type`, `bonus_item_type`, `display_order`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_order_product_children` (
    `order_product_id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `child_product_id` bigint unsigned NOT NULL,
    `product_color_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_size_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_material_id` bigint unsigned NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `price` char(85) COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`order_product_id`, `child_product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_agency_products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `agency_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `added_by_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `added_by_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `remaining_amount` bigint unsigned NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_agency_id_product_id` (`agency_id`, `product_id`),
    INDEX `index_product_id` (`product_id`),
    INDEX `index_remaining_amount` (`remaining_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

