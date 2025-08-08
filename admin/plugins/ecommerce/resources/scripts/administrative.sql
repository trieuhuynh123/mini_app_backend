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

CREATE TABLE IF NOT EXISTS ecommerce_administrative_units (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_id` bigint unsigned NOT NULL DEFAULT 0,
    `parent_id` bigint unsigned NOT NULL DEFAULT 0,
    `unit_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `unit_code` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `local_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `international_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `display_order` int NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_country_id_parent_id_unit_type` (`country_id`, `parent_id`, `unit_type`),
    INDEX `index_country_id_parent_id_unit_type_display_order` (`country_id`, `parent_id`, `unit_type`, `display_order`),
    INDEX `index_country_id_parent_id_unit_code` (`country_id`, `parent_id`, `unit_code`),
    INDEX `index_country_id_parent_id_local_name` (`country_id`, `parent_id`, `local_name`),
    INDEX `index_country_id_parent_id_international_name` (`country_id`, `parent_id`, `international_name`),
    INDEX `index_country_id_parent_id_status` (`country_id`, `parent_id`, `status`),
    INDEX `index_parent_id_status` (`parent_id`, `status`),
    INDEX `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
