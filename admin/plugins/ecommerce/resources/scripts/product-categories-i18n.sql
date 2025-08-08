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

CREATE TABLE IF NOT EXISTS `ecommerce_product_categories_i18n` (
    `category_id` bigint unsigned NOT NULL,
    `language` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_name` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`category_id`, `language`),
    INDEX index_category_id (`category_id`),
    INDEX index_language (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
