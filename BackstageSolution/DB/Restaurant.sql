/*
SQLyog Ultimate v11.42 (64 bit)
MySQL - 5.7.18 : Database - Restaurant
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`Restaurant` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `Restaurant`;

/*Table structure for table `E_Category` */

DROP TABLE IF EXISTS `E_Category`;

CREATE TABLE `E_Category` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `CName` varchar(50) NOT NULL COMMENT '产品类型',
  `CDesc` varchar(256) DEFAULT NULL COMMENT '产品描述',
  `CStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品类型';

/*Data for the table `E_Category` */

LOCK TABLES `E_Category` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_CatrgoryInstructionType` */

DROP TABLE IF EXISTS `E_CatrgoryInstructionType`;

CREATE TABLE `E_CatrgoryInstructionType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `CategoryID` int(11) NOT NULL COMMENT '企业产品分类ID',
  `InstructionTypeID` int(11) NOT NULL COMMENT '企业指令类型ID',
  `CITStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`CategoryID`,`InstructionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业产品分类指令关系';

/*Data for the table `E_CatrgoryInstructionType` */

LOCK TABLES `E_CatrgoryInstructionType` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Function` */

DROP TABLE IF EXISTS `E_Function`;

CREATE TABLE `E_Function` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `FunctionID` int(11) NOT NULL,
  `EFStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`FunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业功能表 平台管理员给企业用户赋予的权限';

/*Data for the table `E_Function` */

LOCK TABLES `E_Function` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Instruction` */

DROP TABLE IF EXISTS `E_Instruction`;

CREATE TABLE `E_Instruction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `InstructionTypeID` int(11) NOT NULL COMMENT '企业指令类型ID',
  `IName` varchar(10) NOT NULL COMMENT '指令名称',
  `IDesc` varchar(256) DEFAULT NULL COMMENT '指令描述',
  `IPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '指令价格',
  `IStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`InstructionTypeID`,`IName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业指令';

/*Data for the table `E_Instruction` */

LOCK TABLES `E_Instruction` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_InstructionType` */

DROP TABLE IF EXISTS `E_InstructionType`;

CREATE TABLE `E_InstructionType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `ITName` varchar(20) NOT NULL COMMENT '指令类型名称',
  `MinSelectCount` tinyint(1) NOT NULL DEFAULT '0' COMMENT '最少选择数量 如果大于0 则标识必选[0,MaxSelectCount]',
  `MaxSelectCount` tinyint(2) NOT NULL DEFAULT '1' COMMENT '最多选择数量 如果大于1 则标识多选 值取值范围[MinSelectCount,对应的指令数量]',
  `ITDesc` varchar(256) DEFAULT NULL COMMENT '指令类型描述',
  `ITStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`ITName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业指令类型';

/*Data for the table `E_InstructionType` */

LOCK TABLES `E_InstructionType` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_POSMenu` */

DROP TABLE IF EXISTS `E_POSMenu`;

CREATE TABLE `E_POSMenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `ParentMenuID` int(11) NOT NULL COMMENT '父菜单节点',
  `MenuName` varchar(50) NOT NULL COMMENT '名称',
  `MenuDesc` varchar(256) DEFAULT NULL COMMENT '描述',
  `MenuImage` varchar(256) DEFAULT NULL COMMENT '菜单图片',
  `MenuStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商店菜单';

/*Data for the table `E_POSMenu` */

LOCK TABLES `E_POSMenu` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_POSMenuProduct` */

DROP TABLE IF EXISTS `E_POSMenuProduct`;

CREATE TABLE `E_POSMenuProduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `MenuID` int(11) NOT NULL COMMENT '菜单ID',
  `ProductID` int(11) NOT NULL COMMENT '产品ID',
  `MPStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`MenuID`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商店菜单产品';

/*Data for the table `E_POSMenuProduct` */

LOCK TABLES `E_POSMenuProduct` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_PackageCategory` */

DROP TABLE IF EXISTS `E_PackageCategory`;

CREATE TABLE `E_PackageCategory` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `PackageID` int(11) NOT NULL COMMENT '套餐ID',
  `PCName` varchar(50) NOT NULL COMMENT '名称',
  `MinSelectCount` int(2) NOT NULL DEFAULT '0' COMMENT '最小选择数量 大于0 表示必选',
  `MaxSelectCount` int(2) NOT NULL DEFAULT '1' COMMENT '最多可选数量',
  `PCDesc` varchar(256) DEFAULT NULL COMMENT '描述',
  `PCStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`PackageID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐子分类';

/*Data for the table `E_PackageCategory` */

LOCK TABLES `E_PackageCategory` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_PackageCategoryProduct` */

DROP TABLE IF EXISTS `E_PackageCategoryProduct`;

CREATE TABLE `E_PackageCategoryProduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `PackageCategoryID` int(11) NOT NULL COMMENT '套餐子分类ID',
  `ProductID` int(11) NOT NULL COMMENT '产品ID',
  `ProductPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '套餐项售价，默认都设置为0，以套餐主价格为准，因为套餐主价格可以根商店',
  `PCPStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`PackageCategoryID`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='套餐子分类产品';

/*Data for the table `E_PackageCategoryProduct` */

LOCK TABLES `E_PackageCategoryProduct` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_PaymentOption` */

DROP TABLE IF EXISTS `E_PaymentOption`;

CREATE TABLE `E_PaymentOption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `PaymentID` int(11) NOT NULL,
  `PaymentParam` text COMMENT '支付参数:json 加密',
  `PaymentStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付状态 1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业支付方式';

/*Data for the table `E_PaymentOption` */

LOCK TABLES `E_PaymentOption` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Product` */

DROP TABLE IF EXISTS `E_Product`;

CREATE TABLE `E_Product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `CategoryID` int(11) NOT NULL,
  `ProductSKU` varchar(20) NOT NULL COMMENT 'SKU',
  `ProductName` varchar(50) NOT NULL COMMENT '产品名称',
  `ProductType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '产品类型: 1产品; 2套餐;',
  `ProductDesc` varchar(256) DEFAULT NULL COMMENT '描述',
  `ProductImage` varchar(256) DEFAULT NULL COMMENT '产品图片',
  `ProductPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '产品价格',
  `ProductPackPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '打包价格',
  `UnitID` int(2) DEFAULT NULL COMMENT '产品单位',
  `ProductStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效;-1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `U_Index1` (`ProductSKU`),
  KEY `I_Index1` (`EnterpriseID`,`CategoryID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品';

/*Data for the table `E_Product` */

LOCK TABLES `E_Product` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_ProductInstructionType` */

DROP TABLE IF EXISTS `E_ProductInstructionType`;

CREATE TABLE `E_ProductInstructionType` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `ProductID` int(11) NOT NULL COMMENT '产品ID',
  `InstructionTypeID` int(11) NOT NULL COMMENT '指令类型ID',
  `CITStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`ProductID`,`InstructionTypeID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业产品指令关系';

/*Data for the table `E_ProductInstructionType` */

LOCK TABLES `E_ProductInstructionType` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Role` */

DROP TABLE IF EXISTS `E_Role`;

CREATE TABLE `E_Role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `RoleCode` varchar(50) NOT NULL COMMENT '角色代码',
  `RoleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `RoleDesc` varchar(256) DEFAULT NULL COMMENT '角色备注',
  `RoleStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`RoleCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业角色表';

/*Data for the table `E_Role` */

LOCK TABLES `E_Role` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_RoleFunction` */

DROP TABLE IF EXISTS `E_RoleFunction`;

CREATE TABLE `E_RoleFunction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `EnterpriseRoleID` int(11) NOT NULL,
  `FunctionID` int(11) NOT NULL,
  `RFStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`EnterpriseRoleID`,`FunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业角色功能表';

/*Data for the table `E_RoleFunction` */

LOCK TABLES `E_RoleFunction` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_RoleMenu` */

DROP TABLE IF EXISTS `E_RoleMenu`;

CREATE TABLE `E_RoleMenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `EnterpriseRoleID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `ERMStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`EnterpriseRoleID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业角色菜单表';

/*Data for the table `E_RoleMenu` */

LOCK TABLES `E_RoleMenu` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_Order` */

DROP TABLE IF EXISTS `E_S_Order`;

