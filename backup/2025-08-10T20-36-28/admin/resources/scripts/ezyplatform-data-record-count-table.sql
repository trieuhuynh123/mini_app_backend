/*
 * Copyright 2022 youngmonkeys.org
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

CREATE TABLE IF NOT EXISTS `ezy_data_record_counts` (
    `data_type` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `record_count` bigint unsigned NOT NULL,
    `last_record_id` bigint unsigned NOT NULL,
    `last_counted_at` datetime NOT NULL,
    PRIMARY KEY (`data_type`),
    INDEX `index_data_type_last_counted_at` (`data_type`, `last_counted_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
