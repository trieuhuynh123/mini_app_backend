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

ALTER TABLE ecommerce_administrative_units
ADD COLUMN `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED' AFTER `display_order`,
ADD INDEX `index_country_id_parent_id_status` (`country_id`, `parent_id`, `status`),
ADD INDEX `index_parent_id_status` (`parent_id`, `status`),
ADD INDEX `index_status` (`status`);

ALTER TABLE ecommerce_administrative_units DROP INDEX `index_country_id_parent_id`;

ALTER TABLE ecommerce_provinces
ADD COLUMN `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED' AFTER `display_name`,
ADD INDEX `index_country_id_status` (`country_id`, `status`),
ADD INDEX `index_status` (`status`);

ALTER TABLE ecommerce_districts
ADD COLUMN `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED' AFTER `display_name`,
ADD INDEX `index_province_id_status` (`province_id`, `status`),
ADD INDEX `index_status` (`status`);

ALTER TABLE ecommerce_districts DROP INDEX `index_province_id`;

ALTER TABLE ecommerce_wards
ADD COLUMN `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED' AFTER `display_name`,
ADD INDEX `index_district_id_status` (`district_id`, `status`),
ADD INDEX `index_status` (`status`);

ALTER TABLE ecommerce_wards DROP INDEX `index_district_id`;
