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

CREATE TABLE IF NOT EXISTS `ecommerce_shop_product_colors` (
    `shop_id` bigint unsigned NOT NULL,
    `color_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `color_display_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `color_code` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    PRIMARY KEY (`shop_id`, `color_name`),
    INDEX `index_color_name` (`color_name`),
    INDEX `index_color_display_name` (`color_display_name`),
    INDEX `index_color_code` (`color_code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
