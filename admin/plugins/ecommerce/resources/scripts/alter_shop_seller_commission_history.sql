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

ALTER TABLE `ecommerce_shop_seller_commission_histories`
ADD COLUMN `from_source_type` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ecommerce_vouchers' AFTER `order_status`,
ADD COLUMN `notes` mediumtext COLLATE utf8mb4_unicode_520_ci AFTER `from_source_type`,
ADD COLUMN `issue_date` datetime NOT NULL DEFAULT '2020-01-01 01:01:01' AFTER `notes`,
ADD INDEX `index_from_source_type` (`from_source_type`),
ADD INDEX `index_from_source_type_order_id_id` (`from_source_type`, `order_id`, `id`),
ADD INDEX `index_issue_date` (`issue_date`),
ADD INDEX `index_shop_user_currency_issue_date_id` (`shop_id`, `user_id`, `currency_id`, `issue_date`, `id`);

UPDATE ecommerce_shop_seller_commission_histories
SET issue_date = created_at
WHERE issue_date = '2020-01-01 01:01:01';
