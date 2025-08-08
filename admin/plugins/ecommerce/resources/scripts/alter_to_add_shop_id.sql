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

ALTER TABLE `ecommerce_product_categories`
ADD COLUMN `shop_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `id`,
DROP INDEX `key_name`,
DROP INDEX `key_display_name`,
ADD UNIQUE KEY `key_shop_name` (`shop_id`, `name`),
ADD UNIQUE KEY `key_shop_display_name` (`shop_id`, `display_name`);

ALTER TABLE `ecommerce_exchange_rates`
ADD COLUMN `shop_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `id`,
DROP INDEX `key_from_to_currency_id`,
ADD UNIQUE KEY key_shop_from_to_currency_id (`shop_id`, `from_currency_id`, `to_currency_id`);
