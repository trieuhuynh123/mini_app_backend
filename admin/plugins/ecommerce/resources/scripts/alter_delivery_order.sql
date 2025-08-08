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
ADD COLUMN `shipping_fee_payer` varchar(25) COLLATE utf8mb4_unicode_520_ci DEFAULT 'SENDER' AFTER `cod_amount`,
ADD INDEX `index_shipping_fee_payer` (`shipping_fee_payer`);

ALTER TABLE ecommerce_order_recipients
ADD COLUMN `delivery_option` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT 'HOME_DELIVERY' AFTER `email`,
MODIFY COLUMN `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
ADD INDEX `index_delivery_option` (`delivery_option`);

ALTER TABLE ecommerce_order_histories
ADD COLUMN `notes` mediumtext COLLATE utf8mb4_unicode_520_ci AFTER `order_status`,
ADD INDEX `index_order_id_status` (`id`, `order_status`);
