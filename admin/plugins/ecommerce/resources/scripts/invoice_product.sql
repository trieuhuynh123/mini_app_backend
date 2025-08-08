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

CREATE TABLE IF NOT EXISTS `ecommerce_invoice_products` (
    `product_id` bigint unsigned NOT NULL,
    `item_group` varchar(50) COLLATE utf8mb4_unicode_520_ci,
    `item_type` varchar(50) COLLATE utf8mb4_unicode_520_ci,
    `item_nature` varchar(50) COLLATE utf8mb4_unicode_520_ci,
    `unit` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `tax_percent` decimal(10,2),
    `tax_on_price_type` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`product_id`),
    INDEX `index_item_type` (`item_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
