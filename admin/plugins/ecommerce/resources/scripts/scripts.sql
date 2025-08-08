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

CREATE TABLE IF NOT EXISTS ecommerce_product_currencies (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `iso_code` varchar(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `symbol` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `symbol_position` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'BEFORE_PRICE',
    `display_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `format` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `decimal_length` int NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_iso_code` (`iso_code`),
    UNIQUE KEY `key_display_name` (`display_name`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_product_categories (
	`id` bigint unsigned NOT NULL AUTO_INCREMENT,
	`shop_id` bigint unsigned NOT NULL DEFAULT 0,
    `name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `description` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `description_content_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'HTML',
    `display_order` int NOT NULL DEFAULT 0,
    `open_category_id` bigint unsigned NOT NULL DEFAULT 0,
    `open_url` varchar(250) COLLATE utf8mb4_unicode_520_ci,
    `category_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'CATEGORY',
    `icon_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_shop_name` (`shop_id`, `name`),
    UNIQUE KEY `key_shop_display_name` (`shop_id`, `display_name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_category_type` (`category_type`),
    INDEX `index_status` (`status`),
    INDEX `index_category_type_status` (`category_type`, `status`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_product_tags (
	 `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_name` (`name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_products` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_name` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `product_code` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `secondary_code` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `icon_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `shop_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `sold_amount` bigint unsigned NOT NULL DEFAULT 0,
    `product_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'SINGLE',
    `parent_id` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_product_name` (`product_name`),
    INDEX `index_product_code` (`product_code`),
    INDEX `index_secondary_code` (`secondary_code`),
    INDEX `index_shop_id_display_order_id` (`shop_id`, `display_order`, `id`),
    INDEX `index_amount` (`amount`),
    INDEX `index_sold_amount` (`sold_amount`),
    INDEX `index_product_type` (`product_type`),
    INDEX `index_parent_id_id` (`parent_id`, `id`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`),
    INDEX `index_status_updated_at_id` (`status`, `updated_at`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_meta` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL DEFAULT 0,
    `meta_key` varchar(255) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `meta_value` varchar(500) COLLATE utf8mb4_unicode_520_ci,
    `meta_number_value` bigint NOT NULL default 0,
    `meta_text_value` mediumtext COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`id`),
    INDEX `index_meta_key_value` (`meta_key`, `meta_value`),
    INDEX `index_meta_key_number_value` (`meta_key`, `meta_number_value`),
    INDEX `index_product_id_meta_key_value` (`product_id`, `meta_key`, `meta_value`),
    INDEX `index_product_id_meta_key_number_value` (`product_id`, `meta_key`, `meta_number_value`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_product_prices` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `product_id` bigint unsigned NOT NULL,
    `currency_id` bigint unsigned NOT NULL,
    `original_price` char(85) COLLATE utf8mb4_unicode_520_ci,
    `price` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_amount` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_percent` decimal(10,2) NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_product_currency_id` (`product_id`, `currency_id`),
    INDEX `index_currency_id` (`currency_id`),
    INDEX `index_original_price` (`original_price`),
    INDEX `index_price` (`price`),
    INDEX `index_discount_amount` (`discount_amount`),
    INDEX `index_discount_percent` (`discount_percent`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_product_category_products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `category_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_category_product` (`category_id`, `product_id`),
    INDEX `index_product_id` (`product_id`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_category_id_display_order` (`category_id`, `display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_product_tag_products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `tag_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `display_order` int NOT NULL DEFAULT 0,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_tag_product` (`tag_id`, `product_id`),
    INDEX `index_product_id` (`product_id`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_tag_id_display_order` (`tag_id`, `display_order`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shopping_carts` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `owner_id` bigint unsigned NOT NULL,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_owner_id` (`owner_id`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shopping_cart_products` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shopping_cart_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `product_color_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_size_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_material_id` bigint unsigned NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_shopping_cart_product_color_size_material` (`shopping_cart_id`, `product_id`, `product_color_id`, `product_size_id`, `product_material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_orders` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_code` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `creator_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `creator_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `approver_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `from_shopping_cart_id` bigint unsigned NOT NULL DEFAULT 0,
    `invoice_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `currency_id` bigint unsigned NOT NULL DEFAULT 0,
    `total_products` bigint unsigned NOT NULL DEFAULT 0,
    `total_product_amount` bigint unsigned NOT NULL DEFAULT 0,
    `total_amount_money` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `tax_percent` decimal(10,2),
    `tax` char(85) COLLATE utf8mb4_unicode_520_ci,
    `tip_percent` decimal(10,2),
    `tip` char(85) COLLATE utf8mb4_unicode_520_ci,
    `payment_service_code` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'UNKNOWN',
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `approved_at` datetime NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_order_code` (`order_code`),
    INDEX `index_creator_admin_id` (`creator_admin_id`),
    INDEX `index_approver_admin_id` (`approver_admin_id`),
    INDEX `index_from_shopping_cart_id` (`from_shopping_cart_id`),
    INDEX `index_payment_service_code` (`payment_service_code`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_creator_user_from_shopping_cart_status_approved_id` (`creator_user_id`, `from_shopping_cart_id`, `status`, `approved_at`, `id`),
    INDEX `index_status_updated_at_id` (`status`, `updated_at`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_order_products` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `product_color_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_size_id` bigint unsigned NOT NULL DEFAULT 0,
    `product_material_id` bigint unsigned NOT NULL DEFAULT 0,
    `amount` bigint unsigned NOT NULL DEFAULT 0,
    `price` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_amount` char(85) COLLATE utf8mb4_unicode_520_ci,
    `discount_percent` decimal(10,2),
    `tax_percent` decimal(10,2),
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_order_product_color_size_material` (`order_id`, `product_id`, `product_color_id`, `product_size_id`, `product_material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shops` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `display_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `headquarters_id` bigint unsigned NOT NULL,
    `owner_id` bigint unsigned NOT NULL,
    `icon_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `main_warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
    `created_by_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `created_by_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_name` (`name`),
    INDEX `index_headquarters_id` (`headquarters_id`),
    INDEX `index_owner_id` (`owner_id`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_branches` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL,
    `area_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `city_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `branch_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `branch_address` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `map_location` varchar(1200) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `phone_number` varchar(30) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_area_name` (`area_name`),
    INDEX `index_city_name` (`city_name`),
    INDEX `index_shop_id_branch_name` (`shop_id`, `branch_name`),
    INDEX `index_branch_name` (`branch_name`),
    INDEX `index_branch_address` (`branch_address`),
    INDEX `index_phone_number` (`phone_number`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_shop_bank_accounts` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL,
    `bank_id` bigint unsigned NOT NULL DEFAULT 0,
    `bank_branch_of_account` varchar(250) COLLATE utf8mb4_unicode_520_ci,
    `account_number` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `account_owner_name` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `account_qr_code_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `display_order` int NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_id_bank_id` (`shop_id`, `bank_id`),
    INDEX `index_shop_id` (`shop_id`),
    INDEX `index_account_number` (`account_number`),
    INDEX `index_account_owner_name` (`account_owner_name`),
    INDEX `index_display_order` (`display_order`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_user_balances (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_type` varchar(150) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ezy_users',
    `user_id` bigint unsigned NOT NULL,
    `currency_id` bigint unsigned NOT NULL,
    `balance` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_user_currency_id` (`user_type`, `user_id`, `currency_id`),
    INDEX `index_user_type` (`user_type`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_currency_id` (`currency_id`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`),
    INDEX `pagination` (`user_type`, `user_id`, `currency_id`, `balance`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_payment_histories (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `user_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ezy_users',
    `user_id` bigint unsigned NOT NULL,
    `currency_id` bigint unsigned NOT NULL,
    `order_id` bigint unsigned NOT NULL DEFAULT 0,
    `pay_amount` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `remaining_balance` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_user` (`user_type`, `user_id`),
    INDEX `index_user_type` (`user_type`),
    INDEX `index_user_id` (`user_id`),
    INDEX `index_currency_id` (`currency_id`),
    INDEX `index_created_at` (`created_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_banks` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `bank_code` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `bin_code` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `bank_name` varchar(250) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `address` varchar(250) COLLATE utf8mb4_unicode_520_ci,
    `url` varchar(250) COLLATE utf8mb4_unicode_520_ci,
    `logo_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'INACTIVATED',
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_bank_code` (`bank_code`),
    INDEX `index_bank_name` (`bank_name`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_payment_service_settings` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `payment_service_code` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `payment_service_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `payment_service_version` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `payment_service_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `payment_service_api_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `callback_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `logo_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `client_key` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `bank_id` bigint unsigned NOT NULL DEFAULT 0,
    `currency_id` bigint unsigned NOT NULL,
    `priority` int NOT NULL DEFAULT 0,
    `styles` varchar(1200) COLLATE utf8mb4_unicode_520_ci,
    `scripts` varchar(1200) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY key_payment_service_code (`payment_service_code`),
    UNIQUE KEY key_payment_service_name (`payment_service_name`),
    INDEX `index_priority` (`priority`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_exchange_rates` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `shop_id` bigint unsigned NOT NULL DEFAULT 0,
    `from_currency_id` bigint unsigned NOT NULL,
    `to_currency_id` bigint unsigned NOT NULL,
    `to_value` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY key_shop_from_to_currency_id (`shop_id`, `from_currency_id`, `to_currency_id`),
    INDEX `index_from_currency_id` (`from_currency_id`),
    INDEX `index_to_currency_id` (`to_currency_id`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
