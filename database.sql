CREATE DATABASE IF NOT EXISTS `southcarolinadb`
USE `southcarolinadb`;

CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(11) NOT NULL AUTO_INCREMENT,
  `identifier` varchar(21) NOT NULL,
  `name` varchar(50) NOT NULL,
  `banned` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `reason` varchar(50) NOT NULL DEFAULT 'não definido',
  `whitelist` tinyint(1) unsigned zerofill NOT NULL DEFAULT 0,
  `createdAt` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`user_id`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `characters` (
  `charid` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `characterName` varchar(50) NOT NULL,
  `level` int(11) DEFAULT 1,
  `age` int(11) DEFAULT 1,
  `xp` int(11) DEFAULT 0,
  `wanted` text NOT NULL DEFAULT '{}',
  `groups` bigint(20) NOT NULL DEFAULT 0,
  `metaData` text NOT NULL DEFAULT '{}',
  `is_dead` int(11) DEFAULT 0,
  PRIMARY KEY (`charid`),
  KEY `FK_characters_users` (`user_id`),
  CONSTRAINT `FK_character_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `characters_appearence` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) DEFAULT NULL,
  `isMale` tinyint(1) DEFAULT 1,
  `model` mediumtext DEFAULT NULL,
  `enabledComponents` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`enabledComponents`)),
  `faceFeatures` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`faceFeatures`)),
  `overlays` longtext DEFAULT NULL,
  `clothes` longtext DEFAULT NULL,
  `pedHeight` text DEFAULT NULL,
  `pedWeight` int(11) DEFAULT 70,
  PRIMARY KEY (`id`),
  KEY `charID` (`charid`) USING BTREE,
  CONSTRAINT `characters_appearence_ibfk_1` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE IF NOT EXISTS `chests` (
  `id` tinytext NOT NULL DEFAULT 'AUTO_INCREMENT',
  `charid` int(11) DEFAULT NULL,
  `position` text NOT NULL DEFAULT '{}[]',
  `type` int(11) NOT NULL,
  `capacity` int(11) NOT NULL,
  KEY `FK_chests_characters` (`charid`),
  CONSTRAINT `FK_chests_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE IF NOT EXISTS `inventories` (
  `id` varchar(100) NOT NULL,
  `charid` int(11) DEFAULT NULL,
  `inv_capacity` tinyint(4) DEFAULT 20,
  `inv_slots` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`inv_slots`)),
  KEY `FK_inventories_characters` (`charid`),
  CONSTRAINT `FK_inventories_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

DELIMITER //
CREATE PROCEDURE `procInventory`(
	IN `iid` VARCHAR(20),
	IN `charid` INT(8),
	IN `capacity` INT(8),
	IN `slot` INT(8),
	IN `itemId` VARCHAR(100),
	IN `itemAmount` INT(8),
	IN `procType` VARCHAR(8)
)
BEGIN
    IF (procType = "update") THEN
		UPDATE inventories SET inv_slots = JSON_SET(inv_slots, CONCAT("$.", slot), "{}") WHERE id = iid;
        UPDATE inventories SET inv_slots = JSON_SET(inv_slots, CONCAT(CONCAT("$.", slot), "[0]"), itemId, CONCAT(CONCAT("$.", slot), "[1]"), itemAmount) WHERE id = iid;
    ELSEIF (procType = "updateAmmoOnly") THEN
        UPDATE inventories SET inv_slots = JSON_SET(inv_slots, CONCAT(CONCAT("$.", slot), "[3]"), itemAmmoInClip, CONCAT(CONCAT("$.", slot), "[4]"), itemAmmoInWeapon) WHERE id = iid;
    ELSEIF (procType = "remove") THEN
        UPDATE inventories SET inv_slots = JSON_REMOVE(inv_slots, CONCAT("$.", slot)) WHERE id = iid;
    ELSEIF (procType = "select") THEN
        SELECT * from inventories WHERE id = iid;
    ELSEIF (procType = "insert") THEN
        INSERT INTO inventories(id, charid, inv_capacity, inv_slots) VALUES (iid, charid, capacity, "{}");
    ELSEIF (procType = "clear") THEN
        UPDATE inventories SET inv_slots = "{}" WHERE id = iid and charid = charid;
    END IF;
END//
DELIMITER ;


CREATE TABLE IF NOT EXISTS `horses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `charid` int(11) NOT NULL,
  `model` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `components` text NOT NULL DEFAULT '{}',
  `metaData` text NOT NULL DEFAULT '{}',
  `isDead` int(11) NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `FK_horses_characters` (`charid`),
  CONSTRAINT `FK_horses_characters` FOREIGN KEY (`charid`) REFERENCES `characters` (`charid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;


DELIMITER //
CREATE PROCEDURE `setData`(
	IN `typeData` VARCHAR(20),
	IN `keyValue` VARCHAR(50),
	IN `valueKey` VARCHAR(200),
	IN `id` INT(8)
)
BEGIN
	IF (typeData = 'clothes') THEN
		UPDATE characters_appearence SET clothes = JSON_SET(clothes, CONCAT("$.", keyValue), valueKey) WHERE charid = id;
	ELSEIF (typeData = 'enabledComponents') THEN
		UPDATE characters_appearence SET enabledComponents = JSON_SET(enabledComponents, CONCAT("$.", keyValue), valueKey) WHERE charid = id;
	ELSEIF (typeData = 'faceFeatures') THEN
		UPDATE characters_appearence SET faceFeatures = JSON_SET(faceFeatures, CONCAT("$.", keyValue), valueKey) WHERE charid = id;
	ELSEIF (typeData = 'overlay') THEN
		UPDATE characters_appearence SET overlay = JSON_SET(overlay, CONCAT("$.", keyValue), valueKey) WHERE charid = id;
	ELSEIF (typeData = 'groups') THEN
		UPDATE characters SET groups = JSON_SET(groups, CONCAT("$.", keyValue), valueKey) WHERE charid = id;		
	ELSEIF (typeData = 'wanted') THEN
		UPDATE characters SET wanted = JSON_SET(wanted, CONCAT("$.", keyValue), valueKey) WHERE charid = id;			
	ELSEIF (typeData = 'metaData') THEN
		UPDATE characters SET metaData = JSON_SET(metaData, CONCAT("$.", keyValue), valueKey) WHERE charid = id;		
	ELSEIF (typeData = 'modificacao') THEN
		UPDATE horses SET modificacao = JSON_SET(modif, CONCAT("$.", keyValue), valueKey) WHERE id = id;
	END IF;
END//
DELIMITER ;

DELIMITER //
CREATE PROCEDURE `getData`(
	IN `typeData` VARCHAR(10),
	IN `id` INT(8),
	IN `keyValue` VARCHAR(50)
)
BEGIN
	IF (keyValue = 'all' && typeData = 'clothes') THEN
		SELECT clothes as Value FROM characters_appearence WHERE charid = id;
	ELSEIF (keyValue = 'all' && typeData = 'enabledComponents') THEN
		SELECT enabledComponents as Value FROM characters_appearence WHERE charid = id;
	ELSEIF (keyValue = 'all' && typeData = 'faceFeatures') THEN
		SELECT faceFeatures as Value FROM characters_appearence WHERE charid = id;
	ELSEIF (keyValue = 'all' && typeData = 'overlay') THEN
		SELECT overlay as Value FROM characters_appearence WHERE charid = id;	
	ELSEIF (keyValue = 'all' && typeData = 'wanted') THEN
		SELECT wanted as Value FROM characters WHERE charid = id;	
	ELSEIF (keyValue = 'all' && typeData = 'groups') THEN
		SELECT groups as Value FROM characters WHERE charid = id;
	ELSEIF (keyValue = 'all' && typeData = 'metaData') THEN
		SELECT metaData as Value FROM characters WHERE charid = id;		
	ELSEIF (keyValue = 'all' && typeData = 'modificacao') THEN
		SELECT modificacao as Value FROM horses WHERE id = id;
	END IF;
	
	IF (typeData = 'clothes') THEN
		SELECT json_extract(clothes, CONCAT("$.", keyValue)) as Value FROM characters_appearence WHERE charid = id;
    ELSEIF (typeData = 'enabledComponents') THEN
		SELECT json_extract(enabledComponents, CONCAT("$.", keyValue)) as Value FROM characters_appearence WHERE charid = id;
    ELSEIF (typeData = 'faceFeatures') THEN
		SELECT json_extract(faceFeatures, CONCAT("$.", keyValue)) as Value FROM characters_appearence WHERE charid = id;
    ELSEIF (typeData = 'overlay') THEN
		SELECT json_extract(overlay, CONCAT("$.", keyValue)) as Value FROM characters_appearence WHERE charid = id;
	ELSEIF (typeData = 'wanted') THEN
		SELECT json_extract(wanted, CONCAT("$.", keyValue)) as Value FROM characters WHERE charid = id;
	ELSEIF (typeData = 'groups') THEN
		SELECT json_extract(groups, CONCAT("$.", keyValue)) as Value FROM characters WHERE charid = id;
	ELSEIF (typeData = 'metaData') THEN
		SELECT json_extract(metaData, CONCAT("$.", keyValue)) as Value FROM characters WHERE charid = id;
	ELSEIF (typeData = 'modificacao') THEN
		SELECT json_extract(modificacao, CONCAT("$.", keyValue)) as Value FROM horses WHERE id = id;
	END IF;
END//
DELIMITER ;