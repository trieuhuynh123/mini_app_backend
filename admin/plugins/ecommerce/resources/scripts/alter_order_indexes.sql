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

ALTER TABLE `ecommerce_orders`
ADD INDEX `index_creator_user_id_status_approved_at_id` (`creator_user_id`, `status`, `approved_at`, `id`);

ALTER TABLE `ecommerce_orders` DROP INDEX `index_creator_user_id`;
ALTER TABLE `ecommerce_orders` DROP INDEX `index_status`;
ALTER TABLE `ecommerce_orders` DROP INDEX `index_approved_at`;
ALTER TABLE `ecommerce_orders` DROP INDEX `index_updated_at`;
