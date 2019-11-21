/*
 Navicat MySQL Data Transfer

 Source Server         : crmeb-mf
 Source Server Version : 50725
 Source Host           : 114.55.209.106
 Source Database       : mf_crmeb_net

 Target Server Version : 50725
 File Encoding         : utf-8

 Date: 11/16/2019 11:14:31 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `eb_cache`
-- ----------------------------
DROP TABLE IF EXISTS `eb_cache`;
CREATE TABLE `eb_cache` (
  `key` varchar(32) NOT NULL,
  `result` text COMMENT '缓存数据',
  `add_time` int(10) DEFAULT NULL COMMENT '缓存时间',
  PRIMARY KEY (`key`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信缓存表';

-- ----------------------------
--  Table structure for `eb_store_category`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_category`;
CREATE TABLE `eb_store_category` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品分类表ID',
  `pid` mediumint(11) NOT NULL COMMENT '父id',
  `cate_name` varchar(100) NOT NULL COMMENT '分类名称',
  `sort` mediumint(11) NOT NULL COMMENT '排序',
  `pic` varchar(128) NOT NULL DEFAULT '' COMMENT '图标',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '是否推荐',
  `add_time` int(11) NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_base` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8 COMMENT='商品分类表';

-- ----------------------------
--  Records of `eb_store_category`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_category` VALUES ('1', '0', '热门推荐', '2', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '1', '1547205038'), ('2', '1', '热门促销', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dba1366885.jpg', '1', '1547205055'), ('3', '1', '折扣专区', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '1', '1547550363'), ('4', '1', '新品上线', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc6a38fab.jpg', '1', '1553783295'), ('6', '0', '居家生活', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3db8b933d92.jpg', '1', '1553783609'), ('7', '6', '床垫', '1', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9de8b7c5cc5.png', '1', '1553784473'), ('8', '6', '灯具', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9def00c2882.png', '1', '1553784490'), ('9', '0', '家电电器', '3', '', '1', '1553852206'), ('10', '0', '手机数码', '4', '', '1', '1553852227'), ('11', '0', '智能设备', '5', '', '1', '1553852259'), ('12', '0', '影音音响', '6', '', '1', '1553852288'), ('13', '0', '服饰鞋帽', '7', '', '1', '1553852314'), ('14', '0', '餐厨厨房', '8', '', '1', '1553852353'), ('15', '0', '洗护健康', '9', '', '1', '1553852370'), ('16', '0', '日杂用品', '10', '', '1', '1553852390'), ('17', '0', '出行交通', '11', '', '1', '1553852413'), ('18', '0', '配件设备', '13', 'http://kaifa.crmeb.net/uploads/attach/2019/08/20190809/6801781ff4403bdbb6764f4182394729.png', '1', '1553852458'), ('19', '6', '家具', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9def5fa968c.png', '1', '1553854308'), ('20', '6', '床品件套', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df11e13742.png', '1', '1553854755'), ('21', '6', '家饰花卉', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df170010cb.png', '1', '1553854835'), ('22', '6', '布艺软装', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/03/29/5c9df1b8f0a7a.png', '1', '1553854908'), ('23', '0', '测试', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/08/20190805/887db984b5f1138e08e1d9b069af766e.jpg', '1', '1565158900'), ('24', '23', '测试1', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/08/20190805/887db984b5f1138e08e1d9b069af766e.jpg', '1', '1565158917'), ('25', '0', '测试2', '0', '', '1', '1565158947'), ('26', '25', '测试22', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/08/20190805/887db984b5f1138e08e1d9b069af766e.jpg', '1', '1565158963');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product`;
CREATE TABLE `eb_store_product` (
  `id` mediumint(11) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `mer_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户Id(0为总后台管理员创建,不为0的时候是商户后台创建)',
  `image` varchar(256) NOT NULL COMMENT '商品图片',
  `slider_image` varchar(2000) NOT NULL COMMENT '轮播图',
  `store_name` varchar(128) NOT NULL COMMENT '商品名称',
  `store_info` varchar(256) NOT NULL COMMENT '商品简介',
  `keyword` varchar(256) NOT NULL COMMENT '关键字',
  `bar_code` varchar(15) NOT NULL DEFAULT '' COMMENT '产品条码（一维码）',
  `cate_id` varchar(64) NOT NULL COMMENT '分类id',
  `price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '商品价格',
  `vip_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '会员价格',
  `ot_price` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '市场价',
  `postage` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '邮费',
  `unit_name` varchar(32) NOT NULL COMMENT '单位名',
  `sort` smallint(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `sales` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `stock` mediumint(11) unsigned NOT NULL DEFAULT '0' COMMENT '库存',
  `is_show` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（0：未上架，1：上架）',
  `is_hot` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否热卖',
  `is_benefit` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否优惠',
  `is_best` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否精品',
  `is_new` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否新品',
  `description` text NOT NULL COMMENT '产品描述',
  `add_time` int(11) unsigned NOT NULL COMMENT '添加时间',
  `is_postage` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否包邮',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否删除',
  `mer_use` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '商户是否代理 0不可代理1可代理',
  `give_integral` decimal(8,2) unsigned NOT NULL COMMENT '获得积分',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `is_seckill` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '秒杀状态 0 未开启 1已开启',
  `is_bargain` tinyint(1) unsigned DEFAULT NULL COMMENT '砍价状态 0未开启 1开启',
  `is_good` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否优品推荐',
  `ficti` mediumint(11) DEFAULT '100' COMMENT '虚拟销量',
  `browse` int(11) DEFAULT '0' COMMENT '浏览量',
  `code_path` varchar(64) NOT NULL DEFAULT '' COMMENT '产品二维码地址(用户小程序海报)',
  `soure_link` varchar(255) DEFAULT '' COMMENT '淘宝京东1688类型',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `cate_id` (`cate_id`) USING BTREE,
  KEY `is_hot` (`is_hot`) USING BTREE,
  KEY `is_benefit` (`is_benefit`) USING BTREE,
  KEY `is_best` (`is_best`) USING BTREE,
  KEY `is_new` (`is_new`) USING BTREE,
  KEY `toggle_on_sale, is_del` (`is_del`) USING BTREE,
  KEY `price` (`price`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `sort` (`sort`) USING BTREE,
  KEY `sales` (`sales`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `is_postage` (`is_postage`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商品表';

-- ----------------------------
--  Records of `eb_store_product`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_product` VALUES ('1', '0', 'https://record-1251018669.cos.ap-chengdu.myqcloud.com/0ee17201905151741257691.png', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba1366885.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dba4187461.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3db9de2b73a.jpg\"]', '无线吸尘器F8 玫瑰金礼盒版', '【年货节活动价1699元，领取吸尘器优惠券再减50元，到手价仅1649元】', '无线吸尘器', '', '2,7', '0.01', '0.00', '1699.00', '1.00', '件', '1', '293', '330', '0', '1', '0', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb137d656.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb229e820.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb3b37f84.jpeg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg\"/></p>', '1547205504', '0', '0', '0', '1699.00', '100.00', '0', '0', '0', '81', '0', '', null), ('2', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc6a38fab.jpg\"]', '智能马桶盖 AI版', '智能马桶盖 AI版', '智能马桶', '', '3,2', '0.01', '0.00', '1999.00', '5.00', '件', '0', '212', '938', '1', '1', '1', '1', '1', '<p><img src=\"http://kaifa.crmeb.net/uploads/config/image/20190725/8827bb36f160a1c33ae710883966063b.png\"/></p>', '1547516202', '1', '0', '0', '1999.00', '1500.00', '0', '0', '0', '20', '0', '', null), ('3', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc0ef27068.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\"]', '智米加湿器 白色', '智米加湿器 白色', '加湿器', '', '3,2', '249.00', '0.00', '299.00', '0.00', '件', '0', '110', '3949', '1', '1', '1', '1', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc1730a0c0.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc182bccac.jpg\"/></p>', '1547551009', '1', '0', '0', '249.00', '10.00', '0', '0', '0', '8', '0', '', null), ('4', '0', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc23646fff.jpg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc23646fff.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc0ef27068.jpg\"]', '互联网电热水器1A', '3000w双管速热，动态360L热水用量，双重漏电保护，智能APP操控', '电热水器', '', '3,2', '999.00', '0.00', '1599.00', '0.00', '件', '0', '86', '414', '0', '1', '1', '0', '1', '<p><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc286862fd.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc294a9a0a.jpg\"/><img src=\"http://datong.crmeb.net/public/uploads/editor/20190115/5c3dc2ba18a77.jpg\"/></p>', '1547551346', '1', '0', '0', '999.00', '888.00', '0', '0', '0', '10', '0', '', null), ('5', '0', 'http://datong.crmeb.net/public/uploads/editor/20190115/5c3dbb513b06f.jpeg', '[\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dc294a9a0a.jpg\",\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/editor\\/20190115\\/5c3dbb513b06f.jpeg\"]', '测试', '阿萨德啊', '去', '', '4,7,2,3,19', '1.00', '0.00', '1.00', '0.00', '件', '0', '7', '94', '1', '1', '0', '1', '0', '', '1554863537', '0', '1', '0', '1.00', '1.00', '0', null, '0', '1', '0', '', null), ('6', '0', 'https://activityu.crmeb.net//ed0437125c6a0b03313c95c180ad82cd.jpg', '[\"https:\\/\\/activityu.crmeb.net\\/\\/ed0437125c6a0b03313c95c180ad82cd.jpg\",\"https:\\/\\/activityu.crmeb.net\\/\\/ed5a330b2e4df8743e7c8747d2ba077d.jpg\",\"https:\\/\\/activityu.crmeb.net\\/\\/982ee257498f8ab6e757c09cbf2f6865.jpg\",\"https:\\/\\/activityu.crmeb.net\\/\\/ecc9f0b3ae923da5ec116a9b40bd851c.jpg\",\"https:\\/\\/activityu.crmeb.net\\/\\/2ca5fd434e88a579238aeaf31389e2ab.jpg\",\"https:\\/\\/activityu.crmeb.net\\/\\/33f86af708018fbaeead7220642c6e83.jpg\"]', '【小米小米9】小米94800万超广角三摄6GB+128GB全息幻彩蓝骁龙855全网通4G双卡双待水滴全面屏拍照游戏智能手机', '【小米小米9】小米94800万超广角三摄6GB+128GB全息幻彩蓝骁龙855全网通4G双卡双待水滴全面屏拍照游戏智能手机', '小米9', '', '2', '3999.00', '0.00', '3999.00', '0.00', '件', '0', '0', '100', '0', '1', '0', '0', '0', '<br><div id=\"zbViewModulesH\" value=\"26470\"></div><input id=\"zbViewModulesHeight\" type=\"hidden\" value=\"26470\"><div skudesign=\"100010\"></div><div class=\"ssd-module-wrap\">\n    <div class=\"ssd-module M155426253860522 animate-M155426253860522\" data-id=\"M155426253860522\">\n        \n</div>\n<div class=\"ssd-module M155426253862223 animate-M155426253862223\" data-id=\"M155426253862223\">\n        \n</div>\n<div class=\"ssd-module M155426253863924 animate-M155426253863924\" data-id=\"M155426253863924\">\n        \n</div>\n<div class=\"ssd-module M155426253865225 animate-M155426253865225\" data-id=\"M155426253865225\">\n        \n</div>\n<div class=\"ssd-module M155426253867026 animate-M155426253867026\" data-id=\"M155426253867026\">\n        \n</div>\n<div class=\"ssd-module M155426253868827 animate-M155426253868827\" data-id=\"M155426253868827\">\n        \n</div>\n<div class=\"ssd-module M155426253870528 animate-M155426253870528\" data-id=\"M155426253870528\">\n        \n</div>\n<div class=\"ssd-module M155426253872529 animate-M155426253872529\" data-id=\"M155426253872529\">\n        \n</div>\n<div class=\"ssd-module M155426253874230 animate-M155426253874230\" data-id=\"M155426253874230\">\n        \n</div>\n<div class=\"ssd-module M155426253875531 animate-M155426253875531\" data-id=\"M155426253875531\">\n        \n</div>\n<div class=\"ssd-module M155426253876832 animate-M155426253876832\" data-id=\"M155426253876832\">\n        \n</div>\n<div class=\"ssd-module M155426253878633 animate-M155426253878633\" data-id=\"M155426253878633\">\n        \n</div>\n<div class=\"ssd-module M155426253880434 animate-M155426253880434\" data-id=\"M155426253880434\">\n        \n</div>\n<div class=\"ssd-module M155426253881935 animate-M155426253881935\" data-id=\"M155426253881935\">\n        \n</div>\n<div class=\"ssd-module M155426253883836 animate-M155426253883836\" data-id=\"M155426253883836\">\n        \n</div>\n<div class=\"ssd-module M155426253885437 animate-M155426253885437\" data-id=\"M155426253885437\">\n        \n</div>\n<div class=\"ssd-module M155426253887338 animate-M155426253887338\" data-id=\"M155426253887338\">\n        \n</div>\n<div class=\"ssd-module M155426253889039 animate-M155426253889039\" data-id=\"M155426253889039\">\n        \n</div>\n<div class=\"ssd-module M155426253890540 animate-M155426253890540\" data-id=\"M155426253890540\">\n        \n</div>\n<div class=\"ssd-module M155426253892241 animate-M155426253892241\" data-id=\"M155426253892241\">\n        \n</div>\n<div class=\"ssd-module M155426253894142 animate-M155426253894142\" data-id=\"M155426253894142\">\n        \n</div>\n\n</div>\n<!-- 2019-04-11 10:18:24 --> <br><script></script><br>', '1558580351', '0', '0', '0', '0.00', '3999.00', '0', null, '0', '123', '0', '', 'https://item.jd.com/7437708.html'), ('7', '0', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//6f2a1ece45e307f274e3384410a3bd3a.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/6f2a1ece45e307f274e3384410a3bd3a.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/ec8484e93ac49309b5576bb5f96d202f.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/60fff157d277d17154d738403870a489.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/3bfee3357bbf0091c2cdfe7aa1da5eec.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/6f2bbcd0dffd379c6f91e95a308bcfb6.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/f92383a6a1be19a7588ccd227e458afd.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/353d754027763daf1ce61d94f7c3709a.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/5f273c529aa59d313f08a36a50a20380.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/27cf255f9990535ed3b333009f1df52c.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/a7dbbc6d4a2ecf16b592b880d937a770.jpg\"]', '【华为畅享9S】华为HUAWEI畅享9S6GB+64GB珊瑚红全网通2400万超广角三摄珍珠屏大存储移动联通电信4G手机双卡双待', '【华为畅享9S】华为HUAWEI畅享9S6GB+64GB珊瑚红全网通2400万超广角三摄珍珠屏大存储移动联通电信4G手机双卡双待', '件', '', '2', '100.00', '0.00', '2000.00', '0.00', '件', '0', '25', '76', '1', '1', '0', '1', '0', '<br><div cssurl=\"//sku-market-gw.jd.com/css/pc/100005088680.css?t=1555464055068\"></div><div skucode=\"100010\"></div><center>\n<div class=\"content_tpl\">\n<div class=\"formwork\">\n<div class=\"formwork_img\">\n<img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//51de55dd382eb9fd9bdc6b9c4218d866.jpg\" usemap=\"#Mapnate20\" border=\"0\"> \n<map name=\"Mapnate20\">\n<area shape=\"rect\" coords=\"14,27,246,400\" href=\"//item.jd.com/100004323338.html\" target=\"_blank\"> <area shape=\"rect\" coords=\"261,27,491,400\" href=\"https://item.jd.com/100000766433.html#crumb-wrap\" target=\"_blank\"> <area shape=\"rect\" coords=\"506,27,736,400\" href=\"https://item.jd.com/100002293114.html#crumb-wrap\" target=\"_blank\"> \n</map>\n<img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//3495c08138194a6f26d821760d6d62a7.jpg\"> <img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//e030f09b773f5a7c8b8a19f77c0ea713.jpg\"> \n</div>\n</div>\n</div>\n</center><br><script></script><br>', '1559101322', '0', '0', '0', '10.00', '1000.00', '0', null, '0', '0', '0', '', 'https://item.jd.com/100005088680.html'), ('8', '0', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//71e85589cb7d3398d08f0d55bdb9031d.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/71e85589cb7d3398d08f0d55bdb9031d.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/996c4bad976844b4f3bcf73cbd6e0f15.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/e47f51861c11fc648a298b16c24d8627.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/105cf3b5bbe2e1c7e6366d09b71e88b2.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/e275a4c451e06248cecc0cfb2ed24fed.jpg\"]', '【AppleiPhone8】AppleiPhone8(A1863)256GB深空灰色移动联通电信4G手机', '【AppleiPhone8】AppleiPhone8(A1863)256GB深空灰色移动联通电信4G手机', '件', '', '2', '0.00', '0.00', '1000.00', '0.00', '件', '0', '20', '982', '1', '1', '0', '0', '0', '<br><div skucode=\"100010\"></div><table id=\"__01\" width=\"750\" height=\"1272\" border=\"0\" align=\"center\" cellpadding=\"0\" cellspacing=\"0\"><tbody><tr><td><img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//da410a5d704e8d94ada293edb79678a7.jpg\" alt=\"\" width=\"750\" height=\"249\" usemap=\"#Map01\" border=\"0\" <=\"\" d=\"\"></td></tr><tr><td><img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//9ccac843781c262ae1e35bd176d43411.jpg\" width=\"750\" height=\"341\" alt=\"\"></td></tr><tr><td><img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//57064ab7664452fef3b9dab19668f915.jpg\" width=\"750\" height=\"405\" alt=\"\" usemap=\"#Map02\" border=\"0\"></td></tr><tr><td><img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/29//92d55c4dc01ade157aba628edc00be0b.jpg\" width=\"640\" alt=\"\" usemap=\"#Map03\"><map name=\"Map01\"><area shape=\"rect\" coords=\"5,41,98,177\" href=\"https://pro.m.jd.com/mall/active/bFBgZuiq1QFNCPfzog9sEHDfeN5/index.html\" target=\"_blank\"><area shape=\"rect\" coords=\"231,67,330,194\" href=\"https://mall.jd.com/view_page-86030491.html#jingzhunda\" target=\"_blank\"> <area shape=\"rect\" coords=\"418,67,517,195\" href=\"https://mall.jd.com/view_page-86030491.html#jingdongweixiu\" target=\"_blank\"> <area shape=\"rect\" coords=\"606,67,705,195\" href=\"https://mall.jd.com/view_page-86030491.html#yijiuhuanxin\" target=\"_blank\"> <map name=\"Map02\"><area shape=\"rect\" coords=\"3,38,250,402\" href=\"https://item.jd.com/4996353.html\" target=\"_blank\"> <area shape=\"rect\" coords=\"252,38,495,402\" href=\"https://item.jd.com/771942.html\" target=\"_blank\"> <area shape=\"rect\" coords=\"501,39,745,400\" href=\"https://item.jd.com/5164987.html\" target=\"_blank\"> </map><map name=\"Map03\"><area shape=\"rect\" coords=\"196,220,532,252\" href=\"https://support.apple.com/zh-cn/HT204073\" target=\"_blank\"> </map></map></td></tr></tbody></table><br><script></script><br>', '1559101359', '0', '0', '0', '0.00', '1000.00', '0', null, '0', '0', '0', '', 'https://item.jd.com/5089241.html'), ('9', '0', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//51308e61ace45968fdef953b2ac6c241.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/51308e61ace45968fdef953b2ac6c241.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/d3f3999622cb39eddb966d8cc041cb79.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/c2a01686bee0024c0ae3d08367ef9836.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/7121d81126a84b20a4f8b7e1252d0306.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/a6cc4157d0cf8e79f5b4a7cac1423f25.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/391618fe80748151243ce5e8650ee3bb.jpg\"]', '【雷神911Air星战】雷神(ThundeRobot)911Air星战二代旗舰版15.6英寸窄边框游戏笔记本电脑i79750H512GSSDRGB键盘GTX1650', '【雷神911Air星战】雷神(ThundeRobot)911Air星战二代旗舰版15.6英寸窄边框游戏笔记本电脑i79750H512GSSDRGB键盘GTX1650', '件', '', '2', '1000.00', '0.00', '1000.00', '0.00', '件', '0', '23', '983', '1', '1', '0', '0', '1', '<br><div id=\"zbViewModulesH\" value=\"12744\"></div><input id=\"zbViewModulesHeight\" type=\"hidden\" value=\"12744\"><div skudesign=\"100010\"></div><div class=\"ssd-module-wrap\">\n    <div class=\"ssd-module M15574696198181 animate-M15574696198181\" data-id=\"M15574696198181\">\n        \n</div>\n<div class=\"ssd-module M15574696198302 animate-M15574696198302\" data-id=\"M15574696198302\">\n        \n</div>\n<div class=\"ssd-module M15574696198423 animate-M15574696198423\" data-id=\"M15574696198423\">\n        \n</div>\n<div class=\"ssd-module M15574696198564 animate-M15574696198564\" data-id=\"M15574696198564\">\n        \n</div>\n<div class=\"ssd-module M15574696198705 animate-M15574696198705\" data-id=\"M15574696198705\">\n        \n</div>\n<div class=\"ssd-module M15574696198856 animate-M15574696198856\" data-id=\"M15574696198856\">\n        \n</div>\n<div class=\"ssd-module M15574696199077 animate-M15574696199077\" data-id=\"M15574696199077\">\n        \n</div>\n<div class=\"ssd-module M15574696199278 animate-M15574696199278\" data-id=\"M15574696199278\">\n        \n</div>\n<div class=\"ssd-module M15574696199519 animate-M15574696199519\" data-id=\"M15574696199519\">\n        \n</div>\n<div class=\"ssd-module M155746961996910 animate-M155746961996910\" data-id=\"M155746961996910\">\n        \n</div>\n<div class=\"ssd-module M155746961998811 animate-M155746961998811\" data-id=\"M155746961998811\">\n        \n</div>\n<div class=\"ssd-module M155746962001812 animate-M155746962001812\" data-id=\"M155746962001812\">\n        \n</div>\n<div class=\"ssd-module M155746962004613 animate-M155746962004613\" data-id=\"M155746962004613\">\n        \n</div>\n<div class=\"ssd-module M155746962006814 animate-M155746962006814\" data-id=\"M155746962006814\">\n        \n</div>\n<div class=\"ssd-module M155746962008915 animate-M155746962008915\" data-id=\"M155746962008915\">\n        \n</div>\n\n</div>\n<!-- 2019-05-10 02:27:40 --> <br><script></script><br>', '1559110455', '0', '0', '0', '0.00', '1000.00', '0', null, '0', '20', '0', '', 'https://item.jd.com/100005518258.html'), ('10', '0', 'http://activity.crmeb.net/public/uploads/attach/2019/05/30//b58f452dc89775b344bade7fdc3ede14.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/b58f452dc89775b344bade7fdc3ede14.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/fe90dcb696cfcef739565894f9e93d9d.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/75a24145aac82bce88931019f91e928a.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/cdbc02ce7907670aa099c486f8959154.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/f8c0ffa71bfc8efae28082bf05c8969a.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/5fda52231265c835f853dd284d7437f9.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/0eaba55adaedcd7d0b17c7202225eed9.jpg\"]', '【华为华为10000mAh快充移动电源/充电宝】华为10000毫安充电宝/移动电源18W双向快充MicroUSB口输入白色适用于安卓/苹果/平板等', '【华为华为10000mAh快充移动电源/充电宝】华为10000毫安充电宝/移动电源18W双向快充MicroUSB口输入白色适用于安卓/苹果/平板等', '', '', '4', '300.00', '0.00', '300.00', '0.00', '件', '0', '0', '100', '0', '1', '0', '1', '0', '<br><div cssurl=\"//sku-market-gw.jd.com/css/pc/100002611539.css?t=1552645455602\"></div><div skucode=\"100010\"></div><center>\n<img src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//efbee681cb31fe72ed52c006b56f31cf.jpg\"> \n</center><br><script></script><br>', '1559198939', '0', '0', '0', '0.00', '400.00', '0', null, '0', '50', '0', '', 'https://item.jd.com/100002611539.html'), ('11', '0', 'http://activity.crmeb.net/public/uploads/attach/2019/05/30//0eecbfbca9ebc315c2882590fd55a209.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/0eecbfbca9ebc315c2882590fd55a209.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/1a730a7edcb0c373f8188b4d6090999e.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/1da1cff5adc9c053022373596032cbb4.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/d116eb69f06169eed8efd06fcd4dcb90.jpg\",\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/30\\/\\/33f645b107441db0b05eaa428a888ac6.jpg\"]', '伊利酸奶畅轻整箱装乳酸菌燕麦黄桃草莓早餐奶250克9瓶风味发酵乳', '伊利酸奶畅轻整箱装乳酸菌燕麦黄桃草莓早餐奶250克9瓶风味发酵乳', '', '', '4', '80.00', '0.00', '80.00', '0.00', '件', '0', '63', '937', '1', '1', '0', '1', '0', '<div style=\"width: 790.0px;height: 13870.0px;overflow: hidden;\"><div style=\"width: 790.0px;height: 13870.0px;overflow: hidden;\"><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//4466609a8fd2572a4366a0786f7893a5.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//f37e16bbbc014195001bc16fcc6cae63.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//960bad190414f774241379ccdf073576.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//8f20a9984fd968785de5e32053be9747.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//c00e4506123402f687405c69b80bb5c8.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//e8bccebd6534055129a8af8c488528a3.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//547c56bac0eb97085b776234e6104d42.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//ebd3cccb57e2d1b7a06b18fb1ee19978.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//a2981e2259068977cb15205d5516046b.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//e768dca53e023a3a79215fe2f2cf25fb.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//57ad0f7b95a510e91f5c080cd0ef45f0.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//3b2c7bafc9bfba1e01da50f2d44da19c.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//4af68ddf547e251bc349daac6b7ddc21.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//c59c6f708dda1ac28df3f627b1543f4e.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//a4cfd1a15c188d1c7793dcd6762c607f.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//83d0a242bbf6c4fce431da5a45ba72dc.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//c56ca302f42d2d16a770d3f87796e614.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//7d2008368b7a9122465c34f459ed55d7.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//cfef919448f30e5b433572edbd316ef5.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//793c7f0f2d8cdc74c7d94dc9c5a3d125.jpg\"/><img style=\"display: block;width: 100.0%;\" src=\"http://activity.crmeb.net/public/uploads/attach/2019/05/30//0d8fd269982df7991462bffcb92904f1.jpg\"/></div></div>', '1559199293', '0', '0', '0', '0.00', '90.00', '0', null, '0', '10', '0', '', 'https://detail.tmall.com/item.htm?spm=a1z10.5-b-s.w4011-19034888351.47.551172542eL9Go&id=569589000841&rn=cdeb08db2601055d6c446c7400b0057f&abbucket=3'), ('12', '0', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\"]', '测撒测试', '测撒测试', '测撒测试', '', '3', '10.00', '0.00', '10.00', '0.00', '件', '0', '4', '996', '1', '1', '1', '1', '1', '', '1560650420', '1', '1', '0', '0.00', '5.00', '0', null, '0', '100', '0', '', ''), ('13', '0', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\"]', '测撒测试', '测撒测试', '测撒测试', '', '3', '10.00', '0.00', '10.00', '0.00', '件', '0', '1', '999', '1', '1', '1', '1', '1', '', '1560650420', '1', '1', '0', '0.00', '5.00', '0', null, '0', '100', '0', '', ''), ('14', '0', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\"]', '测撒测试', '测撒测试', '测撒测试', '', '3', '10.00', '0.00', '10.00', '0.00', '件', '0', '3', '997', '1', '1', '1', '1', '1', '', '1560650420', '1', '1', '0', '0.00', '5.00', '0', null, '0', '100', '0', '', ''), ('15', '0', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '[\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\"]', '测撒测试', '测撒测试', '测撒测试', '', '3', '10.00', '0.00', '10.00', '0.00', '件', '0', '15', '998', '1', '1', '1', '1', '1', '', '1560650420', '1', '1', '0', '0.00', '5.00', '0', null, '0', '100', '0', '', ''), ('17', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/69eb5f09f947ff53244a57d5c021b817.jpg', '[\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/07\\/30\\/69eb5f09f947ff53244a57d5c021b817.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/07\\/30\\/ce0a2ed478552ca0bfc7092f337c8d10.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/07\\/30\\/13efc762f7fdfec35ad2eeedc541db4b.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/07\\/30\\/4d280506de9f99621d6c9257abb00002.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/07\\/30\\/b07e8708977de9c820d7d97958776f8d.jpg\"]', '微信小程序公众号商城源码模板开发定制作拼团购带后台教程CRMEB', '微信小程序公众号商城源码模板开发定制作拼团购带后台教程CRMEB', '', '', '4', '498.00', '0.00', '498.00', '0.00', '件', '0', '0', '498', '1', '0', '0', '0', '0', '<p><br/></p><p><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/60a1b15d3a76d624e8fe4f29d6405329.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/4d756807800de48cf64515abde691858.jpg\" style=\"max-width: 750.0px;\"/><a href=\"http://undefined\" target=\"_blank\"><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/6eb36373e34467b616caf8ebd628b8a9.jpg\" style=\"max-width: 750.0px;\"/></a><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/9fd1c33715375d14a910dc6ac16a1f01.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/cf82af05b3627661f7311b437fd4ef75.png\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/6a199d8d05c1ade1d9d9d430af0c2135.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/ba7b6671f1ab84b7d1ff9f7ae483db97.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/17c4918d59ef74b5f15b63ce905cc301.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/29bcd8aeffa602b6bc37c9ea219f54a1.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/5ccce7202973e32e7b2086010e29038b.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/dc887ac553f4ea66365e69a626b4f030.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/77aedb47edfd4f9f3fe4d0be51bb2994.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/c57055e3fbd06b6947e49da47751ed7e.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/efdf887ad14277311c8f373197bd95ad.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/39154c06e825503436d4e488aecfc466.jpg\" style=\"max-width: 750.0px;\"/><img src=\"http://kaifa.crmeb.net/uploads/attach/2019/07/30/3bbf70c1bbebee6dec6717700a1a0fb1.jpg\" style=\"max-width: 750.0px;\"/></p><p><br/></p><div style=\"height: 1.0px;overflow: hidden;line-height: 20.0px;\">添加影藏字符</div>', '1564471319', '0', '0', '0', '0.00', '498.00', '0', null, '0', '498', '0', '', 'https://item.taobao.com/item.htm?spm=a1z10.1-c.w4004-10814341800.8.26d7346bMJoug6&id=575636560349'), ('18', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/08/20190805/887db984b5f1138e08e1d9b069af766e.jpg', '[\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/20190805\\/887db984b5f1138e08e1d9b069af766e.jpg\"]', '111', '111', '111', '', '', '20.00', '0.00', '20.00', '0.00', '件', '0', '0', '20', '0', '0', '0', '0', '0', '', '1565148206', '0', '0', '0', '0.00', '0.00', '0', null, '0', '0', '0', '', ''), ('19', '0', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/4e3396f4248e9e5ef2eab5505216ade0.jpg', '[\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/13\\/4e3396f4248e9e5ef2eab5505216ade0.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/13\\/5653627e73313cf61c9620725c45a376.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/13\\/1d9d4158d2d7c7f0466e78207246e845.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/13\\/3f9bfd12b76f290d3ed82ea44ebb399a.jpg\",\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/13\\/e8c9d50e6b7cef371fe742ab08abd6a4.jpg\"]', '【直营】ZOJIRUSHI象印进口不锈钢便携保温杯KB48480ml日本tmall.hk天猫国际', '【直营】ZOJIRUSHI象印进口不锈钢便携保温杯KB48480ml日本tmall.hk天猫国际', '', '', '4', '22.00', '0.00', '56.00', '0.00', '件', '0', '0', '222', '1', '0', '0', '0', '0', '<div> <a name=\"hlg_list_1_17635940_start\"></a> </div> <div> <a name=\"hlg_list_1_17599564_end\"></a> </div> <div> <a name=\"hlg_list_1_17537058_start\"></a> </div> <table style=\"margin: 0.0px auto;\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\">  <tbody><tr> <td> <div> &nbsp; </div> <div> <a href=\"https://detail.tmall.hk/hk/item.htm?id=575153295527\" target=\"_blank\"></a><a href=\"https://detail.tmall.hk/hk/item.htm?id=575153295527\" target=\"_blank\"></a> </div> </td> </tr>  </tbody></table> <div> &nbsp; </div> <div> <img width=\"790\" height=\"719\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/e882d4dffdca67b65a7a1e66fb209c4c.jpg\"><img width=\"790\" height=\"589\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/feb565a57f5d42c370c54df7bdacb050.jpg\"><img width=\"790\" height=\"581\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/12709ee798ac2dd5c21d7ab030aa4e13.png\"><img width=\"790\" height=\"1060\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/5cc24febd1722f8c7ec7d5cf74262743.png\"><img width=\"790\" height=\"1051\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/28ccd5e15404129a793045f57049f149.jpg\"><img width=\"790\" height=\"354\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/42cc797e7005e47baf26cc33655b4667.jpg\"><img width=\"790\" height=\"553\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/0a8d0d2e2cb85c94c0d5380058603c56.jpg\"><img width=\"790\" height=\"884\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/26b2896f313fb594884fb992e33c5fa8.jpg\"><img width=\"790\" height=\"891\" style=\"font-weight: bold;font-size: 1.5em;\" src=\"http://kaifa.crmeb.net/uploads/attach/2019/08/13/7d1991d9b7bf33e84782c6cd942224f6.jpg\"> </div>', '1565687845', '0', '0', '0', '0.00', '22.00', '0', null, '0', '22', '0', '', 'https://detail.tmall.hk/hk/item.htm?spm=a1z10.1-b.w4004-21302208419.5.46261c5bwAUxpO&pvid=b786cf12-f690-4910-9535-e0fe5825e8f6&pos=2&acm=03068.1003.1.702815&id=586996993214&scm=1007.12941.28043.100200300000000');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product_attr`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr`;
CREATE TABLE `eb_store_product_attr` (
  `product_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商品ID',
  `attr_name` varchar(32) NOT NULL COMMENT '属性名',
  `attr_values` varchar(256) NOT NULL COMMENT '属性值',
  KEY `store_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表';

-- ----------------------------
--  Records of `eb_store_product_attr`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_product_attr` VALUES ('3', '容量', '3L,4L'), ('3', '颜色', '白色,黑色'), ('15', '颜色', '黑色,白色,紫色'), ('15', '规则', '大,小'), ('2', '孔距', '30cm,40cm'), ('2', '材质', '陶瓷,不锈钢'), ('7', '1', '2,3'), ('7', '3', '1'), ('8', '1', '1,3'), ('8', '2', '2');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product_attr_result`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_result`;
CREATE TABLE `eb_store_product_attr_result` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `result` text NOT NULL COMMENT '商品属性参数',
  `change_time` int(10) unsigned NOT NULL COMMENT '上次修改时间',
  UNIQUE KEY `product_id` (`product_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性详情表';

-- ----------------------------
--  Records of `eb_store_product_attr_result`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_product_attr_result` VALUES ('2', '{\"attr\":[{\"value\":\"\\u5b54\\u8ddd\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"30cm\",\"40cm\"]},{\"value\":\"\\u6750\\u8d28\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9676\\u74f7\",\"\\u4e0d\\u9508\\u94a2\"]}],\"value\":[{\"detail\":{\"\\u5b54\\u8ddd\":\"30cm\",\"\\u6750\\u8d28\":\"\\u9676\\u74f7\"},\"cost\":\"1500.00\",\"price\":0.02,\"sales\":936,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"30cm\",\"\\u6750\\u8d28\":\"\\u4e0d\\u9508\\u94a2\"},\"cost\":\"1500.00\",\"price\":0.03,\"sales\":936,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"40cm\",\"\\u6750\\u8d28\":\"\\u9676\\u74f7\"},\"cost\":\"1500.00\",\"price\":\"0.01\",\"sales\":938,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false},{\"detail\":{\"\\u5b54\\u8ddd\":\"40cm\",\"\\u6750\\u8d28\":\"\\u4e0d\\u9508\\u94a2\"},\"cost\":\"1500.00\",\"price\":\"0.01\",\"sales\":937,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dbc27c69c7.jpg\",\"check\":false}]}', '1565600373'), ('3', '{\"attr\":[{\"value\":\"\\u5bb9\\u91cf\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"3L\",\"4L\"]},{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u767d\\u8272\",\"\\u9ed1\\u8272\"]}],\"value\":[{\"detail\":{\"\\u5bb9\\u91cf\":\"3L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":249,\"sales\":20,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false},{\"detail\":{\"\\u5bb9\\u91cf\":\"4L\",\"\\u989c\\u8272\":\"\\u9ed1\\u8272\"},\"cost\":\"10.00\",\"price\":299,\"sales\":999,\"pic\":\"http:\\/\\/datong.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/01\\/15\\/5c3dc15ba1972.jpg\",\"check\":false}]}', '1559378824'), ('7', '{\"attr\":[{\"value\":\"1\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"2\",\"3\"]},{\"value\":\"3\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"1\"]}],\"value\":[{\"detail\":{\"1\":\"2\",\"3\":\"1\"},\"cost\":\"1000.00\",\"price\":\"100.00\",\"sales\":76,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/6f2a1ece45e307f274e3384410a3bd3a.jpg\",\"check\":false},{\"detail\":{\"1\":\"3\",\"3\":\"1\"},\"cost\":\"1000.00\",\"price\":\"100.00\",\"sales\":76,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/6f2a1ece45e307f274e3384410a3bd3a.jpg\",\"check\":false}]}', '1565665933'), ('8', '{\"attr\":[{\"value\":\"1\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"1\",\"3\"]},{\"value\":\"2\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"2\"]}],\"value\":[{\"detail\":{\"1\":\"1\",\"2\":\"2\"},\"cost\":\"1000.00\",\"price\":\"0.00\",\"sales\":982,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/71e85589cb7d3398d08f0d55bdb9031d.jpg\",\"check\":false},{\"detail\":{\"1\":\"3\",\"2\":\"2\"},\"cost\":\"1000.00\",\"price\":\"0.00\",\"sales\":982,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/71e85589cb7d3398d08f0d55bdb9031d.jpg\",\"check\":false}]}', '1565680773'), ('9', '{\"attr\":[{\"value\":\"\\u914d\\u7f6e\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"i7-9750H 512GSSD RGB\\u952e\\u76d8 GTX1650\",\"i7-9750H 8G 512GSSD GTX1050\",\"i5-9300H 8G 512GSSD GTX1050)\"]}],\"value\":[{\"detail\":{\"\\u914d\\u7f6e\":\"i7-9750H 512GSSD RGB\\u952e\\u76d8 GTX1650\"},\"cost\":\"1000.00\",\"price\":\"1000.00\",\"sales\":984,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/51308e61ace45968fdef953b2ac6c241.jpg\",\"check\":false},{\"detail\":{\"\\u914d\\u7f6e\":\"i7-9750H 8G 512GSSD GTX1050\"},\"cost\":\"1000.00\",\"price\":900,\"sales\":984,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/51308e61ace45968fdef953b2ac6c241.jpg\",\"check\":false},{\"detail\":{\"\\u914d\\u7f6e\":\"i5-9300H 8G 512GSSD GTX1050)\"},\"cost\":\"1000.00\",\"price\":800,\"sales\":984,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/attach\\/2019\\/05\\/29\\/\\/51308e61ace45968fdef953b2ac6c241.jpg\",\"check\":false}]}', '1565172349'), ('15', '{\"attr\":[{\"value\":\"\\u989c\\u8272\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u9ed1\\u8272\",\"\\u767d\\u8272\",\"\\u7d2b\\u8272\"]},{\"value\":\"\\u89c4\\u5219\",\"detailValue\":\"\",\"attrHidden\":true,\"detail\":[\"\\u5927\",\"\\u5c0f\"]}],\"value\":[{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u89c4\\u5219\":\"\\u5927\"},\"price\":70,\"cost\":\"5.00\",\"sales\":998,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u9ed1\\u8272\",\"\\u89c4\\u5219\":\"\\u5c0f\"},\"cost\":\"5.00\",\"price\":60,\"sales\":998,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u89c4\\u5219\":\"\\u5927\"},\"cost\":\"5.00\",\"price\":50,\"sales\":998,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u767d\\u8272\",\"\\u89c4\\u5219\":\"\\u5c0f\"},\"cost\":\"5.00\",\"price\":40,\"sales\":998,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u7d2b\\u8272\",\"\\u89c4\\u5219\":\"\\u5927\"},\"cost\":\"5.00\",\"price\":10,\"sales\":202,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false},{\"detail\":{\"\\u989c\\u8272\":\"\\u7d2b\\u8272\",\"\\u89c4\\u5219\":\"\\u5c0f\"},\"cost\":\"5.00\",\"price\":20,\"sales\":200,\"pic\":\"http:\\/\\/activity.crmeb.net\\/public\\/uploads\\/editor\\/20190605\\/5cf737bf264e4.jpg\",\"check\":false}]}', '1563346586');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product_attr_value`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_attr_value`;
CREATE TABLE `eb_store_product_attr_value` (
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `suk` varchar(128) NOT NULL COMMENT '商品属性索引值 (attr_value|attr_value[|....])',
  `stock` int(10) unsigned NOT NULL COMMENT '属性对应的库存',
  `sales` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '销量',
  `price` decimal(8,2) unsigned NOT NULL COMMENT '属性金额',
  `image` varchar(128) DEFAULT NULL COMMENT '图片',
  `unique` char(8) NOT NULL DEFAULT '' COMMENT '唯一值',
  `cost` decimal(8,2) unsigned NOT NULL COMMENT '成本价',
  `bar_code` varchar(50) NOT NULL DEFAULT '' COMMENT '产品条码',
  UNIQUE KEY `unique` (`unique`,`suk`) USING BTREE,
  KEY `store_id` (`product_id`,`suk`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性值表';

-- ----------------------------
--  Records of `eb_store_product_attr_value`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_product_attr_value` VALUES ('15', '小,白色', '997', '1', '40.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '08af4c92', '5.00', ''), ('15', '大,黑色', '993', '5', '70.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '1bf9fad8', '5.00', ''), ('8', '1,2', '980', '2', '0.00', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//71e85589cb7d3398d08f0d55bdb9031d.jpg', '304d1fc7', '1000.00', ''), ('2', '40cm,不锈钢', '937', '0', '0.01', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '39b97621', '1500.00', ''), ('2', '30cm,不锈钢', '936', '0', '0.03', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '51c7f751', '1500.00', ''), ('8', '2,3', '982', '0', '0.00', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//71e85589cb7d3398d08f0d55bdb9031d.jpg', '5fe3af25', '1000.00', ''), ('2', '30cm,陶瓷', '924', '12', '0.02', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', '63912ead', '1500.00', ''), ('7', '1,2', '75', '1', '100.00', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//6f2a1ece45e307f274e3384410a3bd3a.jpg', '76862ff5', '1000.00', ''), ('15', '大,紫色', '202', '0', '10.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', '7a06e7f9', '5.00', ''), ('2', '40cm,陶瓷', '938', '0', '0.01', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dbc27c69c7.jpg', 'a6c4ecd2', '1500.00', ''), ('3', '4L,黑色', '967', '32', '299.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'aa5915e8', '10.00', ''), ('3', '3L,黑色', '0', '20', '249.00', 'http://datong.crmeb.net/public/uploads/attach/2019/01/15/5c3dc15ba1972.jpg', 'c1fd48a6', '10.00', ''), ('15', '小,紫色', '195', '5', '20.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', 'd630e29a', '5.00', ''), ('7', '1,3', '76', '0', '100.00', 'http://activity.crmeb.net/public/uploads/attach/2019/05/29//6f2a1ece45e307f274e3384410a3bd3a.jpg', 'd7b47f88', '1000.00', ''), ('15', '小,黑色', '997', '1', '60.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', 'e4d9a758', '5.00', ''), ('15', '大,白色', '997', '1', '50.00', 'http://activity.crmeb.net/public/uploads/editor/20190605/5cf737bf264e4.jpg', 'f208c727', '5.00', '');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product_cate`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_cate`;
CREATE TABLE `eb_store_product_cate` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) NOT NULL DEFAULT '0' COMMENT '产品id',
  `cate_id` int(11) NOT NULL DEFAULT '0' COMMENT '分类id',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8 COMMENT='产品分类辅助表';

-- ----------------------------
--  Records of `eb_store_product_cate`
-- ----------------------------
BEGIN;
INSERT INTO `eb_store_product_cate` VALUES ('14', '6', '2', '1558580351'), ('24', '4', '3', '1559110372'), ('25', '4', '2', '1559110372'), ('28', '3', '3', '1559110403'), ('29', '3', '2', '1559110403'), ('38', '12', '3', '1560650420'), ('49', '5', '4', '1562729229'), ('50', '5', '7', '1562729229'), ('51', '5', '2', '1562729229'), ('52', '5', '3', '1562729229'), ('53', '5', '19', '1562729229'), ('55', '11', '4', '1562729250'), ('59', '10', '4', '1562741711'), ('60', '1', '2', '1562835320'), ('61', '1', '7', '1562835320'), ('64', '17', '4', '1564471319'), ('65', '2', '3', '1565148046'), ('66', '2', '2', '1565148046'), ('67', '18', '0', '1565148206'), ('68', '9', '2', '1565148922'), ('70', '8', '2', '1565426114'), ('71', '7', '2', '1565600246'), ('72', '19', '4', '1565687845');
COMMIT;

-- ----------------------------
--  Table structure for `eb_store_product_relation`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_relation`;
CREATE TABLE `eb_store_product_relation` (
  `uid` int(10) unsigned NOT NULL COMMENT '用户ID',
  `product_id` int(10) unsigned NOT NULL COMMENT '商品ID',
  `type` varchar(32) NOT NULL COMMENT '类型(收藏(collect）、点赞(like))',
  `category` varchar(32) NOT NULL COMMENT '某种类型的商品(普通商品、秒杀商品)',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  UNIQUE KEY `uid` (`uid`,`product_id`,`type`,`category`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `category` (`category`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品点赞和收藏表';

-- ----------------------------
--  Table structure for `eb_store_product_reply`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_product_reply`;
CREATE TABLE `eb_store_product_reply` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论ID',
  `uid` int(11) NOT NULL COMMENT '用户ID',
  `oid` int(11) NOT NULL COMMENT '订单ID',
  `unique` char(32) NOT NULL COMMENT '唯一id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `reply_type` varchar(32) NOT NULL DEFAULT 'product' COMMENT '某种商品类型(普通商品、秒杀商品）',
  `product_score` tinyint(1) NOT NULL COMMENT '商品分数',
  `service_score` tinyint(1) NOT NULL COMMENT '服务分数',
  `comment` varchar(512) NOT NULL COMMENT '评论内容',
  `pics` text NOT NULL COMMENT '评论图片',
  `add_time` int(11) NOT NULL COMMENT '评论时间',
  `merchant_reply_content` varchar(300) DEFAULT NULL COMMENT '管理员回复内容',
  `merchant_reply_time` int(11) DEFAULT NULL COMMENT '管理员回复时间',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '0未删除1已删除',
  `is_reply` tinyint(1) NOT NULL DEFAULT '0' COMMENT '0未回复1已回复',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `order_id_2` (`oid`,`unique`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `parent_id` (`reply_type`) USING BTREE,
  KEY `is_del` (`is_del`) USING BTREE,
  KEY `product_score` (`product_score`) USING BTREE,
  KEY `service_score` (`service_score`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='评论表';

-- ----------------------------
--  Table structure for `eb_store_visit`
-- ----------------------------
DROP TABLE IF EXISTS `eb_store_visit`;
CREATE TABLE `eb_store_visit` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `product_id` int(11) DEFAULT NULL COMMENT '产品ID',
  `product_type` varchar(32) DEFAULT NULL COMMENT '产品类型',
  `cate_id` int(11) DEFAULT NULL COMMENT '产品分类ID',
  `type` char(50) DEFAULT NULL COMMENT '产品类型',
  `uid` int(11) DEFAULT NULL COMMENT '用户ID',
  `count` int(11) DEFAULT NULL COMMENT '访问次数',
  `content` varchar(255) DEFAULT NULL COMMENT '备注描述',
  `add_time` int(11) DEFAULT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品浏览分析表';

-- ----------------------------
--  Table structure for `eb_system_admin`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_admin`;
CREATE TABLE `eb_system_admin` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '后台管理员表ID',
  `account` varchar(32) NOT NULL COMMENT '后台管理员账号',
  `pwd` char(32) NOT NULL COMMENT '后台管理员密码',
  `real_name` varchar(16) NOT NULL COMMENT '后台管理员姓名',
  `roles` varchar(128) NOT NULL COMMENT '后台管理员权限(menus_id)',
  `last_ip` varchar(16) DEFAULT NULL COMMENT '后台管理员最后一次登录ip',
  `last_time` int(10) unsigned DEFAULT NULL COMMENT '后台管理员最后一次登录时间',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '后台管理员添加时间',
  `login_count` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '登录次数',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员级别',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '后台管理员状态 1有效0无效',
  `is_del` tinyint(1) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员表';

-- ----------------------------
--  Records of `eb_system_admin`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_admin` VALUES ('1', 'admin', 'e10adc3949ba59abbe56e057f20f883e', 'admin', '1', '123.139.68.6', '1573729780', '1573729780', '0', '0', '1', '0');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_attachment`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment`;
CREATE TABLE `eb_system_attachment` (
  `att_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '附件名称',
  `att_dir` varchar(200) NOT NULL DEFAULT '' COMMENT '附件路径',
  `satt_dir` varchar(200) DEFAULT NULL COMMENT '压缩图片路径',
  `att_size` char(30) NOT NULL DEFAULT '' COMMENT '附件大小',
  `att_type` char(30) NOT NULL DEFAULT '' COMMENT '附件类型',
  `pid` int(10) NOT NULL DEFAULT '0' COMMENT '分类ID0编辑器,1产品图片,2拼团图片,3砍价图片,4秒杀图片,5文章图片,6组合数据图',
  `time` int(11) NOT NULL DEFAULT '0' COMMENT '上传时间',
  `image_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传类型 1本地 2七牛云 3OSS 4COS ',
  `module_type` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '图片上传模块类型 1 后台上传 2 用户生成',
  PRIMARY KEY (`att_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1204 DEFAULT CHARSET=utf8 COMMENT='附件管理表';

-- ----------------------------
--  Records of `eb_system_attachment`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_attachment` VALUES ('336', '69eb5f09f947ff53244a57d5c021b817.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/69eb5f09f947ff53244a57d5c021b817.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/69eb5f09f947ff53244a57d5c021b817.jpg', '377824', 'image/jpeg', '9', '1564471315', '1', '1'), ('337', '69eb5f09f947ff53244a57d5c021b817.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/69eb5f09f947ff53244a57d5c021b817.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/69eb5f09f947ff53244a57d5c021b817.jpg', '377824', 'image/jpeg', '9', '1564471315', '1', '1'), ('338', 'ce0a2ed478552ca0bfc7092f337c8d10.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/ce0a2ed478552ca0bfc7092f337c8d10.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/ce0a2ed478552ca0bfc7092f337c8d10.jpg', '196474', 'image/jpeg', '9', '1564471315', '1', '1'), ('339', '13efc762f7fdfec35ad2eeedc541db4b.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/13efc762f7fdfec35ad2eeedc541db4b.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/13efc762f7fdfec35ad2eeedc541db4b.jpg', '196646', 'image/jpeg', '9', '1564471315', '1', '1'), ('340', '4d280506de9f99621d6c9257abb00002.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/4d280506de9f99621d6c9257abb00002.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/4d280506de9f99621d6c9257abb00002.jpg', '166156', 'image/jpeg', '9', '1564471315', '1', '1'), ('341', 'b07e8708977de9c820d7d97958776f8d.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/b07e8708977de9c820d7d97958776f8d.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/b07e8708977de9c820d7d97958776f8d.jpg', '238765', 'image/jpeg', '9', '1564471316', '1', '1'), ('342', '60a1b15d3a76d624e8fe4f29d6405329.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/60a1b15d3a76d624e8fe4f29d6405329.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/60a1b15d3a76d624e8fe4f29d6405329.jpg', '235698', 'image/jpeg', '9', '1564471316', '1', '1'), ('343', '4d756807800de48cf64515abde691858.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/4d756807800de48cf64515abde691858.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/4d756807800de48cf64515abde691858.jpg', '208245', 'image/jpeg', '9', '1564471316', '1', '1'), ('344', '6eb36373e34467b616caf8ebd628b8a9.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/6eb36373e34467b616caf8ebd628b8a9.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/6eb36373e34467b616caf8ebd628b8a9.jpg', '68136', 'image/jpeg', '9', '1564471316', '1', '1'), ('345', '9fd1c33715375d14a910dc6ac16a1f01.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/9fd1c33715375d14a910dc6ac16a1f01.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/9fd1c33715375d14a910dc6ac16a1f01.jpg', '234315', 'image/jpeg', '9', '1564471316', '1', '1'), ('346', 'cf82af05b3627661f7311b437fd4ef75.png', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/cf82af05b3627661f7311b437fd4ef75.png', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/cf82af05b3627661f7311b437fd4ef75.png', '724918', 'image/png', '9', '1564471317', '1', '1'), ('347', '6a199d8d05c1ade1d9d9d430af0c2135.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/6a199d8d05c1ade1d9d9d430af0c2135.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/6a199d8d05c1ade1d9d9d430af0c2135.jpg', '368263', 'image/jpeg', '9', '1564471317', '1', '1'), ('348', 'ba7b6671f1ab84b7d1ff9f7ae483db97.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/ba7b6671f1ab84b7d1ff9f7ae483db97.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/ba7b6671f1ab84b7d1ff9f7ae483db97.jpg', '388901', 'image/jpeg', '9', '1564471317', '1', '1'), ('349', '17c4918d59ef74b5f15b63ce905cc301.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/17c4918d59ef74b5f15b63ce905cc301.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/17c4918d59ef74b5f15b63ce905cc301.jpg', '496157', 'image/jpeg', '9', '1564471317', '1', '1'), ('350', '29bcd8aeffa602b6bc37c9ea219f54a1.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/29bcd8aeffa602b6bc37c9ea219f54a1.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/29bcd8aeffa602b6bc37c9ea219f54a1.jpg', '213140', 'image/jpeg', '9', '1564471317', '1', '1'), ('351', '5ccce7202973e32e7b2086010e29038b.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/5ccce7202973e32e7b2086010e29038b.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/5ccce7202973e32e7b2086010e29038b.jpg', '244587', 'image/jpeg', '9', '1564471318', '1', '1'), ('352', 'dc887ac553f4ea66365e69a626b4f030.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/dc887ac553f4ea66365e69a626b4f030.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/dc887ac553f4ea66365e69a626b4f030.jpg', '281625', 'image/jpeg', '9', '1564471318', '1', '1'), ('353', '77aedb47edfd4f9f3fe4d0be51bb2994.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/77aedb47edfd4f9f3fe4d0be51bb2994.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/77aedb47edfd4f9f3fe4d0be51bb2994.jpg', '415317', 'image/jpeg', '9', '1564471318', '1', '1'), ('354', 'c57055e3fbd06b6947e49da47751ed7e.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/c57055e3fbd06b6947e49da47751ed7e.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/c57055e3fbd06b6947e49da47751ed7e.jpg', '351565', 'image/jpeg', '9', '1564471318', '1', '1'), ('355', 'efdf887ad14277311c8f373197bd95ad.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/efdf887ad14277311c8f373197bd95ad.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/efdf887ad14277311c8f373197bd95ad.jpg', '301960', 'image/jpeg', '9', '1564471318', '1', '1'), ('356', '39154c06e825503436d4e488aecfc466.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/39154c06e825503436d4e488aecfc466.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/39154c06e825503436d4e488aecfc466.jpg', '195113', 'image/jpeg', '9', '1564471319', '1', '1'), ('357', '3bbf70c1bbebee6dec6717700a1a0fb1.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/3bbf70c1bbebee6dec6717700a1a0fb1.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/07/30/3bbf70c1bbebee6dec6717700a1a0fb1.jpg', '580964', 'image/jpeg', '9', '1564471319', '1', '1'), ('1168', '4e3396f4248e9e5ef2eab5505216ade0.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/4e3396f4248e9e5ef2eab5505216ade0.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/4e3396f4248e9e5ef2eab5505216ade0.jpg', '19245', 'image/jpeg', '9', '1565687843', '1', '1'), ('1169', '4e3396f4248e9e5ef2eab5505216ade0.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/4e3396f4248e9e5ef2eab5505216ade0.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/4e3396f4248e9e5ef2eab5505216ade0.jpg', '19245', 'image/jpeg', '9', '1565687843', '1', '1'), ('1170', '5653627e73313cf61c9620725c45a376.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/5653627e73313cf61c9620725c45a376.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/5653627e73313cf61c9620725c45a376.jpg', '6641', 'image/jpeg', '9', '1565687843', '1', '1'), ('1171', '1d9d4158d2d7c7f0466e78207246e845.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/1d9d4158d2d7c7f0466e78207246e845.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/1d9d4158d2d7c7f0466e78207246e845.jpg', '36653', 'image/jpeg', '9', '1565687843', '1', '1'), ('1172', '3f9bfd12b76f290d3ed82ea44ebb399a.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/3f9bfd12b76f290d3ed82ea44ebb399a.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/3f9bfd12b76f290d3ed82ea44ebb399a.jpg', '14501', 'image/jpeg', '9', '1565687844', '1', '1'), ('1173', 'e8c9d50e6b7cef371fe742ab08abd6a4.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/e8c9d50e6b7cef371fe742ab08abd6a4.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/e8c9d50e6b7cef371fe742ab08abd6a4.jpg', '29431', 'image/jpeg', '9', '1565687844', '1', '1'), ('1174', 'e882d4dffdca67b65a7a1e66fb209c4c.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/e882d4dffdca67b65a7a1e66fb209c4c.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/e882d4dffdca67b65a7a1e66fb209c4c.jpg', '147861', 'image/jpeg', '9', '1565687844', '1', '1'), ('1175', 'feb565a57f5d42c370c54df7bdacb050.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/feb565a57f5d42c370c54df7bdacb050.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/feb565a57f5d42c370c54df7bdacb050.jpg', '68050', 'image/jpeg', '9', '1565687844', '1', '1'), ('1176', '12709ee798ac2dd5c21d7ab030aa4e13.png', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/12709ee798ac2dd5c21d7ab030aa4e13.png', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/12709ee798ac2dd5c21d7ab030aa4e13.png', '428042', 'image/png', '9', '1565687844', '1', '1'), ('1177', '5cc24febd1722f8c7ec7d5cf74262743.png', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/5cc24febd1722f8c7ec7d5cf74262743.png', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/5cc24febd1722f8c7ec7d5cf74262743.png', '808887', 'image/png', '9', '1565687844', '1', '1'), ('1178', '28ccd5e15404129a793045f57049f149.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/28ccd5e15404129a793045f57049f149.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/28ccd5e15404129a793045f57049f149.jpg', '226404', 'image/jpeg', '9', '1565687845', '1', '1'), ('1179', '42cc797e7005e47baf26cc33655b4667.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/42cc797e7005e47baf26cc33655b4667.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/42cc797e7005e47baf26cc33655b4667.jpg', '51540', 'image/jpeg', '9', '1565687845', '1', '1'), ('1180', '0a8d0d2e2cb85c94c0d5380058603c56.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/0a8d0d2e2cb85c94c0d5380058603c56.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/0a8d0d2e2cb85c94c0d5380058603c56.jpg', '112097', 'image/jpeg', '9', '1565687845', '1', '1'), ('1181', '26b2896f313fb594884fb992e33c5fa8.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/26b2896f313fb594884fb992e33c5fa8.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/26b2896f313fb594884fb992e33c5fa8.jpg', '75331', 'image/jpeg', '9', '1565687845', '1', '1'), ('1182', '7d1991d9b7bf33e84782c6cd942224f6.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/7d1991d9b7bf33e84782c6cd942224f6.jpg', 'http://kaifa.crmeb.net/uploads/attach/2019/08/13/7d1991d9b7bf33e84782c6cd942224f6.jpg', '94600', 'image/jpeg', '9', '1565687845', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_attachment_category`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_attachment_category`;
CREATE TABLE `eb_system_attachment_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) DEFAULT '0' COMMENT '父级ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `enname` varchar(50) DEFAULT NULL COMMENT '分类目录',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `id` (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8 COMMENT='附件分类表';

-- ----------------------------
--  Table structure for `eb_system_config`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config`;
CREATE TABLE `eb_system_config` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置id',
  `menu_name` varchar(255) NOT NULL COMMENT '字段名称',
  `type` varchar(255) NOT NULL DEFAULT '' COMMENT '类型(文本框,单选按钮...)',
  `input_type` varchar(20) DEFAULT 'input' COMMENT '表单类型',
  `config_tab_id` int(10) unsigned NOT NULL COMMENT '配置分类id',
  `parameter` varchar(255) DEFAULT NULL COMMENT '规则 单选框和多选框',
  `upload_type` tinyint(1) unsigned DEFAULT NULL COMMENT '上传文件格式1单图2多图3文件',
  `required` varchar(255) DEFAULT NULL COMMENT '规则',
  `width` int(10) unsigned DEFAULT NULL COMMENT '多行文本框的宽度',
  `high` int(10) unsigned DEFAULT NULL COMMENT '多行文框的高度',
  `value` varchar(5000) DEFAULT NULL COMMENT '默认值',
  `info` varchar(255) NOT NULL DEFAULT '' COMMENT '配置名称',
  `desc` varchar(255) DEFAULT NULL COMMENT '配置简介',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=157 DEFAULT CHARSET=utf8 COMMENT='配置表';

-- ----------------------------
--  Records of `eb_system_config`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_config` VALUES ('1', 'site_name', 'text', 'input', '1', '', '0', 'required:true', '100', '0', '\"\"', '网站名称', '网站名称', '0', '1'), ('2', 'site_url', 'text', 'input', '1', '', '0', 'required:true,url:true', '100', '0', '\"http://mf.crmeb.net\"', '网站地址', '网站地址', '0', '1'), ('3', 'site_logo', 'upload', null, '1', null, '1', null, '0', '0', '\"\"', '后台LOGO', '左上角logo,建议尺寸[170*50]', '0', '1'), ('4', 'site_phone', 'text', 'input', '1', '', '0', '', '100', '0', '\"\"', '联系电话', '联系电话', '0', '1'), ('5', 'seo_title', 'text', 'input', '1', '', '0', 'required:true', '100', '0', '\"\"', 'SEO标题', 'SEO标题', '0', '1'), ('6', 'site_email', 'text', 'input', '1', '', '0', 'email:true', '100', '0', '\"\"', '联系邮箱', '联系邮箱', '0', '1'), ('7', 'site_qq', 'text', 'input', '1', '', '0', 'qq:true', '100', '0', '\"\"', '联系QQ', '联系QQ', '0', '1'), ('8', 'site_close', 'radio', 'input', '1', '0=>开启\n1=>PC端关闭\n2=>WAP端关闭(含微信)\n3=>全部关闭', '0', '', '0', '0', '\"0\"', '网站关闭', '网站后台、商家中心不受影响。关闭网站也可访问', '0', '2'), ('9', 'close_system', 'radio', 'input', '1', '0=>开启\n1=>关闭', '0', '', '0', '0', '\"0\"', '关闭后台', '关闭后台', '0', '2'), ('13', 'wechat_appid', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\"\"', 'AppID', 'AppID', '0', '1'), ('14', 'wechat_appsecret', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\"\"', 'AppSecret', 'AppSecret', '0', '1'), ('15', 'wechat_token', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\"\"', '微信验证TOKEN', '微信验证TOKEN', '0', '1'), ('16', 'wechat_encode', 'radio', 'input', '2', '0=>明文模式\n1=>兼容模式\n2=>安全模式', '0', '', '0', '0', '\"0\"', '消息加解密方式', '如需使用安全模式请在管理中心修改，仅限服务号和认证订阅号', '0', '1'), ('17', 'wechat_encodingaeskey', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\"\"', 'EncodingAESKey', '公众号消息加解密Key,在使用安全模式情况下要填写该值，请先在管理中心修改，然后填写该值，仅限服务号和认证订阅号', '0', '1'), ('18', 'wechat_share_img', 'upload', null, '2', null, '1', null, '0', '0', '\"\"', '微信分享图片', '若填写此图片地址，则分享网页出去时会分享此图片。可有效防止分享图片变形', '0', '1'), ('19', 'wechat_qrcode', 'upload', 'input', '2', '', '1', '', '0', '0', '\"\"', '公众号二维码', '您的公众号二维码', '0', '1'), ('20', 'wechat_type', 'radio', 'input', '2', '0=>服务号\n1=>订阅号', '0', '', '0', '0', '\"0\"', '公众号类型', '公众号的类型', '0', '1'), ('21', 'wechat_share_title', 'text', 'input', '2', null, null, 'required:true', '100', '0', '\"CRMEB\"', '微信分享标题', '微信分享标题', '0', '1'), ('22', 'wechat_share_synopsis', 'textarea', null, '2', null, null, null, '100', '5', '\"CRMEB\"', '微信分享简介', '微信分享简介', '0', '1'), ('23', 'pay_weixin_appid', 'text', 'input', '4', '', '0', '', '100', '0', '\"\"', 'Appid', '微信公众号身份的唯一标识。审核通过后，在微信发送的邮件中查看。', '0', '1'), ('24', 'pay_weixin_appsecret', 'text', 'input', '4', '', '0', '', '100', '0', '\"\"', 'Appsecret', 'JSAPI接口中获取openid，审核后在公众平台开启开发模式后可查看。', '0', '1'), ('25', 'pay_weixin_mchid', 'text', 'input', '4', '', '0', '', '100', '0', '\"\"', 'Mchid', '受理商ID，身份标识', '0', '1'), ('26', 'pay_weixin_client_cert', 'upload', 'input', '4', '', '3', '', '0', '0', '\"\"', '微信支付证书', '微信支付证书，在微信商家平台中可以下载！文件名一般为apiclient_cert.pem', '0', '1'), ('27', 'pay_weixin_client_key', 'upload', 'input', '4', '', '3', '', '0', '0', '\"\"', '微信支付证书密钥', '微信支付证书密钥，在微信商家平台中可以下载！文件名一般为apiclient_key.pem', '0', '1'), ('28', 'pay_weixin_key', 'text', 'input', '4', '', '0', '', '100', '0', '\"\"', 'Key', '商户支付密钥Key。审核通过后，在微信发送的邮件中查看。', '0', '1'), ('29', 'pay_weixin_open', 'radio', 'input', '4', '1=>开启\n0=>关闭', '0', '', '0', '0', '\"1\"', '开启', '是否启用微信支付', '0', '1'), ('35', 'site_service_phone', 'text', 'input', '1', '', '0', '', '100', '0', '\"\"', '客服电话', '客服联系电话', '0', '1'), ('47', 'main_business', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\" IT\\u79d1\\u6280 \\u4e92\\u8054\\u7f51|\\u7535\\u5b50\\u5546\\u52a1\"', '微信模板消息_主营行业', '微信公众号模板消息中选择开通的主营行业', '0', '0'), ('48', 'vice_business', 'text', 'input', '2', '', '0', 'required:true', '100', '0', '\"IT\\u79d1\\u6280 IT\\u8f6f\\u4ef6\\u4e0e\\u670d\\u52a1 \"', '微信模板消息_副营行业', '微信公众号模板消息中选择开通的副营行业', '0', '0'), ('57', 'about_us', 'upload', null, '1', null, '1', null, '0', '0', '\"\"', '关于我们', '系统的标识', '0', '2'), ('61', 'api', 'text', 'input', '2', '', '0', '', '100', '0', '\"\\/api\\/wechat\\/serve\"', '接口地址', '微信接口例如：http://www.abc.com/api/wechat/serve', '0', '1'), ('62', 'paydir', 'textarea', 'input', '4', '', '0', '', '100', '5', '\"\"', '配置目录', '支付目录配置系统不调用提示作用', '0', '1'), ('98', 'wechat_avatar', 'upload', 'input', '2', '', '1', '', '0', '0', '\"\"', '公众号logo', '公众号logo', '0', '1'), ('108', 'upload_type', 'radio', 'input', '17', '1=>本地存储\n2=>七牛云存储\n3=>阿里云OSS\n4=>腾讯COS', null, null, null, null, '\"1\"', '上传类型', '文件上传的类型', '0', '1'), ('109', 'uploadUrl', 'text', 'input', '17', null, null, 'url:true', '100', null, '\"\"', '空间域名 Domain', '空间域名 Domain', '0', '1'), ('110', 'accessKey', 'text', 'input', '17', null, null, '', '100', null, '\"\"', 'accessKey', 'accessKey', '0', '1'), ('111', 'secretKey', 'text', 'input', '17', null, null, '', '100', null, '\"\"', 'secretKey', 'secretKey', '0', '1'), ('112', 'storage_name', 'text', 'input', '17', null, null, '', '100', null, '\"\"', '存储空间名称', '存储空间名称', '0', '1'), ('118', 'storage_region', 'text', 'input', '17', null, null, '', '100', null, '\"\"', '所属地域', '所属地域(腾讯COS时填写)', '0', '1'), ('138', 'h5_avatar', 'upload', null, '1', null, '1', null, '0', '0', '\"http:\\/\\/kaifa.crmeb.net\\/uploads\\/attach\\/2019\\/08\\/20190807\\/723adbdd4e49a0f9394dfc700ab5dba3.png\"', '用户H5默认头像', '用户H5默认头像尺寸(80*80)', '0', '1'), ('140', 'news_slides_limit', 'text', 'number', '1', null, null, 'required:true,digits:true,min:1', '100', null, '\"5\"', '新闻幻灯片限制数量', '新闻幻灯片限制数量', '0', '1'), ('144', 'cache_config', 'text', 'input', '1', null, null, null, '100', null, '\"86400\"', '网站缓存时间', '配置全局缓存时间（秒），默认留空为永久缓存', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_config_tab`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_config_tab`;
CREATE TABLE `eb_system_config_tab` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '配置分类id',
  `title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类名称',
  `eng_title` varchar(255) NOT NULL DEFAULT '' COMMENT '配置分类英文名称',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '配置分类状态',
  `info` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '配置分类是否显示',
  `icon` varchar(30) DEFAULT NULL COMMENT '图标',
  `type` int(2) DEFAULT '0' COMMENT '配置类型',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COMMENT='配置分类表';

-- ----------------------------
--  Records of `eb_system_config_tab`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_config_tab` VALUES ('1', '基础配置', 'basics', '1', '0', 'cog', '0'), ('2', '公众号配置', 'wechat', '1', '0', 'weixin', '1'), ('4', '公众号支付配置', 'pay', '1', '0', 'jpy', '2'), ('17', '文件上传配置', 'upload_set', '1', '0', 'cloud-upload', '0');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_file`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_file`;
CREATE TABLE `eb_system_file` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文件对比ID',
  `cthash` char(32) NOT NULL DEFAULT '' COMMENT '文件内容',
  `filename` varchar(255) NOT NULL DEFAULT '' COMMENT '文价名称',
  `atime` char(12) NOT NULL DEFAULT '' COMMENT '上次访问时间',
  `mtime` char(12) NOT NULL DEFAULT '' COMMENT '上次修改时间',
  `ctime` char(12) NOT NULL DEFAULT '' COMMENT '上次改变时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文件对比表';

-- ----------------------------
--  Table structure for `eb_system_group`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group`;
CREATE TABLE `eb_system_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据ID',
  `name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据组名称',
  `info` varchar(256) NOT NULL DEFAULT '' COMMENT '数据提示',
  `config_name` varchar(50) NOT NULL DEFAULT '' COMMENT '数据字段',
  `fields` text COMMENT '数据组字段以及类型（json数据）',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `config_name` (`config_name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合数据表';

-- ----------------------------
--  Table structure for `eb_system_group_data`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_group_data`;
CREATE TABLE `eb_system_group_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '组合数据详情ID',
  `gid` int(11) NOT NULL DEFAULT '0' COMMENT '对应的数据组id',
  `value` text NOT NULL COMMENT '数据组对应的数据值（json数据）',
  `add_time` int(10) NOT NULL DEFAULT '0' COMMENT '添加数据时间',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '数据排序',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '状态（1：开启；2：关闭；）',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='组合数据详情表';

-- ----------------------------
--  Table structure for `eb_system_log`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_log`;
CREATE TABLE `eb_system_log` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '管理员操作记录ID',
  `admin_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '管理员id',
  `admin_name` varchar(64) NOT NULL DEFAULT '' COMMENT '管理员姓名',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '链接',
  `page` varchar(64) NOT NULL DEFAULT '' COMMENT '行为',
  `method` varchar(12) NOT NULL DEFAULT '' COMMENT '访问类型',
  `ip` varchar(16) NOT NULL DEFAULT '' COMMENT '登录IP',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  `merchant_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '商户id',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `type` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='管理员操作记录表';

-- ----------------------------
--  Table structure for `eb_system_menus`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_menus`;
CREATE TABLE `eb_system_menus` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `pid` smallint(5) unsigned NOT NULL DEFAULT '0' COMMENT '父级id',
  `icon` varchar(16) NOT NULL DEFAULT '' COMMENT '图标',
  `menu_name` varchar(32) NOT NULL DEFAULT '' COMMENT '按钮名',
  `module` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '模块名',
  `controller` varchar(64) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '控制器',
  `action` varchar(32) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '方法名',
  `params` varchar(128) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL DEFAULT '[]' COMMENT '参数',
  `sort` tinyint(3) NOT NULL DEFAULT '1' COMMENT '排序',
  `is_show` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '是否显示',
  `access` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '子管理员是否可用',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `pid` (`pid`) USING BTREE,
  KEY `is_show` (`is_show`) USING BTREE,
  KEY `access` (`access`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=482 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
--  Records of `eb_system_menus`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_menus` VALUES ('1', '289', '', '系统设置', 'admin', 'setting.systemConfig', 'index', '[]', '127', '1', '1'), ('2', '153', '', '权限规则', 'admin', 'setting.systemMenus', 'index', '[]', '7', '1', '1'), ('4', '153', '', '管理员列表', 'admin', 'setting.systemAdmin', 'index', '[]', '9', '1', '1'), ('7', '467', '', '配置分类', 'admin', 'setting.systemConfigTab', 'index', '[]', '1', '1', '1'), ('8', '153', '', '身份管理', 'admin', 'setting.systemRole', 'index', '[]', '10', '1', '1'), ('9', '467', '', '组合数据', 'admin', 'setting.systemGroup', 'index', '[]', '1', '1', '1'), ('11', '0', 'wechat', '公众号', 'admin', 'wechat', 'index', '[]', '91', '1', '1'), ('12', '354', '', '微信关注回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"subscribe\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u914d\\u7f6e\\u9ed8\\u8ba4\\u56de\\u590d\"}', '86', '1', '1'), ('17', '360', '', '微信菜单', 'admin', 'wechat.menus', 'index', '[]', '95', '1', '1'), ('19', '11', '', '图文管理', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', '60', '1', '1'), ('21', '0', 'magic', '维护', 'admin', 'system', 'index', '[]', '0', '1', '1'), ('23', '0', 'laptop', '商品', 'admin', 'store', 'index', '[]', '110', '1', '1'), ('24', '23', '', '商品管理', 'admin', 'store.storeProduct', 'index', '{\"type\":\"1\"}', '100', '1', '1'), ('25', '23', '', '商品分类', 'admin', 'store.storeCategory', 'index', '[]', '1', '1', '1'), ('30', '354', '', '关键字回复', 'admin', 'wechat.reply', 'keyword', '[]', '85', '1', '1'), ('31', '354', '', '无效关键词回复', 'admin', 'wechat.reply', 'index', '{\"key\":\"default\",\"title\":\"\\u7f16\\u8f91\\u65e0\\u6548\\u5173\\u952e\\u5b57\\u9ed8\\u8ba4\\u56de\\u590d\"}', '84', '1', '1'), ('37', '31', '', '附加权限', 'admin', 'wechat.reply', '', '[]', '0', '0', '1'), ('42', '19', '', '附加权限', 'admin', 'wechat.wechatNewsCategory', '', '[]', '0', '0', '1'), ('43', '42', '', '添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'create', '[]', '0', '0', '1'), ('44', '42', '', '编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'edit', '[]', '0', '0', '1'), ('45', '42', '', '删除图文消息', 'admin', 'wechat.wechatNewsCategory', 'delete', '[]', '0', '0', '1'), ('46', '7', '', '配置分类附加权限', 'admin', 'setting.systemConfigTab', '', '[]', '0', '0', '1'), ('47', '46', '', '添加配置分类', 'admin', 'setting.systemConfigTab', 'create', '[]', '0', '0', '1'), ('48', '117', '', '添加配置', 'admin', 'setting.systemConfig', 'create', '[]', '0', '0', '1'), ('49', '46', '', '编辑配置分类', 'admin', 'setting.systemConfigTab', 'edit', '[]', '0', '0', '1'), ('50', '46', '', '删除配置分类', 'admin', 'setting.systemConfigTab', 'delete', '[]', '0', '0', '1'), ('51', '46', '', '查看子字段', 'admin', 'system.systemConfigTab', 'sonConfigTab', '[]', '0', '0', '1'), ('52', '9', '', '组合数据附加权限', 'admin', 'setting.systemGroup', '', '[]', '0', '0', '1'), ('53', '468', '', '添加数据', 'admin', 'setting.systemGroupData', 'create', '[]', '0', '0', '1'), ('54', '468', '', '编辑数据', 'admin', 'setting.systemGroupData', 'edit', '[]', '0', '0', '1'), ('55', '468', '', '删除数据', 'admin', 'setting.systemGroupData', 'delete', '[]', '0', '0', '1'), ('56', '468', '', '数据列表', 'admin', 'setting.systemGroupData', 'index', '[]', '0', '0', '1'), ('57', '52', '', '添加数据组', 'admin', 'setting.systemGroup', 'create', '[]', '0', '0', '1'), ('58', '52', '', '删除数据组', 'admin', 'setting.systemGroup', 'delete', '[]', '0', '0', '1'), ('59', '4', '', '管理员列表附加权限', 'admin', 'setting.systemAdmin', '', '[]', '0', '0', '1'), ('60', '59', '', '添加管理员', 'admin', 'setting.systemAdmin', 'create', '[]', '0', '0', '1'), ('61', '59', '', '编辑管理员', 'admin', 'setting.systemAdmin', 'edit', '[]', '0', '0', '1'), ('62', '59', '', '删除管理员', 'admin', 'setting.systemAdmin', 'delete', '[]', '0', '0', '1'), ('63', '8', '', '身份管理附加权限', 'admin', 'setting.systemRole', '', '[]', '0', '0', '1'), ('64', '63', '', '添加身份', 'admin', 'setting.systemRole', 'create', '[]', '0', '0', '1'), ('65', '63', '', '修改身份', 'admin', 'setting.systemRole', 'edit', '[]', '0', '0', '1'), ('66', '63', '', '删除身份', 'admin', 'setting.systemRole', 'delete', '[]', '0', '0', '1'), ('67', '8', '', '身份管理展示页', 'admin', 'setting.systemRole', 'index', '[]', '0', '0', '1'), ('68', '4', '', '管理员列表展示页', 'admin', 'setting.systemAdmin', 'index', '[]', '0', '0', '1'), ('69', '7', '', '配置分类展示页', 'admin', 'setting.systemConfigTab', 'index', '[]', '0', '0', '1'), ('70', '9', '', '组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', '0', '0', '1'), ('73', '19', '', '图文消息展示页', 'admin', 'wechat.wechatNewsCategory', 'index', '[]', '0', '0', '1'), ('74', '2', '', '菜单管理附加权限', 'admin', 'setting.systemMenus', '', '[]', '0', '0', '1'), ('75', '74', '', '添加菜单', 'admin', 'setting.systemMenus', 'create', '[]', '0', '0', '1'), ('76', '74', '', '编辑菜单', 'admin', 'setting.systemMenus', 'edit', '[]', '0', '0', '1'), ('77', '74', '', '删除菜单', 'admin', 'setting.systemMenus', 'delete', '[]', '0', '0', '1'), ('78', '2', '', '菜单管理展示页', 'admin', 'setting.systemMenus', 'index', '[]', '0', '0', '1'), ('82', '11', '', '微信用户管理', 'admin', 'user', 'list', '[]', '5', '1', '1'), ('84', '82', '', '用户标签', 'admin', 'wechat.wechatUser', 'tag', '[]', '0', '1', '1'), ('89', '30', '', '关键字回复附加权限', 'admin', 'wechat.reply', '', '[]', '0', '0', '1'), ('90', '89', '', '添加关键字', 'admin', 'wechat.reply', 'add_keyword', '[]', '0', '0', '1'), ('91', '89', '', '修改关键字', 'admin', 'wechat.reply', 'info_keyword', '[]', '0', '0', '1'), ('92', '89', '', '删除关键字', 'admin', 'wechat.reply', 'delete', '[]', '0', '0', '1'), ('93', '30', '', '关键字回复展示页', 'admin', 'wechat.reply', 'keyword', '[]', '0', '0', '1'), ('94', '31', '', '无效关键词回复展示页', 'admin', 'wechat.reply', 'index', '[]', '0', '0', '1'), ('95', '31', '', '无效关键词回复附加权限', 'admin', 'wechat.reply', '', '[]', '0', '0', '1'), ('96', '95', '', '无效关键词回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"default\",\"title\":\"编辑无效关键字默认回复\"}', '0', '0', '1'), ('97', '12', '', '微信关注回复展示页', 'admin', 'wechat.reply', 'index', '[]', '0', '0', '1'), ('98', '12', '', '微信关注回复附加权限', 'admin', 'wechat.reply', '', '[]', '0', '0', '1'), ('99', '98', '', '微信关注回复提交按钮', 'admin', 'wechat.reply', 'save', '{\"key\":\"subscribe\",\"title\":\"编辑无配置默认回复\"}', '0', '0', '1'), ('100', '74', '', '添加提交菜单', 'admin', 'setting.systemMenus', 'save', '[]', '0', '0', '1'), ('101', '74', '', '编辑提交菜单', 'admin', 'setting.systemMenus', 'update', '[]', '0', '0', '1'), ('102', '59', '', '提交添加管理员', 'admin', 'setting.systemAdmin', 'save', '[]', '0', '0', '1'), ('103', '59', '', '提交修改管理员', 'admin', 'setting.systemAdmin', 'update', '[]', '0', '0', '1'), ('104', '63', '', '提交添加身份', 'admin', 'setting.systemRole', 'save', '[]', '0', '0', '1'), ('105', '63', '', '提交修改身份', 'admin', 'setting.systemRole', 'update', '[]', '0', '0', '1'), ('106', '46', '', '提交添加配置分类', 'admin', 'setting.systemConfigTab', 'save', '[]', '0', '0', '1'), ('107', '46', '', '提交修改配置分类', 'admin', 'setting.systemConfigTab', 'update', '[]', '0', '0', '1'), ('108', '117', '', '提交添加配置列表', 'admin', 'setting.systemConfig', 'save', '[]', '0', '0', '1'), ('109', '52', '', '提交添加数据组', 'admin', 'setting.systemGroup', 'save', '[]', '0', '0', '1'), ('110', '52', '', '提交修改数据组', 'admin', 'setting.systemGroup', 'update', '[]', '0', '0', '1'), ('111', '468', '', '提交添加数据', 'admin', 'setting.systemGroupData', 'save', '[]', '0', '0', '1'), ('112', '468', '', '提交修改数据', 'admin', 'setting.systemGroupData', 'update', '[]', '0', '0', '1'), ('115', '42', '', '提交添加图文消息', 'admin', 'wechat.wechatNewsCategory', 'save', '[]', '0', '0', '1'), ('116', '42', '', '提交编辑图文消息', 'admin', 'wechat.wechatNewsCategory', 'update', '[]', '0', '0', '1'), ('117', '1', '', '配置列表附加权限', 'admin', 'setting.systemConfig', '', '[]', '0', '0', '1'), ('118', '1', '', '配置列表展示页', 'admin', 'setting.systemConfig', 'index', '[]', '0', '0', '1'), ('119', '117', '', '提交保存配置列表', 'admin', 'setting.systemConfig', 'save_basics', '[]', '0', '0', '1'), ('123', '89', '', '提交添加关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"1\"}', '0', '0', '1'), ('124', '89', '', '提交修改关键字', 'admin', 'wechat.reply', 'save_keyword', '{\"dis\":\"2\"}', '0', '0', '1'), ('126', '17', '', '微信菜单展示页', 'admin', 'wechat.menus', 'index', '[]', '0', '0', '1'), ('127', '17', '', '微信菜单附加权限', 'admin', 'wechat.menus', '', '[]', '0', '0', '1'), ('128', '127', '', '提交微信菜单按钮', 'admin', 'wechat.menus', 'save', '{\"dis\":\"1\"}', '0', '0', '1'), ('129', '82', '', '用户行为纪录', 'admin', 'wechat.wechatMessage', 'index', '[]', '0', '1', '1'), ('130', '469', '', '系统日志', 'admin', 'system.systemLog', 'index', '[]', '5', '1', '1'), ('131', '130', '', '管理员操作记录展示页', 'admin', 'system.systemLog', 'index', '[]', '0', '0', '1'), ('132', '129', '', '微信用户行为纪录展示页', 'admin', 'wechat.wechatMessage', 'index', '[]', '0', '0', '1'), ('133', '82', '', '微信用户', 'admin', 'wechat.wechatUser', 'index', '[]', '1', '1', '1'), ('134', '133', '', '微信用户展示页', 'admin', 'wechat.wechatUser', 'index', '[]', '0', '0', '1'), ('137', '135', '', '添加通知模板', 'admin', 'system.systemNotice', 'create', '[]', '0', '0', '1'), ('138', '135', '', '编辑通知模板', 'admin', 'system.systemNotice', 'edit', '[]', '0', '0', '1'), ('139', '135', '', '删除辑通知模板', 'admin', 'system.systemNotice', 'delete', '[]', '0', '0', '1'), ('140', '135', '', '提交编辑辑通知模板', 'admin', 'system.systemNotice', 'update', '[]', '0', '0', '1'), ('141', '135', '', '提交添加辑通知模板', 'admin', 'system.systemNotice', 'save', '[]', '0', '0', '1'), ('142', '25', '', '产品分类展示页', 'admin', 'store.storeCategory', 'index', '[]', '0', '0', '1'), ('143', '25', '', '产品分类附加权限', 'admin', 'store.storeCategory', '', '[]', '0', '0', '1'), ('144', '117', '', '获取配置列表上传文件的名称', 'admin', 'setting.systemConfig', 'getimagename', '[]', '0', '0', '1'), ('145', '117', '', '配置列表上传文件', 'admin', 'setting.systemConfig', 'view_upload', '[]', '0', '0', '1'), ('146', '24', '', '产品管理展示页', 'admin', 'store.storeProduct', 'index', '[]', '0', '0', '1'), ('147', '24', '', '产品管理附加权限', 'admin', 'store.storeProduct', '', '[]', '0', '0', '1'), ('153', '0', 'users', '管理权限', 'admin', 'setting.systemAdmin', '', '[]', '50', '1', '1'), ('155', '154', '', '商户产品展示页', 'admin', 'store.storeMerchant', 'index', '[]', '0', '0', '1'), ('156', '154', '', '商户产品附加权限', 'admin', 'store.storeMerchant', '', '[]', '0', '0', '1'), ('158', '157', '', '商户文章管理展示页', 'admin', 'wechat.wechatNews', 'merchantIndex', '[]', '0', '0', '1'), ('159', '157', '', '商户文章管理附加权限', 'admin', 'wechat.wechatNews', '', '[]', '0', '0', '1'), ('173', '469', '', '文件校验', 'admin', 'system.systemFile', 'index', '[]', '1', '1', '1'), ('174', '360', '', '微信模板消息', 'admin', 'wechat.wechatTemplate', 'index', '[]', '1', '1', '1'), ('220', '180', '', '预售卡管理批量修改预售卡金额', 'admin', 'presell.presellCard', 'batch_price', '[]', '0', '0', '1'), ('221', '180', '', '预售卡管理批量修改预售卡金额提交', 'admin', 'presell.presellCard', 'savebatch', '[]', '0', '0', '1'), ('236', '82', '', '用户分组', 'admin', 'wechat.wechatUser', 'group', '[]', '0', '1', '1'), ('237', '21', '', '刷新缓存', 'admin', 'system.clear', 'index', '[]', '0', '1', '1'), ('247', '153', '', '个人资料', 'admin', 'setting.systemAdmin', 'admininfo', '[]', '0', '0', '1'), ('248', '247', '', '个人资料附加权限', 'admin', 'setting.systemAdmin', '', '[]', '0', '0', '1'), ('249', '248', '', '个人资料提交保存', 'admin', 'system.systemAdmin', 'setAdminInfo', '[]', '0', '0', '1'), ('250', '247', '', '个人资料展示页', 'admin', 'setting.systemAdmin', 'admininfo', '[]', '0', '0', '1'), ('252', '21', '', '在线更新', 'admin', 'system.systemUpgradeclient', 'index', '[]', '0', '1', '1'), ('261', '147', '', '编辑产品', 'admin', 'store.storeproduct', 'edit', '[]', '0', '0', '1'), ('262', '147', '', '添加产品', 'admin', 'store.storeproduct', 'create', '[]', '0', '0', '1'), ('263', '147', '', '编辑产品详情', 'admin', 'store.storeproduct', 'edit_content', '[]', '0', '0', '1'), ('264', '147', '', '开启秒杀', 'admin', 'store.storeproduct', 'seckill', '[]', '0', '0', '1'), ('265', '147', '', '开启秒杀', 'admin', 'store.store_product', 'bargain', '[]', '0', '0', '1'), ('266', '147', '', '产品编辑属性', 'admin', 'store.storeproduct', 'attr', '[]', '0', '0', '1'), ('276', '469', '', '附件管理', 'admin', 'widget.images', 'index', '[]', '0', '0', '1'), ('278', '469', '', '清除数据', 'admin', 'system.systemCleardata', 'index', '[]', '0', '1', '1'), ('289', '0', 'gear', '设置', 'admin', 'setting', 'index', '[]', '90', '1', '1'), ('354', '11', '', '自动回复', '', '', '', '[]', '80', '1', '1'), ('360', '11', '', '公众号配置', '', '', '', '[]', '100', '1', '1'), ('361', '289', '', '应用配置', 'admin', 'setting.systemConfig', 'index', '{\"type\":\"1\",\"tab_id\":\"2\"}', '127', '1', '1'), ('362', '276', '', '附加权限', 'admin', 'widget.images', '', '[]', '0', '1', '1'), ('363', '362', '', '上传图片', 'admin', 'widget.images', 'upload', '[]', '0', '0', '1'), ('364', '362', '', '删除图片', 'admin', 'widget.images', 'delete', '[]', '0', '0', '1'), ('365', '362', '', '附件管理', 'admin', 'widget.images', 'index', '[]', '0', '0', '1'), ('369', '143', '', '添加产品分类', 'admin', 'store.storeCategory', 'create', '[]', '0', '0', '1'), ('370', '143', '', '编辑产品分类', 'admin', 'store.storeCategory', 'edit', '[]', '0', '0', '1'), ('372', '462', '', '首页幻灯片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"48\"}', '0', '1', '1'), ('373', '462', '', '首页导航按钮', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"47\"}', '0', '1', '1'), ('377', '469', '', '数据备份', 'admin', 'system.systemDatabackup', 'index', '[]', '0', '1', '1'), ('379', '469', '', '文件管理', 'admin', 'system.systemFile', 'opendir', '[]', '0', '1', '1'), ('380', '379', '', '权限规则', 'admin', 'system.systemFile', '', '[]', '0', '0', '1'), ('381', '380', '', '打开文件', 'admin', 'system.systemFile', 'openfile', '[]', '0', '0', '1'), ('382', '380', '', '编辑文件', 'admin', 'system.systemFile', 'savefile', '[]', '0', '0', '1'), ('386', '362', '', '移动图片分类展示', 'admin', 'widget.images', 'moveimg', '[]', '0', '0', '1'), ('387', '362', '', '编辑分类', 'admin', 'widget.images', 'updatecate', '[]', '0', '0', '1'), ('388', '362', '', '添加分类', 'admin', 'widget.images', 'savecate', '[]', '0', '0', '1'), ('389', '362', '', '移动图片分类', 'admin', 'widget.images', 'moveimgcecate', '[]', '0', '0', '1'), ('390', '362', '', '编辑分类展示', 'admin', 'widget.images', 'editcate', '[]', '0', '0', '1'), ('392', '362', '', '删除分类', 'admin', 'widget.images', 'deletecate', '[]', '0', '0', '1'), ('393', '362', '', '添加分类展示', 'admin', 'widget.images', 'addcate', '[]', '0', '0', '1'), ('395', '82', '', '微信用户附加权限', 'admin', 'wechat.wechatUser', '', '[]', '0', '0', '1'), ('396', '395', '', '推送消息', 'admin', 'wechat.wechat_news_category', 'push', '[]', '0', '0', '1'), ('397', '395', '', '推送优惠券', 'admin', 'ump.storeCouponUser', 'grant', '[]', '0', '0', '1'), ('416', '174', '', '微信模版消息附加权限', 'admin', 'wechat.wechatTemplate', '', '[]', '0', '0', '1'), ('417', '416', '', '添加模版消息', 'admin', 'wechat.wechatTemplate', 'save', '[]', '0', '0', '1'), ('418', '416', '', '添加模版消息展示', 'admin', 'wechat.wechatTemplate', 'create', '[]', '0', '0', '1'), ('419', '416', '', '编辑模版消息展示', 'admin', 'wechat.wechatTemplate', 'edit', '[]', '0', '0', '1'), ('420', '416', '', '更新模版消息展示', 'admin', 'wechat.wechatTemplate', 'update', '[]', '0', '0', '1'), ('421', '416', '', '删除模版消息展示', 'admin', 'wechat.wechatTemplate', 'delete', '[]', '0', '0', '1'), ('439', '377', '', '数据库备份附加权限', 'admin', 'system.systemDatabackup', '', '[]', '0', '0', '1'), ('440', '439', '', '查看表结构', 'admin', 'system.systemDatabackup', 'seetable', '[]', '0', '0', '1'), ('441', '439', '', '优化表', 'admin', 'system.systemDatabackup', 'optimize', '[]', '0', '0', '1'), ('442', '439', '', '修复表', 'admin', 'system.systemDatabackup', 'repair', '[]', '0', '0', '1'), ('443', '439', '', '备份表', 'admin', 'system.systemDatabackup', 'backup', '[]', '0', '0', '1'), ('444', '439', '', '删除备份', 'admin', 'system.systemDatabackup', 'delFile', '[]', '0', '0', '1'), ('445', '439', '', '恢复备份', 'admin', 'system.systemDatabackup', 'import', '[]', '0', '0', '1'), ('446', '439', '', '下载备份', 'admin', 'system.systemDatabackup', 'downloadFile', '[]', '0', '0', '1'), ('447', '377', '', '数据备份展示页', 'admin', 'system.systemDatabackup', 'index', '[]', '0', '0', '1'), ('448', '379', '', '文件管理展示页', 'admin', 'system.systemFile', 'index', '[]', '0', '0', '1'), ('452', '174', '', '微信模版消息列表页', 'admin', 'wechat.wechatTemplate', 'index', '[]', '0', '0', '1'), ('453', '276', '', '附件管理展示页', 'admin', 'widget.images', 'index', '[]', '0', '0', '1'), ('460', '462', '', '个人中心菜单', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"54\"}', '0', '1', '1'), ('462', '289', '', '数据配置', 'admin', '', '', '[]', '100', '1', '1'), ('467', '21', '', '开发配置', 'admin', 'system', '', '[]', '0', '1', '1'), ('468', '1', '', '配置组合数据附加权限', 'admin', 'setting.systemGroupData', 'index', '[]', '0', '0', '1'), ('469', '21', '', '安全维护', 'admin', 'system', '', '[]', '0', '1', '1'), ('470', '1', '', '配置组合数据展示页', 'admin', 'setting.systemGroup', 'index', '[]', '0', '0', '1'), ('472', '462', '', '首页活动区域图片', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"51\"}', '0', '1', '1'), ('481', '462', '', '首页配置', 'admin', 'setting.system_group_data', 'index', '{\"gid\":\"61\"}', '0', '1', '1');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_role`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_role`;
CREATE TABLE `eb_system_role` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '身份管理id',
  `role_name` varchar(32) NOT NULL COMMENT '身份管理名称',
  `rules` text NOT NULL COMMENT '身份管理权限(menus_id)',
  `level` tinyint(3) unsigned NOT NULL DEFAULT '0',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `status` (`status`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='身份管理表';

-- ----------------------------
--  Records of `eb_system_role`
-- ----------------------------
BEGIN;
INSERT INTO `eb_system_role` VALUES ('1', '超级管理员', '23,24,146,147,264,265,266,263,261,262,25,142,143,369,370,285,26,190,191,394,208,207,206,198,199,200,201,202,203,204,205,197,196,192,193,194,195,329,334,335,290,170,224,225,226,227,228,151,177,398,399,407,406,400,401,402,403,405,176,449,408,409,410,411,412,413,456,337,353,371,450,415,286,148,149,229,230,231,232,233,234,235,150,352,271,254,366,368,367,272,333,238,273,473,241,349,351,350,287,306,239,307,179,217,219,218,216,312,308,313,288,293,341,340,296,318,317,316,315,314,294,300,301,302,244,295,305,304,303,374,246,297,319,321,320,269,376,451,422,423,424,425,426,427,11,360,17,127,128,126,174,452,416,421,420,417,418,419,355,356,357,358,359,354,12,97,98,99,30,93,89,124,92,91,90,123,31,94,95,96,37,19,73,42,115,116,43,44,45,82,133,134,395,396,397,84,236,129,132,289,1,470,468,112,111,53,54,55,56,117,119,108,48,144,145,118,361,270,462,471,472,466,458,459,460,461,463,464,465,372,373,153,8,63,104,105,64,65,66,67,4,68,59,102,103,62,61,60,2,74,100,75,76,77,101,78,247,248,249,250,474,478,475,476,477,479,378,255,80,283,72,38,41,39,40,284,71,33,113,114,34,35,36,175,209,210,222,223,211,212,213,214,215,21,469,130,131,173,276,362,365,364,363,386,387,388,389,390,392,393,453,278,377,447,439,444,445,446,443,442,441,440,379,448,380,382,381,467,9,52,109,110,57,58,70,7,46,106,107,47,49,50,51,69,252,237,0', '0', '1');
COMMIT;

-- ----------------------------
--  Table structure for `eb_system_store`
-- ----------------------------
DROP TABLE IF EXISTS `eb_system_store`;
CREATE TABLE `eb_system_store` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL DEFAULT '' COMMENT '门店名称',
  `introduction` varchar(1000) NOT NULL DEFAULT '' COMMENT '简介',
  `phone` char(25) NOT NULL DEFAULT '' COMMENT '手机号码',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '省市区',
  `detailed_address` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `image` varchar(255) NOT NULL DEFAULT '' COMMENT '门店logo',
  `latitude` char(25) NOT NULL DEFAULT '' COMMENT '纬度',
  `longitude` char(25) NOT NULL DEFAULT '' COMMENT '经度',
  `valid_time` varchar(100) NOT NULL DEFAULT '' COMMENT '核销有效日期',
  `day_time` varchar(100) NOT NULL DEFAULT '' COMMENT '每日营业开关时间',
  `add_time` int(11) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `is_show` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否显示',
  `is_del` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `phone` (`phone`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='门店自提';

-- ----------------------------
--  Table structure for `eb_user`
-- ----------------------------
DROP TABLE IF EXISTS `eb_user`;
CREATE TABLE `eb_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `account` varchar(32) NOT NULL COMMENT '用户账号',
  `pwd` varchar(32) NOT NULL COMMENT '用户密码',
  `real_name` varchar(25) NOT NULL DEFAULT '' COMMENT '真实姓名',
  `birthday` int(11) NOT NULL DEFAULT '0' COMMENT '生日',
  `card_id` varchar(20) NOT NULL DEFAULT '' COMMENT '身份证号码',
  `mark` varchar(255) NOT NULL DEFAULT '' COMMENT '用户备注',
  `partner_id` int(11) NOT NULL DEFAULT '0' COMMENT '合伙人id',
  `group_id` int(11) NOT NULL DEFAULT '0' COMMENT '用户分组id',
  `nickname` varchar(16) NOT NULL COMMENT '用户昵称',
  `avatar` varchar(256) NOT NULL COMMENT '用户头像',
  `phone` char(15) DEFAULT NULL COMMENT '手机号码',
  `add_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `add_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '添加ip',
  `last_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_ip` varchar(16) NOT NULL DEFAULT '' COMMENT '最后一次登录ip',
  `now_money` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户余额',
  `brokerage_price` decimal(8,2) NOT NULL DEFAULT '0.00' COMMENT '佣金金额',
  `integral` decimal(8,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '用户剩余积分',
  `sign_num` int(11) NOT NULL DEFAULT '0' COMMENT '连续签到天数',
  `status` tinyint(1) NOT NULL DEFAULT '1' COMMENT '1为正常，0为禁止',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '0' COMMENT '等级',
  `spread_uid` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '推广元id',
  `spread_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '推广员关联时间',
  `user_type` varchar(32) NOT NULL COMMENT '用户类型',
  `is_promoter` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否为推广员',
  `pay_count` int(11) unsigned DEFAULT '0' COMMENT '用户购买次数',
  `spread_count` int(11) DEFAULT '0' COMMENT '下级人数',
  `clean_time` int(11) DEFAULT '0' COMMENT '清理会员时间',
  `addres` varchar(255) NOT NULL DEFAULT '' COMMENT '详细地址',
  `adminid` int(11) unsigned DEFAULT '0' COMMENT '管理员编号 ',
  `login_type` varchar(36) NOT NULL DEFAULT '' COMMENT '用户登陆类型，h5,wechat,routine',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `account` (`account`) USING BTREE,
  KEY `spreaduid` (`spread_uid`) USING BTREE,
  KEY `level` (`level`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `is_promoter` (`is_promoter`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
--  Table structure for `eb_wechat_media`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_media`;
CREATE TABLE `eb_wechat_media` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信视频音频id',
  `type` varchar(16) NOT NULL DEFAULT '' COMMENT '回复类型',
  `path` varchar(128) NOT NULL DEFAULT '' COMMENT '文件路径',
  `media_id` varchar(64) NOT NULL DEFAULT '' COMMENT '微信服务器返回的id',
  `url` varchar(256) NOT NULL DEFAULT '' COMMENT '地址',
  `temporary` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否永久或者临时 0永久1临时',
  `add_time` int(10) unsigned NOT NULL COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `type` (`type`,`media_id`) USING BTREE,
  KEY `type_2` (`type`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信回复表';

-- ----------------------------
--  Table structure for `eb_wechat_message`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_message`;
CREATE TABLE `eb_wechat_message` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '用户行为记录id',
  `openid` varchar(32) NOT NULL DEFAULT '' COMMENT '用户openid',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '操作类型',
  `result` varchar(512) NOT NULL DEFAULT '' COMMENT '操作详细记录',
  `add_time` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户行为记录表';

-- ----------------------------
--  Table structure for `eb_wechat_news_category`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_news_category`;
CREATE TABLE `eb_wechat_news_category` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '图文消息管理ID',
  `cate_name` varchar(255) NOT NULL COMMENT '图文名称',
  `sort` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '排序',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `new_id` varchar(255) NOT NULL DEFAULT '' COMMENT '文章id',
  `add_time` varchar(255) NOT NULL DEFAULT '' COMMENT '添加时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='图文消息管理表';

-- ----------------------------
--  Table structure for `eb_wechat_qrcode`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_qrcode`;
CREATE TABLE `eb_wechat_qrcode` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信二维码ID',
  `third_type` varchar(32) NOT NULL DEFAULT '' COMMENT '二维码类型',
  `third_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `ticket` varchar(255) NOT NULL DEFAULT '' COMMENT '二维码参数',
  `expire_seconds` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '二维码有效时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  `add_time` varchar(255) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '微信访问url',
  `qrcode_url` varchar(255) NOT NULL DEFAULT '' COMMENT '微信二维码url',
  `scan` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '被扫的次数',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `third_type` (`third_type`,`third_id`) USING BTREE,
  KEY `ticket` (`ticket`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信二维码管理表';

-- ----------------------------
--  Table structure for `eb_wechat_reply`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_reply`;
CREATE TABLE `eb_wechat_reply` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信关键字回复id',
  `key` varchar(64) NOT NULL DEFAULT '' COMMENT '关键字',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '回复类型',
  `data` text NOT NULL COMMENT '回复数据',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '0=不可用  1 =可用',
  `hide` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否隐藏',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `key` (`key`) USING BTREE,
  KEY `type` (`type`) USING BTREE,
  KEY `status` (`status`) USING BTREE,
  KEY `hide` (`hide`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信关键字回复表';

-- ----------------------------
--  Table structure for `eb_wechat_template`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_template`;
CREATE TABLE `eb_wechat_template` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '模板id',
  `tempkey` char(50) NOT NULL DEFAULT '' COMMENT '模板编号',
  `name` char(100) NOT NULL DEFAULT '' COMMENT '模板名',
  `content` varchar(1000) NOT NULL DEFAULT '' COMMENT '回复内容',
  `tempid` char(100) DEFAULT NULL COMMENT '模板ID',
  `add_time` varchar(15) NOT NULL DEFAULT '0' COMMENT '添加时间',
  `status` tinyint(4) NOT NULL DEFAULT '0' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `tempkey` (`tempkey`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COMMENT='微信模板';

-- ----------------------------
--  Records of `eb_wechat_template`
-- ----------------------------
BEGIN;
INSERT INTO `eb_wechat_template` VALUES ('3', 'OPENTM200565259', '订单发货提醒', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n物流公司：{{keyword2.DATA}}\n物流单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM', '1515052638', '1'), ('4', 'OPENTM413386489', '订单收货通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单状态：{{keyword2.DATA}}\n收货时间：{{keyword3.DATA}}\n商品详情：{{keyword4.DATA}}\n{{remark.DATA}}', 'UNyz81kgsn1WZHSqmwPiF9fUkcdZghfTZvN6qtDuu54', '1515052765', '1'), ('5', 'OPENTM410119152', '退款进度通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n订单金额：{{keyword2.DATA}}\n下单时间：{{keyword3.DATA}}\n{{remark.DATA}}', 'xrXtApBFv0L3-YXKkl9WYB89hJxFGfQo3jSsk2WpAwI', '1515053049', '1'), ('6', 'OPENTM405847076', '帐户资金变动提醒', '{{first.DATA}}\n变动类型：{{keyword1.DATA}}\n变动时间：{{keyword2.DATA}}\n变动金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'Bk3XLd1Nwk9aNF1NIPBlyTDhrgNbzJW4H23OwVQdE-s', '1515053127', '1'), ('7', 'OPENTM207707249', '订单发货提醒', '\n{{first.DATA}}\n商品明细：{{keyword1.DATA}}\n下单时间：{{keyword2.DATA}}\n配送地址：{{keyword3.DATA}}\n配送人：{{keyword4.DATA}}\n联系电话：{{keyword5.DATA}}\n{{remark.DATA}}', 'KusKZOFc_4CrRU_gzuXMdMMTfFeR-OLVVuDiMyR5PiM', '1515053313', '1'), ('8', 'OPENTM408237350', '服务进度提醒', '{{first.DATA}}\n服务类型：{{keyword1.DATA}}\n服务状态：{{keyword2.DATA}}\n服务时间：{{keyword3.DATA}}\n{{remark.DATA}}', 'ul2g_y0oxqEhtWoSJBbLzmnPrUwtLnIAe30MTBRL7rw', '1515483915', '1'), ('9', 'OPENTM204431262', '客服通知提醒', '{{first.DATA}}\n客户名称：{{keyword1.DATA}}\n客服类型：{{keyword2.DATA}}\n提醒内容：{{keyword3.DATA}}\n通知时间：{{keyword4.DATA}}\n{{remark.DATA}}', 'j51mawxEmTuCCtMrXwSTnRfXH93qutoOebs5RG4MyHY', '1515484354', '1'), ('10', 'OPENTM407456411', '拼团成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n团购商品：{{keyword2.DATA}}\n{{remark.DATA}}', 'CNvCAz9GIoQri-ogSCODVRANCBUQjZIxWzWvizbHVoQ', '1520063823', '1'), ('11', 'OPENTM401113750', '拼团失败通知', '{{first.DATA}}\n拼团商品：{{keyword1.DATA}}\n商品金额：{{keyword2.DATA}}\n退款金额：{{keyword3.DATA}}\n{{remark.DATA}}', 'mSg4ZexW1qaQH3FCrFLe746EYMlTFsZhfTB6VI_ElYg', '1520064059', '1'), ('12', 'OPENTM205213550', '订单生成通知', '{{first.DATA}}\n时间：{{keyword1.DATA}}\n商品名称：{{keyword2.DATA}}\n订单号：{{keyword3.DATA}}\n{{remark.DATA}}', 'HYD99ERso6_PcA3hAT6pzH1RmO88H6IIe8crAVaXPRE', '1528966701', '1'), ('13', 'OPENTM207791277', '订单支付成功通知', '{{first.DATA}}\n订单编号：{{keyword1.DATA}}\n支付金额：{{keyword2.DATA}}\n{{remark.DATA}}', 'hJV1d1OwWB_lbPrSaRHi9RGr5CFAF4PJcZdYeg73Mtg', '1528966759', '1'), ('14', 'OPENTM410292733', '砍价成功提醒', '{{first.DATA}}\n商品名称：{{keyword1.DATA}}\n底价：{{keyword2.DATA}}\n{{remark.DATA}}', 'SxBvid65JxK6PWOhlC2sgCG_mlopY1uKekEnEvAALp4', '1564566678', '1'), ('15', 'OPENTM414349441', '开团成功通知', '{{first.DATA}}\n拼团名称：{{keyword1.DATA}}\n团购价格：{{keyword2.DATA}}\n拼团人数：{{keyword3.DATA}}\n{{remark.DATA}}', 'VDTU6X1UiK438tu-qcHKc_I76CtsEWVx-_Pbf1voiws', '1564567037', '1');
COMMIT;

-- ----------------------------
--  Table structure for `eb_wechat_user`
-- ----------------------------
DROP TABLE IF EXISTS `eb_wechat_user`;
CREATE TABLE `eb_wechat_user` (
  `uid` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '微信用户id',
  `unionid` varchar(30) DEFAULT NULL COMMENT '只有在用户将公众号绑定到微信开放平台帐号后，才会出现该字段',
  `openid` varchar(30) DEFAULT NULL COMMENT '用户的标识，对当前公众号唯一',
  `routine_openid` varchar(32) DEFAULT NULL COMMENT '小程序唯一身份ID',
  `nickname` varchar(64) NOT NULL COMMENT '用户的昵称',
  `headimgurl` varchar(256) NOT NULL COMMENT '用户头像',
  `sex` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户的性别，值为1时是男性，值为2时是女性，值为0时是未知',
  `city` varchar(64) NOT NULL COMMENT '用户所在城市',
  `language` varchar(64) NOT NULL COMMENT '用户的语言，简体中文为zh_CN',
  `province` varchar(64) NOT NULL COMMENT '用户所在省份',
  `country` varchar(64) NOT NULL COMMENT '用户所在国家',
  `remark` varchar(256) DEFAULT NULL COMMENT '公众号运营者对粉丝的备注，公众号运营者可在微信公众平台用户管理界面对粉丝添加备注',
  `groupid` smallint(5) unsigned DEFAULT '0' COMMENT '用户所在的分组ID（兼容旧的用户分组接口）',
  `tagid_list` varchar(256) DEFAULT NULL COMMENT '用户被打上的标签ID列表',
  `subscribe` tinyint(3) unsigned DEFAULT '1' COMMENT '用户是否订阅该公众号标识',
  `subscribe_time` int(10) unsigned DEFAULT NULL COMMENT '关注公众号时间',
  `add_time` int(10) unsigned DEFAULT NULL COMMENT '添加时间',
  `stair` int(11) unsigned DEFAULT NULL COMMENT '一级推荐人',
  `second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人',
  `order_stair` int(11) DEFAULT NULL COMMENT '一级推荐人订单',
  `order_second` int(11) unsigned DEFAULT NULL COMMENT '二级推荐人订单',
  `now_money` decimal(8,2) unsigned DEFAULT NULL COMMENT '佣金',
  `session_key` varchar(32) DEFAULT NULL COMMENT '小程序用户会话密匙',
  `user_type` varchar(32) DEFAULT 'wechat' COMMENT '用户类型',
  PRIMARY KEY (`uid`) USING BTREE,
  KEY `groupid` (`groupid`) USING BTREE,
  KEY `subscribe_time` (`subscribe_time`) USING BTREE,
  KEY `add_time` (`add_time`) USING BTREE,
  KEY `subscribe` (`subscribe`) USING BTREE,
  KEY `unionid` (`unionid`) USING BTREE,
  KEY `openid` (`openid`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='微信用户表';

SET FOREIGN_KEY_CHECKS = 1;
