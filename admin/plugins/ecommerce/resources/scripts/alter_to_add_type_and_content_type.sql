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

ALTER TABLE `ecommerce_product_descriptions`
ADD COLUMN `content_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'HTML' AFTER `description`;

ALTER TABLE `ecommerce_product_categories`
ADD COLUMN `description_content_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'HTML' AFTER `description`;

ALTER TABLE `ecommerce_shop_agencies`
ADD COLUMN `agency_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'AGENCY' AFTER `tier`,
ADD INDEX `index_agency_type` (`agency_type`),
ADD INDEX `index_agency_code` (`agency_code`);

ALTER TABLE `ecommerce_countries`
ADD COLUMN `dialing_code` varchar(5) COLLATE utf8mb4_unicode_520_ci AFTER `international_name`,
ADD COLUMN `currency_iso_code` varchar(12) COLLATE utf8mb4_unicode_520_ci AFTER `dialing_code`,
ADD COLUMN `capital_name` varchar(12) COLLATE utf8mb4_unicode_520_ci AFTER `currency_iso_code`,
ADD UNIQUE KEY `key_dialing_code` (`dialing_code`);

ALTER TABLE `ecommerce_order_recipients`
ADD COLUMN `shipping_type` varchar(25) COLLATE utf8mb4_unicode_520_ci DEFAULT 'FREE' AFTER `free_shipping`,
ADD COLUMN `first_name` varchar(64) COLLATE utf8mb4_unicode_520_ci AFTER `full_name`,
ADD COLUMN `last_name` varchar(64) COLLATE utf8mb4_unicode_520_ci AFTER `first_name`,
ADD COLUMN `city_name` varchar(200) COLLATE utf8mb4_unicode_520_ci AFTER `ward_id`,
ADD COLUMN `postal_code` varchar(32) COLLATE utf8mb4_unicode_520_ci AFTER `city_name`,
ADD COLUMN `send_order_updates` tinyint NOT NULL DEFAULT 0 AFTER `detailed_address`,
ADD COLUMN `send_live_tracking` tinyint NOT NULL DEFAULT 0 AFTER `send_order_updates`,
ADD COLUMN `save_delivery_information` tinyint NOT NULL DEFAULT 1 AFTER `send_live_tracking`,
ADD COLUMN `send_news` tinyint NOT NULL DEFAULT 0 AFTER `save_delivery_information`,
ADD COLUMN `send_offers` tinyint NOT NULL DEFAULT 0 AFTER `send_news`;
