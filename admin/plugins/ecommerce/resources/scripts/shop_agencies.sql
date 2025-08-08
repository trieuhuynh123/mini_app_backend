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

CREATE TABLE IF NOT EXISTS ecommerce_shop_agencies (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `tier` int unsigned NOT NULL DEFAULT 0,
    `agency_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'AGENCY',
    `agency_code` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `display_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `shop_id` bigint unsigned NOT NULL,
    `manager_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `manager_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `email` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `country_id` bigint unsigned NOT NULL DEFAULT 0,
    `province_id` bigint unsigned NOT NULL DEFAULT 0,
    `district_id` bigint unsigned NOT NULL DEFAULT 0,
    `ward_id` bigint unsigned NOT NULL DEFAULT 0,
    `detailed_address` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_id` (`id`, `shop_id`),
    INDEX `index_tier` (`tier`),
    INDEX `index_agency_type` (`agency_type`),
    INDEX `index_agency_code` (`agency_code`),
    INDEX `index_display_name` (`display_name`),
    INDEX `index_id_status` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_agency_members (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `agency_id` bigint unsigned NOT NULL,
    `member_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `member_id` bigint unsigned NOT NULL,
    `added_by_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `added_by_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `added_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_agency_id_member` (`agency_id`, `member_type`, `member_id`),
    INDEX `index_warehouse_id` (`agency_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
