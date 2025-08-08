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

ALTER TABLE ecommerce_product_size_color_prices
ADD COLUMN `material_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `color_id`,
ADD UNIQUE KEY `key_product_size_color_material_currency_id` (`product_id`, `size_id`, `color_id`, `material_id`, `currency_id`);

ALTER TABLE ecommerce_product_size_color_prices DROP INDEX key_product_size_color_currency_id;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_product_id;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_size_id;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_color_id;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_currency_id;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_original_price;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_price;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_discount_amount;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_discount_percent;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_created_at;
ALTER TABLE ecommerce_product_size_color_prices DROP INDEX index_updated_at;
