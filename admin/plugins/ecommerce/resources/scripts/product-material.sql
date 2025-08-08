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

CREATE TABLE IF NOT EXISTS `ecommerce_product_materials` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL DEFAULT 0,
    `material_name` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `material_display_name` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `icon_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `sold_amount` bigint unsigned NOT NULL DEFAULT 0,
    `limited` tinyint NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_product_id_material_name` (`product_id`, `material_name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_amount` (`amount`),
    INDEX `index_sold_amount` (`sold_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_product_materials` (
    `shop_id` bigint unsigned NOT NULL,
    `material_name` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `material_display_name` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `icon_image_id` bigint unsigned NOT NULL DEFAULT 0,
    PRIMARY KEY (`shop_id`, `material_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_material_medias` (
    `product_material_id` bigint unsigned NOT NULL DEFAULT 0,
    `media_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`product_material_id`, `media_id`),
    INDEX `index_pagination` (`product_material_id`, `display_order`, `media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
