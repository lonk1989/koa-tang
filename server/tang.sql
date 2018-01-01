/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : tang

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2018-01-01 22:08:18
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类ID',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `title` char(100) NOT NULL DEFAULT '' COMMENT '文章标题',
  `description` char(255) NOT NULL DEFAULT '' COMMENT '文章描述',
  `content` text CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL COMMENT '文章内容',
  `passed` int(1) NOT NULL DEFAULT '0' COMMENT '审核状态',
  `read_type` tinyint(4) NOT NULL DEFAULT '0' COMMENT '阅读权限（参阅用户类型）',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '发表时间',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `article_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`),
  KEY `sort_id` (`sort_id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章数据库表';

-- ----------------------------
-- Records of article
-- ----------------------------

-- ----------------------------
-- Table structure for banner
-- ----------------------------
DROP TABLE IF EXISTS `banner`;
CREATE TABLE `banner` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pic` text,
  `url` varchar(255) DEFAULT NULL,
  `open` bit(1) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of banner
-- ----------------------------

-- ----------------------------
-- Table structure for comment
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `doctor_id` int(11) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `parent_phone` varchar(255) DEFAULT NULL,
  `content` varchar(255) DEFAULT NULL,
  `rank` int(11) DEFAULT NULL,
  `keyword` varchar(255) DEFAULT NULL,
  `desc` varchar(255) DEFAULT NULL,
  `insert_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of comment
-- ----------------------------

-- ----------------------------
-- Table structure for department
-- ----------------------------
DROP TABLE IF EXISTS `department`;
CREATE TABLE `department` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` int(5) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of department
-- ----------------------------
INSERT INTO `department` VALUES ('1', '消化科', null);
INSERT INTO `department` VALUES ('4', '皮肤科', '00000');
INSERT INTO `department` VALUES ('65', '内科', '00003');
INSERT INTO `department` VALUES ('66', '外科', '00000');
INSERT INTO `department` VALUES ('67', '妇科', '00000');
INSERT INTO `department` VALUES ('68', '儿科', '00000');
INSERT INTO `department` VALUES ('69', '口腔科', '00000');
INSERT INTO `department` VALUES ('70', '内分泌科', '00000');
INSERT INTO `department` VALUES ('71', '耳鼻喉科', '00000');
INSERT INTO `department` VALUES ('72', '男科', '00000');
INSERT INTO `department` VALUES ('73', '精神科', '00000');

-- ----------------------------
-- Table structure for doctor
-- ----------------------------
DROP TABLE IF EXISTS `doctor`;
CREATE TABLE `doctor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` int(11) DEFAULT '0',
  `hospital` varchar(255) DEFAULT NULL,
  `hospital_id` varchar(255) DEFAULT NULL,
  `avatar` text,
  `rank` int(11) DEFAULT '0',
  `visit` varchar(255) DEFAULT NULL,
  `price` decimal(6,2) unsigned zerofill DEFAULT NULL,
  `consult_price` decimal(6,2) unsigned zerofill DEFAULT NULL,
  `notice` varchar(255) DEFAULT NULL,
  `adept` varchar(255) DEFAULT NULL,
  `about` text,
  `intro` text,
  `sort` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of doctor
-- ----------------------------
INSERT INTO `doctor` VALUES ('5', '陈光献', '13581580506', null, '0', '北京王府井医院', '7', 'http://118.31.12.161:3001/upFile/1513414166352.png', '2', null, '0050.00', '0050.00', '', '男女不孕不育,前列腺疾病,性功能障碍,女性月经不调,痛经,卵巢囊肿,子宫肌瘤,头痛,失眠,眩晕,癫痫,三叉神经痛,心脑血管疾病,更年期综合症,肾病,糖尿病,颈椎病,类风湿病等.', '', '<p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂中医院特聘专家</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">从事中医临床教学、科研工作已</font>55<font face=\"宋体\">年，独创“溶栓优化及多靶点渗透疗法”治疗前列腺、前列腺炎。擅长治疗：男女不孕不育、前列腺疾病、性功能障碍，女性月经不调、痛经、卵巢囊肿、子宫肌瘤，头痛、失眠、眩晕、癫痫、三叉神经痛、心脑血管疾病、更年期综合症、肾病、糖尿病、颈椎病、类风湿病等，对各种肿瘤术前术后的中药治疗其药方独特亦有其独到之处，其疗效获得患者的好评。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('6', '陈克正', '13426068718', null, '0', '北京同仁堂崇文门药店', '5', 'http://118.31.12.161:3001/upFile/1513414220268.png', '1', null, '0100.00', '0100.00', '', '哮喘,胃肠病,肝炎,各种肿瘤术前术后的中药治疗,发热不退,冠心病,高血脂,肾炎,甲亢,糖尿病,关节痛,痛风,痤疮,荨麻疹,鼻炎,小儿疳积,小儿反复感冒以及妇科月经不调,子宫肌瘤,乳腺病等.', '', '<p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂集团特聘著名专家</font></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"font-family: 宋体; font-size: 10.5pt; text-indent: 21pt; line-height: 1.5;\">中国中医科学院主任医师、资深专家</span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\">1981<font face=\"宋体\">年中国中医研究院首届研究生</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">出身中医世家，</font>1981<font face=\"宋体\">年中国中医研究院首届研究生毕业，是当代中医大师严苍山先生、方药中教授的学术继承人。擅长治疗哮喘、胃肠病、肝炎、各种肿瘤术前术后的中药治疗、发热不退、冠心病、高血脂、肾炎、甲亢、糖尿病、关节痛、痛风、痤疮、荨麻疹、鼻炎、小儿疳积、小儿反复感冒以及妇科月经不调、子宫肌瘤、乳腺病等。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">陈克正专家从医已</font>58<font face=\"宋体\">年，对内科、妇科、儿科等疑难杂症拥有丰富的临床经验，其学识渊深，辨证论治，遣方用药，严谨精炼，深受同道敬重，且在病患之中名闻遐迩。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('7', '郭正权', '18911386445', null, '0', '北京同仁堂崇文门药店', '5', 'http://118.31.12.161:3001/upFile/1513414234386.png', '1', null, '0100.00', '0100.00', '', '运用中医传统理论与现代医学知识相结合,对消化系统疾病,肝胆疾患,呼吸系统及心脑血管疾病等疑难杂症有深入研究,在治疗乙肝,大三阳,小三阳,肝纤维化,肝腹水等疾病有良好的治疗效果.', '', '<p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂特聘专家</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京中医疑难杂症研究会副会长，北京国医堂中医研究院专家委员会主任委员。先后曾在中国中医科学院、北京宣武医院、宣武中医院、北京第二传染病院工作和学习。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">　　擅长治疗：运用中医传统理论与现代医学知识相结合，对消化系统疾病、肝胆疾患，呼吸系统及心脑血管疾病等疑难杂症有深入研究，在治疗乙肝、大三阳、小三阳、肝纤维化、肝腹水等疾病有良好的治疗效果。</font></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('8', '张士贤', '18101093447', null, '1', '北京同仁堂崇文门药店', '5', 'http://118.31.12.161:3001/upFile/1513414245923.png', '2', null, '0050.00', '0050.00', '', '脾胃病,呼吸道疾病,肿瘤治疗,糖尿病及其并发症,不孕不育症,产后病,妇科炎症,月经不调,闭经,痛经,更年期综合症,心悸,眩晕,头痛,失眠,神经衰弱,疲劳综合症以及耳鸣,鼻炎,咽喉等杂症.', '', '<p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂特聘专家</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">毕业于首都医科大学，师从翟济生先生（施今墨先生之高足）。主治内科、妇科、眼科疾病。擅长脾胃病、呼吸道疾病、肿瘤治疗、糖尿病及其并发症、不孕不育症、产后病、妇科炎症、月经不调、闭经、痛经、更年期综合症、心悸、眩晕、头痛、失眠、神经衰弱、疲劳综合症以及耳鸣、鼻炎、咽喉等杂症。其临床经验丰富，对中医理论有精深的研究，独有特色的中医药治疗方法，深受广大患者的喜爱。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('9', '王红兵', '13701277734', null, '1', '北京同仁堂崇文门药店', '5', 'http://118.31.12.161:3001/upFile/1513414256431.png', '2', null, '0050.00', '0050.00', '', '糖尿病,高血压,血脂紊乱,心律失常,肝胆炎症,结石,脾胃病,头疼,眩晕,焦虑,抑郁失眠,喘咳,口腔复发溃疡,疲劳综合症,各种肿瘤术前术后的中药治疗等.妇科月经不调,闭经,盆腔炎,卵巢病.皮肤痤疮,皮炎,湿疹,小儿发热,哮喘,消化不良等.', '', '<p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂特聘专家</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">从医已</font>44<font face=\"宋体\">年，擅长诊治糖尿病、高血压、血脂紊乱、心律失常、肝胆炎症、结石、脾胃病、头疼、眩晕、焦虑、抑郁失眠、喘咳、口腔复发溃疡、疲劳综合症、各种肿瘤术前术后的中药治疗等。妇科月经不调、闭经、盆腔炎、卵巢病。皮肤痤疮、皮炎、湿疹、小儿发热、哮喘、消化不良等。其独到的辩证治疗理念与丰富的临床经验、严谨的工作态度、良好的疗效，得到广大患者的一致好评与认可。</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('10', '李晓光', '13605348168', null, '0', '北京同仁堂德州药店', '6', 'http://118.31.12.161:3001/upFile/1513414270772.png', '1', null, '0000.00', '0000.00', '', '消化系统,心脑血管系统,呼吸系统的常见病及疑难杂症.对胃,肠,肝,胆,胰腺等疾病的诊疗更是有自己的独到之处.', '', '<p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">北京同仁堂特聘专家</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">知名中医主任医师</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">山东中医药大学兼职教授</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">原德州市中医院副院长</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p>&nbsp;</o:p></span></p><p class=\"MsoNormal\" style=\"text-indent:21.0000pt;\"><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><font face=\"宋体\">　　</font>1977<font face=\"宋体\">年毕业于山东中医药大学，从事中医内科临床</font><font face=\"Calibri\">40</font><font face=\"宋体\">余年。擅长诊治消化系统、心脑血管系统、呼吸系统的常见病及疑难杂症。对胃、肠、肝、胆、胰腺等疾病的诊疗更是有自己的独到之处。尤以对慢性消化系统疾病如萎缩性胃炎、胃食管反流病、消化性溃疡等中西医诊治疗效显著。对心脑血管疾病，如中风、冠心病、风心病、头痛、眩晕、失眠等治疗经验丰富。对良、恶性肿瘤的术前术后中医治疗有较高造诣。对中医妇科、男科疾病临床治疗效果明显。擅长对亚健康症的中医调理。被病患赞誉“悬壶济世四十载 京津鲁冀克病魔！”</font></span><span style=\"mso-spacerun:\'yes\';font-family:宋体;mso-ascii-font-family:Calibri;mso-hansi-font-family:Calibri;mso-bidi-font-family:\'Times New Roman\';font-size:10.5000pt;mso-font-kerning:1.0000pt;\"><o:p></o:p></span></p>', '00000000000');
INSERT INTO `doctor` VALUES ('11', '马士田', '13804219805', null, '0', '北京同仁堂德州药店', '6', 'http://118.31.12.161:3001/upFile/1513414293622.png', '2', null, '0000.00', '0000.00', '', '内科常见病,多发病及各种疑难杂症.对中晚期恶性肿瘤,脾胃病,消化系统疾病,中风病,冠心病,心梗,糖尿病,顽固性头痛,泌尿系结石,急慢性泌尿系感染,原因不明发热等多种疾病总结了多套成功的临床验方及治疗方法.', '', '<span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font color=\"#000000\" face=\"宋体\"><p style=\"margin: 0pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font face=\"宋体\">&nbsp;&nbsp;&nbsp; 全国著名中医</font></span></p><p style=\"margin: 0pt; text-indent: 21pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font face=\"宋体\">北京同仁堂特聘专家</font></span></p></font><p style=\"margin: 0pt;\"><br></p></span><p style=\"margin: 0pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font color=\"#000000\" face=\"宋体\">&nbsp;&nbsp;&nbsp; 毕业于辽宁中医药大学医疗系，从医已</font><font color=\"#000000\">41</font><font color=\"#000000\" face=\"宋体\">年，擅长中西医结合治疗内科常见病、多发病及各种疑难杂症。对中晚期恶性肿瘤、脾胃病、消化系统疾病、中风病、冠心病、心梗、糖尿病、顽固性头痛、泌尿系结石、急慢性泌尿系感染、原因不明发热等多种疾病总结了多套成功的临床验方及治疗方法，精于临床施治，具有独特的治疗思路和丰富的辩证经验。</font></span></p>&nbsp;&nbsp; ', '00000000000');
INSERT INTO `doctor` VALUES ('12', '韩祉弘', '18162020110', null, '0', '北京同仁堂德州药店', '6', 'http://118.31.12.161:3001/upFile/1513414308407.png', '0', null, '0000.00', '0000.00', '', '擅于治疗颈椎错位引起的头晕,头痛,耳鸣,眼睛干涩,脑供血不足,失眠,记忆力下降,上肢麻痛以及各种颈椎病.胸椎错位引起的胸闷气短,心慌,心绞痛,高低肩,含胸驼背,后背酸痛,肩周炎.腰椎错位引起的长短腿,腰椎间盘突出,腰痛,腹痛,坐骨神经痛,尾骨痛,腿麻,脚麻,膝关节屈伸不利,疼痛,下蹲上楼困难.青少年脊柱侧弯,注意力下降,罗圈腿,k型腿,内外八字等症.另对面部长痘长斑,急慢性鼻炎,哮喘,高血压,心脑血管等疑难病有特效.', '', '<p style=\"margin: 0pt; text-indent: 21pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font color=\"#000000\" face=\"宋体\">齐氏中医第七代传人</font></span></p><p style=\"margin: 0pt; text-indent: 21pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font color=\"#000000\">&nbsp;</font></span></p><p style=\"margin: 0pt;\"><span style=\'font-family: 宋体; font-size: 10.5pt; mso-spacerun: \"yes\"; mso-ascii-font-family: Calibri; mso-hansi-font-family: Calibri; mso-bidi-font-family: \"Times New Roman\"; mso-font-kerning: 1.0000pt;\'><font color=\"#000000\" face=\"宋体\">　　擅于治疗颈椎错位引起的头晕、头痛、耳鸣、眼睛干涩、脑供血不足、失眠、记忆力下降、上肢麻痛以及各种颈椎病。胸椎错位引起的胸闷气短、心慌、心绞痛、高低肩、含胸驼背、后背酸痛、肩周炎。腰椎错位引起的长短腿、腰椎间盘突出、腰痛、腹痛、坐骨神经痛、尾骨痛、腿麻、脚麻、膝关节屈伸不利、疼痛、下蹲上楼困难。青少年脊柱侧弯、注意力下降、罗圈腿、</font><font color=\"#000000\">k</font><font color=\"#000000\" face=\"宋体\">型腿、内外八字等症。另对面部长痘长斑、急慢性鼻炎、哮喘、高血压、心脑血管等疑难病有特效。</font></span></p>', '00000000000');

-- ----------------------------
-- Table structure for hospital
-- ----------------------------
DROP TABLE IF EXISTS `hospital`;
CREATE TABLE `hospital` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `rank` varchar(255) DEFAULT NULL,
  `sort` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of hospital
-- ----------------------------
INSERT INTO `hospital` VALUES ('1', '盛京医院', '三甲医院', '00000000000');
INSERT INTO `hospital` VALUES ('2', '天坛医院', '', '00000000000');
INSERT INTO `hospital` VALUES ('5', '北京同仁堂崇文门药店', '', '00000000000');
INSERT INTO `hospital` VALUES ('6', '北京同仁堂德州药店', '', '00000000000');
INSERT INTO `hospital` VALUES ('7', '北京王府井医院', '', '00000000000');

-- ----------------------------
-- Table structure for medicine
-- ----------------------------
DROP TABLE IF EXISTS `medicine`;
CREATE TABLE `medicine` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `medicine_type_id` varchar(255) NOT NULL,
  `unit` varchar(255) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `spec` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1156 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine
-- ----------------------------
INSERT INTO `medicine` VALUES ('8', '阿胶珠', '2', '克', '4.35', null, '0');
INSERT INTO `medicine` VALUES ('9', '艾绒', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('10', '艾叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('11', '安息香', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('12', '八角茴香', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('13', '巴戟天', '2', '克', '0.28', null, '0');
INSERT INTO `medicine` VALUES ('14', '菝葜', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('15', '白扁豆仁', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('16', '白矾', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('17', '白果', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('18', '白果仁', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('19', '白胡椒', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('20', '白花蛇舌草', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('21', '白及', '2', '克', '3.00', null, '0');
INSERT INTO `medicine` VALUES ('22', '白僵蚕', '2', '克', '0.69', null, '0');
INSERT INTO `medicine` VALUES ('23', '白蔹', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('24', '白茅根', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('25', '白片', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('26', '白前', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('27', '白屈菜', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('28', '白芍', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('29', '白英石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('30', '白头翁', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('31', '白薇', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('32', '白鲜皮', '2', '克', '0.35', null, '0');
INSERT INTO `medicine` VALUES ('33', '白药子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('34', '白英', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('35', '白芷', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('36', '百倍', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('37', '百部', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('38', '百合', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('39', '百枝', '2', '克', '0.80', null, '0');
INSERT INTO `medicine` VALUES ('40', '柏子仁', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('41', '板蓝根', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('42', '半边莲 ', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('43', '半枝莲', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('44', '薄荷', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('45', '薄荷脑', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('46', '北败酱草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('47', '北柴胡', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('48', '北豆根', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('49', '北寒水石', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('50', '北刘寄奴', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('51', '北沙参', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('52', '奔马草', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('53', '荜茇', '2', '克', '0.35', '', '0');
INSERT INTO `medicine` VALUES ('54', '蓖麻子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('55', '壁虎', '2', '克', '2.40', null, '0');
INSERT INTO `medicine` VALUES ('56', '萹蓄', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('57', '扁豆花', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('58', '鳖甲', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('59', '补骨脂', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('60', '补阳', '2', '克', '0.44', null, '0');
INSERT INTO `medicine` VALUES ('61', '蚕蛾', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('62', '蚕沙', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('63', '苍术', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('64', '草豆蔻', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('65', '草果', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('66', '侧柏炭', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('67', '侧柏叶', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('68', '柴狗肾', '2', '克', '75.00', null, '0');
INSERT INTO `medicine` VALUES ('69', '蝉蜕', '2', '克', '1.74', null, '0');
INSERT INTO `medicine` VALUES ('70', '燀桃仁', '2', '克', '0.25', null, '0');
INSERT INTO `medicine` VALUES ('71', '炒艾叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('72', '炒白扁豆仁', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('73', '炒白芍', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('74', '炒苍耳子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('75', '炒稻芽', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('76', '炒谷芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('77', '炒槐米', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('78', '炒僵蚕', '2', '克', '0.78', null, '0');
INSERT INTO `medicine` VALUES ('79', '炒决明子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('80', '炒苦杏仁', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('81', '炒莱菔子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('82', '炒麦芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('83', '炒牵牛子（白）', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('84', '炒牵牛子（黑）', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('85', '炒山楂', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('86', '炒酸枣仁', '2', '克', '0.55', null, '0');
INSERT INTO `medicine` VALUES ('87', '炒王不留行', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('88', '炒栀子', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('89', '炒紫苏叶', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('90', '车前草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('91', '沉香', '2', '克', '13.00', null, '0');
INSERT INTO `medicine` VALUES ('92', '沉香粉', '2', '克', '25.50', null, '0');
INSERT INTO `medicine` VALUES ('93', '陈皮', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('94', '赤茯苓', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('95', '赤箭', '2', '克', '0.87', null, '0');
INSERT INTO `medicine` VALUES ('96', '赤芍', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('97', '赤石脂', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('98', '赤小豆', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('99', '茺蔚子', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('100', '抽葫芦', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('101', '楮实子', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('102', '川贝母', '2', '克', '8.00', null, '0');
INSERT INTO `medicine` VALUES ('103', '川槿皮', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('104', '川楝子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('105', '川木通', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('106', '川牛膝', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('107', '川蜀', '2', '克', '0.44', null, '0');
INSERT INTO `medicine` VALUES ('108', '穿破石', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('109', '穿山龙', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('110', '穿心莲', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('111', '垂盆草', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('112', '磁石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('113', '刺五加', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('114', '葱子', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('115', '醋鳖甲', '2', '克', '0.53', null, '0');
INSERT INTO `medicine` VALUES ('116', '醋柴胡', '2', '克', '0.78', null, '0');
INSERT INTO `medicine` VALUES ('117', '醋莪术', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('118', '粗龟甲', '2', '克', '1.38', null, '0');
INSERT INTO `medicine` VALUES ('119', '醋鸡内金', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('120', '醋没药', '2', '克', '0.70', null, '0');
INSERT INTO `medicine` VALUES ('121', '醋青皮', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('122', '醋乳香', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('123', '醋三棱', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('124', '醋山甲', '2', '克', '10.00', null, '0');
INSERT INTO `medicine` VALUES ('125', '醋五灵脂', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('126', '醋五味子', '2', '克', '0.52', null, '0');
INSERT INTO `medicine` VALUES ('127', '醋香附', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('128', '醋延胡索', '2', '克', '0.35', null, '0');
INSERT INTO `medicine` VALUES ('129', '大腹皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('130', '大黄', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('131', '大青盐', '2', '克', '0.02', null, '0');
INSERT INTO `medicine` VALUES ('132', '大青叶', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('133', '大血藤', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('134', '大枣', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('135', '大皂角', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('136', '代代花', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('137', '胆矾', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('138', '胆南星', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('139', '淡豆豉', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('140', '淡竹叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('141', '当归尾', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('142', '刀豆', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('143', '倒扣草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('144', '稻芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('145', '灯芯草', '2', '克', '0.99', null, '0');
INSERT INTO `medicine` VALUES ('146', '地枫皮', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('147', '地肤子', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('148', '地骨皮', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('149', '地锦草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('150', '地精', '2', '克', '4.50', null, '0');
INSERT INTO `medicine` VALUES ('151', '地龙', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('152', '地榆', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('153', '地榆炭', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('154', '丁香', '2', '克', '0.41', null, '0');
INSERT INTO `medicine` VALUES ('155', '精-冬虫夏草', '2', '克', '550.00', null, '0');
INSERT INTO `medicine` VALUES ('156', '冬虫夏草', '2', '克', '428.00', null, '0');
INSERT INTO `medicine` VALUES ('157', '冬瓜皮', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('158', '冬瓜子', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('159', '冬凌草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('160', '豆蔻', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('161', '独活', '2', '克', '0.16', null, '0');
INSERT INTO `medicine` VALUES ('162', '独一味', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('163', '杜仲', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('164', '杜仲炭', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('165', '煅磁石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('166', '煅蛤壳', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('167', '煅牡蛎', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('168', '煅石膏', '2', '克', '0.02', null, '0');
INSERT INTO `medicine` VALUES ('169', '煅石决明', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('170', '煅瓦楞子', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('171', '莪术', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('172', '鹅不食草', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('173', '儿茶', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('174', '法半夏', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('175', '番泻叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('176', '防己', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('177', '榧子', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('178', '分心木', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('179', '蜂房', '2', '克', '1.65', null, '0');
INSERT INTO `medicine` VALUES ('180', '凤凰衣', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('181', '凤尾草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('182', '凤仙透骨草', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('183', '凤眼草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('184', '佛手', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('185', '佛手花', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('186', '麸炒白术', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('187', '麸炒半夏曲', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('188', '麸炒苍术', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('189', '麸炒椿皮', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('190', '麸炒芡实', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('191', '麸炒山药', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('192', '麸炒神曲', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('193', '麸炒薏苡仁', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('194', '麸炒枳壳', '2', '克', '0.22', null, '0');
INSERT INTO `medicine` VALUES ('195', '麸炒枳实', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('196', '伏龙肝', '2', '克', '0.02', null, '0');
INSERT INTO `medicine` VALUES ('197', '芙蓉叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('198', '茯苓皮', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('199', '茯神', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('200', '浮海石', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('201', '浮小麦', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('202', '覆盆子', '2', '克', '1.05', null, '0');
INSERT INTO `medicine` VALUES ('203', '甘草', '2', '克', '29.00', null, '0');
INSERT INTO `medicine` VALUES ('204', '甘松', '2', '克', '0.32', null, '0');
INSERT INTO `medicine` VALUES ('205', '干蟾', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('206', '干姜', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('207', '高良姜', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('208', '藁本', '2', '克', '0.66', null, '0');
INSERT INTO `medicine` VALUES ('209', '藁本片', '2', '克', '0.66', null, '0');
INSERT INTO `medicine` VALUES ('210', '葛根', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('211', '葛花', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('212', '贡菊', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('213', '钩藤', '2', '克', '0.22', null, '0');
INSERT INTO `medicine` VALUES ('214', '枸杞子', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('215', '谷精草', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('216', '谷芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('217', '骨碎补', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('218', '瓜蒌', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('219', '瓜蒌皮', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('220', '瓜蒌子', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('221', '广藿香', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('222', '龟甲', '2', '克', '1.20', null, '0');
INSERT INTO `medicine` VALUES ('223', '鬼箭羽', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('224', '鬼针草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('225', '桂枝', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('226', '蛤蚧', '2', '克', '88.00', null, '0');
INSERT INTO `medicine` VALUES ('227', '蛤壳', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('228', '蛤蟆草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('229', '海风藤', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('230', '海金沙', '2', '克', '0.69', null, '0');
INSERT INTO `medicine` VALUES ('231', '海龙', '2', '克', '3.00', null, '0');
INSERT INTO `medicine` VALUES ('232', '海螵蛸', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('233', '海桐皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('234', '海藻', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('235', '诃子肉', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('236', '合欢花', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('237', '合欢皮', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('238', '何首乌', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('239', '荷梗', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('240', '荷叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('241', '祖师麻', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('242', '黑豆', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('243', '黑豆衣', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('244', '黑胡椒', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('245', '黑蚂蚁', '2', '克', '0.69', null, '0');
INSERT INTO `medicine` VALUES ('246', '黑顺片', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('247', '黑芝麻', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('248', '红参片', '2', '克', '4.50', null, '0');
INSERT INTO `medicine` VALUES ('249', '红豆蔻', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('250', '红花', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('251', '红景天', '2', '克', '0.25', null, '0');
INSERT INTO `medicine` VALUES ('252', '红景天（片）', '2', '克', '6.60', null, '0');
INSERT INTO `medicine` VALUES ('253', '红曲', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('254', '厚朴', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('255', '厚朴花', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('267', '胡黄连', '2', '克', '1.11', null, '0');
INSERT INTO `medicine` VALUES ('268', '胡芦巴', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('269', '虎杖', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('270', '琥珀', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('271', '花椒', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('272', '花蕊石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('273', '花生仁衣', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('274', '滑石粉', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('275', '化橘红', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('276', '桦褐灵芝', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('277', '槐花', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('278', '槐角', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('279', '槐米', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('280', '黄柏', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('281', '黄瓜子', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('282', '黄芩', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('283', '黄芩片', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('284', '黄芩炭', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('285', '黄药子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('286', '会及', '2', '克', '0.44', null, '0');
INSERT INTO `medicine` VALUES ('287', '火麻仁', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('288', '鸡骨草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('289', '鸡冠花', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('290', '鸡内金', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('291', '鸡矢藤', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('292', '鸡血藤', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('293', '积雪草', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('294', '急性子', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('295', '建神曲', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('296', '姜半夏', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('297', '姜厚朴', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('298', '姜皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('299', '姜炭', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('300', '降香', '2', '克', '1.74', null, '0');
INSERT INTO `medicine` VALUES ('301', '椒目', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('302', '焦白术', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('303', '焦槟榔', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('304', '焦谷芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('305', '焦麦芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('306', '焦山楂', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('307', '焦神曲', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('308', '焦栀子', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('309', '绞股蓝', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('310', '接骨木', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('311', '芥子', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('312', '金沸草', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('313', '棕榈炭', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('314', '自然铜', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('315', '紫珠叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('316', '紫菀', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('317', '紫苏子', '2', '克', '0.09', '', '0');
INSERT INTO `medicine` VALUES ('318', '紫苏叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('319', '紫苏梗', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('320', '紫石英', '2', '克', '0.05', '', '0');
INSERT INTO `medicine` VALUES ('321', '紫梢花', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('322', '紫硇砂', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('323', '紫荆皮', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('324', '紫花地丁', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('325', '紫河车', '2', '克', '4.20', null, '0');
INSERT INTO `medicine` VALUES ('326', '紫草', '2', '克', '0.84', null, '0');
INSERT INTO `medicine` VALUES ('327', '紫贝齿', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('328', '苎麻根', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('329', '竹茹', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('330', '猪牙皂', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('331', '猪苓', '2', '克', '1.65', null, '0');
INSERT INTO `medicine` VALUES ('332', '朱远志', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('333', '朱砂粉', '2', '克', '2.70', null, '0');
INSERT INTO `medicine` VALUES ('334', '朱茯苓', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('335', '重楼', '2', '克', '4.80', null, '0');
INSERT INTO `medicine` VALUES ('336', '肿节风', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('337', '钟乳石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('338', '中灵草', '2', '克', '0.42', null, '0');
INSERT INTO `medicine` VALUES ('339', '炙黄芪', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('340', '炙甘草', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('341', '制远志', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('342', '制吴茱萸', '2', '克', '1.05', '', '0');
INSERT INTO `medicine` VALUES ('343', '制天南星', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('344', '制何首乌', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('345', '制川乌', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('346', '制草乌', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('347', '制白附子', '2', '克', '0.19', null, '0');
INSERT INTO `medicine` VALUES ('348', '制巴戟天', '2', '克', '0.35', null, '0');
INSERT INTO `medicine` VALUES ('349', '枳实', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('350', '枳壳', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('351', '枳椇子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('352', '栀子', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('353', '知母', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('354', '真蔚', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('355', '金果榄', '2', '克', '1.05', null, '0');
INSERT INTO `medicine` VALUES ('356', '珍珠母', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('357', '浙贝片', '2', '克', '0.66', null, '0');
INSERT INTO `medicine` VALUES ('358', '浙贝母', '2', '克', '0.66', null, '0');
INSERT INTO `medicine` VALUES ('359', '赭石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('360', '樟脑', '2', '克', '0.13', null, '0');
INSERT INTO `medicine` VALUES ('361', '泽泻', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('362', '泽兰', '2', '克', '0.05', '', '0');
INSERT INTO `medicine` VALUES ('363', '皂角子', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('364', '皂角刺', '2', '克', '1.08', null, '0');
INSERT INTO `medicine` VALUES ('365', '月季花', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('366', '元胡', '2', '克', '0.35', null, '0');
INSERT INTO `medicine` VALUES ('367', '预知子', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('368', '郁李仁', '2', '克', '0.25', null, '0');
INSERT INTO `medicine` VALUES ('369', '郁金', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('370', '玉竹', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('371', '玉片', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('372', '玉女', '2', '克', '0.19', '', '0');
INSERT INTO `medicine` VALUES ('373', '玉米须', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('374', '鱼腥草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('375', '鱼脑石', '2', '克', '0.54', null, '0');
INSERT INTO `medicine` VALUES ('376', '油松节', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('377', '淫羊藿', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('378', '银杏叶', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('379', '银柴胡', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('380', '茵陈', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('381', '阴起石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('382', '薏苡仁', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('383', '夜明砂', '2', '克', '0.04', '', '0');
INSERT INTO `medicine` VALUES ('384', '叶下珠', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('385', '野菊花', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('386', '阳起石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('387', '盐知母', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('388', '盐泽泻', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('389', '盐益智仁', '2', '克', '0.70', null, '0');
INSERT INTO `medicine` VALUES ('390', '盐橘核', '2', '克', '0.29', null, '0');
INSERT INTO `medicine` VALUES ('391', '盐蒺藜', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('392', '盐关黄柏', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('393', '盐杜仲', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('394', '盐车前子', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('395', '盐补骨脂', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('396', '盐巴戟天', '2', '克', '0.35', null, '0');
INSERT INTO `medicine` VALUES ('397', '亚麻籽', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('398', '鸭跖草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('399', '鸦胆子', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('400', '血余炭', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('401', '血竭', '2', '克', '15.60', null, '0');
INSERT INTO `medicine` VALUES ('402', '雪莲花', '2', '克', '75.00', null, '0');
INSERT INTO `medicine` VALUES ('403', '旋覆花', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('404', '玄参', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('405', '萱草根', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('406', '徐长卿', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('407', '金莲花', '2', '克', '1.17', null, '0');
INSERT INTO `medicine` VALUES ('408', '辛夷', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('409', '金礞石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('410', '薤白', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('411', '金钱白花蛇', '2', '克', '105.00', null, '0');
INSERT INTO `medicine` VALUES ('412', '缬草', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('413', '金钱草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('414', '小蓟炭', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('415', '小蓟', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('416', '小茴香', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('417', '象牙屑', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('418', '金荞麦', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('419', '香橼', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('420', '香薷', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('421', '金樱子肉', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('422', '香果', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('423', '锦灯笼', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('424', '仙茅', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('425', '仙鹤草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('426', '荆芥', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('427', '荆芥穗', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('428', '夏天无', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('429', '荆芥穗炭', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('430', '夏枯草', '2', '克', '0.13', null, '0');
INSERT INTO `medicine` VALUES ('431', '荆芥炭', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('432', '细辛', '2', '克', '0.66', null, '0');
INSERT INTO `medicine` VALUES ('433', '蟋蟀', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('434', '精-白参（个）', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('435', '豨签草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('436', '精-白参个（全须）', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('437', '溪黄草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('438', '精-白参片', '2', '克', '4.00', null, '0');
INSERT INTO `medicine` VALUES ('439', '西洋参（片）', '2', '克', '5.00', null, '0');
INSERT INTO `medicine` VALUES ('440', '精-百合', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('441', '西洋参（个）', '2', '克', '7.80', null, '0');
INSERT INTO `medicine` VALUES ('442', '精品-百合', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('443', '精-北芪片', '2', '克', '2.88', null, '0');
INSERT INTO `medicine` VALUES ('444', '西青果', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('445', '西红花', '2', '克', '38.00', null, '0');
INSERT INTO `medicine` VALUES ('446', '精品-北芪片', '2', '克', '2.25', null, '0');
INSERT INTO `medicine` VALUES ('447', '西河柳', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('448', '精-陈皮（二级）', '2', '克', '1.63', null, '0');
INSERT INTO `medicine` VALUES ('449', '五指毛桃', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('450', '精-陈皮特级', '2', '克', '3.75', null, '0');
INSERT INTO `medicine` VALUES ('451', '五孙', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('452', '精-虫草花', '2', '克', '1.30', null, '0');
INSERT INTO `medicine` VALUES ('453', '精-大枣', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('454', '五加皮', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('455', '精-当归（个）', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('456', '五倍子', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('457', '精-当归（头片）', '2', '克', '0.70', null, '0');
INSERT INTO `medicine` VALUES ('458', '精-党参（白条）', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('459', '蜈蚣', '2', '支', '6.30', null, '0');
INSERT INTO `medicine` VALUES ('460', '精-党参（纹党）', '2', '克', '3.22', null, '0');
INSERT INTO `medicine` VALUES ('461', '吴茱萸', '2', '克', '1.02', null, '0');
INSERT INTO `medicine` VALUES ('462', '精品-党参（纹党）', '2', '克', '2.25', null, '0');
INSERT INTO `medicine` VALUES ('463', '精-杜仲（块）', '2', '克', '0.22', null, '0');
INSERT INTO `medicine` VALUES ('464', '精-甘草（个）', '2', '克', '0.53', null, '0');
INSERT INTO `medicine` VALUES ('465', '无名异', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('466', '精-甘草片', '2', '克', '0.70', null, '0');
INSERT INTO `medicine` VALUES ('467', '无花果', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('468', '精-枸杞子', '2', '克', '0.44', null, '0');
INSERT INTO `medicine` VALUES ('469', '无柄灵芝', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('470', '精-海龙', '2', '克', '52.50', null, '0');
INSERT INTO `medicine` VALUES ('471', '乌药', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('472', '精-海马', '2', '克', '27.50', null, '0');
INSERT INTO `medicine` VALUES ('473', '乌梅炭', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('474', '精品-海马', '2', '克', '48.75', null, '0');
INSERT INTO `medicine` VALUES ('475', '乌梅', '2', '克', '0.10', '', '0');
INSERT INTO `medicine` VALUES ('476', '精-杭菊', '2', '克', '0.42', null, '0');
INSERT INTO `medicine` VALUES ('477', '委陵菜', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('478', '精-黑枸杞', '2', '克', '3.30', null, '0');
INSERT INTO `medicine` VALUES ('479', '威灵仙', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('480', '精-红参（个-15支）', '2', '克', '4.50', null, '0');
INSERT INTO `medicine` VALUES ('481', '精-红参（片）', '2', '克', '6.00', null, '0');
INSERT INTO `medicine` VALUES ('482', '望月砂', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('483', '精-红参片', '2', '克', '3.75', null, '0');
INSERT INTO `medicine` VALUES ('484', '望江南', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('485', '精-黄芪(瓜子片)', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('486', '精-黄芪（长片）', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('487', '王连', '2', '克', '0.51', null, '0');
INSERT INTO `medicine` VALUES ('488', '精-莲子肉', '2', '克', '0.33', null, '0');
INSERT INTO `medicine` VALUES ('489', '王不留行', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('490', '瓦松', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('491', '瓦楞子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('492', '土牛膝', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('493', '土槿皮', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('494', '土茯苓', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('495', '土大黄', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('496', '土贝母', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('497', '精-龙眼肉', '2', '克', '0.43', null, '0');
INSERT INTO `medicine` VALUES ('498', '土白术', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('499', '精-鹿鞭', '2', '条', '1750.00', null, '0');
INSERT INTO `medicine` VALUES ('500', '通草', '2', '克', '1.50', null, '0');
INSERT INTO `medicine` VALUES ('501', '精-鹿筋', '2', '克', '2.88', null, '0');
INSERT INTO `medicine` VALUES ('502', '葶苈子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('503', '精-鹿茸片', '2', '克', '22.30', null, '0');
INSERT INTO `medicine` VALUES ('504', '铁树叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('505', '精-鹿茸片（白粉）', '2', '克', '25.00', null, '0');
INSERT INTO `medicine` VALUES ('506', '铁皮石斛', '2', '克', '14.40', '', '0');
INSERT INTO `medicine` VALUES ('507', '精-鹿茸片（半蜡片）', '2', '克', '52.50', null, '0');
INSERT INTO `medicine` VALUES ('508', '铁落花', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('509', '精-麦冬', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('510', '天葵子', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('511', '精-玫瑰花', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('512', '天花粉', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('513', '精-胖大海', '2', '克', '0.70', null, '0');
INSERT INTO `medicine` VALUES ('514', '天冬', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('515', '精-三七', '2', '克', '2.50', null, '0');
INSERT INTO `medicine` VALUES ('516', '精-三七 （个）', '2', '克', '2.88', null, '0');
INSERT INTO `medicine` VALUES ('517', '藤梨根', '2', '克', '0.05', '', '0');
INSERT INTO `medicine` VALUES ('518', '桃花', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('519', '精品-三七（个）', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('520', '烫鱼鳔', '2', '克', '0.96', null, '0');
INSERT INTO `medicine` VALUES ('521', '精-山药', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('522', '精-山楂', '2', '克', '0.13', null, '0');
INSERT INTO `medicine` VALUES ('523', '精-石斛', '2', '克', '11.00', null, '0');
INSERT INTO `medicine` VALUES ('524', '烫水蛭', '2', '克', '7.20', null, '0');
INSERT INTO `medicine` VALUES ('525', '烫狗脊', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('526', '精品-石斛', '2', '克', '6.50', null, '0');
INSERT INTO `medicine` VALUES ('527', '精-胎菊', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('528', '烫刺猬皮', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('529', '精-天麻(个)', '2', '克', '3.38', null, '0');
INSERT INTO `medicine` VALUES ('530', '檀香', '2', '克', '5.40', null, '0');
INSERT INTO `medicine` VALUES ('531', '太子参', '2', '克', '0.78', null, '0');
INSERT INTO `medicine` VALUES ('532', '锁阳', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('533', '娑罗子', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('534', '酸枣仁', '2', '克', '0.50', null, '0');
INSERT INTO `medicine` VALUES ('535', '苏木', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('536', '松针灵芝', '2', '克', '5.00', null, '0');
INSERT INTO `medicine` VALUES ('537', '松香', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('538', '丝瓜络', '2', '克', '0.29', null, '0');
INSERT INTO `medicine` VALUES ('539', '水蛭', '2', '克', '6.30', null, '0');
INSERT INTO `medicine` VALUES ('540', '水牛角粉', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('541', '水红花子', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('542', '树舌灵芝', '2', '克', '5.00', null, '0');
INSERT INTO `medicine` VALUES ('543', '薯蓣', '2', '克', '0.22', null, '0');
INSERT INTO `medicine` VALUES ('544', '鼠妇虫', '2', '克', '1.26', null, '0');
INSERT INTO `medicine` VALUES ('545', '熟地黄炭', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('546', '熟地黄', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('547', '熟大黄', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('548', '首乌藤', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('549', '精品-天麻（个）', '2', '克', '4.38', null, '0');
INSERT INTO `medicine` VALUES ('550', '柿蒂', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('551', '使君子', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('552', '精-天麻（个）特级', '2', '克', '1.63', null, '0');
INSERT INTO `medicine` VALUES ('553', '石燕', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('554', '石韦', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('555', '精-天麻（片）一级', '2', '克', '4.20', null, '0');
INSERT INTO `medicine` VALUES ('556', '石上柏', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('557', '精-铁皮石斛', '2', '克', '30.00', null, '0');
INSERT INTO `medicine` VALUES ('558', '石楠叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('559', '精-西红花', '2', '瓶', '69.60', '', '0');
INSERT INTO `medicine` VALUES ('560', '精-西红花礼盒', '2', '盒', '1041.00', null, '0');
INSERT INTO `medicine` VALUES ('561', '精-西洋参', '2', '克', '8.50', null, '0');
INSERT INTO `medicine` VALUES ('562', '精-西洋参（个-短从）', '2', '克', '19.00', null, '0');
INSERT INTO `medicine` VALUES ('563', '精-西洋参（个粒）', '2', '克', '8.25', null, '0');
INSERT INTO `medicine` VALUES ('564', '精-西洋参（个圆粒贵细）', '2', '克', '13.25', null, '0');
INSERT INTO `medicine` VALUES ('565', '精-西洋参(斜片)', '2', '克', '8.75', null, '0');
INSERT INTO `medicine` VALUES ('566', '精-西洋参片（特级）', '2', '克', '8.75', null, '0');
INSERT INTO `medicine` VALUES ('567', '精-燕窝', '2', '克', '78.00', null, '0');
INSERT INTO `medicine` VALUES ('568', '精-制何首乌', '2', '克', '15.00', null, '0');
INSERT INTO `medicine` VALUES ('569', '精品-制何首乌', '2', '克', '10.00', null, '0');
INSERT INTO `medicine` VALUES ('570', '精-制何首乌特一级', '2', '克', '8.00', null, '0');
INSERT INTO `medicine` VALUES ('571', '精-制何首乌特二级', '2', '克', '5.00', null, '0');
INSERT INTO `medicine` VALUES ('572', '精-制何首乌一级', '2', '克', '3.00', null, '0');
INSERT INTO `medicine` VALUES ('573', '精-制何首乌二级', '2', '克', '2.00', null, '0');
INSERT INTO `medicine` VALUES ('574', '精-制何首乌三级', '2', '克', '1.00', null, '0');
INSERT INTO `medicine` VALUES ('575', '九节菖蒲', '2', '克', '0.57', null, '0');
INSERT INTO `medicine` VALUES ('576', '九香虫', '2', '克', '3.30', null, '0');
INSERT INTO `medicine` VALUES ('577', '韭菜籽', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('578', '酒白芍', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('579', '酒大黄', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('580', '酒当归', '2', '克', '0.51', null, '0');
INSERT INTO `medicine` VALUES ('581', '酒黄精', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('582', '酒黄芩', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('583', '酒女贞子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('584', '酒蕲蛇', '2', '克', '13.50', null, '0');
INSERT INTO `medicine` VALUES ('585', '酒山茱萸', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('586', '酒乌鞘蛇', '2', '克', '1.95', null, '0');
INSERT INTO `medicine` VALUES ('587', '酒萸肉', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('588', '石楠藤', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('589', '救必应', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('590', '桔梗', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('591', '橘络', '2', '克', '0.80', null, '0');
INSERT INTO `medicine` VALUES ('592', '石榴皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('593', '橘叶', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('594', '巨胜子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('595', '卷柏', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('596', '决明子', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('597', '石莲子', '2', '克', '0.06', '', '0');
INSERT INTO `medicine` VALUES ('598', '石决明', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('599', '石见穿', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('600', '石斛', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('601', '石膏', '2', '克', '0.02', null, '0');
INSERT INTO `medicine` VALUES ('602', '石菖蒲', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('603', '生蒲黄', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('604', '生地黄炭', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('605', '升麻', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('606', '枯矾', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('607', '伸筋草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('608', '苦参', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('609', '射干', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('610', '苦丁茶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('611', '苦瓜', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('612', '蛇蜕', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('613', '苦瓜干', '2', '克', '0.20', null, '0');
INSERT INTO `medicine` VALUES ('614', '蛇莓', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('615', '蛇六谷', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('616', '苦楝皮', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('617', '蛇床子', '2', '克', '0.16', null, '0');
INSERT INTO `medicine` VALUES ('618', '苦杏仁', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('619', '山茱萸', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('620', '款冬花', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('621', '山楂核', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('622', '昆布', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('623', '山楂', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('624', '腊梅花', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('625', '老鹳草', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('626', '山柰', '2', '克', '0.26', null, '0');
INSERT INTO `medicine` VALUES ('627', '老龙皮', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('628', '山连', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('629', '雷公藤', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('630', '山慈姑', '2', '克', '2.55', null, '0');
INSERT INTO `medicine` VALUES ('631', '雷丸', '2', '克', '0.41', null, '0');
INSERT INTO `medicine` VALUES ('632', '荔枝核', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('633', '砂仁', '2', '克', '2.00', null, '0');
INSERT INTO `medicine` VALUES ('634', '连翘', '2', '克', '0.29', null, '0');
INSERT INTO `medicine` VALUES ('635', '砂炒鸡内金', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('636', '沙苑子', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('637', '莲房炭', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('638', '莲须', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('639', '莲子', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('640', '莲子心', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('641', '沙棘', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('642', '两面针', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('643', '桑枝', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('644', '两头尖', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('645', '灵通', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('646', '桑叶', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('647', '灵芝', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('648', '桑螵蛸', '2', '克', '3.30', null, '0');
INSERT INTO `medicine` VALUES ('649', '桑寄生', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('650', '灵芝（无柄）', '2', '克', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('651', '桑白皮', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('652', '凌霄花', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('653', '精-羚羊角粉', '2', '克', '54.00', null, '0');
INSERT INTO `medicine` VALUES ('654', '三叶青', '2', '克', '1.26', null, '0');
INSERT INTO `medicine` VALUES ('655', '羚羊角粉', '2', '克', '16.20', null, '0');
INSERT INTO `medicine` VALUES ('656', '三七片', '2', '克', '1.80', null, '0');
INSERT INTO `medicine` VALUES ('657', '六汗', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('658', '三七花', '2', '克', '1.80', null, '0');
INSERT INTO `medicine` VALUES ('659', '六一散', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('660', '三七粉', '2', '克', '1.80', null, '0');
INSERT INTO `medicine` VALUES ('661', '六月雪', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('662', '龙齿', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('663', '龙胆', '2', '克', '0.45', null, '0');
INSERT INTO `medicine` VALUES ('664', '三七（片）', '2', '克', '2.10', null, '0');
INSERT INTO `medicine` VALUES ('665', '龙骨', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('666', '龙葵', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('667', '龙眼肉', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('668', '漏芦', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('669', '三七(30头)', '2', '克', '2.88', null, '0');
INSERT INTO `medicine` VALUES ('670', '芦根', '2', '克', '0.07', null, '0');
INSERT INTO `medicine` VALUES ('671', '三七（40头）', '2', '克', '2.40', null, '0');
INSERT INTO `medicine` VALUES ('672', '三七（60头）', '2', '克', '1.80', null, '0');
INSERT INTO `medicine` VALUES ('673', '芦荟', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('674', '三棱', '2', '克', '0.13', null, '0');
INSERT INTO `medicine` VALUES ('675', '炉甘石', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('676', '鹿角片', '2', '克', '1.47', null, '0');
INSERT INTO `medicine` VALUES ('677', '鹿角霜', '2', '克', '1.05', null, '0');
INSERT INTO `medicine` VALUES ('678', '鹿衔草', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('679', '路路通', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('680', '罗布麻叶', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('681', '三颗针', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('682', '罗汉果', '2', '个', '3.50', null, '0');
INSERT INTO `medicine` VALUES ('683', '蕤仁', '2', '克', '0.36', null, '0');
INSERT INTO `medicine` VALUES ('684', '络石藤', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('685', '如草', '2', '克', '0.60', null, '0');
INSERT INTO `medicine` VALUES ('686', '肉桂', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('687', '绿豆衣', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('688', '葎草', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('689', '肉豆蔻', '2', '克', '0.39', null, '0');
INSERT INTO `medicine` VALUES ('690', '麻黄', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('691', '肉苁蓉', '2', '克', '0.87', null, '0');
INSERT INTO `medicine` VALUES ('692', '麻黄根', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('693', '日精', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('694', '马鞭草', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('695', '忍冬藤', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('696', '马齿笕', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('697', '忍冬', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('698', '马尾连', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('699', '人参叶', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('700', '麦冬', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('701', '人参须', '2', '克', '2.55', null, '0');
INSERT INTO `medicine` VALUES ('702', '麦芽', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('703', '人参(片）', '2', '克', '3.90', null, '0');
INSERT INTO `medicine` VALUES ('704', '蔓荆子', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('705', '拳参', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('706', '猫眼草', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('707', '全蝎', '2', '克', '7.20', null, '0');
INSERT INTO `medicine` VALUES ('708', '猫抓草', '2', '克', '0.57', null, '0');
INSERT INTO `medicine` VALUES ('709', '瞿麦', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('710', '毛冬青', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('711', '秋石', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('712', '苘麻子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('713', '清半夏', '2', '克', '0.40', null, '0');
INSERT INTO `medicine` VALUES ('714', '青葙子', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('715', '青皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('716', '玫瑰花', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('717', '青礞石', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('718', '梅花', '2', '克', '1.08', null, '0');
INSERT INTO `medicine` VALUES ('719', '青龙衣', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('720', '青椒', '2', '克', '0.29', null, '0');
INSERT INTO `medicine` VALUES ('721', '虻虫', '2', '克', '1.80', null, '0');
INSERT INTO `medicine` VALUES ('722', '青蒿', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('723', '密蒙花', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('724', '青果', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('725', '青风藤', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('726', '蜜百部', '2', '克', '0.18', null, '0');
INSERT INTO `medicine` VALUES ('727', '蜜百合', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('728', '蜜瓜蒌子', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('729', '蜜槐角', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('730', '蜜款冬花', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('731', '蜜麻黄', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('732', '蜜枇杷叶', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('733', '蜜旋覆花', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('734', '蜜紫苑', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('735', '青黛', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('736', '绵萆薢', '2', '克', '0.11', null, '0');
INSERT INTO `medicine` VALUES ('737', '秦皮', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('738', '秦瓜', '2', '克', '1.05', null, '0');
INSERT INTO `medicine` VALUES ('739', '茄根', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('740', '羌活', '2', '克', '1.07', null, '0');
INSERT INTO `medicine` VALUES ('741', '茜草炭', '2', '克', '0.90', null, '0');
INSERT INTO `medicine` VALUES ('742', '绵马贯众', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('743', '茜草', '2', '克', '0.78', null, '0');
INSERT INTO `medicine` VALUES ('744', '绵茵陈', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('745', '芡实', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('746', '明党参', '2', '克', '0.21', null, '0');
INSERT INTO `medicine` VALUES ('747', '茉莉花', '2', '克', '0.27', null, '0');
INSERT INTO `medicine` VALUES ('748', '墨旱莲', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('749', '前胡', '2', '克', '0.30', null, '0');
INSERT INTO `medicine` VALUES ('750', '母丁香', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('751', '千年健', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('752', '牡丹皮', '2', '克', '0.15', null, '0');
INSERT INTO `medicine` VALUES ('753', '牡蛎', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('754', '木鳖子', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('755', '木瓜', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('756', '木蝴蝶', '2', '克', '0.17', null, '0');
INSERT INTO `medicine` VALUES ('757', '木香', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('758', '木贼', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('759', '南瓜子', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('760', '南鹤虱', '2', '克', '0.03', null, '0');
INSERT INTO `medicine` VALUES ('761', '南沙参', '2', '克', '0.24', null, '0');
INSERT INTO `medicine` VALUES ('762', '南山楂', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('763', '柠檬片', '2', '克', '0.29', null, '0');
INSERT INTO `medicine` VALUES ('764', '牛蒡根', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('765', '牛大力', '2', '克', '0.14', null, '0');
INSERT INTO `medicine` VALUES ('766', '牛黄', '2', '克', '585.00', null, '0');
INSERT INTO `medicine` VALUES ('767', '牛膝', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('768', '女贞子', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('769', '藕节', '2', '克', '0.23', null, '0');
INSERT INTO `medicine` VALUES ('770', '藕节炭', '2', '克', '0.09', null, '0');
INSERT INTO `medicine` VALUES ('771', '胖大海', '2', '克', '0.25', null, '0');
INSERT INTO `medicine` VALUES ('772', '炮姜', '2', '克', '0.12', null, '0');
INSERT INTO `medicine` VALUES ('773', '佩兰', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('774', '枇杷叶', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('775', '片姜黄', '2', '克', '0.10', null, '0');
INSERT INTO `medicine` VALUES ('776', '瓶-灵芝片', '2', '瓶', '48.00', null, '0');
INSERT INTO `medicine` VALUES ('777', '蒲公英', '2', '克', '0.05', null, '0');
INSERT INTO `medicine` VALUES ('778', '蒲黄炭', '2', '克', '0.48', null, '0');
INSERT INTO `medicine` VALUES ('779', '岂', '2', '克', '0.08', null, '0');
INSERT INTO `medicine` VALUES ('780', '千斤拔', '2', '克', '0.06', null, '0');
INSERT INTO `medicine` VALUES ('781', '千里光', '2', '克', '0.04', null, '0');
INSERT INTO `medicine` VALUES ('782', '左归丸', '1', '盒', '68.00', '54g', '0');
INSERT INTO `medicine` VALUES ('783', '紫金散', '1', '盒', '134.00', '3g/10瓶', '0');
INSERT INTO `medicine` VALUES ('784', '滋补肝肾丸', '1', '盒', '23.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('785', '壮腰健肾丸（OTC)', '1', '盒', '15.00', '5.6g*10丸', '0');
INSERT INTO `medicine` VALUES ('786', '壮骨药酒', '1', '瓶', '600.00', '600ml', '0');
INSERT INTO `medicine` VALUES ('787', '治痢片', '1', '盒', '15.80', '40片/盒', '0');
INSERT INTO `medicine` VALUES ('788', '治咳枇杷露（OTC乙类）', '1', '瓶', '18.00', '120ml*1瓶', '0');
INSERT INTO `medicine` VALUES ('789', '至圣保元丸', '1', '盒', '120.00', '1g*10丸', '0');
INSERT INTO `medicine` VALUES ('790', '止痒酊', '1', '瓶', '26.80', '20ml/瓶', '0');
INSERT INTO `medicine` VALUES ('791', '止咳片（OTC甲类）', '1', '瓶', '14.50', '60片*1瓶', '0');
INSERT INTO `medicine` VALUES ('792', '止咳橘红丸', '1', '盒', '16.70', '6g*10丸/盒', '0');
INSERT INTO `medicine` VALUES ('793', '栀子金花丸', '1', '盒', '20.80', '10袋/盒', '0');
INSERT INTO `medicine` VALUES ('794', '知柏地黄丸（OTC乙类）', '1', '盒', '15.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('795', '知柏地黄丸', '1', '盒', '16.80', '360粒', '0');
INSERT INTO `medicine` VALUES ('796', '珍珠末', '1', '盒', '98.00', '30瓶*1盒', '0');
INSERT INTO `medicine` VALUES ('797', '再造丸', '1', '盒', '160.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('798', '越鞠保和丸', '1', '盒', '13.20', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('799', '愈风宁心片(薄膜衣片)', '1', '盒', '18.00', '0.28g*100粒', '0');
INSERT INTO `medicine` VALUES ('800', '愈风宁心滴丸', '1', '瓶', '38.60', '90丸*1瓶', '0');
INSERT INTO `medicine` VALUES ('801', '右归丸', '1', '盒', '16.60', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('802', '银翘解毒片（OTC乙类）', '1', '盒', '10.70', '0.55g*40片', '0');
INSERT INTO `medicine` VALUES ('803', '益肾强身丸（六角盒）', '1', '盒', '1192.00', '30粒*1盒', '0');
INSERT INTO `medicine` VALUES ('804', '益肾强身丸', '1', '盒', '395.00', '3G*10丸', '0');
INSERT INTO `medicine` VALUES ('805', '益母丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('806', '益母草颗粒', '1', '盒', '20.00', '15g*8袋', '0');
INSERT INTO `medicine` VALUES ('807', '益坤丸', '1', '盒', '29.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('808', '养阴清肺丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('809', '养血荣筋丸', '1', '盒', '12.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('810', '养血安神丸（OTC乙类）', '1', '瓶', '7.50', '36g', '0');
INSERT INTO `medicine` VALUES ('811', '养肺丸', '1', '盒', '20.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('812', '洋参保肺丸', '1', '盒', '8.70', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('813', '醒脑牛黄清心片（薄膜衣片）', '1', '盒', '12.50', '10片/板*3板', '0');
INSERT INTO `medicine` VALUES ('814', '泻清丸', '1', '盒', '47.50', '7g*10袋', '0');
INSERT INTO `medicine` VALUES ('815', '阿胶（铁盒）', '1', '盒', '518.00', '31.25*8块', '0');
INSERT INTO `medicine` VALUES ('816', '阿胶（铁盒）大', '1', '盒', '1180.00', '62.5g*4块', '0');
INSERT INTO `medicine` VALUES ('817', '阿胶(铁盒)（OTC乙类）', '1', '盒', '1180.00', '31.25*8块', '0');
INSERT INTO `medicine` VALUES ('818', '阿胶（铁盒）16块装', '1', '盒', '2350.00', '31.25g*16块', '0');
INSERT INTO `medicine` VALUES ('819', '泻痢固肠丸', '1', '盒', '19.80', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('820', '阿胶（纸盒）', '1', '盒', '1298.00', '31.25g*16块', '0');
INSERT INTO `medicine` VALUES ('821', '安宫降压丸', '1', '盒', '79.00', '32g', '0');
INSERT INTO `medicine` VALUES ('822', '泻肝安神丸', '1', '盒', '49.80', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('823', '安宫降压丸小', '1', '盒', '28.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('824', '小金丸', '1', '盒', '169.00', '3g*10瓶', '0');
INSERT INTO `medicine` VALUES ('825', '安坤赞育丸', '1', '盒', '26.30', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('826', '安神补脑液', '1', '盒', '25.80', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('827', '安嗽化痰丸', '1', '盒', '38.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('828', '小儿至宝丸', '1', '盒', '20.00', '1.5G*10丸', '0');
INSERT INTO `medicine` VALUES ('829', '八珍益母丸', '1', '盒', '19.80', '60g*1瓶', '0');
INSERT INTO `medicine` VALUES ('830', '小儿止泻安颗粒', '1', '盒', '42.00', '12g*10袋/盒', '0');
INSERT INTO `medicine` VALUES ('831', '拔云退翳丸', '1', '盒', '19.60', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('832', '小儿咽扁颗粒（OTC甲类）', '1', '盒', '22.80', '8g*10袋', '0');
INSERT INTO `medicine` VALUES ('833', '白咳静糖浆', '1', '盒', '43.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('834', '小儿香橘丸', '1', '盒', '22.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('835', '柏子养心丸', '1', '盒', '16.00', '60g', '0');
INSERT INTO `medicine` VALUES ('836', '小儿太极丸', '1', '盒', '16.00', '1.0g*10丸', '0');
INSERT INTO `medicine` VALUES ('837', '板蓝根糖浆（OTC乙类）', '1', '瓶', '12.70', '60ml', '0');
INSERT INTO `medicine` VALUES ('838', '宝咳宁颗粒', '1', '盒', '19.80', '5g*10袋', '0');
INSERT INTO `medicine` VALUES ('839', '小儿清热宁颗粒', '1', '盒', '16.00', '4g*10袋', '0');
INSERT INTO `medicine` VALUES ('840', '保和丸（OTC甲类）', '1', '盒', '12.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('841', '小儿清感灵片', '1', '瓶', '18.00', '0.23g*60片', '0');
INSERT INTO `medicine` VALUES ('842', '保童化痰丸', '1', '盒', '25.00', '3g*10粒3g*10粒', '0');
INSERT INTO `medicine` VALUES ('843', '小儿清肺止咳片', '1', '盒', '18.00', '0.2g*60片', '0');
INSERT INTO `medicine` VALUES ('844', '补肾强身片（OTC乙类）', '1', '盒', '17.80', '0.28g*60片', '0');
INSERT INTO `medicine` VALUES ('845', '小儿牛黄散', '1', '盒', '48.00', '0.9g*10袋', '0');
INSERT INTO `medicine` VALUES ('846', '补益蒺藜丸', '1', '盒', '22.90', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('847', '小儿健脾丸', '1', '盒', '22.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('848', '补中益气丸（OTC乙类）', '1', '盒', '18.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('849', '参桂理中丸', '1', '盒', '15.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('850', '小儿化食丸', '1', '盒', '20.00', '1.5g*10丸', '0');
INSERT INTO `medicine` VALUES ('851', '参桂鹿茸丸', '1', '盒', '39.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('852', '小儿感冒口服液', '1', '支', '28.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('853', '参茸丸', '1', '盒', '290.00', '10g*10丸', '0');
INSERT INTO `medicine` VALUES ('854', '小儿感冒颗粒', '1', '袋', '28.00', '12g*10袋', '0');
INSERT INTO `medicine` VALUES ('855', '小儿鼻炎片', '1', '瓶', '15.00', '0.3g*30片', '0');
INSERT INTO `medicine` VALUES ('856', '参茸丸-大', '1', '盒', '1280.00', '10g*30丸/1盒', '0');
INSERT INTO `medicine` VALUES ('857', '参茸卫生丸', '1', '盒', '59.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('858', '小儿百寿丸', '1', '盒', '48.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('859', '参茸卫生丸-大', '1', '盒', '49.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('860', '消栓再造丸', '1', '盒', '58.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('861', '参芍片（OTC甲类）', '1', '盒', '40.80', '0.3g*48片', '0');
INSERT INTO `medicine` VALUES ('862', '消栓通络片', '1', '盒', '33.30', '60s', '0');
INSERT INTO `medicine` VALUES ('863', '参苏宣肺丸', '1', '盒', '30.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('864', '藏青果喉片', '1', '盒', '72.00', '12片*2板*6袋/盒', '0');
INSERT INTO `medicine` VALUES ('865', '香苏正胃丸', '1', '盒', '29.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('866', '沉香舒气丸', '1', '盒', '9.50', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('867', '除痰止嗽丸', '1', '盒', '22.00', '7.5g*10袋', '0');
INSERT INTO `medicine` VALUES ('868', '香砂六君丸', '1', '盒', '18.20', '6g*12袋（基）丸剂', '0');
INSERT INTO `medicine` VALUES ('869', '除痰止嗽丸（大蜜丸）', '1', '盒', '14.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('870', '香连化滞丸', '1', '盒', '12.50', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('871', '川贝枇杷露（川贝止咳露）（OTC乙类）', '1', '瓶', '15.60', '150ml', '0');
INSERT INTO `medicine` VALUES ('872', '川贝枇杷糖浆（OTC甲类）', '1', '瓶', '25.00', '150ml', '0');
INSERT INTO `medicine` VALUES ('873', '大败毒胶囊', '1', '盒', '42.00', '0.5g*20粒', '0');
INSERT INTO `medicine` VALUES ('874', '西黄丸', '1', '瓶', '648.00', '3g*10瓶', '0');
INSERT INTO `medicine` VALUES ('875', '大黄蛰虫丸', '1', '瓶', '30.80', '60g*1瓶', '0');
INSERT INTO `medicine` VALUES ('876', '大山楂丸', '1', '盒', '14.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('877', '导赤丸', '1', '盒', '25.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('878', '地榆槐角丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('879', '跌打丸（OTC甲类）', '1', '盒', '8.30', '3g*6丸', '0');
INSERT INTO `medicine` VALUES ('880', '定搐化风丸', '1', '盒', '21.00', '1.5G*10丸', '0');
INSERT INTO `medicine` VALUES ('881', '定喘止嗽丸', '1', '盒', '59.00', '7.5g*10袋', '0');
INSERT INTO `medicine` VALUES ('882', '儿感清口服液', '1', '盒', '38.50', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('883', '儿童咳液（OTC甲类）', '1', '盒', '28.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('884', '儿童清肺丸', '1', '盒', '24.70', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('885', '儿童清热口服液', '1', '盒', '29.60', '10ml*6支', '0');
INSERT INTO `medicine` VALUES ('886', '耳聋左慈丸', '1', '盒', '25.00', '60g*1瓶', '0');
INSERT INTO `medicine` VALUES ('887', '二妙丸', '1', '盒', '18.20', '6G*12袋', '0');
INSERT INTO `medicine` VALUES ('888', '二母宁嗽片', '1', '盒', '24.00', '24片', '0');
INSERT INTO `medicine` VALUES ('889', '二母宁嗽丸', '1', '盒', '25.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('890', '二十七味定坤丸', '1', '盒', '72.00', '12g*6丸', '0');
INSERT INTO `medicine` VALUES ('891', '防风通圣丸（OTC甲类）', '1', '盒', '14.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('892', '防衰益寿丸', '1', '盒', '595.00', '3g*10丸*1盒', '0');
INSERT INTO `medicine` VALUES ('893', '防衰益寿丸-大', '1', '盒', '359.00', '180粒*1盒', '0');
INSERT INTO `medicine` VALUES ('894', '防衰益寿丸（六角盒）', '1', '盒', '1788.00', '3g*30粒*1盒', '0');
INSERT INTO `medicine` VALUES ('895', '肥儿丸', '1', '盒', '19.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('896', '分清五淋丸', '1', '盒', '49.80', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('897', '妇宝金丸', '1', '瓶', '12.80', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('898', '妇宝金丸（水蜜丸）', '1', '瓶', '18.50', '240粒', '0');
INSERT INTO `medicine` VALUES ('899', '妇康宁片（OTC甲类）', '1', '瓶', '26.00', '60片', '0');
INSERT INTO `medicine` VALUES ('900', '妇科回生丸', '1', '盒 ', '75.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('901', '妇女痛经丸（OTC乙类）', '1', '盒', '46.00', '1.8g*10袋', '0');
INSERT INTO `medicine` VALUES ('903', '附子理中丸', '1', '盒', '15.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('904', '附子理中丸（OTC甲类）', '1', '盒', '8.00', '30g/瓶/盒', '0');
INSERT INTO `medicine` VALUES ('905', '复方丹参片', '1', '盒', '9.90', '60粒/瓶', '0');
INSERT INTO `medicine` VALUES ('906', '复方益母草膏（OTCjl)', '1', '瓶', '23.00', '100g', '0');
INSERT INTO `medicine` VALUES ('907', '感冒清热颗粒（无蔗糖）（OTC甲类）', '1', '盒', '16.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('908', '感冒清热颗粒有糖', '1', '盒', '11.80', '12g*10袋', '0');
INSERT INTO `medicine` VALUES ('909', '感冒软胶囊', '1', '盒', '28.00', '0.45g*10*2板（基）胶囊', '0');
INSERT INTO `medicine` VALUES ('910', '感冒水（OTC)', '1', '盒', '14.80', '5ml*6瓶', '0');
INSERT INTO `medicine` VALUES ('911', '感冒退烧片（OTC)', '1', '瓶', '23.00', '0.25g*60片', '0');
INSERT INTO `medicine` VALUES ('912', '高血压速降丸', '1', '盒', '91.20', '3g*20粒*12袋', '0');
INSERT INTO `medicine` VALUES ('913', '骨刺丸', '1', '盒', '23.80', '6g/10袋', '0');
INSERT INTO `medicine` VALUES ('914', '骨刺丸（水蜜丸）', '1', '盒', '19.80', '9g/10丸', '0');
INSERT INTO `medicine` VALUES ('915', '骨刺消痛液', '1', '瓶', '32.00', '300ml*1瓶', '0');
INSERT INTO `medicine` VALUES ('916', '冠心安口服液', '1', '盒', '72.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('917', '冠心苏合丸', '1', '盒', '13.00', '30丸/盒', '0');
INSERT INTO `medicine` VALUES ('918', '归芍地黄丸', '1', '盒', '14.50', '9g*10丸/盒', '0');
INSERT INTO `medicine` VALUES ('919', '桂附地黄丸（OTC甲类）', '1', '瓶', '14.50', '360丸*1瓶', '0');
INSERT INTO `medicine` VALUES ('920', '桂附地黄丸水蜜丸(OTC甲类)', '1', '盒', '17.60', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('921', '国公酒简装', '1', '瓶', '21.00', '328ml', '0');
INSERT INTO `medicine` VALUES ('922', '河车大造丸', '1', '盒', '38.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('923', '荷叶丸', '1', '盒', '16.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('924', '喉症丸', '1', '瓶', '12.00', '100粒*1瓶', '0');
INSERT INTO `medicine` VALUES ('925', '化瘀丸', '1', '盒', '85.20', '5g*6袋', '0');
INSERT INTO `medicine` VALUES ('926', '换骨丸', '1', '盒', '25.00', '9g/10丸', '0');
INSERT INTO `medicine` VALUES ('927', '黄连上清片（薄膜衣片）（OTC甲类）', '1', '盒', '10.80', '12片*3板', '0');
INSERT INTO `medicine` VALUES ('928', '黄连羊肝丸', '1', '盒', '19.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('929', '回生第一散', '1', '瓶', '79.00', '1g*10瓶', '0');
INSERT INTO `medicine` VALUES ('930', '活络丸', '1', '盒', '90.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('931', '活胃胶囊', '1', '盒', '22.00', '0.25g*20粒', '0');
INSERT INTO `medicine` VALUES ('932', '活胃散', '1', '盒', '16.80', '75g*1瓶', '0');
INSERT INTO `medicine` VALUES ('933', '活血通脉片（薄膜衣片）', '1', '盒', '40.20', '48片', '0');
INSERT INTO `medicine` VALUES ('934', '活血消炎丸', '1', '盒', '22.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('935', '藿香祛暑水（OTC甲类）', '1', '瓶', '19.00', '15ml*10瓶', '0');
INSERT INTO `medicine` VALUES ('936', '藿香正气片（OTC甲类）', '1', '瓶', '18.00', '0.3g*60片', '0');
INSERT INTO `medicine` VALUES ('937', '藿香正气水（OTC)', '1', '盒', '19.80', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('938', '加味保和丸', '1', '盒', '13.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('939', '加味藿香正气丸（OTC乙类）', '1', '盒', '13.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('940', '加味香连丸', '1', '盒', '24.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('941', '加味逍遥丸（OTC）', '1', '盒', '11.90', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('942', '健儿消食口服液', '1', '盒', '36.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('943', '健脾消食丸', '1', '盒', '21.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('944', '健身全鹿丸', '1', '盒', '288.00', '9g*20丸', '0');
INSERT INTO `medicine` VALUES ('945', '健胃片（OTC甲类）', '1', '瓶', '20.00', '60片', '0');
INSERT INTO `medicine` VALUES ('946', '解热感冒片（OTC甲类）', '1', '瓶', '13.80', '0.25g*60片', '0');
INSERT INTO `medicine` VALUES ('947', '金黄抱龙丸', '1', '盒', '48.00', '0.75g*10丸', '0');
INSERT INTO `medicine` VALUES ('948', '金鸡虎补丸', '1', '盒', '36.00', '240粒/盒', '0');
INSERT INTO `medicine` VALUES ('949', '金匮肾气丸', '1', '盒', '10.90', '6g*10丸（基）丸剂', '0');
INSERT INTO `medicine` VALUES ('950', '金匮肾气丸（水蜜丸）', '1', '瓶', '13.50', '360粒', '0');
INSERT INTO `medicine` VALUES ('951', '京制咳嗽痰喘丸', '1', '瓶', '12.00', '180粒*1瓶', '0');
INSERT INTO `medicine` VALUES ('952', '京制牛黄解毒片（OTC甲类）', '1', '盒', '27.50', '8片*10瓶', '0');
INSERT INTO `medicine` VALUES ('953', '京制牛黄解毒丸（OTC甲类）', '1', '盒', '13.80', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('954', '久强脑力清', '1', '盒', '6.00', '10.5*100粒', '0');
INSERT INTO `medicine` VALUES ('955', '久芝清心丸', '1', '盒', '12.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('956', '救急散', '1', '盒', '61.00', '1.5g10袋', '0');
INSERT INTO `medicine` VALUES ('957', '局方至宝丸', '1', '盒', '550.00', '3g*1丸', '0');
INSERT INTO `medicine` VALUES ('958', '菊明降压丸', '1', '盒', '14.60', '6g*9袋', '0');
INSERT INTO `medicine` VALUES ('959', '橘红片', '1', '60片', '24.50', null, '0');
INSERT INTO `medicine` VALUES ('960', '开胃理脾丸（OTC甲类）', '1', '盒', '18.50', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('961', '开胸顺气丸', '1', '盒', '10.90', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('962', '抗饥消渴片', '1', '瓶', '15.00', '80片/瓶', '0');
INSERT INTO `medicine` VALUES ('963', '孔圣枕中丸', '1', '盒', '98.00', '9g*10丸 ', '0');
INSERT INTO `medicine` VALUES ('964', '宽胸舒气化滞丸', '1', '盒', '24.30', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('965', '坤宝丸', '1', '盒', '22.00', '50粒*10袋', '0');
INSERT INTO `medicine` VALUES ('966', '坤顺丸', '1', '瓶', '27.50', '30g/瓶', '0');
INSERT INTO `medicine` VALUES ('967', '阑尾消炎丸', '1', '盒', '23.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('968', '利肺片', '1', '瓶', '85.00', '0.25g*40片', '0');
INSERT INTO `medicine` VALUES ('969', '利咽灵片（薄膜衣片）', '1', '瓶', '29.80', '0.32g*30片', '0');
INSERT INTO `medicine` VALUES ('970', '连翘败毒丸（OTC甲类）', '1', '盒', '15.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('971', '良附丸', '1', '盒', '12.80', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('972', '羚翘解毒片（OTC甲类）', '1', '瓶', '20.00', '0.55g*40片', '0');
INSERT INTO `medicine` VALUES ('973', '羚羊感冒片（OTC甲类）', '1', '盒', '10.90', '10片/板*3板', '0');
INSERT INTO `medicine` VALUES ('974', '羚羊清肺颗粒', '1', '盒', '38.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('975', '羚羊清肺丸', '1', '盒', '32.00', '6g*20丸', '0');
INSERT INTO `medicine` VALUES ('976', '六合定中丸', '1', '盒', '16.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('977', '六味地黄软胶囊', '1', '盒', '48.00', '0.38g*10粒*6板/盒', '0');
INSERT INTO `medicine` VALUES ('978', '六味地黄丸(水蜜丸OTC乙类)', '1', '瓶', '13.90', '360*1瓶', '0');
INSERT INTO `medicine` VALUES ('979', '六味地黄丸浓缩丸(OTC乙类)', '1', '盒', '14.90', '120丸*1瓶', '0');
INSERT INTO `medicine` VALUES ('980', '龙胆泻肝丸', '1', '盒', '15.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('981', '鹿角胶(OTC）', '1', '盒', '1380.00', '6g*18块', '0');
INSERT INTO `medicine` VALUES ('982', '鹭鸶咯丸', '1', '盒', '15.00', '1.5g*10丸', '0');
INSERT INTO `medicine` VALUES ('983', '麻仁润肠丸', '1', '盒', '16.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('984', '麦味地黄口服液（OTC甲类）', '1', '盒', '20.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('985', '麦味地黄丸（水蜜丸）（OTC甲类）', '1', '盒', '15.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('986', '西黄清醒丸', '1', '盒', '11.50', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('987', '武力拔寒散', '1', '盒', '21.00', '17g*10袋', '0');
INSERT INTO `medicine` VALUES ('988', '五子衍宗丸', '1', '瓶', '15.50', '60g*100粒', '0');
INSERT INTO `medicine` VALUES ('989', '五粒回春丸', '1', '盒', '27.80', '5丸*4瓶', '0');
INSERT INTO `medicine` VALUES ('990', '温肾全鹿丸', '1', '盒', '298.00', '9g*20丸', '0');
INSERT INTO `medicine` VALUES ('991', '卫生宝丸', '1', '盒', '23.20', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('992', '同仁乌鸡白凤丸（水蜜丸）', '1', '盒', '62.00', '6g(50丸)*6瓶/盒', '0');
INSERT INTO `medicine` VALUES ('993', '同仁乌鸡白凤丸（大蜜丸）', '1', '盒', '69.00', '9g*6丸', '0');
INSERT INTO `medicine` VALUES ('994', '同仁乌鸡白凤丸（大蜜丸)', '1', '盒', '12.50', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('995', '同仁牛黄清心丸（6丸）', '1', '盒', '38.50', '3g*6丸', '0');
INSERT INTO `medicine` VALUES ('996', '同仁大活络丸（10丸）', '1', '盒', '160.00', '3.6g*10丸', '0');
INSERT INTO `medicine` VALUES ('997', '通宣理肺丸', '1', '盒', '10.50', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('998', '通宣理肺片（OTC甲类）', '1', '瓶', '14.10', '40片', '0');
INSERT INTO `medicine` VALUES ('999', '通脉口服液', '1', '盒', '125.40', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('1000', '通便灵胶囊', '1', '盒', '17.00', '0.25g*10粒*2板/盒', '0');
INSERT INTO `medicine` VALUES ('1002', '木香顺气丸', '1', '盒', '15.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('1003', '清胃黄连丸', '1', '盒', '20.50', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('1004', '七宝美髯丸', '1', '盒', '32.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1005', '强阳保肾丸(袋装)', '1', '盒', '68.00', '6g*6袋', '0');
INSERT INTO `medicine` VALUES ('1006', '调经丸', '1', '盒', '29.00', '30g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1007', '生脉饮(人参方)(OTC乙类)', '1', '盒', '19.00', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('1008', '天麻胶囊（OTC甲类）', '1', '盒', '24.00', '0.25G*50粒', '0');
INSERT INTO `medicine` VALUES ('1009', '牛黄降压丸', '1', '盒', '10.90', '1.6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1010', '舒肝止痛丸（OTC甲类）', '1', '盒', '16.00', '4.5g*10袋', '0');
INSERT INTO `medicine` VALUES ('1011', '清热养阴丸', '1', '盒', '25.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1012', '石斛明目丸', '1', '盒', '19.00', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1013', '全鹿丸', '1', '盒', '269.00', '6G*20袋', '0');
INSERT INTO `medicine` VALUES ('1014', '益肾强身丸（小）', '1', '盒', '239.00', '180粒*1盒', '0');
INSERT INTO `medicine` VALUES ('1015', '杞菊地黄丸', '1', '盒', '15.00', '9g*10丸/盒', '0');
INSERT INTO `medicine` VALUES ('1016', '舒肝和胃丸', '1', '盒', '9.80', '180粒（基）丸剂', '0');
INSERT INTO `medicine` VALUES ('1017', '田七补丸', '1', '盒', '38.00', '360丸', '0');
INSERT INTO `medicine` VALUES ('1018', '同仁乌鸡白凤丸（水蜜丸）36g', '1', '瓶', '8.90', '36g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1019', '人参保肺丸', '1', '盒', '10.00', '6g*10丸/盒', '0');
INSERT INTO `medicine` VALUES ('1020', '清音丸', '1', '盒', '20.00', '2g*10袋/盒', '0');
INSERT INTO `medicine` VALUES ('1021', '同仁牛黄清心丸（10丸）', '1', '盒', '160.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('1022', '调经促孕丸', '1', '盒', '22.00', '5g*10袋', '0');
INSERT INTO `medicine` VALUES ('1023', '人参健脾丸', '1', '盒', '12.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1024', '轻身消胖丸', '1', '瓶', '168.00', '240粒/瓶', '0');
INSERT INTO `medicine` VALUES ('1025', '同仁大活络丸（6丸）', '1', '盒', '41.80', '3.6g*6丸', '0');
INSERT INTO `medicine` VALUES ('1026', '枇杷叶膏', '1', '瓶', '26.80', '150g/瓶', '0');
INSERT INTO `medicine` VALUES ('1027', '调中四消丸', '1', '盒', '15.60', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1028', '天王补心丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1029', '杞菊地黄丸(浓缩)', '1', '盒', '17.70', '120粒/盒', '0');
INSERT INTO `medicine` VALUES ('1030', '天麻丸', '1', '盒', '20.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1031', '舒肝片', '1', '盒', '29.30', '40片/盒', '0');
INSERT INTO `medicine` VALUES ('1032', '明目蒺藜丸（袋装）', '1', '盒', '35.00', '9g*10袋', '0');
INSERT INTO `medicine` VALUES ('1033', '木瓜丸', '1', '瓶', '19.80', '240丸', '0');
INSERT INTO `medicine` VALUES ('1034', '内补养荣丸', '1', '盒', '22.30', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1035', '宁坤养血丸', '1', '盒', '26.30', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1036', '牛黄解毒片', '1', '盒', '6.00', '10片/板*3板', '0');
INSERT INTO `medicine` VALUES ('1037', '牛黄解毒片-大', '1', '盒', '24.00', '0.27g*10片*12板', '0');
INSERT INTO `medicine` VALUES ('1038', '牛黄清宫丸', '1', '盒', '15.80', '2.2g*10丸', '0');
INSERT INTO `medicine` VALUES ('1039', '牛黄清胃丸', '1', '盒', '12.50', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1040', '牛黄清胃丸-30g', '1', '瓶', '9.80', '30g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1041', '牛黄上清丸', '1', '盒', '16.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1042', '牛黄镇惊丸', '1', '盒', '125.00', '1.5g*10丸', '0');
INSERT INTO `medicine` VALUES ('1043', '女金丸', '1', '盒', '22.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1044', '平肝舒络丸', '1', '瓶', '25.00', '35g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1045', '平肝舒络丸-小', '1', '盒', '18.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1046', '杞菊地黄丸-6g', '1', '盒', '15.00', '6g*10袋/盒', '0');
INSERT INTO `medicine` VALUES ('1047', '启脾丸', '1', '盒', '20.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('1048', '强肾镇痛丸', '1', '盒', '23.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1049', '清肺抑火丸', '1', '盒', '14.80', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('1050', '清热化毒丸', '1', '盒', '20.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('1051', '清瘟解毒丸', '1', '盒', '12.50', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1052', '清心滚痰丸', '1', '盒', '33.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('1053', '清心明目上清丸', '1', '盒', '13.20', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('1054', '清眩片（OTC甲类）', '1', '瓶', '16.00', '0.55g*40片', '0');
INSERT INTO `medicine` VALUES ('1055', '左炔诺孕酮片（毓婷）', '3', '盒', '10.60', '0.75mg*2片', '0');
INSERT INTO `medicine` VALUES ('1056', '左炔诺孕酮片', '3', '盒', '16.00', '1片', '0');
INSERT INTO `medicine` VALUES ('1057', '左炔诺孕酮肠溶胶囊', '3', '盒', '22.00', '1粒/盒', '0');
INSERT INTO `medicine` VALUES ('1058', '正清风痛宁片', '3', '盒', '7.40', '20mg*24片', '0');
INSERT INTO `medicine` VALUES ('1059', '珍珠明目滴眼液（太湖美）', '3', '盒', '2.40', '8ml', '0');
INSERT INTO `medicine` VALUES ('1060', '珍珠明目滴眼液', '3', '盒', '2.00', '8ml', '0');
INSERT INTO `medicine` VALUES ('1061', '藻酸双酯钠片', '3', '盒', '10.50', '50mg*100片', '1');
INSERT INTO `medicine` VALUES ('1062', '云南白药气雾剂', '1', '盒', '32.60', '50g+60g', '2');
INSERT INTO `medicine` VALUES ('1063', '云南白药膏', '1', '盒', '46.90', '10片', '0');
INSERT INTO `medicine` VALUES ('1064', '吲达帕胺片', '3', '盒', '16.40', '2.5mg*10片*3板', '0');
INSERT INTO `medicine` VALUES ('1065', '银杏叶片', '1', '盒', '11.00', '24片/盒', '0');
INSERT INTO `medicine` VALUES ('1066', '乙酰螺旋霉素片（鲁抗）', '3', '盒', '3.00', '0.1g*24片', '0');
INSERT INTO `medicine` VALUES ('1067', '乙酰螺旋霉素片', '3', '盒', '2.00', '0.1g*12片*2板', '0');
INSERT INTO `medicine` VALUES ('1068', '叶酸片（斯利安）', '3', '盒', '24.80', '31片', '0');
INSERT INTO `medicine` VALUES ('1069', '叶酸片', '3', '瓶', '12.50', '5mg*100片', '0');
INSERT INTO `medicine` VALUES ('1070', '氧化锌软膏', '3', '盒', '4.70', '20克', '0');
INSERT INTO `medicine` VALUES ('1071', '氧氟沙星滴耳液', '3', '盒', '1.90', '5ml：15mg', '0');
INSERT INTO `medicine` VALUES ('1072', '养心氏片', '1', '盒', '34.00', '0.3g*90片', '0');
INSERT INTO `medicine` VALUES ('1073', '盐酸左氧氟沙星片', '3', '盒', '1.00', '0.1g*6片*1板', '0');
INSERT INTO `medicine` VALUES ('1074', '盐酸左氧氟沙星胶囊（左克）', '3', '盒', '9.50', '0.1g*12粒/盒', '0');
INSERT INTO `medicine` VALUES ('1075', '盐酸左氧氟沙星胶囊', '3', '盒', '14.00', '20粒', '0');
INSERT INTO `medicine` VALUES ('1076', '盐酸左氧氟沙星滴眼液（博士伦）', '3', '盒', '17.30', '5ml：15mg', '0');
INSERT INTO `medicine` VALUES ('1077', '盐酸左氧氟沙星滴眼液', '3', '盒', '11.80', '5ml：15mg', '0');
INSERT INTO `medicine` VALUES ('1078', '盐酸左西替利嗪口服溶液', '3', '盒', '24.00', '0.05%10ml*6支', '0');
INSERT INTO `medicine` VALUES ('1079', '盐酸左西替利嗪分散片（芬必得）', '3', '盒', '26.00', '5mg*12s', '0');
INSERT INTO `medicine` VALUES ('1080', '盐酸小檗碱片', '3', '瓶', '9.00', '0.1g*100s', '0');
INSERT INTO `medicine` VALUES ('1081', '盐酸西替利嗪片(仙利特)', '3', '盒', '8.00', '10mg*7片*2板', '0');
INSERT INTO `medicine` VALUES ('1082', '盐酸特比萘芬乳膏（兰美抒）', '3', '盒', '26.00', '10g', '0');
INSERT INTO `medicine` VALUES ('1083', '盐酸特比奈芬喷雾剂', '3', '盒', '10.00', '15毫升', '0');
INSERT INTO `medicine` VALUES ('1084', '盐酸坦洛新缓释胶囊', '3', '盒', '20.50', '0.2mg*7粒', '0');
INSERT INTO `medicine` VALUES ('1085', '盐酸曲美他嗪片（15片）', '3', '盒', '15.50', '20mg*15片', '0');
INSERT INTO `medicine` VALUES ('1086', '盐酸曲美他嗪片（24片）', '3', '盒', '14.00', '12片*2板', '0');
INSERT INTO `medicine` VALUES ('1087', '盐酸普罗帕酮片', '3', '瓶', '5.50', '50mg*50片', '0');
INSERT INTO `medicine` VALUES ('1088', '盐酸雷尼替丁胶囊', '3', '瓶', '4.50', '0.15mg*30s', '0');
INSERT INTO `medicine` VALUES ('1089', '盐酸环丙沙星片（10片）', '3', '盒', '1.00', '0.25g*10片*1板', '0');
INSERT INTO `medicine` VALUES ('1090', '盐酸环丙沙星片（9片）', '3', '盒', '1.50', '250mg*9片', '0');
INSERT INTO `medicine` VALUES ('1091', '盐酸氟桂利嗪胶囊', '3', '盒', '26.40', '5mg*20粒', '0');
INSERT INTO `medicine` VALUES ('1092', '盐酸二甲双胍片', '3', '瓶', '4.90', '0.25*100片', '0');
INSERT INTO `medicine` VALUES ('1093', '盐酸二甲双胍缓释片', '3', '盒', '19.80', '0.5g*10片*3板', '0');
INSERT INTO `medicine` VALUES ('1094', '盐酸苯环壬酯片', '3', '盒', '20.60', '2mg*6片', '0');
INSERT INTO `medicine` VALUES ('1095', '盐酸氨溴索口服溶液', '3', '盒', '15.20', '100ml：0.6g', '0');
INSERT INTO `medicine` VALUES ('1096', '盐酸氨基葡萄糖胶囊', '3', '盒', '20.50', '0.24g*42粒', '0');
INSERT INTO `medicine` VALUES ('1097', '咽炎片（慢严舒柠）', '1', '盒', '15.50', '12片*2板', '0');
INSERT INTO `medicine` VALUES ('1098', '醒脾养儿颗粒', '1', '盒', '22.50', '2g*12袋', '0');
INSERT INTO `medicine` VALUES ('1099', '辛方鼻炎胶囊', '1', '盒', '4.80', '0.25*10s*3板', '0');
INSERT INTO `medicine` VALUES ('1100', '辛伐他汀片', '3', '盒', '6.00', '10mg*10片', '0');
INSERT INTO `medicine` VALUES ('1101', '心脑清软胶囊', '1', '盒', '22.00', '100粒', '0');
INSERT INTO `medicine` VALUES ('1102', '心宝丸', '1', '盒', '12.70', '60mg*20丸', '0');
INSERT INTO `medicine` VALUES ('1103', '缬沙坦胶囊', '3', '盒', '40.20', '80mg*7粒', '0');
INSERT INTO `medicine` VALUES ('1104', '小儿咳喘灵颗粒', '1', '盒', '8.50', '2g*15袋', '0');
INSERT INTO `medicine` VALUES ('1105', '小儿氨酚烷胺颗粒（优卡丹）', '3', '盒', '11.50', '6g*16袋', '0');
INSERT INTO `medicine` VALUES ('1106', '小儿氨酚黄那敏颗粒（小快克）', '3', '盒', '9.00', '4g*10袋', '0');
INSERT INTO `medicine` VALUES ('1107', '小儿氨酚黄那敏颗粒（甜橙）', '3', '盒', '8.70', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1108', '小儿氨酚黄那敏颗粒（恩威）', '3', '盒', '12.00', '18袋/盒', '0');
INSERT INTO `medicine` VALUES ('1109', '小儿氨酚黄那敏颗粒（万通）', '3', '盒', '9.50', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1110', '小儿氨酚黄那敏颗粒', '3', '盒', '6.50', '6g*9袋', '0');
INSERT INTO `medicine` VALUES ('1111', '秋梨润肺膏（OTC甲类）', '1', '瓶', '34.00', '100g', '0');
INSERT INTO `medicine` VALUES ('1112', '硝酸咪康唑阴道软胶囊', '3', '盒', '25.80', '0.4g*3粒', '0');
INSERT INTO `medicine` VALUES ('1113', '硝酸咪康唑拴', '3', '盒', '18.40', '0.2g*7枚', '0');
INSERT INTO `medicine` VALUES ('1114', '硝酸咪康唑乳膏（西安杨森）', '3', '盒', '15.20', '20g', '0');
INSERT INTO `medicine` VALUES ('1115', '硝酸咪康唑乳膏', '3', '盒', '6.50', '20克', '0');
INSERT INTO `medicine` VALUES ('1116', '硝酸甘油片', '3', '瓶', '4.80', '0.5mg*100s', '0');
INSERT INTO `medicine` VALUES ('1117', '硝呋太尔制霉素阴道软胶囊', '3', '盒', '34.80', '6粒', '0');
INSERT INTO `medicine` VALUES ('1118', '硝苯地平片', '3', '瓶', '2.80', '100片', '0');
INSERT INTO `medicine` VALUES ('1119', '硝苯地平控释片', '3', '盒', '29.50', '12片', '0');
INSERT INTO `medicine` VALUES ('1120', '硝苯地平控释片（拜耳）', '3', '盒', '29.50', '30mg*7片', '0');
INSERT INTO `medicine` VALUES ('1121', '硝苯地平缓释片（II)', '3', '瓶', '19.00', '20mg*30片', '0');
INSERT INTO `medicine` VALUES ('1122', '硝苯地平缓释片（德药）', '3', '盒', '17.50', '10mg*50片', '0');
INSERT INTO `medicine` VALUES ('1123', '香菊胶囊', '1', '盒', '18.00', '0.3g*24粒', '0');
INSERT INTO `medicine` VALUES ('1124', '西地碘含片（华素片）', '3', '盒', '13.00', '1.5mg*15s*3板', '0');
INSERT INTO `medicine` VALUES ('1125', '胃炎宁颗粒', '1', '盒', '12.00', '15g*6袋', '0');
INSERT INTO `medicine` VALUES ('1126', '人参固本丸', '1', '盒', '62.40', '6g*10袋', '0');
INSERT INTO `medicine` VALUES ('1127', '人参归脾丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1128', '人参归脾丸-小', '1', '盒', '12.00', '30g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1129', '人参养荣丸', '1', '盒', '24.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1130', '人参再造丸', '1', '盒', '88.00', '3g*6丸', '0');
INSERT INTO `medicine` VALUES ('1131', '仁丹（OTC乙类）', '1', '袋', '3.00', '30粒*100袋', '0');
INSERT INTO `medicine` VALUES ('1132', '肉蔻四神丸', '1', '盒', '28.00', '6g*12袋', '0');
INSERT INTO `medicine` VALUES ('1133', '润肺止嗽丸', '1', '盒', '52.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1134', '塞隆风湿胶囊', '1', '盒', '187.00', '10粒/板*3盒', '0');
INSERT INTO `medicine` VALUES ('1135', '赛金化毒散', '1', '盒', '15.00', '0.5g*10袋', '0');
INSERT INTO `medicine` VALUES ('1136', '三七片（OTC甲类）', '1', '瓶', '39.00', '60片', '0');
INSERT INTO `medicine` VALUES ('1137', '散寒活络丸', '1', '盒', '17.00', '3g*10丸', '0');
INSERT INTO `medicine` VALUES ('1138', '桑菊感冒片（OTC乙类）', '1', '瓶', '12.50', '0.6g*40片', '0');
INSERT INTO `medicine` VALUES ('1139', '桑椹膏（OTC甲类）', '1', '瓶', '12.00', '50g', '0');
INSERT INTO `medicine` VALUES ('1140', '生脉饮（党参方）（OTC乙类）', '1', '盒', '16.60', '10ml*10支', '0');
INSERT INTO `medicine` VALUES ('1141', '十全大补丸(水蜜丸)(OTC乙类）', '1', '瓶', '14.00', '360粒', '0');
INSERT INTO `medicine` VALUES ('1142', '十香返生丸', '1', '盒', '263.40', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1143', '石斛夜光丸', '1', '盒', '10.00', '29.2*100粒', '0');
INSERT INTO `medicine` VALUES ('1144', '石斛夜光丸(大蜜丸)', '1', '盒', '12.50', '5.5g*10丸', '0');
INSERT INTO `medicine` VALUES ('1145', '舒肝丸-小', '1', '盒', '16.00', '32g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1146', '舒肝丸-大', '1', '盒', '20.00', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1147', '双黄消炎片', '1', '瓶', '15.20', '0.4g*40片', '0');
INSERT INTO `medicine` VALUES ('1148', '四神丸', '1', '瓶', '9.80', '27g*1瓶', '0');
INSERT INTO `medicine` VALUES ('1149', '嗣育保胎丸', '1', '盒', '58.80', '6g*10丸', '0');
INSERT INTO `medicine` VALUES ('1150', '搜风顺气丸', '1', '盒', '29.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1151', '锁精丸', '1', '盒', '280.00', '4g*30袋', '0');
INSERT INTO `medicine` VALUES ('1152', '锁阳固精丸', '1', '盒', '25.00', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1153', '太和妙灵丸', '1', '盒', '28.00', '3G*10丸', '0');
INSERT INTO `medicine` VALUES ('1154', '同仁乌鸡白凤丸（水蜜丸）9g', '1', '盒', '12.50', '9g*10丸', '0');
INSERT INTO `medicine` VALUES ('1155', '同仁乌鸡白凤丸（大蜜丸）6丸', '1', '盒', '69.00', '9g*6丸', '0');

-- ----------------------------
-- Table structure for medicine_template
-- ----------------------------
DROP TABLE IF EXISTS `medicine_template`;
CREATE TABLE `medicine_template` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `medicine_arr` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine_template
-- ----------------------------

-- ----------------------------
-- Table structure for medicine_type
-- ----------------------------
DROP TABLE IF EXISTS `medicine_type`;
CREATE TABLE `medicine_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `sort` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of medicine_type
-- ----------------------------
INSERT INTO `medicine_type` VALUES ('1', '中成药', '0');
INSERT INTO `medicine_type` VALUES ('2', '中药饮片', '0');
INSERT INTO `medicine_type` VALUES ('3', '西药', '0');

-- ----------------------------
-- Table structure for patient
-- ----------------------------
DROP TABLE IF EXISTS `patient`;
CREATE TABLE `patient` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `sex` bit(1) DEFAULT NULL,
  `avatar` text,
  `birthday` varchar(255) DEFAULT NULL,
  `createtime` datetime DEFAULT NULL,
  `detail1` varchar(255) DEFAULT NULL,
  `detail2` varchar(255) DEFAULT NULL,
  `detail3` varchar(255) DEFAULT NULL,
  `login_ip` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of patient
-- ----------------------------
INSERT INTO `patient` VALUES ('2', null, '15502614820', '$2a$10$5ceQxLmh9bB1I5nJKXT34OZCEAiegfPmXAZUpcoYjWgg/ycXdcMOi', null, null, null, '2017-12-25 01:33:59', null, null, null, null);
INSERT INTO `patient` VALUES ('3', null, '15512312312', '$2a$10$yvzjLmhrs0gu34865uUZo.U/SGeyXsnKACWsN/X22Unv3d3tRKW/G', null, null, null, '2017-12-25 01:35:45', null, null, null, null);
INSERT INTO `patient` VALUES ('4', null, '15545645645', '$2a$10$4hkEaqmdewpVvIJCm.8dqeLsHVq6LbRBJbqkumKBQuMLQ9BTPnWRu', null, null, null, '2017-12-25 01:45:09', null, null, null, null);
INSERT INTO `patient` VALUES ('5', null, '15511221122', '$2a$10$99ocezu4f3tBsgvCybYEvO2Uczc/sRXF8lSNEw8QrEKg6kwe2LxNS', null, null, null, '2017-12-25 01:58:08', null, null, null, null);
INSERT INTO `patient` VALUES ('6', null, '15512341234', '$2a$10$pAWp2tJHNcOlgdXu4kggyOCJmkr0j6B0eTUmaUiZw5Tivsjj3S2sK', null, null, null, '2017-12-25 02:56:25', null, null, null, '');

-- ----------------------------
-- Table structure for settings
-- ----------------------------
DROP TABLE IF EXISTS `settings`;
CREATE TABLE `settings` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `tel` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of settings
-- ----------------------------
INSERT INTO `settings` VALUES ('3', '40012312312');

-- ----------------------------
-- Table structure for sickness
-- ----------------------------
DROP TABLE IF EXISTS `sickness`;
CREATE TABLE `sickness` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `department_id` varchar(255) DEFAULT '0',
  `name` varchar(255) NOT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `sort` int(11) unsigned zerofill DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sickness
-- ----------------------------
INSERT INTO `sickness` VALUES ('1', '1', '脾胃虚弱', 'http://118.31.12.161:3001/upFile/1512548842504.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('3', '4', '湿疹瘙痒', 'http://118.31.12.161:3001/upFile/1512548930759.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('4', '67', '月经不调', 'http://118.31.12.161:3001/upFile/1512549343732.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('5', '67', '痛经', 'http://118.31.12.161:3001/upFile/1512549363247.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('6', '67', '妇科炎症', 'http://118.31.12.161:3001/upFile/1512549378439.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('7', '1', '胃痛胁痛', 'http://118.31.12.161:3001/upFile/1512549415254.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('8', '1', '便秘腹泻', 'http://118.31.12.161:3001/upFile/1512549441754.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('9', '65', '贫血', 'http://118.31.12.161:3001/upFile/1512549468317.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('10', '4', '痘痘色斑', 'http://118.31.12.161:3001/upFile/1512549479784.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('11', '4', '荨麻疹', 'http://118.31.12.161:3001/upFile/1512549522616.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('12', '70', '甲状腺病', 'http://118.31.12.161:3001/upFile/1512549604300.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('13', '70', '痛风', 'http://118.31.12.161:3001/upFile/1512549574081.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('14', '70', '风湿病', 'http://118.31.12.161:3001/upFile/1512549619643.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('15', '65', '高血压', 'http://118.31.12.161:3001/upFile/1512549641369.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('16', '65', '糖尿病', 'http://118.31.12.161:3001/upFile/1512550371880.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('17', '65', '高血脂', 'http://118.31.12.161:3001/upFile/1512549687736.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('18', '71', '鼻炎咽炎', 'http://118.31.12.161:3001/upFile/1512549716278.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('19', '71', '眼部不适', 'http://118.31.12.161:3001/upFile/1512549745177.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('20', '71', '耳部疾病', 'http://118.31.12.161:3001/upFile/1512549757835.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('21', '68', '小儿疾病', 'http://118.31.12.161:3001/upFile/1512549783470.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('22', '72', '房事不利', 'http://118.31.12.161:3001/upFile/1512549816361.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('23', '72', '不孕不育', 'http://118.31.12.161:3001/upFile/1512549841724.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('24', '72', '尿路感染', 'http://118.31.12.161:3001/upFile/1512550088498.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('25', '72', '前列腺炎', 'http://118.31.12.161:3001/upFile/1512695070443.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('26', '70', '咳喘感冒', 'http://118.31.12.161:3001/upFile/1512695038744.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('27', '66', '颈腰痛', 'http://118.31.12.161:3001/upFile/1512695006625.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('28', '73', '失眠头痛', 'http://118.31.12.161:3001/upFile/1512694983045.jpg', '00000000000');
INSERT INTO `sickness` VALUES ('29', '69', '口腔溃疡', 'http://118.31.12.161:3001/upFile/1512695372907.jpg', '00000000000');

-- ----------------------------
-- Table structure for sort
-- ----------------------------
DROP TABLE IF EXISTS `sort`;
CREATE TABLE `sort` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `sort_name` char(50) NOT NULL DEFAULT '' COMMENT '分类名称',
  `parent_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '分类父ID',
  `sort_type` char(10) NOT NULL DEFAULT '' COMMENT '分类类别（可定制成新闻、文章、教程等）',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章分类表';

-- ----------------------------
-- Records of sort
-- ----------------------------

-- ----------------------------
-- Table structure for upload
-- ----------------------------
DROP TABLE IF EXISTS `upload`;
CREATE TABLE `upload` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_id` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '用户ID',
  `file_name` char(100) NOT NULL DEFAULT '' COMMENT '文件名称',
  `file_path` char(200) NOT NULL DEFAULT '' COMMENT '文件路径',
  `mime_type` char(50) NOT NULL DEFAULT '' COMMENT '文件类型',
  `file_size` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小KB',
  `is_delete` tinyint(1) NOT NULL DEFAULT '0' COMMENT '是否删除',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '上传时间',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=93 DEFAULT CHARSET=utf8 COMMENT='上传列表';

-- ----------------------------
-- Records of upload
-- ----------------------------
INSERT INTO `upload` VALUES ('1', '1', 'IMG_5299.JPG', 'dist\\upFile\\1511828452430.JPG', 'image/jpeg', '1982935', '0', '2017-11-28 08:20:52');
INSERT INTO `upload` VALUES ('3', '1', 'logo.PNG', 'dist\\upFile\\1511914993490.PNG', 'image/png', '3908', '0', '2017-11-29 08:23:13');
INSERT INTO `upload` VALUES ('4', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374346212.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 15:59:06');
INSERT INTO `upload` VALUES ('5', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374360037.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 15:59:20');
INSERT INTO `upload` VALUES ('6', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374385909.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 15:59:46');
INSERT INTO `upload` VALUES ('7', '6', '20160612100826137.jpg', 'dist/upFile/1512374419702.jpg', 'image/jpeg', '159875', '0', '2017-12-04 16:00:19');
INSERT INTO `upload` VALUES ('8', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374588127.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 16:03:08');
INSERT INTO `upload` VALUES ('9', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374612156.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 16:03:32');
INSERT INTO `upload` VALUES ('10', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374674466.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 16:04:35');
INSERT INTO `upload` VALUES ('11', '6', '脾胃虚弱.jpg', 'dist/upFile/1512374698577.jpg', 'image/jpeg', '1183755', '0', '2017-12-04 16:04:59');
INSERT INTO `upload` VALUES ('12', '6', '20160612100826137.jpg', 'dist/upFile/1512375060973.jpg', 'image/jpeg', '159875', '0', '2017-12-04 16:11:01');
INSERT INTO `upload` VALUES ('13', '6', '20160612100826137.jpg', 'dist/upFile/1512375077182.jpg', 'image/jpeg', '159875', '0', '2017-12-04 16:11:17');
INSERT INTO `upload` VALUES ('14', '1', 'timg.jpg', 'dist/upFile/1512375081384.jpg', 'image/jpeg', '20546', '0', '2017-12-04 16:11:21');
INSERT INTO `upload` VALUES ('15', '1', 'timg.jpg', 'dist/upFile/1512375295514.jpg', 'image/jpeg', '20546', '0', '2017-12-04 16:14:55');
INSERT INTO `upload` VALUES ('16', '1', 'timg.jpg', 'dist/upFile/1512375301244.jpg', 'image/jpeg', '20546', '0', '2017-12-04 16:15:01');
INSERT INTO `upload` VALUES ('17', '6', '脾胃虚弱.jpg', 'dist/upFile/1512462687309.jpg', 'image/jpeg', '903888', '0', '2017-12-05 16:31:28');
INSERT INTO `upload` VALUES ('22', '1', 'timg.gif', 'dist/upFile/1512525299940.gif', 'image/gif', '4695', '0', '2017-12-06 09:54:59');
INSERT INTO `upload` VALUES ('32', '1', 'logo.PNG', 'dist/upFile/1512526659344.PNG', 'image/png', '3908', '0', '2017-12-06 10:17:39');
INSERT INTO `upload` VALUES ('33', '1', 'logo.PNG', 'dist/upFile/1512526790635.PNG', 'image/png', '3908', '0', '2017-12-06 10:19:50');
INSERT INTO `upload` VALUES ('34', '1', 'logo.PNG', 'dist/upFile/1512526996277.PNG', 'image/png', '3908', '0', '2017-12-06 10:23:16');
INSERT INTO `upload` VALUES ('35', '1', 'timg.jpg', 'dist/upFile/1512527157490.jpg', 'image/jpeg', '20546', '0', '2017-12-06 10:25:57');
INSERT INTO `upload` VALUES ('36', '6', '脾胃虚弱.jpg', 'dist/upFile/1512548842504.jpg', 'image/jpeg', '903888', '0', '2017-12-06 16:27:23');
INSERT INTO `upload` VALUES ('37', '6', '湿疹.jpg', 'dist/upFile/1512548921171.jpg', 'image/jpeg', '929100', '0', '2017-12-06 16:28:42');
INSERT INTO `upload` VALUES ('38', '6', '湿疹.jpg', 'dist/upFile/1512548930759.jpg', 'image/jpeg', '929100', '0', '2017-12-06 16:28:51');
INSERT INTO `upload` VALUES ('39', '6', '月经不调.jpg', 'dist/upFile/1512549343732.jpg', 'image/jpeg', '721395', '0', '2017-12-06 16:35:44');
INSERT INTO `upload` VALUES ('40', '6', '痛经.jpg', 'dist/upFile/1512549363247.jpg', 'image/jpeg', '827981', '0', '2017-12-06 16:36:04');
INSERT INTO `upload` VALUES ('41', '6', '妇科炎症.jpg', 'dist/upFile/1512549378439.jpg', 'image/jpeg', '693758', '0', '2017-12-06 16:36:19');
INSERT INTO `upload` VALUES ('42', '6', '胃痛.jpg', 'dist/upFile/1512549404698.jpg', 'image/jpeg', '815835', '0', '2017-12-06 16:36:45');
INSERT INTO `upload` VALUES ('43', '6', '胃痛.jpg', 'dist/upFile/1512549415254.jpg', 'image/jpeg', '815835', '0', '2017-12-06 16:36:56');
INSERT INTO `upload` VALUES ('44', '6', '腹泻.jpg', 'dist/upFile/1512549441754.jpg', 'image/jpeg', '834648', '0', '2017-12-06 16:37:22');
INSERT INTO `upload` VALUES ('45', '6', '贫血.jpg', 'dist/upFile/1512549468317.jpg', 'image/jpeg', '761367', '0', '2017-12-06 16:37:49');
INSERT INTO `upload` VALUES ('46', '6', '痘痘.jpg', 'dist/upFile/1512549479784.jpg', 'image/jpeg', '906179', '0', '2017-12-06 16:38:00');
INSERT INTO `upload` VALUES ('47', '6', '荨麻疹.jpg', 'dist/upFile/1512549510782.jpg', 'image/jpeg', '881017', '0', '2017-12-06 16:38:31');
INSERT INTO `upload` VALUES ('48', '6', '荨麻疹.jpg', 'dist/upFile/1512549517040.jpg', 'image/jpeg', '881017', '0', '2017-12-06 16:38:38');
INSERT INTO `upload` VALUES ('49', '6', '荨麻疹.jpg', 'dist/upFile/1512549522616.jpg', 'image/jpeg', '881017', '0', '2017-12-06 16:38:43');
INSERT INTO `upload` VALUES ('50', '6', '痛风.jpg', 'dist/upFile/1512549574081.jpg', 'image/jpeg', '762174', '0', '2017-12-06 16:39:34');
INSERT INTO `upload` VALUES ('51', '6', '甲状腺.jpg', 'dist/upFile/1512549604300.jpg', 'image/jpeg', '851760', '0', '2017-12-06 16:40:05');
INSERT INTO `upload` VALUES ('52', '6', '风湿病.jpg', 'dist/upFile/1512549619643.jpg', 'image/jpeg', '857919', '0', '2017-12-06 16:40:20');
INSERT INTO `upload` VALUES ('53', '6', '高血压.jpg', 'dist/upFile/1512549635565.jpg', 'image/jpeg', '856142', '0', '2017-12-06 16:40:36');
INSERT INTO `upload` VALUES ('54', '6', '高血压.jpg', 'dist/upFile/1512549641369.jpg', 'image/jpeg', '856142', '0', '2017-12-06 16:40:42');
INSERT INTO `upload` VALUES ('55', '6', '高血脂.jpg', 'dist/upFile/1512549687736.jpg', 'image/jpeg', '872036', '0', '2017-12-06 16:41:28');
INSERT INTO `upload` VALUES ('56', '6', '鼻炎.jpg', 'dist/upFile/1512549716278.jpg', 'image/jpeg', '774515', '0', '2017-12-06 16:41:57');
INSERT INTO `upload` VALUES ('57', '6', '眼部不适.jpg', 'dist/upFile/1512549745177.jpg', 'image/jpeg', '959778', '0', '2017-12-06 16:42:26');
INSERT INTO `upload` VALUES ('58', '6', '耳部疾病.jpg', 'dist/upFile/1512549757835.jpg', 'image/jpeg', '879154', '0', '2017-12-06 16:42:38');
INSERT INTO `upload` VALUES ('59', '6', '小儿疾病.jpg', 'dist/upFile/1512549773033.jpg', 'image/jpeg', '921963', '0', '2017-12-06 16:42:53');
INSERT INTO `upload` VALUES ('60', '6', '小儿疾病.jpg', 'dist/upFile/1512549783470.jpg', 'image/jpeg', '921963', '0', '2017-12-06 16:43:04');
INSERT INTO `upload` VALUES ('61', '6', '不孕不育.jpg', 'dist/upFile/1512549801051.jpg', 'image/jpeg', '829060', '0', '2017-12-06 16:43:21');
INSERT INTO `upload` VALUES ('62', '6', '房事不利.jpg', 'dist/upFile/1512549806239.jpg', 'image/jpeg', '699456', '0', '2017-12-06 16:43:26');
INSERT INTO `upload` VALUES ('63', '6', '房事不利.jpg', 'dist/upFile/1512549816361.jpg', 'image/jpeg', '699456', '0', '2017-12-06 16:43:37');
INSERT INTO `upload` VALUES ('64', '6', '不孕不育.jpg', 'dist/upFile/1512549841724.jpg', 'image/jpeg', '829060', '0', '2017-12-06 16:44:02');
INSERT INTO `upload` VALUES ('65', '6', '尿路感染.jpg', 'dist/upFile/1512550088498.jpg', 'image/jpeg', '948163', '0', '2017-12-06 16:48:09');
INSERT INTO `upload` VALUES ('66', '6', '前列腺炎.jpg', 'dist/upFile/1512550116192.jpg', 'image/jpeg', '972377', '0', '2017-12-06 16:48:37');
INSERT INTO `upload` VALUES ('67', '6', '前列腺炎.jpg', 'dist/upFile/1512550156908.jpg', 'image/jpeg', '972377', '0', '2017-12-06 16:49:17');
INSERT INTO `upload` VALUES ('68', '6', '糖尿病.jpg', 'dist/upFile/1512550371880.jpg', 'image/jpeg', '1084053', '0', '2017-12-06 16:52:52');
INSERT INTO `upload` VALUES ('69', '6', '前列腺炎.jpg', 'dist/upFile/1512550416307.jpg', 'image/jpeg', '972377', '0', '2017-12-06 16:53:37');
INSERT INTO `upload` VALUES ('70', '6', '失眠.jpg', 'dist/upFile/1512694983045.jpg', 'image/jpeg', '929133', '0', '2017-12-08 09:03:03');
INSERT INTO `upload` VALUES ('71', '6', '颈腰痛.jpg', 'dist/upFile/1512695006625.jpg', 'image/jpeg', '892258', '0', '2017-12-08 09:03:27');
INSERT INTO `upload` VALUES ('72', '6', '感冒.jpg', 'dist/upFile/1512695038744.jpg', 'image/jpeg', '734432', '0', '2017-12-08 09:03:59');
INSERT INTO `upload` VALUES ('73', '6', '前列腺炎.jpg', 'dist/upFile/1512695057440.jpg', 'image/jpeg', '972377', '0', '2017-12-08 09:04:18');
INSERT INTO `upload` VALUES ('74', '6', '前列腺炎.jpg', 'dist/upFile/1512695070443.jpg', 'image/jpeg', '972377', '0', '2017-12-08 09:04:31');
INSERT INTO `upload` VALUES ('75', '6', '口腔溃疡.jpg', 'dist/upFile/1512695372907.jpg', 'image/jpeg', '843430', '0', '2017-12-08 09:09:33');
INSERT INTO `upload` VALUES ('76', '1', 'logo.PNG', 'dist/upFile/1513042691932.PNG', 'image/png', '3908', '0', '2017-12-12 09:38:11');
INSERT INTO `upload` VALUES ('77', '1', 'logo.PNG', 'dist/upFile/1513042715719.PNG', 'image/png', '3908', '0', '2017-12-12 09:38:35');
INSERT INTO `upload` VALUES ('78', '1', 'logo.PNG', 'dist/upFile/1513042721119.PNG', 'image/png', '3908', '0', '2017-12-12 09:38:41');
INSERT INTO `upload` VALUES ('79', '1', '合同式样.jpg', 'dist/upFile/1513402251157.jpg', 'image/jpeg', '1105168', '0', '2017-12-16 13:30:51');
INSERT INTO `upload` VALUES ('80', '1', '合同式样.jpg', 'dist/upFile/1513402326472.jpg', 'image/jpeg', '1105168', '0', '2017-12-16 13:32:07');
INSERT INTO `upload` VALUES ('81', '1', '合同式样.jpg', 'dist/upFile/1513402336463.jpg', 'image/jpeg', '1105168', '0', '2017-12-16 13:32:17');
INSERT INTO `upload` VALUES ('82', '1', '合同式样.jpg', 'dist/upFile/1513402426678.jpg', 'image/jpeg', '1105168', '0', '2017-12-16 13:33:47');
INSERT INTO `upload` VALUES ('83', '1', '1.jpeg', 'dist/upFile/1513402454374.jpeg', 'image/jpeg', '315181', '0', '2017-12-16 13:34:14');
INSERT INTO `upload` VALUES ('84', '5', '微信图片_20171216164801.png', 'dist/upFile/1513414166352.png', 'image/png', '260541', '0', '2017-12-16 16:49:26');
INSERT INTO `upload` VALUES ('85', '5', '微信图片_20171216164723.png', 'dist/upFile/1513414220268.png', 'image/png', '207837', '0', '2017-12-16 16:50:20');
INSERT INTO `upload` VALUES ('86', '5', '微信图片_20171216164752.png', 'dist/upFile/1513414234386.png', 'image/png', '252669', '0', '2017-12-16 16:50:34');
INSERT INTO `upload` VALUES ('87', '5', '微信图片_20171216164821.png', 'dist/upFile/1513414245923.png', 'image/png', '282994', '0', '2017-12-16 16:50:46');
INSERT INTO `upload` VALUES ('88', '5', '微信图片_20171216164756.png', 'dist/upFile/1513414256431.png', 'image/png', '284068', '0', '2017-12-16 16:50:56');
INSERT INTO `upload` VALUES ('89', '5', '微信图片_20171216164815.png', 'dist/upFile/1513414270772.png', 'image/png', '276320', '0', '2017-12-16 16:51:11');
INSERT INTO `upload` VALUES ('90', '5', '微信图片_20171216164810.png', 'dist/upFile/1513414285841.png', 'image/png', '284915', '0', '2017-12-16 16:51:26');
INSERT INTO `upload` VALUES ('91', '5', '微信图片_20171216164810.png', 'dist/upFile/1513414293622.png', 'image/png', '284915', '0', '2017-12-16 16:51:33');
INSERT INTO `upload` VALUES ('92', '5', '微信图片_20171216164807.png', 'dist/upFile/1513414308407.png', 'image/png', '253591', '0', '2017-12-16 16:51:48');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `user_name` char(50) NOT NULL DEFAULT '' COMMENT '用户帐号',
  `pass_word` char(128) NOT NULL DEFAULT '' COMMENT '用户密码',
  `user_type` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '用户类型 0:未审核用户;1:超级管理员;2:普通管理员;3:VIP用户;4:普通用户',
  `user_email` char(128) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '注册时间',
  `login_ip` char(15) NOT NULL DEFAULT '' COMMENT '登录IP',
  `update_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后登录时间',
  `user_pic` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户头像',
  `user_extend` text CHARACTER SET utf8 COLLATE utf8_unicode_ci COMMENT '扩展信息',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='用户据库表';

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'admin', '$2a$10$VEhpnvxChI87l43LPJaWW.wqTMcQUfCnPiKYB3AIvoGPj0.PibQCu', '1', 'lonk1989@126.com', '2017-11-23 02:18:28', '127.0.0.1', '2018-01-01 16:57:48', '', null);
INSERT INTO `user` VALUES ('2', 'zcl', '$2a$10$j1vHOFLM5xi3F6ZnxrBNueb1ZQw8KhPhYAm3X5xWGJEtwzDY1CkYy', '2', 'zcl@163.com', '2017-11-29 10:33:24', '182.43.213.129', '2017-12-04 10:32:08', '', null);
INSERT INTO `user` VALUES ('3', 'ddk', '$2a$10$VVqrZEAa4fuFlk.iAlfcvuZz.UbpaN80jO8bBFeVpBVkgQcPJMwea', '2', 'ddk@163.com', '2017-11-29 10:33:45', '124.205.82.130', '2017-11-29 10:33:54', '', null);
INSERT INTO `user` VALUES ('4', 'dongyan', '$2a$10$2V/Viy74zzuSK/IUA0tm1eC7AuvlPETRLM7rv1jw1kekWd4DFjX0O', '4', 'dongyan@126.com', '2017-12-04 10:30:31', '112.242.14.169', '2017-12-04 11:56:48', '', null);
INSERT INTO `user` VALUES ('5', 'lihailing', '$2a$10$2Yj9z8o4b/pdjSBVuOBWlu3FXvZWltz..HKlumDAoGrh9vjsA5h8u', '4', 'lihailing@126.com', '2017-12-04 10:31:30', '182.32.187.63', '2017-12-13 07:55:03', '', null);
INSERT INTO `user` VALUES ('6', 'houweiting', '$2a$10$97mtZbCi//BOLltQJB3JheXPuqwO1h2XawqHqnNyrwihwELwUuN1a', '4', 'houweiting@126.com', '2017-12-04 10:32:05', '112.242.14.169', '2017-12-04 10:35:38', '', null);
