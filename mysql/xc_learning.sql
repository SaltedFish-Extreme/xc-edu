/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 80017
 Source Host           : localhost:3306
 Source Schema         : xc_learning

 Target Server Type    : MySQL
 Target Server Version : 80017
 File Encoding         : 65001

 Date: 14/05/2020 11:07:50
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for xc_learning_course
-- ----------------------------
DROP TABLE IF EXISTS `xc_learning_course`;
CREATE TABLE `xc_learning_course`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `course_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '课程id',
  `user_id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '用户id',
  `valid` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '有效性',
  `start_time` datetime(0) NULL DEFAULT NULL,
  `end_time` datetime(0) NULL DEFAULT NULL,
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '选课状态',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `xc_learning_list_unique`(`course_id`, `user_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_learning_course
-- ----------------------------
INSERT INTO `xc_learning_course` VALUES ('402885816243d2dd016243f24c030002', '402885816243d2dd016243f24c030002', '49', NULL, NULL, NULL, '501001');
INSERT INTO `xc_learning_course` VALUES ('8a7e82b564b5e53f0164b5ee61e50002', '4028e581617f945f01617f9dabc40000', '49', NULL, '2020-05-10 21:55:54', '2020-05-10 21:55:54', '501001');
INSERT INTO `xc_learning_course` VALUES ('8a7e82b564b5e53f0164b5ee6b780003', '4028e581617f945f01617f9dabc40001', '49', NULL, NULL, NULL, '501001');

-- ----------------------------
-- Table structure for xc_task_his
-- ----------------------------
DROP TABLE IF EXISTS `xc_task_his`;
CREATE TABLE `xc_task_his`  (
  `id` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '任务id',
  `create_time` datetime(0) NULL DEFAULT NULL,
  `update_time` datetime(0) NULL DEFAULT NULL,
  `delete_time` datetime(0) NULL DEFAULT NULL,
  `task_type` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务类型',
  `mq_exchange` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '交换机名称',
  `mq_routingkey` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'routingkey',
  `request_body` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务请求的内容',
  `version` int(10) NULL DEFAULT 0 COMMENT '乐观锁版本号',
  `status` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '任务状态',
  `errormsg` varchar(512) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of xc_task_his
-- ----------------------------
INSERT INTO `xc_task_his` VALUES ('10', '2018-04-04 22:58:20', '2018-07-13 22:58:54', '2018-07-16 12:24:36', NULL, 'ex_learning_addchoosecourse', 'addchoosecourse', '{\"userId\":\"49\",\"courseId\":\"4028e581617f945f01617f9dabc40000\"}', NULL, '10201', NULL);
INSERT INTO `xc_task_his` VALUES ('11', '2018-07-16 12:28:03', '2018-07-15 12:28:04', '2018-07-16 12:29:11', NULL, 'ex_learning_addchoosecourse', 'addchoosecourse', '{\"userId\":\"49\",\"courseId\":\"4028e581617f945f01617f9dabc40001\"}', NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
