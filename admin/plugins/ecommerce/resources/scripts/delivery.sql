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

CREATE TABLE IF NOT EXISTS ecommerce_countries (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_code` varchar(12) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `image_id` bigint unsigned NOT NULL DEFAULT 0,
    `flag_icon` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `local_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `international_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `dialing_code` varchar(5) COLLATE utf8mb4_unicode_520_ci,
    `currency_iso_code` varchar(12) COLLATE utf8mb4_unicode_520_ci,
    `capital_name` varchar(12) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED',
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_country_code` (`country_code`),
    UNIQUE KEY `key_international_name` (`international_name`),
    UNIQUE KEY `key_dialing_code` (`dialing_code`),
    INDEX `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_provinces (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_id` bigint unsigned NOT NULL,
    `province_code` varchar(12) COLLATE utf8mb4_unicode_520_ci,
    `name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `province_type` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `display_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED',
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_country_id_province_code` (`country_id`, `province_code`),
    INDEX `index_country_id_status` (`country_id`, `status`),
    INDEX `index_name` (`name`),
    INDEX `index_province_type` (`province_type`),
    INDEX `index_display_name` (`display_name`),
    INDEX `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_districts (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_id` bigint unsigned NOT NULL,
    `province_id` bigint unsigned NOT NULL,
    `district_code` varchar(12) COLLATE utf8mb4_unicode_520_ci,
    `name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `district_type` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `display_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED',
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_province_id_district_code` (`province_id`, `district_code`),
    INDEX `index_country_id` (`country_id`),
    INDEX `index_province_id_status` (`province_id`, `status`),
    INDEX `index_name` (`name`),
    INDEX `index_district_type` (`district_type`),
    INDEX `index_display_name` (`display_name`),
    INDEX `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_wards (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_id` bigint unsigned NOT NULL,
    `province_id` bigint unsigned NOT NULL,
    `district_id` bigint unsigned NOT NULL,
    `name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `ward_type` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `display_name` varchar(150) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'ACTIVATED',
    PRIMARY KEY (`id`),
    INDEX `index_country_id` (`country_id`),
    INDEX `index_province_id` (`province_id`),
    INDEX `index_district_id_status` (`district_id`, `status`),
    INDEX `index_name` (`name`),
    INDEX `index_ward_type` (`ward_type`),
    INDEX `index_display_name` (`display_name`),
    INDEX `index_status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_deliverable_products (
	`product_id` bigint unsigned NOT NULL,
    `weight_in_gram` decimal(10,2) DEFAULT NULL,
    `width_in_millimeter` decimal(10,2) DEFAULT NULL,
    `height_in_millimeter` decimal(10,2) DEFAULT NULL,
    `length_in_millimeter` decimal(10,2) DEFAULT NULL,
    `fragile` tinyint NOT NULL DEFAULT 0,
    `luxury` tinyint NOT NULL DEFAULT 0,
    `delivery_required` tinyint NOT NULL DEFAULT 1,
    `small` tinyint NOT NULL DEFAULT 0,
    `document` tinyint NOT NULL DEFAULT 0,
    `liquid` tinyint NOT NULL DEFAULT 0,
    `agricultural` tinyint NOT NULL DEFAULT 0,
    `food` tinyint NOT NULL DEFAULT 0,
    `dried_food` tinyint NOT NULL DEFAULT 0,
    `full_box` tinyint NOT NULL DEFAULT 0,
    `short_shelf_life` tinyint NOT NULL DEFAULT 0,
    `sharp_edges` tinyint NOT NULL DEFAULT 0,
    `requiring_proper_orientation` tinyint NOT NULL DEFAULT 0,
    PRIMARY KEY (`product_id`),
    INDEX `index_product_id_delivery_required` (`product_id`, `delivery_required`),
    INDEX `index_delivery_required` (`delivery_required`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_delivery_orders (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `order_id` bigint unsigned NOT NULL,
    `parent_id` bigint unsigned NOT NULL DEFAULT 0,
    `order_code` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `order_id_text_8` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `order_id_text_12` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `tracking_id` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `from_warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
    `delivery_service_code` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `delivery_order_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `cod_amount` char(85) COLLATE utf8mb4_unicode_520_ci,
    `shipping_fee_payer` varchar(25) COLLATE utf8mb4_unicode_520_ci DEFAULT 'SENDER',
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    `delivered_at` datetime,
    PRIMARY KEY (`id`),
    INDEX `index_order_id` (`order_id`),
    INDEX `index_order_order_id_text_8` (`order_id_text_8`),
    INDEX `index_order_order_id_text_12` (`order_id_text_12`),
    INDEX `index_order_code_status_id` (`order_code`, `status`, `id`),
    INDEX `index_tracking_id` (`tracking_id`),
    INDEX `index_delivery_service_code` (`delivery_service_code`),
    INDEX `index_delivery_order_type_status_id` (`delivery_order_type`, `status`, `id`),
    INDEX `index_parent_id_delivery_order_type_status_id` (`parent_id`, `delivery_order_type`, `status`, `id`),
    INDEX `index_shipping_fee_payer` (`shipping_fee_payer`),
    INDEX `index_updated_at` (`updated_at`),
    INDEX `index_delivered_at` (`delivered_at`),
    INDEX `index_status_updated_at_id` (`status`, `updated_at`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_delivery_order_histories (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `delivery_order_id` bigint unsigned NOT NULL,
    `warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(50) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_status` (`status`),
    INDEX `index_delivery_order_id_status` (`delivery_order_id`, `status`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_delivery_order_products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `delivery_order_id` bigint unsigned NOT NULL,
    `order_product_id` bigint unsigned NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_delivery_order_id` (`delivery_order_id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS `ecommerce_delivery_service_settings` (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `delivery_service_code` varchar(60) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `delivery_service_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `delivery_service_version` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `delivery_service_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `delivery_service_api_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `callback_url` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `logo_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `banner_image_id` bigint unsigned NOT NULL DEFAULT 0,
    `client_key` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `delivery_fee_currency_id` bigint unsigned NOT NULL DEFAULT 0,
    `min_delivery_fee` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `default_goods_value` char(85) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY key_delivery_service_code (`delivery_service_code`),
    UNIQUE KEY key_delivery_service_name (`delivery_service_name`),
    INDEX `index_status` (`status`),
    INDEX `index_created_at` (`created_at`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_nearby_districts (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `country_id_a` bigint unsigned NOT NULL,
    `province_id_a` bigint unsigned NOT NULL,
    `district_id_a` bigint unsigned NOT NULL,
    `country_id_b` bigint unsigned NOT NULL,
    `province_id_b` bigint unsigned NOT NULL,
    `district_id_b` bigint unsigned NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_all` (`country_id_a`, `province_id_a`, `district_id_a`, `country_id_b`, `province_id_b`, `district_id_b`),
    INDEX `index_country_province` (`country_id_a`, `province_id_a`, `country_id_b`, `province_id_b`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_order_recipients (
    `order_id` bigint unsigned NOT NULL,
    `order_recipient_type` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `free_shipping` tinyint NOT NULL DEFAULT 0,
    `shipping_type` varchar(25) COLLATE utf8mb4_unicode_520_ci,
    `customer_code` varchar(64) COLLATE utf8mb4_unicode_520_ci,
    `full_name` varchar(64) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `first_name` varchar(64) COLLATE utf8mb4_unicode_520_ci,
    `last_name` varchar(64) COLLATE utf8mb4_unicode_520_ci,
    `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `email` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `delivery_option` varchar(50) COLLATE utf8mb4_unicode_520_ci DEFAULT 'HOME_DELIVERY',
    `country_id` bigint unsigned NOT NULL DEFAULT 0,
    `province_id` bigint unsigned NOT NULL DEFAULT 0,
    `district_id` bigint unsigned NOT NULL DEFAULT 0,
    `ward_id` bigint unsigned NOT NULL DEFAULT 0,
    `city_name` varchar(200) COLLATE utf8mb4_unicode_520_ci,
    `postal_code` varchar(32) COLLATE utf8mb4_unicode_520_ci,
    `detailed_address` varchar(300) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `send_order_updates` tinyint NOT NULL DEFAULT 0,
    `send_live_tracking` tinyint NOT NULL DEFAULT 0,
    `save_delivery_information` tinyint NOT NULL DEFAULT 0,
    `send_news` tinyint NOT NULL DEFAULT 0,
    `send_offers` tinyint NOT NULL DEFAULT 0,
    `notes` mediumtext COLLATE utf8mb4_unicode_520_ci,
    `delivery_fee` char(85) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `receive_at_shop_branch_id` bigint unsigned NOT NULL DEFAULT 0,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `index_order_recipient_type` (`order_recipient_type`),
    INDEX `index_delivery_option` (`delivery_option`),
    INDEX `index_customer_code_order_id` (`customer_code`, `order_id`),
    INDEX `index_receive_at_shop_branch_id` (`receive_at_shop_branch_id`),
    INDEX `index_status_order_id` (`status`, `order_id`),
    INDEX `index_updated_at` (`updated_at`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_process_delivery_orders (
    `order_id` bigint unsigned NOT NULL,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`order_id`),
    INDEX `index_status_order_id` (`status`, `order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_branch_details (
    `shop_branch_id` bigint unsigned NOT NULL,
    `manager_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `manager_user_id` bigint unsigned NOT NULL DEFAULT 0,
	`email` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `country_id` bigint unsigned NOT NULL DEFAULT 0,
    `province_id` bigint unsigned NOT NULL DEFAULT 0,
    `district_id` bigint unsigned NOT NULL DEFAULT 0,
    `ward_id` bigint unsigned NOT NULL DEFAULT 0,
    `warehouse_id` bigint unsigned NOT NULL DEFAULT 0,
    `allow_user_received_stock` tinyint NOT NULL DEFAULT 0,
    `weekly_working_day_from` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'MONDAY',
    `weekly_working_day_to` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL DEFAULT 'FRIDAY',
    `daily_working_time_from` time,
    `daily_working_time_to` time,
    PRIMARY KEY (`shop_branch_id`),
    INDEX `index_warehouse_id` (`warehouse_id`),
    INDEX `index_allow_user_received_stock` (`allow_user_received_stock`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_details (
    `shop_id` bigint unsigned NOT NULL,
    `company_name` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `company_email` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `company_phone_number` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `company_address` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `company_legal_representative` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `company_tax_code` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `company_licensed_date` DATE,
    `company_tax_submission_location` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    PRIMARY KEY (`shop_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_warehouses (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `display_name` varchar(120) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `shop_id` bigint unsigned NOT NULL,
    `manager_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `manager_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `email` varchar(120) COLLATE utf8mb4_unicode_520_ci,
    `phone_number` varchar(20) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `country_id` bigint unsigned NOT NULL DEFAULT 0,
    `province_id` bigint unsigned NOT NULL DEFAULT 0,
    `district_id` bigint unsigned NOT NULL DEFAULT 0,
    `ward_id` bigint unsigned NOT NULL DEFAULT 0,
    `detailed_address` varchar(300) COLLATE utf8mb4_unicode_520_ci,
    `status` varchar(25) COLLATE utf8mb4_unicode_520_ci NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    INDEX `index_shop_id_status_id` (`shop_id`, `status`, `id`),
    INDEX `index_display_name` (`display_name`),
    INDEX `index_status_id` (`status`, `id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;

CREATE TABLE IF NOT EXISTS ecommerce_shop_warehouse_products (
    `id` bigint unsigned NOT NULL AUTO_INCREMENT,
    `warehouse_id` bigint unsigned NOT NULL,
    `product_id` bigint unsigned NOT NULL,
    `added_by_admin_id` bigint unsigned NOT NULL DEFAULT 0,
    `added_by_user_id` bigint unsigned NOT NULL DEFAULT 0,
    `remaining_amount` bigint unsigned NOT NULL,
    `created_at` datetime NOT NULL,
    `updated_at` datetime NOT NULL,
    PRIMARY KEY (`id`),
    UNIQUE KEY `key_warehouse_id_product_id` (`warehouse_id`, `product_id`),
    INDEX `index_remaining_amount` (`remaining_amount`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_520_ci;
