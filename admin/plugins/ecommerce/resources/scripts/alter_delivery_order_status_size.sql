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

ALTER TABLE ecommerce_delivery_orders
MODIFY COLUMN status varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
ADD INDEX `index_order_code_id` (`order_code`, `id`),
ADD INDEX `index_order_code_status_id` (`order_code`, `status`, `id`);

ALTER TABLE ecommerce_delivery_order_histories
MODIFY COLUMN status varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL;

ALTER TABLE ecommerce_orders
MODIFY COLUMN status varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL;

ALTER TABLE ecommerce_product_packages
MODIFY COLUMN status varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL;

ALTER TABLE ecommerce_order_recipients
ADD INDEX `index_customer_code_order_id` (`customer_code`, `order_id`);
