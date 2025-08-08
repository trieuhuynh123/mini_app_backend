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

ALTER TABLE `ecommerce_products`
ADD COLUMN `product_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'SINGLE' AFTER `sold_amount`,
ADD COLUMN `parent_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `product_type`,
ADD INDEX `index_product_type` (`product_type`),
ADD INDEX `index_parent_id` (`parent_id`);
