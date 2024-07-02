/*
 Navicat Premium Data Transfer

 Source Server         : who.sphereweb.net
 Source Server Type    : MySQL
 Source Server Version : 101107 (10.11.7-MariaDB-1:10.11.7+maria~ubu2204)
 Source Host           : 212.83.160.7:3306
 Source Schema         : logan22user_sp2

 Target Server Type    : MySQL
 Target Server Version : 101107 (10.11.7-MariaDB-1:10.11.7+maria~ubu2204)
 File Encoding         : 65001

 Date: 01/06/2024 00:02:40
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bonus
-- ----------------------------
DROP TABLE IF EXISTS `bonus`;
CREATE TABLE `bonus`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `enchant` int NULL DEFAULT 0,
  `phrase` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `issued` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of bonus
-- ----------------------------

-- ----------------------------
-- Table structure for bonus_code
-- ----------------------------
DROP TABLE IF EXISTS `bonus_code`;
CREATE TABLE `bonus_code`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT 1,
  `enchant` int NULL DEFAULT 0,
  `phrase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `start_date_code` datetime NULL DEFAULT NULL,
  `end_date_code` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bonus_code
-- ----------------------------

-- ----------------------------
-- Table structure for bonus_pack_codes
-- ----------------------------
DROP TABLE IF EXISTS `bonus_pack_codes`;
CREATE TABLE `bonus_pack_codes`  (
  `id` int NOT NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `issued` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bonus_pack_codes
-- ----------------------------

-- ----------------------------
-- Table structure for bonus_pack_item
-- ----------------------------
DROP TABLE IF EXISTS `bonus_pack_item`;
CREATE TABLE `bonus_pack_item`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `enchant` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bonus_pack_item
-- ----------------------------

-- ----------------------------
-- Table structure for chat
-- ----------------------------
DROP TABLE IF EXISTS `chat`;
CREATE TABLE `chat`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `message` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `player` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `server` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of chat
-- ----------------------------

-- ----------------------------
-- Table structure for donate
-- ----------------------------
DROP TABLE IF EXISTS `donate`;
CREATE TABLE `donate`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `cost` float NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `is_pack` int NULL DEFAULT NULL,
  `pack_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate
-- ----------------------------

-- ----------------------------
-- Table structure for donate_history
-- ----------------------------
DROP TABLE IF EXISTS `donate_history`;
CREATE TABLE `donate_history`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `amount` int NULL DEFAULT NULL,
  `cost` int NULL DEFAULT NULL,
  `char_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_history
-- ----------------------------

-- ----------------------------
-- Table structure for donate_history_pay
-- ----------------------------
DROP TABLE IF EXISTS `donate_history_pay`;
CREATE TABLE `donate_history_pay`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `point` int NULL DEFAULT NULL,
  `message` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pay_system` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `id_admin_pay` int NULL DEFAULT NULL COMMENT 'Если администратор зачислил вручную, запишим его ID',
  `date` datetime NULL DEFAULT NULL,
  `sphere` int NULL DEFAULT 0 COMMENT '1 если деньги зачислила сфера (к примеру это просто бонус)',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_history_pay
-- ----------------------------

-- ----------------------------
-- Table structure for donate_pack
-- ----------------------------
DROP TABLE IF EXISTS `donate_pack`;
CREATE TABLE `donate_pack`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `pack_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_pack
-- ----------------------------

-- ----------------------------
-- Table structure for donate_uuid
-- ----------------------------
DROP TABLE IF EXISTS `donate_uuid`;
CREATE TABLE `donate_uuid`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `uuid` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `pay_system` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `request` varchar(12000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of donate_uuid
-- ----------------------------

-- ----------------------------
-- Table structure for github_updates
-- ----------------------------
DROP TABLE IF EXISTS `github_updates`;
CREATE TABLE `github_updates`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `sha` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `author` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `url` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `message` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of github_updates
-- ----------------------------

-- ----------------------------
-- Table structure for items_data
-- ----------------------------
DROP TABLE IF EXISTS `items_data`;
CREATE TABLE `items_data`  (
  `item_id` int NOT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `additionalname` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `is_trade` int NULL DEFAULT NULL,
  `is_drop` int NULL DEFAULT NULL,
  `is_destruct` int NULL DEFAULT NULL,
  `crystal_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `consume_type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'consume_type_normal',
  PRIMARY KEY (`item_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of items_data
-- ----------------------------

-- ----------------------------
-- Table structure for launcher
-- ----------------------------
DROP TABLE IF EXISTS `launcher`;
CREATE TABLE `launcher`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `l2app` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `args` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `phrase` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of launcher
-- ----------------------------

-- ----------------------------
-- Table structure for log_transfer_spherecoin
-- ----------------------------
DROP TABLE IF EXISTS `log_transfer_spherecoin`;
CREATE TABLE `log_transfer_spherecoin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_sender` int NULL DEFAULT NULL,
  `user_receiving` int NULL DEFAULT NULL,
  `point` int NULL DEFAULT NULL,
  `date` timestamp NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Fixed;

-- ----------------------------
-- Records of log_transfer_spherecoin
-- ----------------------------

-- ----------------------------
-- Table structure for logs_all
-- ----------------------------
DROP TABLE IF EXISTS `logs_all`;
CREATE TABLE `logs_all`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `phrase` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `variables` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `request` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `method` enum('post','get') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `action` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `file` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `line` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of logs_all
-- ----------------------------

-- ----------------------------
-- Table structure for notification
-- ----------------------------
DROP TABLE IF EXISTS `notification`;
CREATE TABLE `notification`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `message` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  `read` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = latin1 COLLATE = latin1_swedish_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of notification
-- ----------------------------

-- ----------------------------
-- Table structure for page_comments
-- ----------------------------
DROP TABLE IF EXISTS `page_comments`;
CREATE TABLE `page_comments`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `message` varchar(3000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `trash` int NOT NULL DEFAULT 0,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp,
  `date_update` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of page_comments
-- ----------------------------

-- ----------------------------
-- Table structure for pages
-- ----------------------------
DROP TABLE IF EXISTS `pages`;
CREATE TABLE `pages`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `is_news` int NULL DEFAULT 0,
  `name` varchar(140) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `description` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `comment` int NOT NULL DEFAULT 0,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp,
  `date_update` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `trash` int NOT NULL DEFAULT 0,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'ru',
  `poster` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `link` varchar(1200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of pages
-- ----------------------------

-- ----------------------------
-- Table structure for player_accounts
-- ----------------------------
DROP TABLE IF EXISTS `player_accounts`;
CREATE TABLE `player_accounts`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `login` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `characters` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `date_update_characters` datetime NULL DEFAULT NULL,
  `password_hide` int NULL DEFAULT NULL,
  `date_create` datetime NULL DEFAULT NULL,
  `date_update` datetime NULL DEFAULT current_timestamp,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of player_accounts
-- ----------------------------

-- ----------------------------
-- Table structure for referrals
-- ----------------------------
DROP TABLE IF EXISTS `referrals`;
CREATE TABLE `referrals`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `leader_id` int NULL DEFAULT NULL,
  `done` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of referrals
-- ----------------------------

-- ----------------------------
-- Table structure for route
-- ----------------------------
DROP TABLE IF EXISTS `route`;
CREATE TABLE `route`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `enable` tinyint(1) NULL DEFAULT 1,
  `method` enum('GET','POST','PUT','DELETE','PATCH') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `pattern` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `func` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `access` varchar(222) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `weight` int NOT NULL DEFAULT 0,
  `page` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `comment` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `unique_method_pattern`(`method` ASC, `pattern` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 90 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of route
-- ----------------------------
INSERT INTO `route` VALUES (1, 1, 'GET', '/main', 'controller\\main\\main::index', '[\"any\"]', 0, '', 'Start page!!');
INSERT INTO `route` VALUES (2, 1, 'GET', '/user/change/lang/{lang}', 'controller\\config\\config::setLang', '[\"any\"]', 0, '', 'Change lang');
INSERT INTO `route` VALUES (3, 1, 'GET', '/admin/server/add/new', 'controller\\admin\\options::new_server', '[\"admin\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (4, 1, 'POST', '/admin/options/server/client/protocol', 'component\\chronicle\\client::get_base_collection_class', '[\"admin\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (5, 1, 'GET', '/statistic', NULL, '[\"any\"]', 0, 'statistic.html', 'Statistic page');
INSERT INTO `route` VALUES (6, 1, 'GET', '/shop', 'controller\\donate\\pay::shop', '[\"any\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (7, 1, 'POST', '/admin/route/add', 'controller\\route\\route::add', '[\"admin\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (8, 1, 'POST', '/admin/route/get/file', 'controller\\route\\route::getDirFiles', '[\"admin\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (22, 1, 'POST', '/admin/route/update/enable', 'controller\\route\\route::update_enable', '[\"admin\"]', 0, NULL, NULL);
INSERT INTO `route` VALUES (24, 1, 'GET', '/ticket', 'controller\\ticket\\ticket::all', '[\"user\",\"admin\"]', 0, '', 'Tickets list');
INSERT INTO `route` VALUES (25, 1, 'GET', '/ticket/(\\d+)', 'controller\\ticket\\ticket::get', '[\"admin\",\"user\"]', 0, NULL, 'Ticket read');
INSERT INTO `route` VALUES (26, 1, 'POST', '/ticket/message', 'controller\\ticket\\ticket::message', '[\"admin\",\"user\"]', 0, '', 'Ticket send message');
INSERT INTO `route` VALUES (27, 1, 'POST', '/admin/route/edit', 'controller\\route\\route::edit', '[\"admin\"]', 1, '', 'Update route data');
INSERT INTO `route` VALUES (28, 1, 'GET', '/admin/shop', NULL, '[\"admin\"]', 0, 'admin/shop_add.html', 'Shop manager');
INSERT INTO `route` VALUES (29, 1, 'POST', '/admin/shop', 'model\\admin\\donate::add_item', '[\"admin\"]', 0, 'admin/shop_add.html', '');
INSERT INTO `route` VALUES (31, 1, 'POST', '/admin/shop/remove/item', 'model\\admin\\donate::remove_item', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (32, 1, 'POST', '/admin/shop/get', 'controller\\donate\\shop::getShopObjectJSON', '[\"user\",\"admin\"]', 0, '', 'Получить информацию о продаваемых предметах');
INSERT INTO `route` VALUES (33, 1, 'POST', '/shop/purchase', 'controller\\donate\\pay::buyShopItem', '[\"user\",\"admin\"]', 0, '', 'Purchase of goods');
INSERT INTO `route` VALUES (34, 1, 'POST', '/shop/towarehouse', 'model\\donate\\donate::toWarehouse', '[\"admin\",\"user\"]', 0, '', 'Shop items to warehouse');
INSERT INTO `route` VALUES (40, 1, 'GET', '/user/avatar', 'controller\\user\\profile\\change::show_avatar_page', '[\"admin\",\"user\"]', 0, '', 'Set user avatar');
INSERT INTO `route` VALUES (41, 1, 'GET', '/admin/forum', NULL, '[\"admin\"]', 0, 'admin/forum.html', '');
INSERT INTO `route` VALUES (42, 1, 'POST', '/admin/forum', 'model\\forum\\forum::saveConfig', '[\"admin\"]', 0, '', 'Save forum settings');
INSERT INTO `route` VALUES (43, 1, 'GET', '/admin/phrases', NULL, '[\"admin\"]', 0, '/admin/phrases.html', 'Set multilang phrases');
INSERT INTO `route` VALUES (44, 1, 'POST', '/admin/phrases', 'model\\phrases\\phrases::save', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (45, 1, 'POST', '/admin/function/save', 'model\\enabled\\enabled::save', '[\"admin\"]', 0, '', 'Save status function');
INSERT INTO `route` VALUES (46, 1, 'POST', '/admin/config/save', 'model\\config\\config::save', '[\"admin\"]', 0, '', 'Save Sphere config');
INSERT INTO `route` VALUES (47, 1, 'GET', '/admin/sphere/update', NULL, '[\"admin\"]', 0, '/admin/selfupdate.html', '');
INSERT INTO `route` VALUES (48, 1, 'GET', '/admin/route', 'controller\\route\\route::all', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (49, 1, 'GET', '/news', NULL, '[\"any\"]', 0, 'pages.html', '');
INSERT INTO `route` VALUES (50, 1, 'GET', '/install', 'controller\\install\\install::rules', '[\"any\"]', 0, '', '');
INSERT INTO `route` VALUES (51, 1, 'GET', '/balance', 'controller\\donate\\pay::pay', '[\"user\",\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (52, 1, 'GET', '/admin/setting', 'controller\\admin\\options::server_show', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (53, 1, 'GET', '/admin/pages', NULL, '[\"admin\"]', 0, 'admin/pages.html', '');
INSERT INTO `route` VALUES (54, 1, 'GET', '/admin/pages/edit/(\\d+)', NULL, '[\"admin\"]', 0, '/admin/page_edit.html', '');
INSERT INTO `route` VALUES (55, 1, 'GET', '/admin/pages/create', NULL, '[\"admin\"]', 0, '/admin/page_create.html', '');
INSERT INTO `route` VALUES (56, 1, 'GET', '/page/(\\d+)', NULL, '[\"any\"]', 0, '/page.html', '');
INSERT INTO `route` VALUES (57, 1, 'POST', '/user/change/avatar', 'controller\\user\\profile\\change::save_avatar', '[\"admin\",\"user\"]', 0, '', '');
INSERT INTO `route` VALUES (58, 1, 'GET', '/admin/users', NULL, '[\"admin\"]', 0, '/admin/users.html', '');
INSERT INTO `route` VALUES (59, 1, 'GET', '/', 'controller\\promo\\promo::index', '[\"any\"]', 0, '', '');
INSERT INTO `route` VALUES (60, 1, 'GET', '/auth/logout', 'controller\\user\\auth\\auth::logout', '[\"admin\",\"user\"]', 0, '', '');
INSERT INTO `route` VALUES (61, 1, 'GET', '/auth', 'controller\\user\\auth\\auth::index', '[\"any\"]', 0, '', '');
INSERT INTO `route` VALUES (62, 1, 'POST', '/captcha', 'component\\captcha\\captcha::defence', '[\"any\"]', 0, '', '');
INSERT INTO `route` VALUES (63, 1, 'POST', '/auth', 'controller\\user\\auth\\auth::auth_request', '[\"guest\"]', 0, '', '');
INSERT INTO `route` VALUES (64, 1, 'GET', '/referral', 'controller\\referral\\referral::show', '[\"user\",\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (65, 1, 'GET', '/registration/user', NULL, '[\"guest\"]', 0, 'sign-up.html', '');
INSERT INTO `route` VALUES (66, 1, 'POST', '/registration/user', 'controller\\registration\\user::add', '[\"guest\"]', 0, '', '');
INSERT INTO `route` VALUES (67, 1, 'POST', '/registration/account', 'controller\\registration\\account::requestNewAccount', '[\"admin\",\"user\"]', 0, '', '');
INSERT INTO `route` VALUES (68, 1, 'POST', '/inventory/send', 'controller\\account\\characters\\inventory::warehouseToGame', '[\"user\",\"admin\"]', 0, '', 'Send items to player');
INSERT INTO `route` VALUES (70, 1, 'POST', '/user/change', 'controller\\user\\profile\\change::save', '[\"admin\",\"user\"]', 0, '', '');
INSERT INTO `route` VALUES (71, 1, 'POST', '/send/to/player', 'controller\\account\\characters\\inventory::sendToGame', '[\"admin\",\"user\"]', 0, 'sendtogame.html', '');
INSERT INTO `route` VALUES (72, 1, 'POST', '/player/account/reload', 'controller\\account\\characters\\reload::reload', '[\"admin\",\"user\"]', 0, '', '');
INSERT INTO `route` VALUES (73, 1, 'POST', '/player/account/change/password', 'controller\\account\\password\\change::password', '[\"admin\",\"user\"]', 0, '', 'Change player password');
INSERT INTO `route` VALUES (74, 1, 'POST', '/admin/option/server/db/connect/select/name', 'controller\\admin\\options::test_connect_db_selected_name', '[\"admin\"]', 0, '', 'Check MySQL Connect');
INSERT INTO `route` VALUES (75, 1, 'POST', '/admin/create/server/new', 'controller\\admin\\options::create_server', '[\"admin\"]', 0, '', 'Add new server');
INSERT INTO `route` VALUES (76, 1, 'POST', '/user/change/server', 'controller\\user\\default_server::change', '[\"any\"]', 0, '', 'Change server');
INSERT INTO `route` VALUES (77, 1, 'GET', '/admin/shop/startpack', 'controller\\admin\\startpack::index', '[\"admin\"]', 0, '/admin/startpack.html', '');
INSERT INTO `route` VALUES (78, 1, 'POST', '/admin/client/item/info', 'component\\image\\client_icon::get_item_info_json', '[\"admin\"]', 0, '', 'Item data info');
INSERT INTO `route` VALUES (80, 1, 'POST', '/admin/shop/startpack', 'controller\\admin\\startpack::add', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (81, 1, 'POST', '/startpack/purchase', 'controller\\admin\\startpack::purchase', '[\"user\",\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (82, 1, 'POST', '/startpack/purchase/warehouse', 'controller\\admin\\startpack::purchaseWarehouse', '[\"admin\",\"guest\"]', 0, '', '');
INSERT INTO `route` VALUES (83, 1, 'POST', '/admin/setting/donate/save', 'controller\\admin\\options::saveConfigDonate', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (84, 1, 'POST', '/admin/setting/referral/save', 'controller\\admin\\options::saveConfigReferral', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (85, 1, 'GET', '/admin/server/list', 'controller\\admin\\options::edit_server_show', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (86, 1, 'GET', '/admin/server/edit/(\\d+)', 'controller\\admin\\options::edit_server_show', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (87, 1, 'POST', '/admin/server/edit/save/general', 'controller\\admin\\options::saveGeneral', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (88, 1, 'POST', '/admin/server/edit/save/other', 'controller\\admin\\options::saveOther', '[\"admin\"]', 0, '', '');
INSERT INTO `route` VALUES (89, 1, 'POST', '/admin/server/edit/save/mysql', 'controller\\admin\\options::saveMySQL', '[\"admin\"]', 0, '', '');

-- ----------------------------
-- Table structure for server_cache
-- ----------------------------
DROP TABLE IF EXISTS `server_cache`;
CREATE TABLE `server_cache`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `type` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `data` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_create` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server_cache
-- ----------------------------

-- ----------------------------
-- Table structure for server_data
-- ----------------------------
DROP TABLE IF EXISTS `server_data`;
CREATE TABLE `server_data`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `val` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `key`(`key` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server_data
-- ----------------------------

-- ----------------------------
-- Table structure for server_description
-- ----------------------------
DROP TABLE IF EXISTS `server_description`;
CREATE TABLE `server_description`  (
  `server_id` int NOT NULL,
  `lang` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `page_id` int NULL DEFAULT NULL,
  `default` int NULL DEFAULT 0,
  `date_create` timestamp NULL DEFAULT current_timestamp,
  `date_update` timestamp NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of server_description
-- ----------------------------

-- ----------------------------
-- Table structure for servers
-- ----------------------------
DROP TABLE IF EXISTS `servers`;
CREATE TABLE `servers`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `data` varchar(10000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of servers
-- ----------------------------

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `key` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `setting` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `serverId` int NULL DEFAULT NULL,
  `dateUpdate` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of settings
-- ----------------------------

-- ----------------------------
-- Table structure for shop_items
-- ----------------------------
DROP TABLE IF EXISTS `shop_items`;
CREATE TABLE `shop_items`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `serverId` int NULL DEFAULT NULL,
  `items` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of shop_items
-- ----------------------------

-- ----------------------------
-- Table structure for startpacks
-- ----------------------------
DROP TABLE IF EXISTS `startpacks`;
CREATE TABLE `startpacks`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `name` varchar(300) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `cost` float NULL DEFAULT NULL,
  `items` varchar(6000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of startpacks
-- ----------------------------

-- ----------------------------
-- Table structure for statistic_online
-- ----------------------------
DROP TABLE IF EXISTS `statistic_online`;
CREATE TABLE `statistic_online`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `loginserver` int NULL DEFAULT NULL,
  `gameserver` int NULL DEFAULT NULL,
  `count_online_player` int NULL DEFAULT NULL,
  `time` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of statistic_online
-- ----------------------------

-- ----------------------------
-- Table structure for user_auth_log
-- ----------------------------
DROP TABLE IF EXISTS `user_auth_log`;
CREATE TABLE `user_auth_log`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL,
  `ip` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `country` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `city` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `browser` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_auth_log
-- ----------------------------

-- ----------------------------
-- Table structure for user_variables
-- ----------------------------
DROP TABLE IF EXISTS `user_variables`;
CREATE TABLE `user_variables`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `user_id` int NOT NULL,
  `var` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `val` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `date_create` datetime NULL DEFAULT current_timestamp,
  `date_update` datetime NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`, `user_id`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_variables
-- ----------------------------

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `signature` varchar(400) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date_create` timestamp NOT NULL DEFAULT current_timestamp,
  `date_update` timestamp NOT NULL DEFAULT current_timestamp ON UPDATE CURRENT_TIMESTAMP,
  `access_level` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'user',
  `donate_point` float NULL DEFAULT 0,
  `avatar` varchar(62) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'none.jpeg',
  `avatar_background` varchar(62) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'none.jpeg',
  `timezone` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `country` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `city` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `server_id` int NULL DEFAULT NULL,
  `lang` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------

-- ----------------------------
-- Table structure for users_password_forget
-- ----------------------------
DROP TABLE IF EXISTS `users_password_forget`;
CREATE TABLE `users_password_forget`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `date` datetime NULL DEFAULT current_timestamp,
  `ip` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `active` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_password_forget
-- ----------------------------

-- ----------------------------
-- Table structure for users_permission
-- ----------------------------
DROP TABLE IF EXISTS `users_permission`;
CREATE TABLE `users_permission`  (
  `user_id` int NOT NULL,
  `ban_page` int NULL DEFAULT 0,
  `ban_ticket` int NULL DEFAULT 0,
  `ban_gallery` int NULL DEFAULT 0
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_permission
-- ----------------------------

-- ----------------------------
-- Table structure for warehouse
-- ----------------------------
DROP TABLE IF EXISTS `warehouse`;
CREATE TABLE `warehouse`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `server_id` int NULL DEFAULT NULL,
  `user_id` int NULL DEFAULT NULL,
  `item_id` int NULL DEFAULT NULL,
  `count` int NULL DEFAULT NULL,
  `enchant` int NULL DEFAULT 0,
  `phrase` varchar(600) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `issued` int NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of warehouse
-- ----------------------------

SET FOREIGN_KEY_CHECKS = 1;