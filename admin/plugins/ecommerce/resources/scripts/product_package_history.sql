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

CREATE TABLE IF NOT EXISTS ecommerce_product_package_histories (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `package_id` bigint unsigned NOT NULL,
    `warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_package_id` (`package_id`),
    INDEX `index_status` (`status`),
    INDEX `index_package_id_status` (`id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
