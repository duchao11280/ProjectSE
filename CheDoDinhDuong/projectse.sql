/*
 Navicat Premium Data Transfer

 Source Server         : MySQL
 Source Server Type    : MySQL
 Source Server Version : 100417
 Source Host           : localhost:3306
 Source Schema         : projectse

 Target Server Type    : MySQL
 Target Server Version : 100417
 File Encoding         : 65001

 Date: 08/04/2021 15:22:21
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for activity
-- ----------------------------
DROP TABLE IF EXISTS `activity`;
CREATE TABLE `activity`  (
  `actID` int(11) NOT NULL,
  `actName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `cal` float(11, 0) NULL DEFAULT NULL,
  PRIMARY KEY (`actID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `catID` int(11) NOT NULL,
  `catName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`catID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Đồ nước');

-- ----------------------------
-- Table structure for condition
-- ----------------------------
DROP TABLE IF EXISTS `condition`;
CREATE TABLE `condition`  (
  `conID` int(11) NOT NULL,
  `conName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `bmiStart` float NULL DEFAULT NULL,
  `bmiEnd` float NULL DEFAULT NULL,
  PRIMARY KEY (`conID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for custommenu
-- ----------------------------
DROP TABLE IF EXISTS `custommenu`;
CREATE TABLE `custommenu`  (
  `userID` int(11) NOT NULL,
  `foodID` int(11) NOT NULL,
  `datetime` datetime(0) NOT NULL,
  `number` int(11) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`, `foodID`, `datetime`) USING BTREE,
  INDEX `Fk_custommenu_food`(`foodID`) USING BTREE,
  CONSTRAINT `FK_customenu_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `Fk_custommenu_food` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for food
-- ----------------------------
DROP TABLE IF EXISTS `food`;
CREATE TABLE `food`  (
  `foodID` int(11) NOT NULL,
  `foodName` varchar(100) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `catID` int(11) NOT NULL,
  `glucozo` float NULL DEFAULT NULL,
  `kcal` float NULL DEFAULT NULL,
  `lipit` float NULL DEFAULT NULL,
  `protein` float NULL DEFAULT NULL,
  `vitA` float NULL DEFAULT NULL,
  `vitB` float NULL DEFAULT NULL,
  `vitC` float NULL DEFAULT NULL,
  `vitD` float NULL DEFAULT NULL,
  `vitE` float NULL DEFAULT NULL,
  `kali` float NULL DEFAULT NULL,
  `fe` float NULL DEFAULT NULL,
  `na` float NULL DEFAULT NULL,
  PRIMARY KEY (`foodID`) USING BTREE,
  INDEX `FK_food_category`(`catID`) USING BTREE,
  CONSTRAINT `FK_food_category` FOREIGN KEY (`catID`) REFERENCES `category` (`catID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of food
-- ----------------------------
INSERT INTO `food` VALUES (1, 'Bún bò huế', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `food` VALUES (2, 'Cơm chiên', 1, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for historyuserbmi
-- ----------------------------
DROP TABLE IF EXISTS `historyuserbmi`;
CREATE TABLE `historyuserbmi`  (
  `historyID` int(11) NOT NULL,
  `userID` int(11) NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `dateUpdate` date NULL DEFAULT NULL,
  PRIMARY KEY (`historyID`) USING BTREE,
  INDEX `FK_historyuserbmi_user`(`userID`) USING BTREE,
  CONSTRAINT `FK_historyuserbmi_user` FOREIGN KEY (`userID`) REFERENCES `user` (`userID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for ingredient
-- ----------------------------
DROP TABLE IF EXISTS `ingredient`;
CREATE TABLE `ingredient`  (
  `foodID` int(11) NOT NULL,
  `ingredientID` int(11) NOT NULL,
  `gram` double NULL DEFAULT NULL,
  PRIMARY KEY (`foodID`, `ingredientID`) USING BTREE,
  INDEX `FK_ingredient_food_ingre`(`ingredientID`) USING BTREE,
  CONSTRAINT `FK_ingredient_food` FOREIGN KEY (`foodID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_ingredient_food_ingre` FOREIGN KEY (`ingredientID`) REFERENCES `food` (`foodID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for suggestmenu
-- ----------------------------
DROP TABLE IF EXISTS `suggestmenu`;
CREATE TABLE `suggestmenu`  (
  `ID` int(11) NOT NULL,
  `conID` int(11) NULL DEFAULT NULL,
  `dayofweek` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `foodName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `number` int(11) NULL DEFAULT NULL,
  `session` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  PRIMARY KEY (`ID`) USING BTREE,
  INDEX `FK_suggestmenu_condition`(`conID`) USING BTREE,
  CONSTRAINT `FK_suggestmenu_condition` FOREIGN KEY (`conID`) REFERENCES `condition` (`conID`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `userID` int(11) NOT NULL,
  `userName` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `role` int(11) NULL DEFAULT NULL,
  `fullName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `age` int(11) NULL DEFAULT NULL,
  `height` double NULL DEFAULT NULL,
  `weight` double NULL DEFAULT NULL,
  `sex` bit(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

SET FOREIGN_KEY_CHECKS = 1;
