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

CREATE TABLE IF NOT EXISTS `ecommerce_user_order_statuses` (
    `user_id` bigint unsigned NOT NULL,
    `order_status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `first_order_id` bigint unsigned NOT NULL,
    `last_order_id` bigint unsigned NOT NULL,
    `first_order_history_id` bigint unsigned NOT NULL,
    `last_order_history_id` bigint unsigned NOT NULL,
    `first_created_at` datetime NOT NULL,
    `last_updated_at` datetime NOT NULL,
    PRIMARY KEY (`user_id`, `order_status`),
    INDEX `index_pagination` (`order_status`, `last_updated_at`, `user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