CREATE TABLE `E_S_Order` (
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 EnterpriseNo 4+StoreNo 2+来源类型 2+年 2 +月 2+日 2+小时 2+redis计数器 4',
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `StoreID` int(11) NOT NULL COMMENT '商店ID',
  `TableNo` varchar(5) DEFAULT NULL COMMENT '台号',
  `TotalPrice` decimal(19,2) NOT NULL COMMENT '总价',
  `ServiceCharge` decimal(19,2) NOT NULL COMMENT '服务费',
  `TotalDiscount` decimal(19,2) NOT NULL COMMENT '总折扣',
  `PaymentAmount` decimal(19,2) NOT NULL COMMENT '支付金额 = 总价+服务费-总折扣',
  `OrderSource` tinyint(1) NOT NULL DEFAULT '1' COMMENT '0 未知; 1 POS; 2 微信小程序; 3 美团; 4 饿了么; 5 口碑',
  `OrderType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 交易订单; 2 退款订单',
  `OrderStatus` tinyint(1) NOT NULL DEFAULT '0' COMMENT '-1 已取消; 0 待支付; 1 支付中; 2 支付完成; 3 已退款',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`OrderNo`),
  KEY `I_Index1` (`EnterpriseID`,`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单';

/*Data for the table `E_S_Order` */

LOCK TABLES `E_S_Order` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_OrderDiscount` */

DROP TABLE IF EXISTS `E_S_OrderDiscount`;

CREATE TABLE `E_S_OrderDiscount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 ',
  `DiscountAmount` decimal(19,2) NOT NULL COMMENT '单个折扣金额',
  `DiscountCode` varchar(256) NOT NULL COMMENT '折扣Code',
  `DiscountDesc` varchar(256) NOT NULL COMMENT '折扣描述',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效   -1 的产品是在下单过程中又删除的可能不记录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`OrderNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单折扣';

/*Data for the table `E_S_OrderDiscount` */

LOCK TABLES `E_S_OrderDiscount` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_OrderPayment` */

DROP TABLE IF EXISTS `E_S_OrderPayment`;

CREATE TABLE `E_S_OrderPayment` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 ',
  `PaymentAmount` decimal(19,2) NOT NULL COMMENT '支付金额',
  `ChangeAmount` decimal(19,2) NOT NULL COMMENT '找零',
  `PaymentID` int(11) NOT NULL COMMENT '支付ID',
  `PaymentName` varchar(50) NOT NULL COMMENT '支付方式名',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效   -1 的产品是在下单过程中又删除的可能不记录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`OrderNo`,`PaymentID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单支付方式';

/*Data for the table `E_S_OrderPayment` */

LOCK TABLES `E_S_OrderPayment` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_OrderProduct` */

DROP TABLE IF EXISTS `E_S_OrderProduct`;

CREATE TABLE `E_S_OrderProduct` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 ',
  `ParentID` int(11) NOT NULL DEFAULT '0' COMMENT '父节点',
  `ProductID` int(11) DEFAULT NULL COMMENT '产品ID',
  `ProductName` int(11) DEFAULT NULL COMMENT '产品名称-用于记录下单时对应的产品',
  `TotalPrice` decimal(19,2) NOT NULL COMMENT '总价',
  `Price` decimal(19,2) NOT NULL COMMENT '单价',
  `Qty` int(11) DEFAULT NULL COMMENT '数量',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效   -1 的产品是在下单过程中又删除的可能不记录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`OrderNo`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单产品';

/*Data for the table `E_S_OrderProduct` */

LOCK TABLES `E_S_OrderProduct` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_OrderProductDiscount` */

DROP TABLE IF EXISTS `E_S_OrderProductDiscount`;

CREATE TABLE `E_S_OrderProductDiscount` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 ',
  `OrderProductID` int(11) DEFAULT NULL COMMENT '订单产品记录ID',
  `TotalDiscountAmount` decimal(19,2) NOT NULL COMMENT '总折扣金额 = 单个折扣金额 * 数量',
  `DiscountAmount` decimal(19,2) NOT NULL COMMENT '单个折扣金额',
  `Qty` int(11) DEFAULT NULL COMMENT '数量',
  `DiscountCode` varchar(256) NOT NULL COMMENT '折扣Code',
  `DiscountDesc` varchar(256) NOT NULL COMMENT '折扣描述',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效   -1 的产品是在下单过程中又删除的可能不记录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`OrderNo`,`OrderProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单产品折扣';

/*Data for the table `E_S_OrderProductDiscount` */

LOCK TABLES `E_S_OrderProductDiscount` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_OrderProductInstruction` */

DROP TABLE IF EXISTS `E_S_OrderProductInstruction`;

CREATE TABLE `E_S_OrderProductInstruction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `OrderNo` varchar(20) NOT NULL COMMENT '订单号 ',
  `OrderProductID` int(11) DEFAULT NULL COMMENT '订单产品记录ID',
  `InstructionID` int(11) DEFAULT NULL COMMENT '指令ID',
  `InstructionName` int(11) DEFAULT NULL COMMENT '指令名称-用于记录下单时对应的产品',
  `TotalPrice` decimal(19,2) NOT NULL COMMENT '总价',
  `Price` decimal(19,2) NOT NULL COMMENT '单价',
  `Qty` int(11) DEFAULT NULL COMMENT '数量',
  `Status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效   -1 的产品是在下单过程中又删除的可能不记录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`OrderNo`,`OrderProductID`,`InstructionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='交易订单产品指令';

/*Data for the table `E_S_OrderProductInstruction` */

LOCK TABLES `E_S_OrderProductInstruction` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_POS` */

DROP TABLE IF EXISTS `E_S_POS`;

CREATE TABLE `E_S_POS` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `POSNumber` varchar(10) NOT NULL COMMENT '店铺号',
  `POSStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `POSDesc` varchar(256) DEFAULT NULL COMMENT 'pos描述',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `U_Index1` (`POSNumber`),
  KEY `I_Index1` (`EnterpriseID`,`StoreID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='pos';

/*Data for the table `E_S_POS` */

LOCK TABLES `E_S_POS` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_Product` */

DROP TABLE IF EXISTS `E_S_Product`;

CREATE TABLE `E_S_Product` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `StoreID` int(11) NOT NULL,
  `EPID` int(11) NOT NULL COMMENT '企业商品ID',
  `SPPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '商店售价',
  `SPStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `DaySaleStartHour` int(2) NOT NULL DEFAULT '0' COMMENT '一天的销售开始时间 小时',
  `DaySaleStartMinute` int(2) NOT NULL DEFAULT '0' COMMENT '一天的销售开始时间 分钟',
  `DaySaleEndHour` int(2) NOT NULL DEFAULT '23' COMMENT '一天的销售结束时间 小时',
  `DaySaleEndMinute` int(2) NOT NULL DEFAULT '59' COMMENT '一天的销售结束时间 分钟',
  `MondaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `TuesdaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `WednesdaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `ThursdaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `FridaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `SaturdaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `SundaySale` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 可销售; -1 不可销售',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`StoreID`,`EPID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商店产品';

/*Data for the table `E_S_Product` */

LOCK TABLES `E_S_Product` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_ProductRation` */

DROP TABLE IF EXISTS `E_S_ProductRation`;

CREATE TABLE `E_S_ProductRation` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL COMMENT '企业ID',
  `StoreID` int(11) NOT NULL COMMENT '商店ID',
  `ProductID` int(11) NOT NULL COMMENT '产品ID',
  `RationRule` tinyint(1) NOT NULL DEFAULT '1' COMMENT '配额规则 1 当天；2 永久',
  `RationCount` int(11) NOT NULL DEFAULT '0' COMMENT '配额数',
  `RationEffectiveDate` datetime DEFAULT NULL COMMENT '配额生效日期',
  `RationStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseID`,`StoreID`,`ProductID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='产品配额';

/*Data for the table `E_S_ProductRation` */

LOCK TABLES `E_S_ProductRation` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_S_User` */

DROP TABLE IF EXISTS `E_S_User`;

CREATE TABLE `E_S_User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `StoreID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `SUStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `u_index1` (`StoreID`,`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='店铺员工 非企业管理员只有这里有数据才能看到对应商店的信息';

/*Data for the table `E_S_User` */

LOCK TABLES `E_S_User` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Store` */

DROP TABLE IF EXISTS `E_Store`;

CREATE TABLE `E_Store` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `StoreNo` int(5) NOT NULL COMMENT '店铺号',
  `StoreName` varchar(50) DEFAULT NULL COMMENT '商店名称',
  `StorePhone1` varchar(20) DEFAULT NULL COMMENT '商店电话1',
  `StorePhone2` varchar(20) DEFAULT NULL COMMENT '商店电话2',
  `StoreAddress` varchar(256) DEFAULT NULL COMMENT '商店地址',
  `StoreDesc` varchar(256) DEFAULT NULL COMMENT '商店描述',
  `POSCount` int(3) NOT NULL DEFAULT '0' COMMENT '商店POS机数量',
  `ServiceChargeType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '服务费类型 0:按销售价格; 1: 按人数',
  `ServiceChargeRule` int(4) NOT NULL DEFAULT '0' COMMENT '如果类型为0，则该值为百分比；如果是按人数，该值为单个人的价格(单位分)',
  `PackPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '打包所需费用，如果按产品算则这里为0',
  `TakeawayPrice` decimal(19,2) NOT NULL DEFAULT '0.00' COMMENT '外卖费用',
  `StoreStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `BusinessStartHour` int(2) NOT NULL DEFAULT '0' COMMENT '商店营业开始小时',
  `BusinessStartMinute` int(2) NOT NULL DEFAULT '0' COMMENT '商店营业开始分钟',
  `BusinessEndHour` int(2) NOT NULL DEFAULT '23' COMMENT '商店营业结束小时',
  `BusinessEndMinute` int(2) NOT NULL DEFAULT '59' COMMENT '商店营业结束分钟',
  `BusinessState` int(1) NOT NULL DEFAULT '1' COMMENT '1 营业中; 2 休息',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `u_index` (`EnterpriseID`,`StoreNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='商店';

/*Data for the table `E_Store` */

LOCK TABLES `E_Store` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_Unit` */

DROP TABLE IF EXISTS `E_Unit`;

CREATE TABLE `E_Unit` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) DEFAULT NULL,
  `UnitCode` varchar(10) DEFAULT NULL COMMENT '单位Code',
  `UnitName` varchar(10) DEFAULT NULL COMMENT '单位名称',
  `UnitDesc` varchar(256) DEFAULT NULL COMMENT '单位描述',
  `UnitStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `U_Index1` (`UnitCode`),
  KEY `I_Index1` (`EnterpriseID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='单位';

/*Data for the table `E_Unit` */

LOCK TABLES `E_Unit` WRITE;

UNLOCK TABLES;

/*Table structure for table `E_User` */

DROP TABLE IF EXISTS `E_User`;

CREATE TABLE `E_User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseID` int(11) NOT NULL,
  `UserID` int(11) NOT NULL,
  `IsAdmin` tinyint(1) NOT NULL DEFAULT '0' COMMENT '1 管理者;0 员工',
  `WorkNumber` varchar(10) DEFAULT NULL COMMENT '工号',
  `EUStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效;-1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `u_index1` (`EnterpriseID`,`UserID`),
  KEY `u_index2` (`WorkNumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业用户';

/*Data for the table `E_User` */

LOCK TABLES `E_User` WRITE;

UNLOCK TABLES;

/*Table structure for table `Enterprise` */

DROP TABLE IF EXISTS `Enterprise`;

CREATE TABLE `Enterprise` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `EnterpriseNo` int(2) DEFAULT NULL COMMENT '企业号',
  `EnterpriseName` varchar(256) NOT NULL COMMENT '企业名称',
  `AdminUserID` int(11) DEFAULT NULL COMMENT '系统管理者ID',
  `EnterpriseDesc` text COMMENT '企业描述',
  `MaxStoreCount` int(5) NOT NULL DEFAULT '1' COMMENT '企业最多可建店铺数',
  `StoreCount` int(5) NOT NULL DEFAULT '0' COMMENT '企业店铺数',
  `StorePosMaxCount` int(3) NOT NULL DEFAULT '1' COMMENT '单店最多POS机数量',
  `EnterpriseStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效;-1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`EnterpriseNo`,`EnterpriseName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='企业表';

/*Data for the table `Enterprise` */

LOCK TABLES `Enterprise` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_DataDic` */

DROP TABLE IF EXISTS `P_DataDic`;

CREATE TABLE `P_DataDic` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `DDParentID` int(11) NOT NULL DEFAULT '0' COMMENT '值为0则标识为一级',
  `DDCode` varchar(50) NOT NULL COMMENT '代码',
  `DDName` varchar(50) DEFAULT NULL COMMENT '名称',
  `DDDesc` varchar(256) DEFAULT NULL COMMENT '名称',
  `DDStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `DDSort` int(11) NOT NULL DEFAULT '0' COMMENT '排序，越大越后，顺序',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `I_Index1` (`DDParentID`,`DDCode`)
) ENGINE=InnoDB AUTO_INCREMENT=55 DEFAULT CHARSET=utf8mb4 COMMENT='数据字典';

/*Data for the table `P_DataDic` */

LOCK TABLES `P_DataDic` WRITE;

insert  into `P_DataDic`(`ID`,`DDParentID`,`DDCode`,`DDName`,`DDDesc`,`DDStatus`,`DDSort`,`CreateTime`,`CreateUser`,`UpdateTime`,`UpdateUser`) values (1,0,'SEX','性别','用户的性别 0未知  1男  2女',1,0,'2018-09-05 17:22:18',1,NULL,NULL),(2,1,'0','未知',NULL,1,0,NULL,NULL,NULL,NULL),(3,1,'1','男',NULL,1,0,NULL,NULL,NULL,NULL),(4,1,'2','女',NULL,1,0,NULL,NULL,NULL,NULL),(5,0,'UType','用户类型','0 无所属用户; 1 平台用户;2 企业用户;',1,0,NULL,NULL,NULL,NULL),(6,5,'0','无所属用户',NULL,1,0,NULL,NULL,NULL,NULL),(7,5,'1','平台用户','后台管理使用',1,0,NULL,NULL,NULL,NULL),(8,5,'2','企业用户','从属于某个企业',1,0,NULL,NULL,NULL,NULL),(9,0,'Status','状态','1 有效; -1 无效 ',1,0,NULL,NULL,NULL,NULL),(10,9,'1','有效',NULL,1,0,NULL,NULL,NULL,NULL),(11,9,'-1','无效',NULL,1,0,NULL,NULL,NULL,NULL),(12,0,'MenuType','菜单类型','菜单类型 1 后台菜单; 2 POS菜单; 3 小程序菜单',1,0,NULL,NULL,NULL,NULL),(13,12,'1','后台菜单',NULL,1,0,NULL,NULL,NULL,NULL),(14,12,'2','POS菜单',NULL,1,0,NULL,NULL,NULL,NULL),(15,12,'3','小程序菜单',NULL,1,0,NULL,NULL,NULL,NULL),(16,0,'FunctionType','功能类型','功能类型 1 后台功能; 2 POS功能; 3 小程序功能',1,0,NULL,NULL,NULL,NULL),(17,16,'1','后台功能',NULL,1,0,NULL,NULL,NULL,NULL),(18,16,'2','POS功能',NULL,1,0,NULL,NULL,NULL,NULL),(19,16,'3','小程序功能',NULL,1,0,NULL,NULL,NULL,NULL),(20,0,'IsAdmin','是否管理者','1 管理者;0 员工',1,0,NULL,NULL,NULL,NULL),(22,20,'1','管理者',NULL,1,0,NULL,NULL,NULL,NULL),(23,20,'0','员工',NULL,1,0,NULL,NULL,NULL,NULL),(24,0,'ServiceChargeType','服务费类型','服务费类型 0:按销售价格; 1: 按人数',1,0,NULL,NULL,NULL,NULL),(25,24,'0','按销售价格','ServiceChargeRule 值为百分比',1,0,NULL,NULL,NULL,NULL),(26,24,'1','按人数','ServiceChargeRule 值为单个人的价格(单位分)',1,0,NULL,NULL,NULL,NULL),(27,0,'BusinessState','营业状态','控制商店的营业和休息1 营业中; 2 休息',1,0,NULL,NULL,NULL,NULL),(28,27,'1','营业中',NULL,1,0,NULL,NULL,NULL,NULL),(29,27,'2','休息',NULL,1,0,NULL,NULL,NULL,NULL),(30,0,'RationRule','配额规则','配额规则 1 当天；2 永久',1,0,NULL,NULL,NULL,NULL),(31,30,'1','当天',NULL,1,0,NULL,NULL,NULL,NULL),(32,30,'2','永久',NULL,1,0,NULL,NULL,NULL,NULL),(33,0,'SaleStatus','销售状态','1 可销售; -1 不可销售',1,0,NULL,NULL,NULL,NULL),(34,33,'1','可销售',NULL,1,0,NULL,NULL,NULL,NULL),(35,33,'-1','不可销售',NULL,1,0,NULL,NULL,NULL,NULL),(36,0,'OrderType','订单类型','1 交易订单; 2 退款订单',1,0,NULL,NULL,NULL,NULL),(37,36,'1','交易订单',NULL,1,0,NULL,NULL,NULL,NULL),(38,36,'2','退款订单',NULL,1,0,NULL,NULL,NULL,NULL),(39,0,'OrderSource','订单来源','0 未知; 1 POS; 2 微信小程序; 3 美团; 4 饿了么; 5 口碑',1,0,NULL,NULL,NULL,NULL),(40,39,'0','未知',NULL,1,0,NULL,NULL,NULL,NULL),(41,39,'1','POS',NULL,1,0,NULL,NULL,NULL,NULL),(42,39,'2','微信小程序',NULL,1,0,NULL,NULL,NULL,NULL),(43,39,'3','美团',NULL,1,0,NULL,NULL,NULL,NULL),(44,39,'4','饿了么',NULL,1,0,NULL,NULL,NULL,NULL),(45,39,'5','口碑',NULL,1,0,NULL,NULL,NULL,NULL),(46,0,'OrderStatus','订单状态','-1 已取消; 0 待支付; 1 支付中; 2 支付完成; 3 已退款',1,0,NULL,NULL,NULL,NULL),(47,46,'-1','已取消',NULL,1,0,NULL,NULL,NULL,NULL),(48,46,'0','待支付',NULL,1,0,NULL,NULL,NULL,NULL),(49,46,'1','支付中',NULL,1,0,NULL,NULL,NULL,NULL),(50,46,'2','支付完成',NULL,1,0,NULL,NULL,NULL,NULL),(51,46,'3','已退款',NULL,1,0,NULL,NULL,NULL,NULL),(52,0,'ProductType','产品类型','产品类型: 1产品; 2套餐;',1,0,NULL,NULL,NULL,NULL),(53,52,'1','产品',NULL,1,0,NULL,NULL,NULL,NULL),(54,52,'2','套餐',NULL,1,0,NULL,NULL,NULL,NULL);

UNLOCK TABLES;

/*Table structure for table `P_Function` */

DROP TABLE IF EXISTS `P_Function`;

CREATE TABLE `P_Function` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL DEFAULT '0',
  `FunctionCode` varchar(50) NOT NULL COMMENT '功能代码 前端和后端过滤通过这个进行',
  `FunctionName` varchar(50) DEFAULT NULL COMMENT '功能名称',
  `FunctionUrl` varchar(256) DEFAULT NULL COMMENT '功能URL',
  `FunctionType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '功能类型 1 后台功能; 2 POS功能; 3 小程序功能',
  `FunctionStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`ParentID`,`FunctionCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='功能表';

/*Data for the table `P_Function` */

LOCK TABLES `P_Function` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_Menu` */

DROP TABLE IF EXISTS `P_Menu`;

CREATE TABLE `P_Menu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ParentID` int(11) NOT NULL DEFAULT '0' COMMENT '值为0则标识为一级目录',
  `FunctionID` int(11) NOT NULL DEFAULT '0' COMMENT '功能ID',
  `MenuCode` varchar(50) NOT NULL COMMENT '功能代码 前端和后端过滤通过这个进行',
  `MenuName` varchar(50) DEFAULT NULL COMMENT '功能名称',
  `MenuDesc` varchar(256) DEFAULT NULL COMMENT '功能名称',
  `MenuUrl` varchar(256) DEFAULT NULL COMMENT '功能URL',
  `MenuType` tinyint(1) NOT NULL DEFAULT '1' COMMENT '菜单类型 1 后台菜单; 2 POS菜单; 3 小程序菜单',
  `MenuStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`ParentID`,`FunctionID`,`MenuCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='菜单表';

/*Data for the table `P_Menu` */

LOCK TABLES `P_Menu` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_PaymentOption` */

DROP TABLE IF EXISTS `P_PaymentOption`;

CREATE TABLE `P_PaymentOption` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PaymentCode` varchar(50) NOT NULL COMMENT '支付Code',
  `PaymentName` varchar(50) NOT NULL COMMENT '支付名称',
  `PaymentStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '支付状态 1 有效;  -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`PaymentCode`,`PaymentName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='支付方式';

/*Data for the table `P_PaymentOption` */

LOCK TABLES `P_PaymentOption` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_Role` */

DROP TABLE IF EXISTS `P_Role`;

CREATE TABLE `P_Role` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleCode` varchar(50) NOT NULL COMMENT '角色代码',
  `RoleName` varchar(50) DEFAULT NULL COMMENT '角色名称',
  `RoleDesc` varchar(256) DEFAULT NULL COMMENT '角色备注',
  `RoleStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`RoleCode`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COMMENT='平台角色表';

/*Data for the table `P_Role` */

LOCK TABLES `P_Role` WRITE;

insert  into `P_Role`(`ID`,`RoleCode`,`RoleName`,`RoleDesc`,`RoleStatus`,`CreateTime`,`CreateUser`,`UpdateTime`,`UpdateUser`) values (1,'Admin','系统管理组','系统管理组',1,'2018-08-28 07:59:53',1,'2018-08-28 16:22:10',1),(2,'EnterpriseAdmin','企业管理员','企业管理员',1,'2018-08-28 07:59:53',1,'2018-08-28 16:22:16',1);

UNLOCK TABLES;

/*Table structure for table `P_RoleFunction` */

DROP TABLE IF EXISTS `P_RoleFunction`;

CREATE TABLE `P_RoleFunction` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL,
  `FunctionID` int(11) NOT NULL,
  `RFStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`RoleID`,`FunctionID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台角色功能表';

/*Data for the table `P_RoleFunction` */

LOCK TABLES `P_RoleFunction` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_RoleMenu` */

DROP TABLE IF EXISTS `P_RoleMenu`;

CREATE TABLE `P_RoleMenu` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `RoleID` int(11) NOT NULL,
  `MenuID` int(11) NOT NULL,
  `RMStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`RoleID`,`MenuID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='平台角色菜单表';

/*Data for the table `P_RoleMenu` */

LOCK TABLES `P_RoleMenu` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_User` */

DROP TABLE IF EXISTS `P_User`;

CREATE TABLE `P_User` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Account` varchar(50) NOT NULL COMMENT '登录帐号=加密',
  `Phone` varchar(20) DEFAULT NULL COMMENT '手机号码=加密',
  `Email` varchar(256) DEFAULT NULL COMMENT '电子邮箱=加密',
  `Password` varchar(100) NOT NULL COMMENT '密码组成=md5(md5(account)+md5(password)+id)',
  `USex` tinyint(1) NOT NULL DEFAULT '0' COMMENT '性别 0未知  1男  2女',
  `UName` varchar(50) DEFAULT NULL COMMENT '名称',
  `UType` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0 无所属用户; 1 平台用户;2 企业用户;',
  `UStatus` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1 有效; -1 无效 无效的用户不能登录',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `u_account` (`Account`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表';

/*Data for the table `P_User` */

LOCK TABLES `P_User` WRITE;

UNLOCK TABLES;

/*Table structure for table `P_UserInfo` */

DROP TABLE IF EXISTS `P_UserInfo`;

CREATE TABLE `P_UserInfo` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `UserID` int(11) NOT NULL COMMENT '用户ID',
  `Address` varchar(256) DEFAULT NULL COMMENT '地址',
  `NickName` varchar(50) DEFAULT NULL COMMENT '昵称',
  `HeadImage` varchar(256) DEFAULT NULL COMMENT '头像地址',
  `CreateTime` datetime DEFAULT NULL COMMENT '创建时间',
  `CreateUser` int(11) DEFAULT NULL COMMENT '创建用户ID',
  `UpdateTime` datetime DEFAULT NULL COMMENT '修改时间',
  `UpdateUser` int(11) DEFAULT NULL COMMENT '修改用户ID',
  PRIMARY KEY (`ID`),
  KEY `U_Index1` (`UserID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COMMENT='用户表信息';

/*Data for the table `P_UserInfo` */

LOCK TABLES `P_UserInfo` WRITE;

UNLOCK TABLES;

/*Table structure for table `SYS_Log` */

DROP TABLE IF EXISTS `SYS_Log`;

CREATE TABLE `SYS_Log` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TableName` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '被操作的表名',
  `PrimaryKey` varchar(100) CHARACTER SET utf8 NOT NULL COMMENT '对应的主键值',
  `LogType` char(1) CHARACTER SET utf8 NOT NULL DEFAULT 'I' COMMENT '操作类型 I:插入 U:修改 D:删除',
  `OldContent` text CHARACTER SET utf8 COMMENT '操作前内容',
  `NewContent` text CHARACTER SET utf8 COMMENT '操作后内容',
  `Describe` varchar(256) CHARACTER SET utf8 DEFAULT NULL COMMENT '描述',
  `UserId` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `UserName` varchar(50) CHARACTER SET utf8 DEFAULT NULL,
  `CreateTime` datetime DEFAULT NULL,
  `SendType` tinyint(1) DEFAULT '0' COMMENT '发送类型 0:不需要发送 1:发送给创建人 2:发送给相关人员',
  `SendStatus` tinyint(1) DEFAULT '0' COMMENT '发送状态 0:未发送 1:已发送 -1:发送失败',
  `SendTime` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `I_Index1` (`TableName`,`PrimaryKey`)
) ENGINE=InnoDB AUTO_INCREMENT=117 DEFAULT CHARSET=utf8mb4 COMMENT='sys功能操作记录表，主要用于朔源';

/*Data for the table `SYS_Log` */

LOCK TABLES `SYS_Log` WRITE;

insert  into `SYS_Log`(`ID`,`TableName`,`PrimaryKey`,`LogType`,`OldContent`,`NewContent`,`Describe`,`UserId`,`UserName`,`CreateTime`,`SendType`,`SendStatus`,`SendTime`) values (9,'P_Role','23','I','','{\"ID\":\"23\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:22\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:23','1',NULL,'2018-08-28 07:59:22',0,0,NULL),(10,'P_Role','24','I','','{\"ID\":\"24\", \"RoleCode\":\"EnterpriseAdmin\", \"RoleName\":\"企业管理员\", \"RoleDesc\":\"企业管理员\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:22\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:24','1',NULL,'2018-08-28 07:59:22',0,0,NULL),(11,'P_Role','1','I','','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:1','1',NULL,'2018-08-28 07:59:53',0,0,NULL),(12,'P_Role','2','I','','{\"ID\":\"2\", \"RoleCode\":\"EnterpriseAdmin\", \"RoleName\":\"企业管理员\", \"RoleDesc\":\"企业管理员\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:2','1',NULL,'2018-08-28 07:59:53',0,0,NULL),(13,'P_Role','1','U','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:1',NULL,NULL,'2018-08-28 08:18:16',0,0,NULL),(14,'P_Role','1','U','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','修改:1','1',NULL,'2018-08-28 08:22:14',0,0,NULL),(15,'P_Role','2','U','{\"ID\":\"2\", \"RoleCode\":\"EnterpriseAdmin\", \"RoleName\":\"企业管理员\", \"RoleDesc\":\"企业管理员\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"2\", \"RoleCode\":\"EnterpriseAdmin\", \"RoleName\":\"企业管理员\", \"RoleDesc\":\"企业管理员\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:16\", \"UpdateUser\":\"1\"}','修改:2','1',NULL,'2018-08-28 08:22:19',0,0,NULL),(16,'P_Role','1','U','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','修改:1','1',NULL,'2018-08-28 08:22:22',0,0,NULL),(17,'P_Role','1','U','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','修改:1','1',NULL,'2018-08-28 09:07:14',0,0,NULL),(18,'P_Role','1','U','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组1\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','{\"ID\":\"1\", \"RoleCode\":\"Admin\", \"RoleName\":\"系统管理组\", \"RoleDesc\":\"系统管理组\", \"RoleStatus\":\"1\", \"CreateTime\":\"2018-08-28 07:59:53\", \"CreateUser\":\"1\", \"UpdateTime\":\"2018-08-28 16:22:10\", \"UpdateUser\":\"1\"}','修改:1','1',NULL,'2018-08-28 09:07:36',0,0,NULL),(19,'P_DataDic','1','I','','{\"ID\":\"1\", \"DDParentID\":\"0\", \"DDCode\":\"SEX\", \"DDName\":\"性别\", \"DDDesc\":\"用户的性别 0未知  1男  2女\", \"DDStatus\":\"1\", \"CreateTime\":\"2018-09-05 17:22:18\", \"CreateUser\":\"1\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:1','1',NULL,'2018-09-05 09:22:28',0,0,NULL),(20,'P_DataDic','2','I','','{\"ID\":\"2\", \"DDParentID\":\"1\", \"DDCode\":\"0\", \"DDName\":\"未知\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:2',NULL,NULL,'2018-09-05 09:23:26',0,0,NULL),(21,'P_DataDic','3','I','','{\"ID\":\"3\", \"DDParentID\":\"0\", \"DDCode\":\"1\", \"DDName\":\"男\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:3',NULL,NULL,'2018-09-05 09:23:35',0,0,NULL),(22,'P_DataDic','4','I','','{\"ID\":\"4\", \"DDParentID\":\"0\", \"DDCode\":\"2\", \"DDName\":\"女\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:4',NULL,NULL,'2018-09-05 09:23:42',0,0,NULL),(23,'P_DataDic','5','I','','{\"ID\":\"5\", \"DDParentID\":\"0\", \"DDCode\":\"UType\", \"DDName\":\"用户类型\", \"DDDesc\":\"0 无所属用户; 1 平台用户;2 企业用户;\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:5',NULL,NULL,'2018-09-05 09:24:07',0,0,NULL),(24,'P_DataDic','6','I','','{\"ID\":\"6\", \"DDParentID\":\"5\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:6',NULL,NULL,'2018-09-05 09:24:14',0,0,NULL),(25,'P_DataDic','6','U','{\"ID\":\"6\", \"DDParentID\":\"5\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"6\", \"DDParentID\":\"5\", \"DDCode\":\"0\", \"DDName\":\"无所属用户\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:6',NULL,NULL,'2018-09-05 09:24:19',0,0,NULL),(26,'P_DataDic','3','U','{\"ID\":\"3\", \"DDParentID\":\"0\", \"DDCode\":\"1\", \"DDName\":\"男\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"3\", \"DDParentID\":\"1\", \"DDCode\":\"1\", \"DDName\":\"男\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:3',NULL,NULL,'2018-09-05 09:24:20',0,0,NULL),(27,'P_DataDic','4','U','{\"ID\":\"4\", \"DDParentID\":\"0\", \"DDCode\":\"2\", \"DDName\":\"女\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"4\", \"DDParentID\":\"1\", \"DDCode\":\"2\", \"DDName\":\"女\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:4',NULL,NULL,'2018-09-05 09:24:22',0,0,NULL),(28,'P_DataDic','7','I','','{\"ID\":\"7\", \"DDParentID\":\"5\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:7',NULL,NULL,'2018-09-05 09:24:27',0,0,NULL),(29,'P_DataDic','7','U','{\"ID\":\"7\", \"DDParentID\":\"5\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"7\", \"DDParentID\":\"5\", \"DDCode\":\"1\", \"DDName\":\"平台用户\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:7',NULL,NULL,'2018-09-05 09:24:33',0,0,NULL),(30,'P_DataDic','8','I','','{\"ID\":\"8\", \"DDParentID\":\"5\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:8',NULL,NULL,'2018-09-05 09:24:40',0,0,NULL),(31,'P_DataDic','8','U','{\"ID\":\"8\", \"DDParentID\":\"5\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"8\", \"DDParentID\":\"5\", \"DDCode\":\"2\", \"DDName\":\"企业用户\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:8',NULL,NULL,'2018-09-05 09:24:44',0,0,NULL),(32,'P_DataDic','7','U','{\"ID\":\"7\", \"DDParentID\":\"5\", \"DDCode\":\"1\", \"DDName\":\"平台用户\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"7\", \"DDParentID\":\"5\", \"DDCode\":\"1\", \"DDName\":\"平台用户\", \"DDDesc\":\"后台管理使用\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:7',NULL,NULL,'2018-09-05 09:25:01',0,0,NULL),(33,'P_DataDic','8','U','{\"ID\":\"8\", \"DDParentID\":\"5\", \"DDCode\":\"2\", \"DDName\":\"企业用户\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"8\", \"DDParentID\":\"5\", \"DDCode\":\"2\", \"DDName\":\"企业用户\", \"DDDesc\":\"从属于某个企业\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:8',NULL,NULL,'2018-09-05 09:25:14',0,0,NULL),(34,'P_DataDic','9','I','','{\"ID\":\"9\", \"DDParentID\":\"0\", \"DDCode\":\"Status\", \"DDName\":\"状态\", \"DDDesc\":\"1 有效; -1 无效 \", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:9',NULL,NULL,'2018-09-05 09:25:49',0,0,NULL),(35,'P_DataDic','10','I','','{\"ID\":\"10\", \"DDParentID\":\"0\", \"DDCode\":\"1\", \"DDName\":\"有效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:10',NULL,NULL,'2018-09-05 09:25:56',0,0,NULL),(36,'P_DataDic','11','I','','{\"ID\":\"11\", \"DDParentID\":\"0\", \"DDCode\":\"-1\", \"DDName\":\"无效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:11',NULL,NULL,'2018-09-05 09:26:07',0,0,NULL),(37,'P_DataDic','12','I','','{\"ID\":\"12\", \"DDParentID\":\"0\", \"DDCode\":\"MenuType\", \"DDName\":\"菜单类型\", \"DDDesc\":\"菜单类型 1 后台菜单; 2 POS菜单; 3 小程序菜单\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:12',NULL,NULL,'2018-09-05 09:30:15',0,0,NULL),(38,'P_DataDic','13','I','','{\"ID\":\"13\", \"DDParentID\":\"12\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:13',NULL,NULL,'2018-09-05 09:30:22',0,0,NULL),(39,'P_DataDic','14','I','','{\"ID\":\"14\", \"DDParentID\":\"12\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:14',NULL,NULL,'2018-09-05 09:30:27',0,0,NULL),(40,'P_DataDic','14','U','{\"ID\":\"14\", \"DDParentID\":\"12\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"14\", \"DDParentID\":\"12\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:14',NULL,NULL,'2018-09-05 09:30:29',0,0,NULL),(41,'P_DataDic','15','I','','{\"ID\":\"15\", \"DDParentID\":\"12\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:15',NULL,NULL,'2018-09-05 09:30:36',0,0,NULL),(42,'P_DataDic','13','U','{\"ID\":\"13\", \"DDParentID\":\"12\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"13\", \"DDParentID\":\"12\", \"DDCode\":\"1\", \"DDName\":\"后台菜单\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:13',NULL,NULL,'2018-09-05 09:30:40',0,0,NULL),(43,'P_DataDic','14','U','{\"ID\":\"14\", \"DDParentID\":\"12\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"14\", \"DDParentID\":\"12\", \"DDCode\":\"2\", \"DDName\":\"POS菜单\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:14',NULL,NULL,'2018-09-05 09:30:44',0,0,NULL),(44,'P_DataDic','15','U','{\"ID\":\"15\", \"DDParentID\":\"12\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"15\", \"DDParentID\":\"12\", \"DDCode\":\"3\", \"DDName\":\"小程序菜单\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:15',NULL,NULL,'2018-09-05 09:30:44',0,0,NULL),(45,'P_DataDic','16','I','','{\"ID\":\"16\", \"DDParentID\":\"0\", \"DDCode\":\"FunctionType\", \"DDName\":\"功能类型\", \"DDDesc\":\"功能类型 1 后台功能; 2 POS功能; 3 小程序功能\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:16',NULL,NULL,'2018-09-05 09:31:13',0,0,NULL),(46,'P_DataDic','17','I','','{\"ID\":\"17\", \"DDParentID\":\"16\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:17',NULL,NULL,'2018-09-05 09:31:23',0,0,NULL),(47,'P_DataDic','18','I','','{\"ID\":\"18\", \"DDParentID\":\"16\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:18',NULL,NULL,'2018-09-05 09:31:26',0,0,NULL),(48,'P_DataDic','19','I','','{\"ID\":\"19\", \"DDParentID\":\"16\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:19',NULL,NULL,'2018-09-05 09:31:30',0,0,NULL),(49,'P_DataDic','17','U','{\"ID\":\"17\", \"DDParentID\":\"16\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"17\", \"DDParentID\":\"16\", \"DDCode\":\"1\", \"DDName\":\"后台功能\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:17',NULL,NULL,'2018-09-05 09:31:34',0,0,NULL),(50,'P_DataDic','18','U','{\"ID\":\"18\", \"DDParentID\":\"16\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"18\", \"DDParentID\":\"16\", \"DDCode\":\"2\", \"DDName\":\"POS功能\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:18',NULL,NULL,'2018-09-05 09:31:38',0,0,NULL),(51,'P_DataDic','19','U','{\"ID\":\"19\", \"DDParentID\":\"16\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"19\", \"DDParentID\":\"16\", \"DDCode\":\"3\", \"DDName\":\"小程序功能\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:19',NULL,NULL,'2018-09-05 09:31:42',0,0,NULL),(52,'P_DataDic','20','I','','{\"ID\":\"20\", \"DDParentID\":\"0\", \"DDCode\":\"IsAdmin\", \"DDName\":\"是否管理者\", \"DDDesc\":\"1 管理者;0 员工\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:20',NULL,NULL,'2018-09-05 09:32:23',0,0,NULL),(53,'P_DataDic','22','I','','{\"ID\":\"22\", \"DDParentID\":\"20\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:22',NULL,NULL,'2018-09-05 09:32:37',0,0,NULL),(54,'P_DataDic','22','U','{\"ID\":\"22\", \"DDParentID\":\"20\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"22\", \"DDParentID\":\"20\", \"DDCode\":\"1\", \"DDName\":\"管理者\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:22',NULL,NULL,'2018-09-05 09:32:41',0,0,NULL),(55,'P_DataDic','23','I','','{\"ID\":\"23\", \"DDParentID\":\"20\", \"DDCode\":\"0\", \"DDName\":\"员工\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:23',NULL,NULL,'2018-09-05 09:32:49',0,0,NULL),(56,'P_DataDic','24','I','','{\"ID\":\"24\", \"DDParentID\":\"0\", \"DDCode\":\"ServiceChargeType\", \"DDName\":\"服务费类型\", \"DDDesc\":\"服务费类型 0:按销售价格; 1: 按人数\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:24',NULL,NULL,'2018-09-05 09:33:17',0,0,NULL),(57,'P_DataDic','25','I','','{\"ID\":\"25\", \"DDParentID\":\"24\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:25',NULL,NULL,'2018-09-05 09:33:25',0,0,NULL),(58,'P_DataDic','26','I','','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:26',NULL,NULL,'2018-09-05 09:33:35',0,0,NULL),(59,'P_DataDic','25','U','{\"ID\":\"25\", \"DDParentID\":\"24\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"25\", \"DDParentID\":\"24\", \"DDCode\":\"0\", \"DDName\":\"按销售价格\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:25',NULL,NULL,'2018-09-05 09:33:40',0,0,NULL),(60,'P_DataDic','26','U','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"按人数\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:26',NULL,NULL,'2018-09-05 09:33:41',0,0,NULL),(61,'P_DataDic','25','U','{\"ID\":\"25\", \"DDParentID\":\"24\", \"DDCode\":\"0\", \"DDName\":\"按销售价格\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"25\", \"DDParentID\":\"24\", \"DDCode\":\"0\", \"DDName\":\"按销售价格\", \"DDDesc\":\"ServiceChargeRule 值为百分比\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:25',NULL,NULL,'2018-09-05 09:34:30',0,0,NULL),(62,'P_DataDic','26','U','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"按人数\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"按人数\", \"DDDesc\":\"该值为单个人的价格(单位分)\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:26',NULL,NULL,'2018-09-05 09:34:31',0,0,NULL),(63,'P_DataDic','26','U','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"按人数\", \"DDDesc\":\"该值为单个人的价格(单位分)\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"26\", \"DDParentID\":\"24\", \"DDCode\":\"1\", \"DDName\":\"按人数\", \"DDDesc\":\"ServiceChargeRule 值为单个人的价格(单位分)\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:26',NULL,NULL,'2018-09-05 09:34:40',0,0,NULL),(64,'P_DataDic','27','I','','{\"ID\":\"27\", \"DDParentID\":\"0\", \"DDCode\":\"BusinessState\", \"DDName\":\"营业状态\", \"DDDesc\":\"控制商店的营业和休息\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:27',NULL,NULL,'2018-09-05 09:35:26',0,0,NULL),(65,'P_DataDic','28','I','','{\"ID\":\"28\", \"DDParentID\":\"27\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:28',NULL,NULL,'2018-09-05 09:35:35',0,0,NULL),(66,'P_DataDic','29','I','','{\"ID\":\"29\", \"DDParentID\":\"27\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:29',NULL,NULL,'2018-09-05 09:35:38',0,0,NULL),(67,'P_DataDic','27','U','{\"ID\":\"27\", \"DDParentID\":\"0\", \"DDCode\":\"BusinessState\", \"DDName\":\"营业状态\", \"DDDesc\":\"控制商店的营业和休息\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"27\", \"DDParentID\":\"0\", \"DDCode\":\"BusinessState\", \"DDName\":\"营业状态\", \"DDDesc\":\"控制商店的营业和休息1 营业中; 2 休息\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:27',NULL,NULL,'2018-09-05 09:35:58',0,0,NULL),(68,'P_DataDic','28','U','{\"ID\":\"28\", \"DDParentID\":\"27\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"28\", \"DDParentID\":\"27\", \"DDCode\":\"1\", \"DDName\":\"营业中\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:28',NULL,NULL,'2018-09-05 09:35:58',0,0,NULL),(69,'P_DataDic','29','U','{\"ID\":\"29\", \"DDParentID\":\"27\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"29\", \"DDParentID\":\"27\", \"DDCode\":\"2\", \"DDName\":\"休息\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:29',NULL,NULL,'2018-09-05 09:36:02',0,0,NULL),(70,'P_DataDic','30','I','','{\"ID\":\"30\", \"DDParentID\":\"0\", \"DDCode\":\"RationRule\", \"DDName\":\"配额规则\", \"DDDesc\":\"配额规则 1 当天；2 永久\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:30',NULL,NULL,'2018-09-05 09:36:34',0,0,NULL),(71,'P_DataDic','31','I','','{\"ID\":\"31\", \"DDParentID\":\"30\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:31',NULL,NULL,'2018-09-05 09:36:40',0,0,NULL),(72,'P_DataDic','32','I','','{\"ID\":\"32\", \"DDParentID\":\"30\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:32',NULL,NULL,'2018-09-05 09:36:44',0,0,NULL),(73,'P_DataDic','10','U','{\"ID\":\"10\", \"DDParentID\":\"0\", \"DDCode\":\"1\", \"DDName\":\"有效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"10\", \"DDParentID\":\"9\", \"DDCode\":\"1\", \"DDName\":\"有效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:10',NULL,NULL,'2018-09-05 09:36:53',0,0,NULL),(74,'P_DataDic','11','U','{\"ID\":\"11\", \"DDParentID\":\"0\", \"DDCode\":\"-1\", \"DDName\":\"无效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"11\", \"DDParentID\":\"9\", \"DDCode\":\"-1\", \"DDName\":\"无效\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:11',NULL,NULL,'2018-09-05 09:36:54',0,0,NULL),(75,'P_DataDic','31','U','{\"ID\":\"31\", \"DDParentID\":\"30\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"31\", \"DDParentID\":\"30\", \"DDCode\":\"1\", \"DDName\":\"当天\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:31',NULL,NULL,'2018-09-05 09:37:08',0,0,NULL),(76,'P_DataDic','32','U','{\"ID\":\"32\", \"DDParentID\":\"30\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"32\", \"DDParentID\":\"30\", \"DDCode\":\"2\", \"DDName\":\"永久\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:32',NULL,NULL,'2018-09-05 09:37:09',0,0,NULL),(77,'P_DataDic','33','I','','{\"ID\":\"33\", \"DDParentID\":\"0\", \"DDCode\":\"SaleStatus\", \"DDName\":\"销售状态\", \"DDDesc\":\"1 可销售; -1 不可销售\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:33',NULL,NULL,'2018-09-05 09:37:49',0,0,NULL),(78,'P_DataDic','34','I','','{\"ID\":\"34\", \"DDParentID\":\"33\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:34',NULL,NULL,'2018-09-05 09:37:55',0,0,NULL),(79,'P_DataDic','35','I','','{\"ID\":\"35\", \"DDParentID\":\"33\", \"DDCode\":\"-1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:35',NULL,NULL,'2018-09-05 09:37:58',0,0,NULL),(80,'P_DataDic','34','U','{\"ID\":\"34\", \"DDParentID\":\"33\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"34\", \"DDParentID\":\"33\", \"DDCode\":\"1\", \"DDName\":\"可销售\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:34',NULL,NULL,'2018-09-05 09:38:03',0,0,NULL),(81,'P_DataDic','35','U','{\"ID\":\"35\", \"DDParentID\":\"33\", \"DDCode\":\"-1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"35\", \"DDParentID\":\"33\", \"DDCode\":\"-1\", \"DDName\":\"不可销售\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:35',NULL,NULL,'2018-09-05 09:38:06',0,0,NULL),(82,'P_DataDic','36','I','','{\"ID\":\"36\", \"DDParentID\":\"0\", \"DDCode\":\"OrderType\", \"DDName\":\"订单类型\", \"DDDesc\":\"1 交易订单; 2 退款订单\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:36',NULL,NULL,'2018-09-05 09:38:56',0,0,NULL),(83,'P_DataDic','37','I','','{\"ID\":\"37\", \"DDParentID\":\"36\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:37',NULL,NULL,'2018-09-05 09:39:02',0,0,NULL),(84,'P_DataDic','38','I','','{\"ID\":\"38\", \"DDParentID\":\"36\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:38',NULL,NULL,'2018-09-05 09:39:05',0,0,NULL),(85,'P_DataDic','37','U','{\"ID\":\"37\", \"DDParentID\":\"36\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"37\", \"DDParentID\":\"36\", \"DDCode\":\"1\", \"DDName\":\"交易订单\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:37',NULL,NULL,'2018-09-05 09:39:10',0,0,NULL),(86,'P_DataDic','38','U','{\"ID\":\"38\", \"DDParentID\":\"36\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"38\", \"DDParentID\":\"36\", \"DDCode\":\"2\", \"DDName\":\"退款订单\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:38',NULL,NULL,'2018-09-05 09:39:14',0,0,NULL),(87,'P_DataDic','39','I','','{\"ID\":\"39\", \"DDParentID\":\"0\", \"DDCode\":\"OrderSource\", \"DDName\":\"订单来源\", \"DDDesc\":\"0 未知; 1 POS; 2 微信小程序; 3 美团; 4 饿了么; 5 口碑\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:39',NULL,NULL,'2018-09-05 09:39:33',0,0,NULL),(88,'P_DataDic','40','I','','{\"ID\":\"40\", \"DDParentID\":\"39\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:40',NULL,NULL,'2018-09-05 09:39:42',0,0,NULL),(89,'P_DataDic','40','U','{\"ID\":\"40\", \"DDParentID\":\"39\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"40\", \"DDParentID\":\"39\", \"DDCode\":\"0\", \"DDName\":\"未知\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:40',NULL,NULL,'2018-09-05 09:39:46',0,0,NULL),(90,'P_DataDic','41','I','','{\"ID\":\"41\", \"DDParentID\":\"39\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:41',NULL,NULL,'2018-09-05 09:39:51',0,0,NULL),(91,'P_DataDic','42','I','','{\"ID\":\"42\", \"DDParentID\":\"39\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:42',NULL,NULL,'2018-09-05 09:39:56',0,0,NULL),(92,'P_DataDic','43','I','','{\"ID\":\"43\", \"DDParentID\":\"39\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:43',NULL,NULL,'2018-09-05 09:39:59',0,0,NULL),(93,'P_DataDic','44','I','','{\"ID\":\"44\", \"DDParentID\":\"39\", \"DDCode\":\"4\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:44',NULL,NULL,'2018-09-05 09:40:02',0,0,NULL),(94,'P_DataDic','45','I','','{\"ID\":\"45\", \"DDParentID\":\"39\", \"DDCode\":\"5\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:45',NULL,NULL,'2018-09-05 09:40:09',0,0,NULL),(95,'P_DataDic','41','U','{\"ID\":\"41\", \"DDParentID\":\"39\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"41\", \"DDParentID\":\"39\", \"DDCode\":\"1\", \"DDName\":\"POS\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:41',NULL,NULL,'2018-09-05 09:40:13',0,0,NULL),(96,'P_DataDic','42','U','{\"ID\":\"42\", \"DDParentID\":\"39\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"42\", \"DDParentID\":\"39\", \"DDCode\":\"2\", \"DDName\":\"微信小程序\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:42',NULL,NULL,'2018-09-05 09:40:17',0,0,NULL),(97,'P_DataDic','43','U','{\"ID\":\"43\", \"DDParentID\":\"39\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"43\", \"DDParentID\":\"39\", \"DDCode\":\"3\", \"DDName\":\"美团\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:43',NULL,NULL,'2018-09-05 09:40:21',0,0,NULL),(98,'P_DataDic','44','U','{\"ID\":\"44\", \"DDParentID\":\"39\", \"DDCode\":\"4\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"44\", \"DDParentID\":\"39\", \"DDCode\":\"4\", \"DDName\":\"饿了么\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:44',NULL,NULL,'2018-09-05 09:40:25',0,0,NULL),(99,'P_DataDic','45','U','{\"ID\":\"45\", \"DDParentID\":\"39\", \"DDCode\":\"5\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"45\", \"DDParentID\":\"39\", \"DDCode\":\"5\", \"DDName\":\"口碑\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:45',NULL,NULL,'2018-09-05 09:40:26',0,0,NULL),(100,'P_DataDic','46','I','','{\"ID\":\"46\", \"DDParentID\":\"0\", \"DDCode\":\"OrderStatus\", \"DDName\":\"订单状态\", \"DDDesc\":\"-1 已取消; 0 待支付; 1 支付中; 2 支付完成; 3 已退款\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:46',NULL,NULL,'2018-09-05 09:40:46',0,0,NULL),(101,'P_DataDic','47','I','','{\"ID\":\"47\", \"DDParentID\":\"46\", \"DDCode\":\"-1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:47',NULL,NULL,'2018-09-05 09:40:53',0,0,NULL),(102,'P_DataDic','48','I','','{\"ID\":\"48\", \"DDParentID\":\"46\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:48',NULL,NULL,'2018-09-05 09:40:57',0,0,NULL),(103,'P_DataDic','49','I','','{\"ID\":\"49\", \"DDParentID\":\"46\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:49',NULL,NULL,'2018-09-05 09:40:59',0,0,NULL),(104,'P_DataDic','50','I','','{\"ID\":\"50\", \"DDParentID\":\"46\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:50',NULL,NULL,'2018-09-05 09:41:03',0,0,NULL),(105,'P_DataDic','51','I','','{\"ID\":\"51\", \"DDParentID\":\"46\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:51',NULL,NULL,'2018-09-05 09:41:05',0,0,NULL),(106,'P_DataDic','47','U','{\"ID\":\"47\", \"DDParentID\":\"46\", \"DDCode\":\"-1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"47\", \"DDParentID\":\"46\", \"DDCode\":\"-1\", \"DDName\":\"已取消\", \"DDDesc\":\"已取消\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:47',NULL,NULL,'2018-09-05 09:41:12',0,0,NULL),(107,'P_DataDic','47','U','{\"ID\":\"47\", \"DDParentID\":\"46\", \"DDCode\":\"-1\", \"DDName\":\"已取消\", \"DDDesc\":\"已取消\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"47\", \"DDParentID\":\"46\", \"DDCode\":\"-1\", \"DDName\":\"已取消\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:47',NULL,NULL,'2018-09-05 09:41:17',0,0,NULL),(108,'P_DataDic','48','U','{\"ID\":\"48\", \"DDParentID\":\"46\", \"DDCode\":\"0\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"48\", \"DDParentID\":\"46\", \"DDCode\":\"0\", \"DDName\":\"待支付\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:48',NULL,NULL,'2018-09-05 09:41:20',0,0,NULL),(109,'P_DataDic','49','U','{\"ID\":\"49\", \"DDParentID\":\"46\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"49\", \"DDParentID\":\"46\", \"DDCode\":\"1\", \"DDName\":\"支付中\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:49',NULL,NULL,'2018-09-05 09:41:23',0,0,NULL),(110,'P_DataDic','50','U','{\"ID\":\"50\", \"DDParentID\":\"46\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"50\", \"DDParentID\":\"46\", \"DDCode\":\"2\", \"DDName\":\"支付完成\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:50',NULL,NULL,'2018-09-05 09:41:26',0,0,NULL),(111,'P_DataDic','51','U','{\"ID\":\"51\", \"DDParentID\":\"46\", \"DDCode\":\"3\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"51\", \"DDParentID\":\"46\", \"DDCode\":\"3\", \"DDName\":\"已退款\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:51',NULL,NULL,'2018-09-05 09:41:44',0,0,NULL),(112,'P_DataDic','52','I','','{\"ID\":\"52\", \"DDParentID\":\"0\", \"DDCode\":\"ProductType\", \"DDName\":\"产品类型\", \"DDDesc\":\"产品类型: 1产品; 2套餐;\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:52',NULL,NULL,'2018-09-05 09:41:55',0,0,NULL),(113,'P_DataDic','53','I','','{\"ID\":\"53\", \"DDParentID\":\"52\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:53',NULL,NULL,'2018-09-05 09:42:01',0,0,NULL),(114,'P_DataDic','54','I','','{\"ID\":\"54\", \"DDParentID\":\"52\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','新增:54',NULL,NULL,'2018-09-05 09:42:09',0,0,NULL),(115,'P_DataDic','53','U','{\"ID\":\"53\", \"DDParentID\":\"52\", \"DDCode\":\"1\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"53\", \"DDParentID\":\"52\", \"DDCode\":\"1\", \"DDName\":\"产品\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:53',NULL,NULL,'2018-09-05 09:42:14',0,0,NULL),(116,'P_DataDic','54','U','{\"ID\":\"54\", \"DDParentID\":\"52\", \"DDCode\":\"2\", \"DDName\":\"\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','{\"ID\":\"54\", \"DDParentID\":\"52\", \"DDCode\":\"2\", \"DDName\":\"套餐\", \"DDDesc\":\"\", \"DDStatus\":\"1\", \"DDSort\":\"0\", \"CreateTime\":\"\", \"CreateUser\":\"\", \"UpdateTime\":\"\", \"UpdateUser\":\"\"}','修改:54',NULL,NULL,'2018-09-05 09:42:14',0,0,NULL);

UNLOCK TABLES;

/* Trigger structure for table `E_Category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Category_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Category_insert_after` AFTER INSERT ON `E_Category` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Category',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CName":"',IFNULL(new.CName,''),'", ','"CDesc":"',IFNULL(new.CDesc,''),'", ','"CStatus":"',IFNULL(new.CStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Category_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Category_update_after` AFTER UPDATE ON `E_Category` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Category',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CName":"',IFNULL(old.CName,''),'", ','"CDesc":"',IFNULL(old.CDesc,''),'", ','"CStatus":"',IFNULL(old.CStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CName":"',IFNULL(new.CName,''),'", ','"CDesc":"',IFNULL(new.CDesc,''),'", ','"CStatus":"',IFNULL(new.CStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Category` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Category_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Category_delete_after` AFTER DELETE ON `E_Category` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Category',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CName":"',IFNULL(old.CName,''),'", ','"CDesc":"',IFNULL(old.CDesc,''),'", ','"CStatus":"',IFNULL(old.CStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_CatrgoryInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_CatrgoryInstructionType_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_CatrgoryInstructionType_insert_after` AFTER INSERT ON `E_CatrgoryInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_CatrgoryInstructionType',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(new.CategoryID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(new.CITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_CatrgoryInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_CatrgoryInstructionType_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_CatrgoryInstructionType_update_after` AFTER UPDATE ON `E_CatrgoryInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_CatrgoryInstructionType',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(old.CategoryID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(old.CITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(new.CategoryID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(new.CITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_CatrgoryInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_CatrgoryInstructionType_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_CatrgoryInstructionType_delete_after` AFTER DELETE ON `E_CatrgoryInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_CatrgoryInstructionType',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(old.CategoryID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(old.CITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Function_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Function_insert_after` AFTER INSERT ON `E_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Function',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"EFStatus":"',IFNULL(new.EFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Function_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Function_update_after` AFTER UPDATE ON `E_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Function',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"EFStatus":"',IFNULL(old.EFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"EFStatus":"',IFNULL(new.EFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Function_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Function_delete_after` AFTER DELETE ON `E_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Function',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"EFStatus":"',IFNULL(old.EFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Instruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Instruction_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Instruction_insert_after` AFTER INSERT ON `E_Instruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Instruction',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"IName":"',IFNULL(new.IName,''),'", ','"IDesc":"',IFNULL(new.IDesc,''),'", ','"IPrice":"',IFNULL(new.IPrice,''),'", ','"IStatus":"',IFNULL(new.IStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Instruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Instruction_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Instruction_update_after` AFTER UPDATE ON `E_Instruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Instruction',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"IName":"',IFNULL(old.IName,''),'", ','"IDesc":"',IFNULL(old.IDesc,''),'", ','"IPrice":"',IFNULL(old.IPrice,''),'", ','"IStatus":"',IFNULL(old.IStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"IName":"',IFNULL(new.IName,''),'", ','"IDesc":"',IFNULL(new.IDesc,''),'", ','"IPrice":"',IFNULL(new.IPrice,''),'", ','"IStatus":"',IFNULL(new.IStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Instruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Instruction_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Instruction_delete_after` AFTER DELETE ON `E_Instruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Instruction',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"IName":"',IFNULL(old.IName,''),'", ','"IDesc":"',IFNULL(old.IDesc,''),'", ','"IPrice":"',IFNULL(old.IPrice,''),'", ','"IStatus":"',IFNULL(old.IStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_InstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_InstructionType_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_InstructionType_insert_after` AFTER INSERT ON `E_InstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_InstructionType',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ITName":"',IFNULL(new.ITName,''),'", ','"MinSelectCount":"',IFNULL(new.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(new.MaxSelectCount,''),'", ','"ITDesc":"',IFNULL(new.ITDesc,''),'", ','"ITStatus":"',IFNULL(new.ITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_InstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_InstructionType_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_InstructionType_update_after` AFTER UPDATE ON `E_InstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_InstructionType',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ITName":"',IFNULL(old.ITName,''),'", ','"MinSelectCount":"',IFNULL(old.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(old.MaxSelectCount,''),'", ','"ITDesc":"',IFNULL(old.ITDesc,''),'", ','"ITStatus":"',IFNULL(old.ITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ITName":"',IFNULL(new.ITName,''),'", ','"MinSelectCount":"',IFNULL(new.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(new.MaxSelectCount,''),'", ','"ITDesc":"',IFNULL(new.ITDesc,''),'", ','"ITStatus":"',IFNULL(new.ITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_InstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_InstructionType_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_InstructionType_delete_after` AFTER DELETE ON `E_InstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_InstructionType',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ITName":"',IFNULL(old.ITName,''),'", ','"MinSelectCount":"',IFNULL(old.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(old.MaxSelectCount,''),'", ','"ITDesc":"',IFNULL(old.ITDesc,''),'", ','"ITStatus":"',IFNULL(old.ITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenu_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenu_insert_after` AFTER INSERT ON `E_POSMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenu',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ParentMenuID":"',IFNULL(new.ParentMenuID,''),'", ','"MenuName":"',IFNULL(new.MenuName,''),'", ','"MenuDesc":"',IFNULL(new.MenuDesc,''),'", ','"MenuImage":"',IFNULL(new.MenuImage,''),'", ','"MenuStatus":"',IFNULL(new.MenuStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenu_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenu_update_after` AFTER UPDATE ON `E_POSMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenu',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ParentMenuID":"',IFNULL(old.ParentMenuID,''),'", ','"MenuName":"',IFNULL(old.MenuName,''),'", ','"MenuDesc":"',IFNULL(old.MenuDesc,''),'", ','"MenuImage":"',IFNULL(old.MenuImage,''),'", ','"MenuStatus":"',IFNULL(old.MenuStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ParentMenuID":"',IFNULL(new.ParentMenuID,''),'", ','"MenuName":"',IFNULL(new.MenuName,''),'", ','"MenuDesc":"',IFNULL(new.MenuDesc,''),'", ','"MenuImage":"',IFNULL(new.MenuImage,''),'", ','"MenuStatus":"',IFNULL(new.MenuStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenu_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenu_delete_after` AFTER DELETE ON `E_POSMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenu',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ParentMenuID":"',IFNULL(old.ParentMenuID,''),'", ','"MenuName":"',IFNULL(old.MenuName,''),'", ','"MenuDesc":"',IFNULL(old.MenuDesc,''),'", ','"MenuImage":"',IFNULL(old.MenuImage,''),'", ','"MenuStatus":"',IFNULL(old.MenuStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenuProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenuProduct_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenuProduct_insert_after` AFTER INSERT ON `E_POSMenuProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenuProduct',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"MPStatus":"',IFNULL(new.MPStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenuProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenuProduct_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenuProduct_update_after` AFTER UPDATE ON `E_POSMenuProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenuProduct',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"MPStatus":"',IFNULL(old.MPStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"MPStatus":"',IFNULL(new.MPStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_POSMenuProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_POSMenuProduct_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_POSMenuProduct_delete_after` AFTER DELETE ON `E_POSMenuProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_POSMenuProduct',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"MPStatus":"',IFNULL(old.MPStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategory` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategory_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategory_insert_after` AFTER INSERT ON `E_PackageCategory` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategory',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PackageID":"',IFNULL(new.PackageID,''),'", ','"PCName":"',IFNULL(new.PCName,''),'", ','"MinSelectCount":"',IFNULL(new.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(new.MaxSelectCount,''),'", ','"PCDesc":"',IFNULL(new.PCDesc,''),'", ','"PCStatus":"',IFNULL(new.PCStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategory` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategory_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategory_update_after` AFTER UPDATE ON `E_PackageCategory` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategory',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PackageID":"',IFNULL(old.PackageID,''),'", ','"PCName":"',IFNULL(old.PCName,''),'", ','"MinSelectCount":"',IFNULL(old.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(old.MaxSelectCount,''),'", ','"PCDesc":"',IFNULL(old.PCDesc,''),'", ','"PCStatus":"',IFNULL(old.PCStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PackageID":"',IFNULL(new.PackageID,''),'", ','"PCName":"',IFNULL(new.PCName,''),'", ','"MinSelectCount":"',IFNULL(new.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(new.MaxSelectCount,''),'", ','"PCDesc":"',IFNULL(new.PCDesc,''),'", ','"PCStatus":"',IFNULL(new.PCStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategory` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategory_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategory_delete_after` AFTER DELETE ON `E_PackageCategory` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategory',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PackageID":"',IFNULL(old.PackageID,''),'", ','"PCName":"',IFNULL(old.PCName,''),'", ','"MinSelectCount":"',IFNULL(old.MinSelectCount,''),'", ','"MaxSelectCount":"',IFNULL(old.MaxSelectCount,''),'", ','"PCDesc":"',IFNULL(old.PCDesc,''),'", ','"PCStatus":"',IFNULL(old.PCStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategoryProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategoryProduct_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategoryProduct_insert_after` AFTER INSERT ON `E_PackageCategoryProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategoryProduct',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PackageCategoryID":"',IFNULL(new.PackageCategoryID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"ProductPrice":"',IFNULL(new.ProductPrice,''),'", ','"PCPStatus":"',IFNULL(new.PCPStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategoryProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategoryProduct_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategoryProduct_update_after` AFTER UPDATE ON `E_PackageCategoryProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategoryProduct',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PackageCategoryID":"',IFNULL(old.PackageCategoryID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"ProductPrice":"',IFNULL(old.ProductPrice,''),'", ','"PCPStatus":"',IFNULL(old.PCPStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PackageCategoryID":"',IFNULL(new.PackageCategoryID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"ProductPrice":"',IFNULL(new.ProductPrice,''),'", ','"PCPStatus":"',IFNULL(new.PCPStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PackageCategoryProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PackageCategoryProduct_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PackageCategoryProduct_delete_after` AFTER DELETE ON `E_PackageCategoryProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PackageCategoryProduct',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PackageCategoryID":"',IFNULL(old.PackageCategoryID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"ProductPrice":"',IFNULL(old.ProductPrice,''),'", ','"PCPStatus":"',IFNULL(old.PCPStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PaymentOption_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PaymentOption_insert_after` AFTER INSERT ON `E_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PaymentOption',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PaymentID":"',IFNULL(new.PaymentID,''),'", ','"PaymentParam":"',IFNULL(new.PaymentParam,''),'", ','"PaymentStatus":"',IFNULL(new.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PaymentOption_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PaymentOption_update_after` AFTER UPDATE ON `E_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PaymentOption',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PaymentID":"',IFNULL(old.PaymentID,''),'", ','"PaymentParam":"',IFNULL(old.PaymentParam,''),'", ','"PaymentStatus":"',IFNULL(old.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"PaymentID":"',IFNULL(new.PaymentID,''),'", ','"PaymentParam":"',IFNULL(new.PaymentParam,''),'", ','"PaymentStatus":"',IFNULL(new.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_PaymentOption_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_PaymentOption_delete_after` AFTER DELETE ON `E_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_PaymentOption',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"PaymentID":"',IFNULL(old.PaymentID,''),'", ','"PaymentParam":"',IFNULL(old.PaymentParam,''),'", ','"PaymentStatus":"',IFNULL(old.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Product_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Product_insert_after` AFTER INSERT ON `E_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Product',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(new.CategoryID,''),'", ','"ProductSKU":"',IFNULL(new.ProductSKU,''),'", ','"ProductName":"',IFNULL(new.ProductName,''),'", ','"ProductType":"',IFNULL(new.ProductType,''),'", ','"ProductDesc":"',IFNULL(new.ProductDesc,''),'", ','"ProductImage":"',IFNULL(new.ProductImage,''),'", ','"ProductPrice":"',IFNULL(new.ProductPrice,''),'", ','"ProductPackPrice":"',IFNULL(new.ProductPackPrice,''),'", ','"UnitID":"',IFNULL(new.UnitID,''),'", ','"ProductStatus":"',IFNULL(new.ProductStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Product_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Product_update_after` AFTER UPDATE ON `E_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Product',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(old.CategoryID,''),'", ','"ProductSKU":"',IFNULL(old.ProductSKU,''),'", ','"ProductName":"',IFNULL(old.ProductName,''),'", ','"ProductType":"',IFNULL(old.ProductType,''),'", ','"ProductDesc":"',IFNULL(old.ProductDesc,''),'", ','"ProductImage":"',IFNULL(old.ProductImage,''),'", ','"ProductPrice":"',IFNULL(old.ProductPrice,''),'", ','"ProductPackPrice":"',IFNULL(old.ProductPackPrice,''),'", ','"UnitID":"',IFNULL(old.UnitID,''),'", ','"ProductStatus":"',IFNULL(old.ProductStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(new.CategoryID,''),'", ','"ProductSKU":"',IFNULL(new.ProductSKU,''),'", ','"ProductName":"',IFNULL(new.ProductName,''),'", ','"ProductType":"',IFNULL(new.ProductType,''),'", ','"ProductDesc":"',IFNULL(new.ProductDesc,''),'", ','"ProductImage":"',IFNULL(new.ProductImage,''),'", ','"ProductPrice":"',IFNULL(new.ProductPrice,''),'", ','"ProductPackPrice":"',IFNULL(new.ProductPackPrice,''),'", ','"UnitID":"',IFNULL(new.UnitID,''),'", ','"ProductStatus":"',IFNULL(new.ProductStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Product_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Product_delete_after` AFTER DELETE ON `E_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Product',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"CategoryID":"',IFNULL(old.CategoryID,''),'", ','"ProductSKU":"',IFNULL(old.ProductSKU,''),'", ','"ProductName":"',IFNULL(old.ProductName,''),'", ','"ProductType":"',IFNULL(old.ProductType,''),'", ','"ProductDesc":"',IFNULL(old.ProductDesc,''),'", ','"ProductImage":"',IFNULL(old.ProductImage,''),'", ','"ProductPrice":"',IFNULL(old.ProductPrice,''),'", ','"ProductPackPrice":"',IFNULL(old.ProductPackPrice,''),'", ','"UnitID":"',IFNULL(old.UnitID,''),'", ','"ProductStatus":"',IFNULL(old.ProductStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_ProductInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_ProductInstructionType_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_ProductInstructionType_insert_after` AFTER INSERT ON `E_ProductInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_ProductInstructionType',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(new.CITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_ProductInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_ProductInstructionType_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_ProductInstructionType_update_after` AFTER UPDATE ON `E_ProductInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_ProductInstructionType',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(old.CITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"InstructionTypeID":"',IFNULL(new.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(new.CITStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_ProductInstructionType` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_ProductInstructionType_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_ProductInstructionType_delete_after` AFTER DELETE ON `E_ProductInstructionType` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_ProductInstructionType',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"InstructionTypeID":"',IFNULL(old.InstructionTypeID,''),'", ','"CITStatus":"',IFNULL(old.CITStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Role_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Role_insert_after` AFTER INSERT ON `E_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Role',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"RoleCode":"',IFNULL(new.RoleCode,''),'", ','"RoleName":"',IFNULL(new.RoleName,''),'", ','"RoleDesc":"',IFNULL(new.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(new.RoleStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Role_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Role_update_after` AFTER UPDATE ON `E_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Role',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"RoleCode":"',IFNULL(old.RoleCode,''),'", ','"RoleName":"',IFNULL(old.RoleName,''),'", ','"RoleDesc":"',IFNULL(old.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(old.RoleStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"RoleCode":"',IFNULL(new.RoleCode,''),'", ','"RoleName":"',IFNULL(new.RoleName,''),'", ','"RoleDesc":"',IFNULL(new.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(new.RoleStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Role_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Role_delete_after` AFTER DELETE ON `E_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Role',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"RoleCode":"',IFNULL(old.RoleCode,''),'", ','"RoleName":"',IFNULL(old.RoleName,''),'", ','"RoleDesc":"',IFNULL(old.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(old.RoleStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleFunction_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleFunction_insert_after` AFTER INSERT ON `E_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleFunction',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(new.EnterpriseRoleID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"RFStatus":"',IFNULL(new.RFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleFunction_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleFunction_update_after` AFTER UPDATE ON `E_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleFunction',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(old.EnterpriseRoleID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"RFStatus":"',IFNULL(old.RFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(new.EnterpriseRoleID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"RFStatus":"',IFNULL(new.RFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleFunction_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleFunction_delete_after` AFTER DELETE ON `E_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleFunction',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(old.EnterpriseRoleID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"RFStatus":"',IFNULL(old.RFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleMenu_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleMenu_insert_after` AFTER INSERT ON `E_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleMenu',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(new.EnterpriseRoleID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"ERMStatus":"',IFNULL(new.ERMStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleMenu_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleMenu_update_after` AFTER UPDATE ON `E_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleMenu',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(old.EnterpriseRoleID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"ERMStatus":"',IFNULL(old.ERMStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(new.EnterpriseRoleID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"ERMStatus":"',IFNULL(new.ERMStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_RoleMenu_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_RoleMenu_delete_after` AFTER DELETE ON `E_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_RoleMenu',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"EnterpriseRoleID":"',IFNULL(old.EnterpriseRoleID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"ERMStatus":"',IFNULL(old.ERMStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Order_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Order_insert_after` AFTER INSERT ON `E_S_Order` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Order',new.OrderNo,'I',''
      ,CONCAT('{"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"TableNo":"',IFNULL(new.TableNo,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"ServiceCharge":"',IFNULL(new.ServiceCharge,''),'", ','"TotalDiscount":"',IFNULL(new.TotalDiscount,''),'", ','"PaymentAmount":"',IFNULL(new.PaymentAmount,''),'", ','"OrderSource":"',IFNULL(new.OrderSource,''),'", ','"OrderType":"',IFNULL(new.OrderType,''),'", ','"OrderStatus":"',IFNULL(new.OrderStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.OrderNo),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Order_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Order_update_after` AFTER UPDATE ON `E_S_Order` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Order',new.OrderNo,'U'
      ,CONCAT('{"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"TableNo":"',IFNULL(old.TableNo,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"ServiceCharge":"',IFNULL(old.ServiceCharge,''),'", ','"TotalDiscount":"',IFNULL(old.TotalDiscount,''),'", ','"PaymentAmount":"',IFNULL(old.PaymentAmount,''),'", ','"OrderSource":"',IFNULL(old.OrderSource,''),'", ','"OrderType":"',IFNULL(old.OrderType,''),'", ','"OrderStatus":"',IFNULL(old.OrderStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"TableNo":"',IFNULL(new.TableNo,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"ServiceCharge":"',IFNULL(new.ServiceCharge,''),'", ','"TotalDiscount":"',IFNULL(new.TotalDiscount,''),'", ','"PaymentAmount":"',IFNULL(new.PaymentAmount,''),'", ','"OrderSource":"',IFNULL(new.OrderSource,''),'", ','"OrderType":"',IFNULL(new.OrderType,''),'", ','"OrderStatus":"',IFNULL(new.OrderStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.OrderNo),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Order` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Order_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Order_delete_after` AFTER DELETE ON `E_S_Order` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Order',old.OrderNo,'D'
      ,CONCAT('{"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"TableNo":"',IFNULL(old.TableNo,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"ServiceCharge":"',IFNULL(old.ServiceCharge,''),'", ','"TotalDiscount":"',IFNULL(old.TotalDiscount,''),'", ','"PaymentAmount":"',IFNULL(old.PaymentAmount,''),'", ','"OrderSource":"',IFNULL(old.OrderSource,''),'", ','"OrderType":"',IFNULL(old.OrderType,''),'", ','"OrderStatus":"',IFNULL(old.OrderStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.OrderNo),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderDiscount_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderDiscount_insert_after` AFTER INSERT ON `E_S_OrderDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderDiscount',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"DiscountAmount":"',IFNULL(new.DiscountAmount,''),'", ','"DiscountCode":"',IFNULL(new.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(new.DiscountDesc,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderDiscount_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderDiscount_update_after` AFTER UPDATE ON `E_S_OrderDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderDiscount',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"DiscountAmount":"',IFNULL(old.DiscountAmount,''),'", ','"DiscountCode":"',IFNULL(old.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(old.DiscountDesc,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"DiscountAmount":"',IFNULL(new.DiscountAmount,''),'", ','"DiscountCode":"',IFNULL(new.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(new.DiscountDesc,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderDiscount_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderDiscount_delete_after` AFTER DELETE ON `E_S_OrderDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderDiscount',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"DiscountAmount":"',IFNULL(old.DiscountAmount,''),'", ','"DiscountCode":"',IFNULL(old.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(old.DiscountDesc,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderPayment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderPayment_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderPayment_insert_after` AFTER INSERT ON `E_S_OrderPayment` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderPayment',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"PaymentAmount":"',IFNULL(new.PaymentAmount,''),'", ','"ChangeAmount":"',IFNULL(new.ChangeAmount,''),'", ','"PaymentID":"',IFNULL(new.PaymentID,''),'", ','"PaymentName":"',IFNULL(new.PaymentName,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderPayment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderPayment_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderPayment_update_after` AFTER UPDATE ON `E_S_OrderPayment` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderPayment',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"PaymentAmount":"',IFNULL(old.PaymentAmount,''),'", ','"ChangeAmount":"',IFNULL(old.ChangeAmount,''),'", ','"PaymentID":"',IFNULL(old.PaymentID,''),'", ','"PaymentName":"',IFNULL(old.PaymentName,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"PaymentAmount":"',IFNULL(new.PaymentAmount,''),'", ','"ChangeAmount":"',IFNULL(new.ChangeAmount,''),'", ','"PaymentID":"',IFNULL(new.PaymentID,''),'", ','"PaymentName":"',IFNULL(new.PaymentName,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderPayment` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderPayment_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderPayment_delete_after` AFTER DELETE ON `E_S_OrderPayment` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderPayment',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"PaymentAmount":"',IFNULL(old.PaymentAmount,''),'", ','"ChangeAmount":"',IFNULL(old.ChangeAmount,''),'", ','"PaymentID":"',IFNULL(old.PaymentID,''),'", ','"PaymentName":"',IFNULL(old.PaymentName,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProduct_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProduct_insert_after` AFTER INSERT ON `E_S_OrderProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProduct',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"ProductName":"',IFNULL(new.ProductName,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"Price":"',IFNULL(new.Price,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProduct_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProduct_update_after` AFTER UPDATE ON `E_S_OrderProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProduct',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"ProductName":"',IFNULL(old.ProductName,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"Price":"',IFNULL(old.Price,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"ProductName":"',IFNULL(new.ProductName,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"Price":"',IFNULL(new.Price,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProduct` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProduct_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProduct_delete_after` AFTER DELETE ON `E_S_OrderProduct` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProduct',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"ProductName":"',IFNULL(old.ProductName,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"Price":"',IFNULL(old.Price,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductDiscount_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductDiscount_insert_after` AFTER INSERT ON `E_S_OrderProductDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductDiscount',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"OrderProductID":"',IFNULL(new.OrderProductID,''),'", ','"TotalDiscountAmount":"',IFNULL(new.TotalDiscountAmount,''),'", ','"DiscountAmount":"',IFNULL(new.DiscountAmount,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"DiscountCode":"',IFNULL(new.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(new.DiscountDesc,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductDiscount_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductDiscount_update_after` AFTER UPDATE ON `E_S_OrderProductDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductDiscount',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"OrderProductID":"',IFNULL(old.OrderProductID,''),'", ','"TotalDiscountAmount":"',IFNULL(old.TotalDiscountAmount,''),'", ','"DiscountAmount":"',IFNULL(old.DiscountAmount,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"DiscountCode":"',IFNULL(old.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(old.DiscountDesc,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"OrderProductID":"',IFNULL(new.OrderProductID,''),'", ','"TotalDiscountAmount":"',IFNULL(new.TotalDiscountAmount,''),'", ','"DiscountAmount":"',IFNULL(new.DiscountAmount,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"DiscountCode":"',IFNULL(new.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(new.DiscountDesc,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductDiscount` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductDiscount_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductDiscount_delete_after` AFTER DELETE ON `E_S_OrderProductDiscount` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductDiscount',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"OrderProductID":"',IFNULL(old.OrderProductID,''),'", ','"TotalDiscountAmount":"',IFNULL(old.TotalDiscountAmount,''),'", ','"DiscountAmount":"',IFNULL(old.DiscountAmount,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"DiscountCode":"',IFNULL(old.DiscountCode,''),'", ','"DiscountDesc":"',IFNULL(old.DiscountDesc,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductInstruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductInstruction_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductInstruction_insert_after` AFTER INSERT ON `E_S_OrderProductInstruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductInstruction',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"OrderProductID":"',IFNULL(new.OrderProductID,''),'", ','"InstructionID":"',IFNULL(new.InstructionID,''),'", ','"InstructionName":"',IFNULL(new.InstructionName,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"Price":"',IFNULL(new.Price,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductInstruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductInstruction_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductInstruction_update_after` AFTER UPDATE ON `E_S_OrderProductInstruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductInstruction',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"OrderProductID":"',IFNULL(old.OrderProductID,''),'", ','"InstructionID":"',IFNULL(old.InstructionID,''),'", ','"InstructionName":"',IFNULL(old.InstructionName,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"Price":"',IFNULL(old.Price,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"OrderNo":"',IFNULL(new.OrderNo,''),'", ','"OrderProductID":"',IFNULL(new.OrderProductID,''),'", ','"InstructionID":"',IFNULL(new.InstructionID,''),'", ','"InstructionName":"',IFNULL(new.InstructionName,''),'", ','"TotalPrice":"',IFNULL(new.TotalPrice,''),'", ','"Price":"',IFNULL(new.Price,''),'", ','"Qty":"',IFNULL(new.Qty,''),'", ','"Status":"',IFNULL(new.Status,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_OrderProductInstruction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_OrderProductInstruction_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_OrderProductInstruction_delete_after` AFTER DELETE ON `E_S_OrderProductInstruction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_OrderProductInstruction',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"OrderNo":"',IFNULL(old.OrderNo,''),'", ','"OrderProductID":"',IFNULL(old.OrderProductID,''),'", ','"InstructionID":"',IFNULL(old.InstructionID,''),'", ','"InstructionName":"',IFNULL(old.InstructionName,''),'", ','"TotalPrice":"',IFNULL(old.TotalPrice,''),'", ','"Price":"',IFNULL(old.Price,''),'", ','"Qty":"',IFNULL(old.Qty,''),'", ','"Status":"',IFNULL(old.Status,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_POS` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_POS_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_POS_insert_after` AFTER INSERT ON `E_S_POS` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_POS',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"POSNumber":"',IFNULL(new.POSNumber,''),'", ','"POSStatus":"',IFNULL(new.POSStatus,''),'", ','"POSDesc":"',IFNULL(new.POSDesc,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_POS` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_POS_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_POS_update_after` AFTER UPDATE ON `E_S_POS` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_POS',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"POSNumber":"',IFNULL(old.POSNumber,''),'", ','"POSStatus":"',IFNULL(old.POSStatus,''),'", ','"POSDesc":"',IFNULL(old.POSDesc,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"POSNumber":"',IFNULL(new.POSNumber,''),'", ','"POSStatus":"',IFNULL(new.POSStatus,''),'", ','"POSDesc":"',IFNULL(new.POSDesc,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_POS` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_POS_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_POS_delete_after` AFTER DELETE ON `E_S_POS` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_POS',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"POSNumber":"',IFNULL(old.POSNumber,''),'", ','"POSStatus":"',IFNULL(old.POSStatus,''),'", ','"POSDesc":"',IFNULL(old.POSDesc,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Product_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Product_insert_after` AFTER INSERT ON `E_S_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Product',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"EPID":"',IFNULL(new.EPID,''),'", ','"SPPrice":"',IFNULL(new.SPPrice,''),'", ','"SPStatus":"',IFNULL(new.SPStatus,''),'", ','"DaySaleStartHour":"',IFNULL(new.DaySaleStartHour,''),'", ','"DaySaleStartMinute":"',IFNULL(new.DaySaleStartMinute,''),'", ','"DaySaleEndHour":"',IFNULL(new.DaySaleEndHour,''),'", ','"DaySaleEndMinute":"',IFNULL(new.DaySaleEndMinute,''),'", ','"MondaySale":"',IFNULL(new.MondaySale,''),'", ','"TuesdaySale":"',IFNULL(new.TuesdaySale,''),'", ','"WednesdaySale":"',IFNULL(new.WednesdaySale,''),'", ','"ThursdaySale":"',IFNULL(new.ThursdaySale,''),'", ','"FridaySale":"',IFNULL(new.FridaySale,''),'", ','"SaturdaySale":"',IFNULL(new.SaturdaySale,''),'", ','"SundaySale":"',IFNULL(new.SundaySale,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Product_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Product_update_after` AFTER UPDATE ON `E_S_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Product',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"EPID":"',IFNULL(old.EPID,''),'", ','"SPPrice":"',IFNULL(old.SPPrice,''),'", ','"SPStatus":"',IFNULL(old.SPStatus,''),'", ','"DaySaleStartHour":"',IFNULL(old.DaySaleStartHour,''),'", ','"DaySaleStartMinute":"',IFNULL(old.DaySaleStartMinute,''),'", ','"DaySaleEndHour":"',IFNULL(old.DaySaleEndHour,''),'", ','"DaySaleEndMinute":"',IFNULL(old.DaySaleEndMinute,''),'", ','"MondaySale":"',IFNULL(old.MondaySale,''),'", ','"TuesdaySale":"',IFNULL(old.TuesdaySale,''),'", ','"WednesdaySale":"',IFNULL(old.WednesdaySale,''),'", ','"ThursdaySale":"',IFNULL(old.ThursdaySale,''),'", ','"FridaySale":"',IFNULL(old.FridaySale,''),'", ','"SaturdaySale":"',IFNULL(old.SaturdaySale,''),'", ','"SundaySale":"',IFNULL(old.SundaySale,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"EPID":"',IFNULL(new.EPID,''),'", ','"SPPrice":"',IFNULL(new.SPPrice,''),'", ','"SPStatus":"',IFNULL(new.SPStatus,''),'", ','"DaySaleStartHour":"',IFNULL(new.DaySaleStartHour,''),'", ','"DaySaleStartMinute":"',IFNULL(new.DaySaleStartMinute,''),'", ','"DaySaleEndHour":"',IFNULL(new.DaySaleEndHour,''),'", ','"DaySaleEndMinute":"',IFNULL(new.DaySaleEndMinute,''),'", ','"MondaySale":"',IFNULL(new.MondaySale,''),'", ','"TuesdaySale":"',IFNULL(new.TuesdaySale,''),'", ','"WednesdaySale":"',IFNULL(new.WednesdaySale,''),'", ','"ThursdaySale":"',IFNULL(new.ThursdaySale,''),'", ','"FridaySale":"',IFNULL(new.FridaySale,''),'", ','"SaturdaySale":"',IFNULL(new.SaturdaySale,''),'", ','"SundaySale":"',IFNULL(new.SundaySale,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_Product` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_Product_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_Product_delete_after` AFTER DELETE ON `E_S_Product` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_Product',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"EPID":"',IFNULL(old.EPID,''),'", ','"SPPrice":"',IFNULL(old.SPPrice,''),'", ','"SPStatus":"',IFNULL(old.SPStatus,''),'", ','"DaySaleStartHour":"',IFNULL(old.DaySaleStartHour,''),'", ','"DaySaleStartMinute":"',IFNULL(old.DaySaleStartMinute,''),'", ','"DaySaleEndHour":"',IFNULL(old.DaySaleEndHour,''),'", ','"DaySaleEndMinute":"',IFNULL(old.DaySaleEndMinute,''),'", ','"MondaySale":"',IFNULL(old.MondaySale,''),'", ','"TuesdaySale":"',IFNULL(old.TuesdaySale,''),'", ','"WednesdaySale":"',IFNULL(old.WednesdaySale,''),'", ','"ThursdaySale":"',IFNULL(old.ThursdaySale,''),'", ','"FridaySale":"',IFNULL(old.FridaySale,''),'", ','"SaturdaySale":"',IFNULL(old.SaturdaySale,''),'", ','"SundaySale":"',IFNULL(old.SundaySale,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_ProductRation` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_ProductRation_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_ProductRation_insert_after` AFTER INSERT ON `E_S_ProductRation` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_ProductRation',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"RationRule":"',IFNULL(new.RationRule,''),'", ','"RationCount":"',IFNULL(new.RationCount,''),'", ','"RationEffectiveDate":"',IFNULL(new.RationEffectiveDate,''),'", ','"RationStatus":"',IFNULL(new.RationStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_ProductRation` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_ProductRation_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_ProductRation_update_after` AFTER UPDATE ON `E_S_ProductRation` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_ProductRation',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"RationRule":"',IFNULL(old.RationRule,''),'", ','"RationCount":"',IFNULL(old.RationCount,''),'", ','"RationEffectiveDate":"',IFNULL(old.RationEffectiveDate,''),'", ','"RationStatus":"',IFNULL(old.RationStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"ProductID":"',IFNULL(new.ProductID,''),'", ','"RationRule":"',IFNULL(new.RationRule,''),'", ','"RationCount":"',IFNULL(new.RationCount,''),'", ','"RationEffectiveDate":"',IFNULL(new.RationEffectiveDate,''),'", ','"RationStatus":"',IFNULL(new.RationStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_ProductRation` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_ProductRation_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_ProductRation_delete_after` AFTER DELETE ON `E_S_ProductRation` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_ProductRation',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"ProductID":"',IFNULL(old.ProductID,''),'", ','"RationRule":"',IFNULL(old.RationRule,''),'", ','"RationCount":"',IFNULL(old.RationCount,''),'", ','"RationEffectiveDate":"',IFNULL(old.RationEffectiveDate,''),'", ','"RationStatus":"',IFNULL(old.RationStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_User_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_User_insert_after` AFTER INSERT ON `E_S_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_User',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"SUStatus":"',IFNULL(new.SUStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_User_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_User_update_after` AFTER UPDATE ON `E_S_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_User',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"SUStatus":"',IFNULL(old.SUStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"StoreID":"',IFNULL(new.StoreID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"SUStatus":"',IFNULL(new.SUStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_S_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_S_User_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_S_User_delete_after` AFTER DELETE ON `E_S_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_S_User',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"StoreID":"',IFNULL(old.StoreID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"SUStatus":"',IFNULL(old.SUStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Store` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Store_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Store_insert_after` AFTER INSERT ON `E_Store` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Store',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreNo":"',IFNULL(new.StoreNo,''),'", ','"StoreName":"',IFNULL(new.StoreName,''),'", ','"StorePhone1":"',IFNULL(new.StorePhone1,''),'", ','"StorePhone2":"',IFNULL(new.StorePhone2,''),'", ','"StoreAddress":"',IFNULL(new.StoreAddress,''),'", ','"StoreDesc":"',IFNULL(new.StoreDesc,''),'", ','"POSCount":"',IFNULL(new.POSCount,''),'", ','"ServiceChargeType":"',IFNULL(new.ServiceChargeType,''),'", ','"ServiceChargeRule":"',IFNULL(new.ServiceChargeRule,''),'", ','"PackPrice":"',IFNULL(new.PackPrice,''),'", ','"TakeawayPrice":"',IFNULL(new.TakeawayPrice,''),'", ','"StoreStatus":"',IFNULL(new.StoreStatus,''),'", ','"BusinessStartHour":"',IFNULL(new.BusinessStartHour,''),'", ','"BusinessStartMinute":"',IFNULL(new.BusinessStartMinute,''),'", ','"BusinessEndHour":"',IFNULL(new.BusinessEndHour,''),'", ','"BusinessEndMinute":"',IFNULL(new.BusinessEndMinute,''),'", ','"BusinessState":"',IFNULL(new.BusinessState,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Store` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Store_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Store_update_after` AFTER UPDATE ON `E_Store` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Store',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreNo":"',IFNULL(old.StoreNo,''),'", ','"StoreName":"',IFNULL(old.StoreName,''),'", ','"StorePhone1":"',IFNULL(old.StorePhone1,''),'", ','"StorePhone2":"',IFNULL(old.StorePhone2,''),'", ','"StoreAddress":"',IFNULL(old.StoreAddress,''),'", ','"StoreDesc":"',IFNULL(old.StoreDesc,''),'", ','"POSCount":"',IFNULL(old.POSCount,''),'", ','"ServiceChargeType":"',IFNULL(old.ServiceChargeType,''),'", ','"ServiceChargeRule":"',IFNULL(old.ServiceChargeRule,''),'", ','"PackPrice":"',IFNULL(old.PackPrice,''),'", ','"TakeawayPrice":"',IFNULL(old.TakeawayPrice,''),'", ','"StoreStatus":"',IFNULL(old.StoreStatus,''),'", ','"BusinessStartHour":"',IFNULL(old.BusinessStartHour,''),'", ','"BusinessStartMinute":"',IFNULL(old.BusinessStartMinute,''),'", ','"BusinessEndHour":"',IFNULL(old.BusinessEndHour,''),'", ','"BusinessEndMinute":"',IFNULL(old.BusinessEndMinute,''),'", ','"BusinessState":"',IFNULL(old.BusinessState,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"StoreNo":"',IFNULL(new.StoreNo,''),'", ','"StoreName":"',IFNULL(new.StoreName,''),'", ','"StorePhone1":"',IFNULL(new.StorePhone1,''),'", ','"StorePhone2":"',IFNULL(new.StorePhone2,''),'", ','"StoreAddress":"',IFNULL(new.StoreAddress,''),'", ','"StoreDesc":"',IFNULL(new.StoreDesc,''),'", ','"POSCount":"',IFNULL(new.POSCount,''),'", ','"ServiceChargeType":"',IFNULL(new.ServiceChargeType,''),'", ','"ServiceChargeRule":"',IFNULL(new.ServiceChargeRule,''),'", ','"PackPrice":"',IFNULL(new.PackPrice,''),'", ','"TakeawayPrice":"',IFNULL(new.TakeawayPrice,''),'", ','"StoreStatus":"',IFNULL(new.StoreStatus,''),'", ','"BusinessStartHour":"',IFNULL(new.BusinessStartHour,''),'", ','"BusinessStartMinute":"',IFNULL(new.BusinessStartMinute,''),'", ','"BusinessEndHour":"',IFNULL(new.BusinessEndHour,''),'", ','"BusinessEndMinute":"',IFNULL(new.BusinessEndMinute,''),'", ','"BusinessState":"',IFNULL(new.BusinessState,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Store` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Store_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Store_delete_after` AFTER DELETE ON `E_Store` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Store',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"StoreNo":"',IFNULL(old.StoreNo,''),'", ','"StoreName":"',IFNULL(old.StoreName,''),'", ','"StorePhone1":"',IFNULL(old.StorePhone1,''),'", ','"StorePhone2":"',IFNULL(old.StorePhone2,''),'", ','"StoreAddress":"',IFNULL(old.StoreAddress,''),'", ','"StoreDesc":"',IFNULL(old.StoreDesc,''),'", ','"POSCount":"',IFNULL(old.POSCount,''),'", ','"ServiceChargeType":"',IFNULL(old.ServiceChargeType,''),'", ','"ServiceChargeRule":"',IFNULL(old.ServiceChargeRule,''),'", ','"PackPrice":"',IFNULL(old.PackPrice,''),'", ','"TakeawayPrice":"',IFNULL(old.TakeawayPrice,''),'", ','"StoreStatus":"',IFNULL(old.StoreStatus,''),'", ','"BusinessStartHour":"',IFNULL(old.BusinessStartHour,''),'", ','"BusinessStartMinute":"',IFNULL(old.BusinessStartMinute,''),'", ','"BusinessEndHour":"',IFNULL(old.BusinessEndHour,''),'", ','"BusinessEndMinute":"',IFNULL(old.BusinessEndMinute,''),'", ','"BusinessState":"',IFNULL(old.BusinessState,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Unit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Unit_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Unit_insert_after` AFTER INSERT ON `E_Unit` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Unit',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"UnitCode":"',IFNULL(new.UnitCode,''),'", ','"UnitName":"',IFNULL(new.UnitName,''),'", ','"UnitDesc":"',IFNULL(new.UnitDesc,''),'", ','"UnitStatus":"',IFNULL(new.UnitStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Unit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Unit_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Unit_update_after` AFTER UPDATE ON `E_Unit` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Unit',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"UnitCode":"',IFNULL(old.UnitCode,''),'", ','"UnitName":"',IFNULL(old.UnitName,''),'", ','"UnitDesc":"',IFNULL(old.UnitDesc,''),'", ','"UnitStatus":"',IFNULL(old.UnitStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"UnitCode":"',IFNULL(new.UnitCode,''),'", ','"UnitName":"',IFNULL(new.UnitName,''),'", ','"UnitDesc":"',IFNULL(new.UnitDesc,''),'", ','"UnitStatus":"',IFNULL(new.UnitStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_Unit` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_Unit_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_Unit_delete_after` AFTER DELETE ON `E_Unit` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_Unit',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"UnitCode":"',IFNULL(old.UnitCode,''),'", ','"UnitName":"',IFNULL(old.UnitName,''),'", ','"UnitDesc":"',IFNULL(old.UnitDesc,''),'", ','"UnitStatus":"',IFNULL(old.UnitStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_User_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_User_insert_after` AFTER INSERT ON `E_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_User',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"IsAdmin":"',IFNULL(new.IsAdmin,''),'", ','"WorkNumber":"',IFNULL(new.WorkNumber,''),'", ','"EUStatus":"',IFNULL(new.EUStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_User_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_User_update_after` AFTER UPDATE ON `E_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_User',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"IsAdmin":"',IFNULL(old.IsAdmin,''),'", ','"WorkNumber":"',IFNULL(old.WorkNumber,''),'", ','"EUStatus":"',IFNULL(old.EUStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseID":"',IFNULL(new.EnterpriseID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"IsAdmin":"',IFNULL(new.IsAdmin,''),'", ','"WorkNumber":"',IFNULL(new.WorkNumber,''),'", ','"EUStatus":"',IFNULL(new.EUStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `E_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_E_User_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_E_User_delete_after` AFTER DELETE ON `E_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('E_User',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseID":"',IFNULL(old.EnterpriseID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"IsAdmin":"',IFNULL(old.IsAdmin,''),'", ','"WorkNumber":"',IFNULL(old.WorkNumber,''),'", ','"EUStatus":"',IFNULL(old.EUStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `Enterprise` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_Enterprise_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_Enterprise_insert_after` AFTER INSERT ON `Enterprise` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('Enterprise',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseNo":"',IFNULL(new.EnterpriseNo,''),'", ','"EnterpriseName":"',IFNULL(new.EnterpriseName,''),'", ','"AdminUserID":"',IFNULL(new.AdminUserID,''),'", ','"EnterpriseDesc":"',IFNULL(new.EnterpriseDesc,''),'", ','"MaxStoreCount":"',IFNULL(new.MaxStoreCount,''),'", ','"StoreCount":"',IFNULL(new.StoreCount,''),'", ','"StorePosMaxCount":"',IFNULL(new.StorePosMaxCount,''),'", ','"EnterpriseStatus":"',IFNULL(new.EnterpriseStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `Enterprise` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_Enterprise_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_Enterprise_update_after` AFTER UPDATE ON `Enterprise` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('Enterprise',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseNo":"',IFNULL(old.EnterpriseNo,''),'", ','"EnterpriseName":"',IFNULL(old.EnterpriseName,''),'", ','"AdminUserID":"',IFNULL(old.AdminUserID,''),'", ','"EnterpriseDesc":"',IFNULL(old.EnterpriseDesc,''),'", ','"MaxStoreCount":"',IFNULL(old.MaxStoreCount,''),'", ','"StoreCount":"',IFNULL(old.StoreCount,''),'", ','"StorePosMaxCount":"',IFNULL(old.StorePosMaxCount,''),'", ','"EnterpriseStatus":"',IFNULL(old.EnterpriseStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"EnterpriseNo":"',IFNULL(new.EnterpriseNo,''),'", ','"EnterpriseName":"',IFNULL(new.EnterpriseName,''),'", ','"AdminUserID":"',IFNULL(new.AdminUserID,''),'", ','"EnterpriseDesc":"',IFNULL(new.EnterpriseDesc,''),'", ','"MaxStoreCount":"',IFNULL(new.MaxStoreCount,''),'", ','"StoreCount":"',IFNULL(new.StoreCount,''),'", ','"StorePosMaxCount":"',IFNULL(new.StorePosMaxCount,''),'", ','"EnterpriseStatus":"',IFNULL(new.EnterpriseStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `Enterprise` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_Enterprise_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_Enterprise_delete_after` AFTER DELETE ON `Enterprise` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('Enterprise',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"EnterpriseNo":"',IFNULL(old.EnterpriseNo,''),'", ','"EnterpriseName":"',IFNULL(old.EnterpriseName,''),'", ','"AdminUserID":"',IFNULL(old.AdminUserID,''),'", ','"EnterpriseDesc":"',IFNULL(old.EnterpriseDesc,''),'", ','"MaxStoreCount":"',IFNULL(old.MaxStoreCount,''),'", ','"StoreCount":"',IFNULL(old.StoreCount,''),'", ','"StorePosMaxCount":"',IFNULL(old.StorePosMaxCount,''),'", ','"EnterpriseStatus":"',IFNULL(old.EnterpriseStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_DataDic` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_DataDic_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_DataDic_insert_after` AFTER INSERT ON `P_DataDic` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_DataDic',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"DDParentID":"',IFNULL(new.DDParentID,''),'", ','"DDCode":"',IFNULL(new.DDCode,''),'", ','"DDName":"',IFNULL(new.DDName,''),'", ','"DDDesc":"',IFNULL(new.DDDesc,''),'", ','"DDStatus":"',IFNULL(new.DDStatus,''),'", ','"DDSort":"',IFNULL(new.DDSort,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_DataDic` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_DataDic_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_DataDic_update_after` AFTER UPDATE ON `P_DataDic` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_DataDic',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"DDParentID":"',IFNULL(old.DDParentID,''),'", ','"DDCode":"',IFNULL(old.DDCode,''),'", ','"DDName":"',IFNULL(old.DDName,''),'", ','"DDDesc":"',IFNULL(old.DDDesc,''),'", ','"DDStatus":"',IFNULL(old.DDStatus,''),'", ','"DDSort":"',IFNULL(old.DDSort,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"DDParentID":"',IFNULL(new.DDParentID,''),'", ','"DDCode":"',IFNULL(new.DDCode,''),'", ','"DDName":"',IFNULL(new.DDName,''),'", ','"DDDesc":"',IFNULL(new.DDDesc,''),'", ','"DDStatus":"',IFNULL(new.DDStatus,''),'", ','"DDSort":"',IFNULL(new.DDSort,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_DataDic` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_DataDic_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_DataDic_delete_after` AFTER DELETE ON `P_DataDic` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_DataDic',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"DDParentID":"',IFNULL(old.DDParentID,''),'", ','"DDCode":"',IFNULL(old.DDCode,''),'", ','"DDName":"',IFNULL(old.DDName,''),'", ','"DDDesc":"',IFNULL(old.DDDesc,''),'", ','"DDStatus":"',IFNULL(old.DDStatus,''),'", ','"DDSort":"',IFNULL(old.DDSort,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Function_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Function_insert_after` AFTER INSERT ON `P_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Function',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"FunctionCode":"',IFNULL(new.FunctionCode,''),'", ','"FunctionName":"',IFNULL(new.FunctionName,''),'", ','"FunctionUrl":"',IFNULL(new.FunctionUrl,''),'", ','"FunctionType":"',IFNULL(new.FunctionType,''),'", ','"FunctionStatus":"',IFNULL(new.FunctionStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Function_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Function_update_after` AFTER UPDATE ON `P_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Function',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"FunctionCode":"',IFNULL(old.FunctionCode,''),'", ','"FunctionName":"',IFNULL(old.FunctionName,''),'", ','"FunctionUrl":"',IFNULL(old.FunctionUrl,''),'", ','"FunctionType":"',IFNULL(old.FunctionType,''),'", ','"FunctionStatus":"',IFNULL(old.FunctionStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"FunctionCode":"',IFNULL(new.FunctionCode,''),'", ','"FunctionName":"',IFNULL(new.FunctionName,''),'", ','"FunctionUrl":"',IFNULL(new.FunctionUrl,''),'", ','"FunctionType":"',IFNULL(new.FunctionType,''),'", ','"FunctionStatus":"',IFNULL(new.FunctionStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Function` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Function_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Function_delete_after` AFTER DELETE ON `P_Function` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Function',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"FunctionCode":"',IFNULL(old.FunctionCode,''),'", ','"FunctionName":"',IFNULL(old.FunctionName,''),'", ','"FunctionUrl":"',IFNULL(old.FunctionUrl,''),'", ','"FunctionType":"',IFNULL(old.FunctionType,''),'", ','"FunctionStatus":"',IFNULL(old.FunctionStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Menu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Menu_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Menu_insert_after` AFTER INSERT ON `P_Menu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Menu',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"MenuCode":"',IFNULL(new.MenuCode,''),'", ','"MenuName":"',IFNULL(new.MenuName,''),'", ','"MenuDesc":"',IFNULL(new.MenuDesc,''),'", ','"MenuUrl":"',IFNULL(new.MenuUrl,''),'", ','"MenuType":"',IFNULL(new.MenuType,''),'", ','"MenuStatus":"',IFNULL(new.MenuStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Menu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Menu_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Menu_update_after` AFTER UPDATE ON `P_Menu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Menu',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"MenuCode":"',IFNULL(old.MenuCode,''),'", ','"MenuName":"',IFNULL(old.MenuName,''),'", ','"MenuDesc":"',IFNULL(old.MenuDesc,''),'", ','"MenuUrl":"',IFNULL(old.MenuUrl,''),'", ','"MenuType":"',IFNULL(old.MenuType,''),'", ','"MenuStatus":"',IFNULL(old.MenuStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"ParentID":"',IFNULL(new.ParentID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"MenuCode":"',IFNULL(new.MenuCode,''),'", ','"MenuName":"',IFNULL(new.MenuName,''),'", ','"MenuDesc":"',IFNULL(new.MenuDesc,''),'", ','"MenuUrl":"',IFNULL(new.MenuUrl,''),'", ','"MenuType":"',IFNULL(new.MenuType,''),'", ','"MenuStatus":"',IFNULL(new.MenuStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Menu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Menu_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Menu_delete_after` AFTER DELETE ON `P_Menu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Menu',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"ParentID":"',IFNULL(old.ParentID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"MenuCode":"',IFNULL(old.MenuCode,''),'", ','"MenuName":"',IFNULL(old.MenuName,''),'", ','"MenuDesc":"',IFNULL(old.MenuDesc,''),'", ','"MenuUrl":"',IFNULL(old.MenuUrl,''),'", ','"MenuType":"',IFNULL(old.MenuType,''),'", ','"MenuStatus":"',IFNULL(old.MenuStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_PaymentOption_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_PaymentOption_insert_after` AFTER INSERT ON `P_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_PaymentOption',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"PaymentCode":"',IFNULL(new.PaymentCode,''),'", ','"PaymentName":"',IFNULL(new.PaymentName,''),'", ','"PaymentStatus":"',IFNULL(new.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_PaymentOption_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_PaymentOption_update_after` AFTER UPDATE ON `P_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_PaymentOption',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"PaymentCode":"',IFNULL(old.PaymentCode,''),'", ','"PaymentName":"',IFNULL(old.PaymentName,''),'", ','"PaymentStatus":"',IFNULL(old.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"PaymentCode":"',IFNULL(new.PaymentCode,''),'", ','"PaymentName":"',IFNULL(new.PaymentName,''),'", ','"PaymentStatus":"',IFNULL(new.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_PaymentOption` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_PaymentOption_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_PaymentOption_delete_after` AFTER DELETE ON `P_PaymentOption` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_PaymentOption',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"PaymentCode":"',IFNULL(old.PaymentCode,''),'", ','"PaymentName":"',IFNULL(old.PaymentName,''),'", ','"PaymentStatus":"',IFNULL(old.PaymentStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Role_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Role_insert_after` AFTER INSERT ON `P_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Role',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleCode":"',IFNULL(new.RoleCode,''),'", ','"RoleName":"',IFNULL(new.RoleName,''),'", ','"RoleDesc":"',IFNULL(new.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(new.RoleStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Role_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Role_update_after` AFTER UPDATE ON `P_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Role',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleCode":"',IFNULL(old.RoleCode,''),'", ','"RoleName":"',IFNULL(old.RoleName,''),'", ','"RoleDesc":"',IFNULL(old.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(old.RoleStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleCode":"',IFNULL(new.RoleCode,''),'", ','"RoleName":"',IFNULL(new.RoleName,''),'", ','"RoleDesc":"',IFNULL(new.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(new.RoleStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_Role` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_Role_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_Role_delete_after` AFTER DELETE ON `P_Role` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_Role',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleCode":"',IFNULL(old.RoleCode,''),'", ','"RoleName":"',IFNULL(old.RoleName,''),'", ','"RoleDesc":"',IFNULL(old.RoleDesc,''),'", ','"RoleStatus":"',IFNULL(old.RoleStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleFunction_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleFunction_insert_after` AFTER INSERT ON `P_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleFunction',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleID":"',IFNULL(new.RoleID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"RFStatus":"',IFNULL(new.RFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleFunction_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleFunction_update_after` AFTER UPDATE ON `P_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleFunction',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleID":"',IFNULL(old.RoleID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"RFStatus":"',IFNULL(old.RFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleID":"',IFNULL(new.RoleID,''),'", ','"FunctionID":"',IFNULL(new.FunctionID,''),'", ','"RFStatus":"',IFNULL(new.RFStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleFunction` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleFunction_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleFunction_delete_after` AFTER DELETE ON `P_RoleFunction` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleFunction',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleID":"',IFNULL(old.RoleID,''),'", ','"FunctionID":"',IFNULL(old.FunctionID,''),'", ','"RFStatus":"',IFNULL(old.RFStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleMenu_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleMenu_insert_after` AFTER INSERT ON `P_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleMenu',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleID":"',IFNULL(new.RoleID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"RMStatus":"',IFNULL(new.RMStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleMenu_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleMenu_update_after` AFTER UPDATE ON `P_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleMenu',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleID":"',IFNULL(old.RoleID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"RMStatus":"',IFNULL(old.RMStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"RoleID":"',IFNULL(new.RoleID,''),'", ','"MenuID":"',IFNULL(new.MenuID,''),'", ','"RMStatus":"',IFNULL(new.RMStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_RoleMenu` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_RoleMenu_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_RoleMenu_delete_after` AFTER DELETE ON `P_RoleMenu` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_RoleMenu',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"RoleID":"',IFNULL(old.RoleID,''),'", ','"MenuID":"',IFNULL(old.MenuID,''),'", ','"RMStatus":"',IFNULL(old.RMStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_User_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_User_insert_after` AFTER INSERT ON `P_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_User',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"Account":"',IFNULL(new.Account,''),'", ','"Phone":"',IFNULL(new.Phone,''),'", ','"Email":"',IFNULL(new.Email,''),'", ','"Password":"',IFNULL(new.Password,''),'", ','"USex":"',IFNULL(new.USex,''),'", ','"UName":"',IFNULL(new.UName,''),'", ','"UType":"',IFNULL(new.UType,''),'", ','"UStatus":"',IFNULL(new.UStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_User_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_User_update_after` AFTER UPDATE ON `P_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_User',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"Account":"',IFNULL(old.Account,''),'", ','"Phone":"',IFNULL(old.Phone,''),'", ','"Email":"',IFNULL(old.Email,''),'", ','"Password":"',IFNULL(old.Password,''),'", ','"USex":"',IFNULL(old.USex,''),'", ','"UName":"',IFNULL(old.UName,''),'", ','"UType":"',IFNULL(old.UType,''),'", ','"UStatus":"',IFNULL(old.UStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"Account":"',IFNULL(new.Account,''),'", ','"Phone":"',IFNULL(new.Phone,''),'", ','"Email":"',IFNULL(new.Email,''),'", ','"Password":"',IFNULL(new.Password,''),'", ','"USex":"',IFNULL(new.USex,''),'", ','"UName":"',IFNULL(new.UName,''),'", ','"UType":"',IFNULL(new.UType,''),'", ','"UStatus":"',IFNULL(new.UStatus,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_User` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_User_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_User_delete_after` AFTER DELETE ON `P_User` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_User',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"Account":"',IFNULL(old.Account,''),'", ','"Phone":"',IFNULL(old.Phone,''),'", ','"Email":"',IFNULL(old.Email,''),'", ','"Password":"',IFNULL(old.Password,''),'", ','"USex":"',IFNULL(old.USex,''),'", ','"UName":"',IFNULL(old.UName,''),'", ','"UType":"',IFNULL(old.UType,''),'", ','"UStatus":"',IFNULL(old.UStatus,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_UserInfo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_UserInfo_insert_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_UserInfo_insert_after` AFTER INSERT ON `P_UserInfo` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_UserInfo',new.ID,'I',''
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"Address":"',IFNULL(new.Address,''),'", ','"NickName":"',IFNULL(new.NickName,''),'", ','"HeadImage":"',IFNULL(new.HeadImage,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('新增:',new.ID),new.CreateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_UserInfo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_UserInfo_update_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_UserInfo_update_after` AFTER UPDATE ON `P_UserInfo` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_UserInfo',new.ID,'U'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"Address":"',IFNULL(old.Address,''),'", ','"NickName":"',IFNULL(old.NickName,''),'", ','"HeadImage":"',IFNULL(old.HeadImage,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,CONCAT('{"ID":"',IFNULL(new.ID,''),'", ','"UserID":"',IFNULL(new.UserID,''),'", ','"Address":"',IFNULL(new.Address,''),'", ','"NickName":"',IFNULL(new.NickName,''),'", ','"HeadImage":"',IFNULL(new.HeadImage,''),'", ','"CreateTime":"',IFNULL(new.CreateTime,''),'", ','"CreateUser":"',IFNULL(new.CreateUser,''),'", ','"UpdateTime":"',IFNULL(new.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(new.UpdateUser,''),'"}')
      ,CONCAT('修改:',new.ID),new.UpdateUser,0);
    END */$$


DELIMITER ;

/* Trigger structure for table `P_UserInfo` */

DELIMITER $$

/*!50003 DROP TRIGGER*//*!50032 IF EXISTS */ /*!50003 `trigger_P_UserInfo_delete_after` */$$

/*!50003 CREATE */ /*!50017 DEFINER = 'root'@'%' */ /*!50003 TRIGGER `trigger_P_UserInfo_delete_after` AFTER DELETE ON `P_UserInfo` FOR EACH ROW BEGIN
      CALL `insert_sys_log`('P_UserInfo',old.ID,'D'
      ,CONCAT('{"ID":"',IFNULL(old.ID,''),'", ','"UserID":"',IFNULL(old.UserID,''),'", ','"Address":"',IFNULL(old.Address,''),'", ','"NickName":"',IFNULL(old.NickName,''),'", ','"HeadImage":"',IFNULL(old.HeadImage,''),'", ','"CreateTime":"',IFNULL(old.CreateTime,''),'", ','"CreateUser":"',IFNULL(old.CreateUser,''),'", ','"UpdateTime":"',IFNULL(old.UpdateTime,''),'", ','"UpdateUser":"',IFNULL(old.UpdateUser,''),'"}')
      ,''
      ,CONCAT('删除:',old.ID),old.UpdateUser,0);
    END */$$


DELIMITER ;

/* Procedure structure for procedure `insert_sys_log` */

/*!50003 DROP PROCEDURE IF EXISTS  `insert_sys_log` */;

DELIMITER $$

/*!50003 CREATE DEFINER=`root`@`%` PROCEDURE `insert_sys_log`(Table_Name VARCHAR(100),PrimaryKey VARCHAR(100),LogType VARCHAR(1),OldContent TEXT,NewContent TEXT,de VARCHAR(256),UserId VARCHAR(50),SendType INT(1))
BEGIN
	INSERT INTO `SYS_Log`(`TableName`,`PrimaryKey`,`LogType`,`OldContent`,`NewContent`,`Describe`,`UserId`,`CreateTime`,`SendType`)
	VALUE(Table_Name,PrimaryKey,LogType,OldContent,NewContent,de,UserId,NOW(),SendType);
    END */$$
DELIMITER ;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
