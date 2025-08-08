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

CREATE TABLE IF NOT EXISTS `ecommerce_product_books` (
    `product_id` bigint unsigned NOT NULL,
    `author` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `author_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `author_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `book_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `pages` int unsigned NOT NULL,
    `cover_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `affiliate` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `preview_link` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `distribution_company` varchar(250) COLLATE utf8mb4_unicode_520_ci,
    `publisher` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `released_at` datetime,
    PRIMARY KEY (`product_id`),
    INDEX `index_author_user_id` (`author_user_id`),
    INDEX `index_book_type` (`book_type`),
    INDEX `index_cover_type` (`cover_type`),
    INDEX `index_released_at` (`released_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_category_parents` (
    `category_id` bigint unsigned NOT NULL,
    `parent_id` bigint unsigned NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`category_id`, `parent_id`),
    INDEX `index_display_order` (`display_order`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_colors` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL DEFAULT 0,
    `color_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `color_display_name` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `color_code` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `sold_amount` bigint unsigned NOT NULL DEFAULT 0,
    `limited` tinyint NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_product_id_color_name` (`product_id`, `color_name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_amount` (`amount`),
    INDEX `index_sold_amount` (`sold_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_color_medias` (
    `product_color_id` bigint unsigned NOT NULL DEFAULT 0,
    `media_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`product_color_id`, `media_id`),
    INDEX `index_pagination` (`product_color_id`, `display_order`, `media_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_descriptions` (
    `product_id` bigint unsigned NOT NULL,
    `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `content_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'HTML',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`product_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_descriptions_i18n` (
    `product_id` bigint unsigned NOT NULL,
    `language` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `product_name` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`product_id`, `language`),
    INDEX index_product_id (`product_id`),
    INDEX index_language (`language`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
