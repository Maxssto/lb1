-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Июн 09 2022 г., 11:33
-- Версия сервера: 10.4.22-MariaDB
-- Версия PHP: 8.1.2

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `hospital`
--

-- --------------------------------------------------------

--
-- Структура таблицы `nurse`
--

CREATE TABLE `nurse` (
  `ID_Nurse` int(11) NOT NULL,
  `name` text NOT NULL,
  `date` date NOT NULL,
  `department` text NOT NULL,
  `shift` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `nurse`
--

INSERT INTO `nurse` (`ID_Nurse`, `name`, `date`, `department`, `shift`) VALUES
(1, 'Hanna', '2022-06-01', 'Alabama', 'First'),
(2, 'Lesli', '2022-06-02', 'Verginia', 'Second'),
(3, 'John', '2022-06-03', 'Alabama', 'Third'),
(4, 'Root', '2022-06-04', 'California', 'First'),
(5, 'Show', '2022-06-01', 'Alabama', 'Second'),
(6, 'Caroline', '2022-06-05', 'Verginia', 'First'),
(7, 'Samina', '2022-06-10', 'Alabama', 'Second'),
(8, 'Samina', '2022-06-10', 'Alabama', 'Second');

-- --------------------------------------------------------

--
-- Структура таблицы `nurse_ward`
--

CREATE TABLE `nurse_ward` (
  `FID_Nurse` int(11) NOT NULL,
  `FID_Ward` int(11) NOT NULL,
  `ID_Record` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `nurse_ward`
--

INSERT INTO `nurse_ward` (`FID_Nurse`, `FID_Ward`, `ID_Record`) VALUES
(1, 1, 1),
(3, 2, 2),
(2, 3, 3),
(4, 4, 4),
(5, 5, 5),
(1, 2, 6),
(3, 3, 7),
(6, 5, 8),
(8, 7, 9);

-- --------------------------------------------------------

--
-- Структура таблицы `ward`
--

CREATE TABLE `ward` (
  `ID_Ward` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Дамп данных таблицы `ward`
--

INSERT INTO `ward` (`ID_Ward`) VALUES
(1),
(2),
(3),
(4),
(5),
(7);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `nurse`
--
ALTER TABLE `nurse`
  ADD PRIMARY KEY (`ID_Nurse`);

--
-- Индексы таблицы `nurse_ward`
--
ALTER TABLE `nurse_ward`
  ADD PRIMARY KEY (`ID_Record`),
  ADD KEY `FID_Nurse` (`FID_Nurse`),
  ADD KEY `FID_Ward` (`FID_Ward`);

--
-- Индексы таблицы `ward`
--
ALTER TABLE `ward`
  ADD PRIMARY KEY (`ID_Ward`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `nurse`
--
ALTER TABLE `nurse`
  MODIFY `ID_Nurse` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT для таблицы `nurse_ward`
--
ALTER TABLE `nurse_ward`
  MODIFY `ID_Record` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT для таблицы `ward`
--
ALTER TABLE `ward`
  MODIFY `ID_Ward` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `nurse_ward`
--
ALTER TABLE `nurse_ward`
  ADD CONSTRAINT `nurse_ward_ibfk_1` FOREIGN KEY (`FID_Nurse`) REFERENCES `nurse` (`ID_Nurse`),
  ADD CONSTRAINT `nurse_ward_ibfk_2` FOREIGN KEY (`FID_Ward`) REFERENCES `ward` (`ID_Ward`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
