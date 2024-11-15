CREATE DATABASE WholesaleDB;

USE WholesaleDB;

CREATE TABLE Goods (
    код_товар INT PRIMARY KEY,
    категория VARCHAR(100),
    наименования_продукта VARCHAR(255)
);

CREATE TABLE Customer (
    код_покупателя INT PRIMARY KEY,
    фамилия VARCHAR(100),
    имя VARCHAR(100),
    отчество VARCHAR(100),
    телефон VARCHAR(15),
    индекс VARCHAR(10),
    страна VARCHAR(100),
    город VARCHAR(100),
    область VARCHAR(100),
    адрес VARCHAR(255),
    предприятие VARCHAR(100),
    кредит DECIMAL(10, 2)
);

CREATE TABLE Postav (
    код_поставщика INT PRIMARY KEY,
    название VARCHAR(255),
    адрес VARCHAR(255),
    телефон VARCHAR(15),
    скидки DECIMAL(5, 2)
);

CREATE TABLE Ord_Sale (
    код_заказа INT PRIMARY KEY,
    номер_заказа VARCHAR(50),
    код_покупателя INT,
    код_товар INT,
    код_поставщика INT,
    дата_заказа DATE,
    заказано INT,
    дата_продажи DATE,
    продано INT,
    цена DECIMAL(10, 2),
    примечание TEXT,
    FOREIGN KEY (код_покупателя) REFERENCES Customer(код_покупателя),
    FOREIGN KEY (код_товар) REFERENCES Goods(код_товар),
    FOREIGN KEY (код_поставщика) REFERENCES Postav(код_поставщика)
);