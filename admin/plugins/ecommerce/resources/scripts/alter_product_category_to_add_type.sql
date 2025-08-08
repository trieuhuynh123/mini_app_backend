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

ALTER TABLE `ecommerce_product_categories`
ADD COLUMN `category_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'CATEGORY' AFTER `description`,
ADD COLUMN `icon_image_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `category_type`,
ADD COLUMN `banner_image_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `icon_image_id`,
ADD INDEX `index_category_type` (`category_type`),
ADD INDEX `index_category_type_status` (`category_type`, `status`),
CHANGE COLUMN `status` `status` VARCHAR(25) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_520_ci' NOT NULL;
