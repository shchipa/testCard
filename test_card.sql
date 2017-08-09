-- phpMyAdmin SQL Dump
-- version 4.4.15.5
-- http://www.phpmyadmin.net
--
-- Хост: 127.0.0.1:3306
-- Время создания: Авг 09 2017 г., 19:11
-- Версия сервера: 5.5.48
-- Версия PHP: 5.4.45

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `test_card`
--

-- --------------------------------------------------------

--
-- Структура таблицы `obj_contracts`
--

CREATE TABLE IF NOT EXISTS `obj_contracts` (
  `id_contract` int(11) NOT NULL,
  `id_customer` int(11) NOT NULL,
  `number` varchar(100) NOT NULL,
  `date_sign` date NOT NULL,
  `staff_number` varchar(100) NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `obj_contracts`
--

INSERT INTO `obj_contracts` (`id_contract`, `id_customer`, `number`, `date_sign`, `staff_number`) VALUES
(1, 1, 'ИВЦ-2017/08-первый', '2017-08-08', '95 (девяносто пять)'),
(2, 1, 'ИВЦ-2017/08-второй', '2017-08-08', '78 (семьдесят восемь)'),
(3, 2, 'НХ-2016/01-первый', '2016-01-20', '10 (десять)'),
(4, 2, 'ЛВЧД-2017/04-первый', '2017-04-05', '21 (двадцать один)');

-- --------------------------------------------------------

--
-- Структура таблицы `obj_customers`
--

CREATE TABLE IF NOT EXISTS `obj_customers` (
  `id_customer` int(11) NOT NULL,
  `name_customer` varchar(250) NOT NULL,
  `company` enum('company_1','company_2','company_3') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `obj_customers`
--

INSERT INTO `obj_customers` (`id_customer`, `name_customer`, `company`) VALUES
(1, 'Иванов Иван И.', 'company_1'),
(2, 'Петров Пётр П.', 'company_2');

-- --------------------------------------------------------

--
-- Структура таблицы `obj_services`
--

CREATE TABLE IF NOT EXISTS `obj_services` (
  `id_service` int(11) NOT NULL,
  `id_contract` int(11) NOT NULL,
  `title_service` varchar(250) NOT NULL,
  `status` enum('work','connecting','disconnected') NOT NULL
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `obj_services`
--

INSERT INTO `obj_services` (`id_service`, `id_contract`, `title_service`, `status`) VALUES
(1, 1, 'тех.задание', 'connecting'),
(2, 1, 'проектирование', 'work'),
(3, 1, 'программирование', 'work'),
(4, 3, 'закупка', 'disconnected'),
(5, 4, 'обкатка', 'work'),
(6, 4, 'обточка', 'disconnected'),
(7, 4, 'тест-драйв', 'connecting');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `obj_contracts`
--
ALTER TABLE `obj_contracts`
  ADD PRIMARY KEY (`id_contract`);

--
-- Индексы таблицы `obj_customers`
--
ALTER TABLE `obj_customers`
  ADD PRIMARY KEY (`id_customer`);

--
-- Индексы таблицы `obj_services`
--
ALTER TABLE `obj_services`
  ADD PRIMARY KEY (`id_service`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `obj_contracts`
--
ALTER TABLE `obj_contracts`
  MODIFY `id_contract` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `obj_customers`
--
ALTER TABLE `obj_customers`
  MODIFY `id_customer` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `obj_services`
--
ALTER TABLE `obj_services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT,AUTO_INCREMENT=8;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
