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

ALTER TABLE ecommerce_shop_warehouses
ADD INDEX `index_shop_id_status_id` (`shop_id`, `status`, `id`),
ADD INDEX `index_status_id` (`status`, `id`);

ALTER TABLE ecommerce_delivery_orders DROP INDEX index_order_code;
ALTER TABLE ecommerce_delivery_orders DROP INDEX index_order_code_id;
ALTER TABLE ecommerce_delivery_orders DROP INDEX index_delivery_order_type;
ALTER TABLE ecommerce_delivery_orders DROP INDEX index_status;
ALTER TABLE ecommerce_delivery_orders DROP INDEX index_created_at;

ALTER TABLE ecommerce_delivery_order_histories DROP INDEX index_delivery_order_id;

ALTER TABLE ecommerce_order_recipients DROP INDEX index_customer_code;

ALTER TABLE ecommerce_shop_warehouses DROP INDEX index_shop_id;
ALTER TABLE ecommerce_shop_warehouses DROP INDEX index_id_status;

ALTER TABLE ecommerce_shop_warehouse_products DROP INDEX index_warehouse_id;

ALTER TABLE ecommerce_delivery_orders DROP INDEX index_parent_id;
