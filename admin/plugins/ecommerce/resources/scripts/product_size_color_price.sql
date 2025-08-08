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

CREATE TABLE IF NOT EXISTS `ecommerce_product_size_color_prices` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL,
    `size_id` bigint unsigned NOT NULL DEFAULT 0,
    `color_id` bigint unsigned NOT NULL DEFAULT 0,
    `material_id` bigint unsigned NOT NULL DEFAULT 0,
    `currency_id` bigint unsigned NOT NULL,
    `original_price` char(85) COLLATE utf8mb4_unicode_520_ci,
    `price` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_amount` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_percent` decimal(10,2) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_product_size_color_material_currency_id` (`product_id`, `size_id`, `color_id`, `material_id`, `currency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
