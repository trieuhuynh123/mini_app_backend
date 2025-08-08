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

CREATE TABLE IF NOT EXISTS `ecommerce_product_sizes` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL DEFAULT 0,
    `size_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `size_display_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    `width_in_millimeter` decimal(10,2) DEFAULT NULL,
    `height_in_millimeter` decimal(10,2) DEFAULT NULL,
    `length_in_millimeter` decimal(10,2) DEFAULT NULL,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `sold_amount` bigint unsigned NOT NULL DEFAULT 0,
    `limited` tinyint NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_product_id_size_name` (`product_id`, `size_name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_amount` (`amount`),
    INDEX `index_sold_amount` (`sold_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
