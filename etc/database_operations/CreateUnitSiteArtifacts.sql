DROP TABLE IF EXISTS `UNIT_SITE_BANNER`;
CREATE TABLE `UNIT_SITE_BANNER` (
  `ID_INTERNAL` INTEGER  NOT NULL AUTO_INCREMENT,
  `KEY_ROOT_DOMAIN_OBJECT` INTEGER NOT NULL DEFAULT 1,
  `KEY_SITE` INTEGER NOT NULL,
  `KEY_MAIN_IMAGE` INTEGER  NOT NULL DEFAULT 0,
  `KEY_BACKGROUND_IMAGE` INTEGER,
  `COLOR` VARCHAR(50),
  PRIMARY KEY(`ID_INTERNAL`)
) type=InnoDB;

ALTER TABLE `FILE` 
	ADD COLUMN `KEY_MAIN_BANNER` INTEGER,
	ADD COLUMN `KEY_BACKGROUND_BANNER` INTEGER;

ALTER TABLE `SITE` 
	ADD COLUMN `KEY_LOGO` INTEGER,
	ADD COLUMN `PERSONALIZED_LOGO` BOOLEAN DEFAULT 0,
	ADD COLUMN `SHOW_BANNER` BOOLEAN DEFAULT 1,
	ADD COLUMN `SHOW_INTRODUCTION` BOOLEAN DEFAULT 1,
	ADD COLUMN `SHOW_ANNOUNCEMENTS` BOOLEAN DEFAULT 1,
	ADD COLUMN `SHOW_EVENTS` BOOLEAN DEFAULT 1,
	ADD COLUMN `LAYOUT` VARCHAR(50) DEFAULT "BANNER_INTRO";

UPDATE `SITE`
	SET `PERSONALIZED_LOGO` = NULL,
	`SHOW_BANNER` = NULL,
	`SHOW_INTRODUCTION` = NULL,
	`SHOW_ANNOUNCEMENTS` = NULL,
	`SHOW_EVENTS` = NULL,
	`LAYOUT` = NULL
WHERE `OJB_CONCRETE_CLASS` LIKE "%DegreeSite"
   OR `OJB_CONCRETE_CLASS` LIKE "%ExecutionCourseSite"
   OR `OJB_CONCRETE_CLASS` LIKE "%Homepage"
   OR `OJB_CONCRETE_CLASS` LIKE "%SiteTemplate";

ALTER TABLE `FILE` 
	ADD COLUMN `KEY_UNIT_SITE` INTEGER;

DROP TABLE IF EXISTS `UNIT_SITE_LINK`;
CREATE TABLE `UNIT_SITE_LINK` (
  `ID_INTERNAL` INTEGER  NOT NULL AUTO_INCREMENT,
  `KEY_ROOT_DOMAIN_OBJECT` INTEGER NOT NULL DEFAULT 1,
  `KEY_TOP_UNIT_SITE` INTEGER ,
  `KEY_FOOTER_UNIT_SITE` INTEGER ,
  `URL` VARCHAR(255)  NOT NULL,
  `LABEL` LONGTEXT  NOT NULL,
  PRIMARY KEY(`ID_INTERNAL`)
) type=InnoDB;
