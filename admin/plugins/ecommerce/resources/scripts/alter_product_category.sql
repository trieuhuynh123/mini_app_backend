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

DELETE FROM ecommerce_product_category_parents WHERE parent_id = 0 LIMIT 1000;

ALTER TABLE `ecommerce_product_categories`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `display_name`,
ADD COLUMN `open_category_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `display_order`,
ADD INDEX `index_display_order` (`display_order`),
CHANGE COLUMN `name` `name` VARCHAR(120) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_520_ci' NOT NULL ,
CHANGE COLUMN `display_name` `display_name` VARCHAR(120) CHARACTER SET 'utf8mb4' COLLATE 'utf8mb4_unicode_520_ci' NOT NULL;

ALTER TABLE `ecommerce_product_category_parents`
CHANGE COLUMN `display_order` `display_order` INT NOT NULL DEFAULT '0';

ALTER TABLE `ecommerce_product_category_products`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `product_id`,
ADD INDEX `index_display_order` (`display_order`),
ADD INDEX `index_category_id_display_order` (`category_id`, `display_order`);

ALTER TABLE `ecommerce_product_tags`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `name`,
ADD INDEX `index_display_order` (`display_order`);

ALTER TABLE `ecommerce_product_tag_products`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `product_id`,
ADD INDEX `index_display_order` (`display_order`),
ADD INDEX `index_tag_id_display_order` (`tag_id`, `display_order`);

ALTER TABLE `ecommerce_product_color_medias`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `media_id`,
ADD INDEX `index_display_order` (`display_order`);

ALTER TABLE `ecommerce_product_colors`
ADD COLUMN `display_order` int NOT NULL DEFAULT 0 AFTER `color_code`,
ADD COLUMN `amount` bigint unsigned NOT NULL DEFAULT 0 AFTER `display_order`,
ADD COLUMN `sold_amount` bigint unsigned NOT NULL DEFAULT 0 AFTER `amount`,
ADD COLUMN `limited` tinyint NOT NULL DEFAULT 0,
ADD INDEX `index_display_order` (`display_order`),
ADD INDEX `index_amount` (`amount`),
ADD INDEX `index_sold_amount` (`sold_amount`);

ALTER TABLE `ecommerce_products`
ADD COLUMN `secondary_code` varchar(120) COLLATE utf8mb4_unicode_520_ci AFTER `product_code`,
ADD INDEX `index_secondary_code` (`secondary_code`);

ALTER TABLE `ecommerce_order_products`
ADD COLUMN `product_color_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `product_id`,
ADD COLUMN `product_size_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `product_color_id`,
DROP INDEX `key_order_id`,
ADD UNIQUE KEY `key_order_product` (`order_id`, `product_id`, `product_color_id`, `product_size_id`);

ALTER TABLE `ecommerce_shopping_cart_products`
ADD COLUMN `product_color_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `product_id`,
ADD COLUMN `product_size_id` bigint unsigned NOT NULL DEFAULT 0 AFTER `product_color_id`,
DROP INDEX `key_shopping_cart_product_id`,
ADD UNIQUE KEY `key_shopping_cart_product` (`shopping_cart_id`, `product_id`, `product_color_id`, `product_size_id`);
