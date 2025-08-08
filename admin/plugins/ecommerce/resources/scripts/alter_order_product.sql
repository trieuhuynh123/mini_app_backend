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

ALTER TABLE `ecommerce_order_products`
ADD COLUMN `discount_amount` char(85) COLLATE utf8mb4_unicode_520_ci AFTER `price`,
ADD COLUMN `discount_percent` decimal(10,2) AFTER `discount_amount`,
ADD COLUMN `tax_percent` decimal(10,2) AFTER `discount_percent`;
