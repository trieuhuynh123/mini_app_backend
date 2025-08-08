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

ALTER TABLE ecommerce_order_histories
ADD INDEX `index_order_id_order_status_id` (`order_id`, `order_status`, `id`),
ADD INDEX `index_order_status_created_at_id` (`order_status`, `created_at`, `id`),
ADD INDEX `index_created_at_id` (`created_at`, `id`);

ALTER TABLE ecommerce_order_histories DROP INDEX index_order_id;
ALTER TABLE ecommerce_order_histories DROP INDEX index_order_status;
ALTER TABLE ecommerce_order_histories DROP INDEX index_id_order_status;
ALTER TABLE ecommerce_order_histories DROP INDEX index_id_order_id_order_status;
