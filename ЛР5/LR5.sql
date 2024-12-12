CREATE TABLE `goods` (
	`Код_товара` INT(11) NOT NULL AUTO_INCREMENT,
	`Наименование` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Категория` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	PRIMARY KEY (`Код_товара`) USING BTREE
)
COLLATE='utf8mb4_uca1400_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=6
;

CREATE TABLE `customer` (
	`Код_покупателя` INT(11) NOT NULL AUTO_INCREMENT,
	`Фамилия` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Имя` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Отчество` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Телефон` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Индекс` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Страна` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Город` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Область` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Адрес` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Предприятие` VARCHAR(50) NULL DEFAULT '' COLLATE 'utf8mb4_uca1400_ai_ci',
	`Кредит` DECIMAL(20,6) NULL DEFAULT NULL,
	PRIMARY KEY (`Код_покупателя`) USING BTREE
)
COLLATE='utf8mb4_uca1400_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=7
;

CREATE TABLE `postav` (
	`Код_поставщика` INT(11) NOT NULL AUTO_INCREMENT,
	`Название` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Адрес` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Телефон` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Скидки` DECIMAL(20,6) NULL DEFAULT NULL,
	PRIMARY KEY (`Код_поставщика`) USING BTREE
)
COLLATE='utf8mb4_uca1400_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=4
;

CREATE TABLE `ord_sale` (
	`Код_заказа` INT(11) NOT NULL AUTO_INCREMENT,
	`Номер_заказа` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	`Код_покупателя` INT(11) NULL DEFAULT NULL,
	`Код_товар` INT(11) NULL DEFAULT NULL,
	`Код_поставщика` INT(11) NULL DEFAULT NULL,
	`Дата_заказа` DATE NULL DEFAULT NULL,
	`Заказано` INT(11) NULL DEFAULT NULL,
	`Дата_продажи` DATE NULL DEFAULT NULL,
	`Продано` INT(11) NULL DEFAULT NULL,
	`Цена` DECIMAL(20,6) NULL DEFAULT NULL,
	`Примечание` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_uca1400_ai_ci',
	PRIMARY KEY (`Код_заказа`) USING BTREE,
	INDEX `FK_ord_sale_customer` (`Код_покупателя`) USING BTREE,
	INDEX `FK_ord_sale_postav` (`Код_поставщика`) USING BTREE,
	INDEX `FK_ord_sale_goods` (`Код_товар`) USING BTREE,
	CONSTRAINT `FK_ord_sale_customer` FOREIGN KEY (`Код_покупателя`) REFERENCES `customer` (`Код_покупателя`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_ord_sale_goods` FOREIGN KEY (`Код_товар`) REFERENCES `goods` (`Код_товара`) ON UPDATE NO ACTION ON DELETE NO ACTION,
	CONSTRAINT `FK_ord_sale_postav` FOREIGN KEY (`Код_поставщика`) REFERENCES `postav` (`Код_поставщика`) ON UPDATE NO ACTION ON DELETE NO ACTION
)
COLLATE='utf8mb4_uca1400_ai_ci'
ENGINE=InnoDB
AUTO_INCREMENT=3
;