DELETE FROM ob_hook WHERE `name` = 'RegionSelect';

DELETE FROM ob_addon WHERE `name` = 'Region';

DROP TABLE IF EXISTS `ob_region`;