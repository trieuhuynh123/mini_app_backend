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
ADD COLUMN `parent_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `order_id`,
ADD COLUMN `notes` mediumtext COLLATE utf8mb4_unicode_520_ci AFTER `cod_amount`,
ADD INDEX `index_parent_id_delivery_order_type_status_id` (`parent_id`, `delivery_order_type`, `status`, `id`);

ALTER TABLE ecommerce_delivery_order_histories
ADD INDEX `index_status` (`status`),
ADD INDEX `index_delivery_order_id_status` (`delivery_order_id`, `status`);
