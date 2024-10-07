USE bh35910_udlab2;


CREATE TABLE IF NOT EXISTS Intensives_Sayapin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    date DATE NOT NULL,
    location VARCHAR(255) NOT NULL,
    description TEXT
);


CREATE TABLE IF NOT EXISTS Participants_Sayapin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL,
    intensive_id INT,
    FOREIGN KEY (intensive_id) REFERENCES Intensives_Sayapin(id) ON DELETE CASCADE
);


INSERT INTO Participants_Sayapin (name, email, intensive_id) VALUES
('Иван Иванов', 'ivan@example.com', 1),
('Мария Петрова', 'maria@example.com', 1),
('Сергей Смирнов', 'sergey@example.com', 2),
('Анна Кузнецова', 'anna@example.com', 2),
('Дмитрий Васильев', 'dmitry@example.com', 3),
('Елена Соколова', 'elena@example.com', 3),
('Алексей Попов', 'alexey@example.com', 4),
('Ольга Федорова', 'olga@example.com', 4),
('Николай Морозов', 'nikolay@example.com', 5),
('Татьяна Лебедева', 'tatiana@example.com', 5);


CREATE TABLE IF NOT EXISTS Projects_Sayapin (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    intensive_id INT,
    description TEXT,
    FOREIGN KEY (intensive_id) REFERENCES Intensives_Sayapin(id) ON DELETE CASCADE
);


INSERT INTO Projects_Sayapin (name, intensive_id, description) VALUES
('Проект AI', 1, 'Разработка модели машинного обучения.'),
('Веб-приложение', 2, 'Создание интерактивного веб-сайта.'),
('Анализ данных', 3, 'Обработка и визуализация данных.'),
('Мобильное приложение', 4, 'Разработка приложения для Android.'),
('Дизайн интерфейса', 5, 'Создание прототипа пользовательского интерфейса.'),
('Блокчейн проект', 6, 'Разработка смарт-контрактов.'),
('Кибербезопасность', 7, 'Аудит безопасности системы.'),
('Agile проект', 8, 'Внедрение Agile методологий.'),
('IoT решение', 9, 'Создание системы умного дома.'),
('Графика и анимация', 10, 'Разработка анимационного ролика.');


ALTER TABLE Intensives_Sayapin CONVERT TO CHARACTER SET utf8mb4;
ALTER TABLE Participants_Sayapin CONVERT TO CHARACTER SET utf8mb4;
ALTER TABLE Projects_Sayapin CONVERT TO CHARACTER SET utf8mb4;
