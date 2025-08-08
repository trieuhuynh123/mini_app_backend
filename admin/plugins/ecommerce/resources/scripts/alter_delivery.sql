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

ALTER TABLE `ecommerce_delivery_orders`
ADD COLUMN `order_code` varchar(120) COLLATE utf8mb4_unicode_520_ci AFTER `order_id`,
ADD INDEX `index_order_code` (`order_code`);

ALTER TABLE `ecommerce_order_recipients`
ADD COLUMN `customer_code` varchar(64) COLLATE utf8mb4_unicode_520_ci AFTER `free_shipping`,
ADD INDEX `index_customer_code` (`customer_code`);

ALTER TABLE `ecommerce_shop_bank_accounts`
ADD INDEX `index_display_order` (`display_order`);
