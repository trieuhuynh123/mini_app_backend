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

ALTER TABLE ecommerce_order_products
ADD COLUMN `product_material_id` bigint unsigned NOT NULL DEFAULT 0 AFTER product_size_id,
ADD UNIQUE KEY `key_order_product_color_size_material` (`order_id`, `product_id`, `product_color_id`, `product_size_id`, `product_material_id`);

ALTER TABLE ecommerce_order_products DROP INDEX key_order_product;
ALTER TABLE ecommerce_order_products DROP INDEX `index_order_id`;
ALTER TABLE ecommerce_order_products DROP INDEX `index_product_id`;
ALTER TABLE ecommerce_order_products DROP INDEX `index_amount`;
ALTER TABLE ecommerce_order_products DROP INDEX `index_price`;
