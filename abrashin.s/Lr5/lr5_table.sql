-- Создание таблицы Товары (Goods)
CREATE TABLE Goods (
    код_товар INT AUTO_INCREMENT PRIMARY KEY,
    категория VARCHAR(100) NOT NULL,
    наименования_продукта VARCHAR(200) NOT NULL
);

-- Создание таблицы Покупатель (Customer)
CREATE TABLE Customer (
    код_покупателя INT AUTO_INCREMENT PRIMARY KEY,
    фамилия VARCHAR(100) NOT NULL,
    имя VARCHAR(50) NOT NULL,
    отчество VARCHAR(50),
    телефон VARCHAR(20) NOT NULL,
    индекс VARCHAR(10),
    страна VARCHAR(50),
    город VARCHAR(50),
    область VARCHAR(50),
    адрес VARCHAR(200),
    предприятие VARCHAR(100),
    кредит DECIMAL(15,2)
);

-- Создание таблицы Поставщик (Postav)
CREATE TABLE Postav (
    код_поставщика INT AUTO_INCREMENT PRIMARY KEY,
    название VARCHAR(100) NOT NULL,
    адрес VARCHAR(200) NOT NULL,
    телефон VARCHAR(20),
    скидки DECIMAL(5,2)
);

-- Создание таблицы Продажи и заказы товара (Ord_Sale)
CREATE TABLE Ord_Sale (
    код_заказа INT AUTO_INCREMENT PRIMARY KEY,
    номер_заказа VARCHAR(20) NOT NULL,
    код_покупателя INT NOT NULL,
    код_товар INT NOT NULL,
    код_поставщика INT NOT NULL,
    дата_заказа DATE NOT NULL,
    заказано INT NOT NULL,
    дата_продажи DATE,
    продано INT,
    цена DECIMAL(15,2) NOT NULL,
    примечание VARCHAR(200),
    FOREIGN KEY (код_покупателя) REFERENCES Customer(код_покупателя),
    FOREIGN KEY (код_товар) REFERENCES Goods(код_товар),
    FOREIGN KEY (код_поставщика) REFERENCES Postav(код_поставщика)
);