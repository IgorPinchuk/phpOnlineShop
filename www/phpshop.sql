-- phpMyAdmin SQL Dump
-- version 4.6.4
-- https://www.phpmyadmin.net/
--
-- Хост: 127.0.0.1
-- Время создания: Апр 25 2017 г., 20:16
-- Версия сервера: 5.7.14
-- Версия PHP: 5.6.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `phpshop`
--

-- --------------------------------------------------------

--
-- Структура таблицы `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort_order` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `category`
--

INSERT INTO `category` (`id`, `name`, `sort_order`, `status`) VALUES
(13, 'Ноутбуки', 1, 1),
(14, 'Планшеты', 2, 1),
(15, 'Мониторы', 3, 1),
(16, 'Игровые компьютеры', 4, 1),
(17, 'Видеокарты', 5, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `code` int(11) NOT NULL,
  `price` float NOT NULL,
  `availability` int(11) NOT NULL,
  `brand` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `is_new` int(11) NOT NULL DEFAULT '0',
  `is_recommended` int(11) NOT NULL DEFAULT '0',
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product`
--

INSERT INTO `product` (`id`, `name`, `category_id`, `code`, `price`, `availability`, `brand`, `image`, `description`, `is_new`, `is_recommended`, `status`) VALUES
(34, 'Ноутбук Asus X200MA (X200MA-KX315E)', 13, 1839707, 820, 1, 'Asus', '', '<p>Экран 11.6&quot; (1366x768) HD LED, глянцевый</p><p>Intel Pentium N3530 (2.16 - 2.58 ГГц)</p><p>RAM 4 ГБ</p><p>HDD 750 ГБ</p><p>Intel HD Graphics</p><p>Bluetooth 4.0 / Wi-Fi / LAN</p><p>веб-камера</p>', 0, 0, 1),
(35, 'Ноутбук HP Stream 11-d050nr', 13, 2343847, 600, 0, 'Hewlett Packard', '', '<p>Экран 11.6&rdquo; (1366x768) HD LED, матовый</p><p>Intel Celeron N2840 (2.16 ГГц)</p><p>RAM 2 ГБ</p><p>eMMC 32 ГБ</p><p>Intel HD Graphics</p><p>Wi-Fi / Bluetooth</p>', 1, 1, 1),
(36, 'Ноутбук Asus X200MA White ', 13, 2028027, 500, 1, 'Asus', '', '<p>Экран 11.6&quot; (1366x768) HD LED, глянцевый</p><p>Intel Celeron N2840 (2.16 ГГц)</p><p>RAM 2 ГБ</p><p>HDD 500 ГБ</p><p>Intel HD Graphics</p><p>Bluetooth 4.0 / Wi-Fi / LAN</p><p>веб-камера</p>', 0, 1, 1),
(37, 'Ноутбук Acer Aspire E3-112-C65X', 13, 2019487, 600, 1, 'Acer', '', '<p>Экран 11.6&#39;&#39; (1366x768) HD LED, матовый</p><p>Intel Celeron N2840 (2.16 ГГц)</p><p>RAM 2 ГБ</p><p>HDD 500 ГБ</p><p>Intel HD Graphics</p><p>LAN / Wi-Fi / Bluetooth</p><p>веб-камера</p>', 0, 1, 1),
(38, 'Ноутбук Acer TravelMate TMB115', 13, 1953212, 500, 1, 'Acer', '', '<p>Экран 11.6&#39;&#39; (1366x768) HD LED, матовый</p><p>Intel Celeron N2840 (2.16 ГГц)</p><p>RAM 2 ГБ</p><p>HDD 500 ГБ</p><p>Intel HD Graphics</p><p>LAN / Wi-Fi / Bluetooth 4.0</p>', 0, 0, 1),
(39, 'Ноутбук Lenovo Flex 10', 13, 1602042, 650, 0, 'Lenovo', '', '<p>Экран 10.1&quot; (1366x768) HD LED, сенсорный</p><p>Intel Celeron N2830 (2.16 ГГц)</p><p>RAM 2 ГБ</p><p>HDD 500 ГБ</p><p>Intel HD Graphics</p><p>Wi-Fi / Bluetooth</p><p>веб-камера</p>', 0, 0, 1),
(40, 'Ноутбук Asus X751MA', 13, 2028367, 850, 1, 'Asus', '', '<p>Экран 17.3&quot; (1600х900) HD+ LED, глянцевый</p><p>Intel Pentium N3540 (2.16 - 2.66 ГГц)</p><p>RAM 4 ГБ</p><p>HDD 1 ТБ</p><p>Intel HD Graphics</p><p>DVD Super Multi</p><p>LAN / Wi-Fi / Bluetooth 4.0</p><p>веб-камера</p>', 0, 1, 1),
(41, 'Samsung Galaxy Tab S 10.5 16GB', 14, 1129365, 1000, 1, 'Samsung', '', '<p>Samsung Galaxy Tab S создан для того, чтобы сделать вашу жизнь лучше. Наслаждайтесь своим контентом с покрытием 94% цветов Adobe RGB и 100000:1 уровнем контрастности, который обеспечивается sAmoled экраном с функцией оптимизации под отображаемое изображение и окружение. Яркий 10.5&rdquo; экран в ультратонком корпусе весом 467 г порадует вас высоким уровнем портативности. Работа станет проще вместе с Hancom Office и удаленным доступом к вашему ПК. E-Meeting и WebEx &ndash; отличные помощники для проведения встреч, когда вы находитесь вне офиса. Надежно храните ваши данные благодаря сканеру отпечатка пальцев.</p>', 1, 1, 1),
(42, 'Samsung Galaxy Tab S 8.4 16GB', 14, 1128670, 900, 1, 'Samsung', '', '<p>Экран 8.4&quot; Super AMOLED (2560x1600) емкостный Multi-Touch</p><p>Samsung Exynos 5420 (1.9 ГГц + 1.3 ГГц)</p><p>RAM 3 ГБ</p><p>16 ГБ встроенной памяти + поддержка карт памяти microSD</p><p>Bluetooth 4.0 / Wi-Fi 802.11 a/b/g/n/ac</p><p>основная камера 8 Мп, фронтальная 2.1 Мп</p><p>GPS / ГЛОНАСС</p><p>Android 4.4.2 (KitKat)</p>', 0, 0, 1),
(43, 'Gazer Tegra Note 7', 14, 6833642, 400, 1, 'Gazer', '', '<p>Экран 7&quot; IPS (1280x800) емкостный Multi-Touch</p><p>NVIDIA Tegra 4 (1.8 ГГц)</p><p>RAM 1 ГБ</p><p>16 ГБ встроенной памяти + поддержка карт памяти microSD</p><p>Wi-Fi / Bluetooth 4.0</p><p>основная камера 5 Мп, фронтальная - 0.3 Мп</p><p>GPS / ГЛОНАСС</p><p>Android 4.4.2 (KitKat)&nbsp;</p>', 0, 0, 1),
(45, 'Everest Game 9085', 16, 1563832, 2500, 1, 'Everest', '', '<p>Everest Game 9085 &mdash; это компьютеры премимум класса, собранные на базе эксклюзивных компонентов, тщательно подобранных и протестированных лучшими специалистами нашей компании. Это топовый сегмент систем, который отвечает наилучшим характеристикам показателей качества и производительности.</p>', 0, 0, 1),
(47, 'GEFORCE GTX 1080', 17, 2414632, 900, 1, 'Nvidia', '', '<p>Новый флагманский GPU NVIDIA GeForce GTX 1080 - самая технически продвинутая игровая видеокарта на планете. Откройте для себя непревзойденную производительность, энергоэффективность и игровые возможности благодаря новой архитектуре&nbsp;<a href="https://www.nvidia.ru/graphics-cards/geforce/pascal/">NVIDIA Pascal&trade;</a>. Это лучшая игровая платформа.</p>', 1, 1, 1),
(49, 'Acer Predator Z35', 15, 1255235, 1000, 1, 'Aser', '', '<ul><li><strong>34 дюйма</strong></li><li>Full HD&nbsp;<strong>2560 x 1080</strong></li><li>Частота обновления&nbsp;<strong>144 Гц</strong></li><li>Время отклика<strong>&nbsp;4 мс</strong></li><li>Разъемы:&nbsp;<strong>HDMI, DP</strong></li></ul><p>Прекрасное решение для игрушек типа Total War, где важна не милисекундная реакция на поле битвы, а полное его восприятие в мельчайших деталях. С этим монитор справляется на ура.</p>', 1, 1, 1),
(50, 'BenQ XR3501 35-inch', 15, 3456783, 900, 1, 'BenQ', '', '<p>Хороший отклик, большая диагональ и разрешение позволят контролировать поле сражения в мельчайших деталях &mdash; как на месте воина, так и на месте военачальника.</p><ul><li><strong>35 дюймов</strong></li><li>Full HD<strong>&nbsp;2560 x 1080</strong></li><li>Частота обновления&nbsp;<strong>144 Гц</strong></li><li>Время отклика&nbsp;<strong>1 мс</strong></li><li>Разъемы:&nbsp;<strong>HDMI, DP</strong></li></ul>', 1, 1, 1),
(91, 'Dell XPS 13', 13, 1254653, 879, 1, '1', '', '', 0, 0, 1),
(93, 'Asus ZenBook UX305', 13, 5678347, 1199, 1, 'Asus', '', '<p>Классный гибрид на Windows 10</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i5 &ndash; i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD graphics 520 &ndash; Nvidia GeForce graphics;</li><li><strong>ОЗУ:</strong>&nbsp;8GB &ndash; 16GB;</li><li><strong>Дисплей:</strong>&nbsp;13.5 дюйма, 3,000x2,000 PixelSense;</li><li><strong>Накопитель:</strong>&nbsp;128GB &ndash; 256GB PCIe3.0 SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Футуристический дизайн;</li><li>Быстрое отделение планшетной части;</li></ul><p><strong>Минусы:</strong></p><ul><li>Время жизни от АКБ намного меньше обещанной;</li><li>Долго не было крупных обновлений;</li></ul>', 1, 1, 1),
(94, 'HP Chromebook 13', 13, 7834781, 609, 1, 'HP', '', '<p>Тонкий, мощный и восхитительный с виду</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i5 &ndash; i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD Graphics 520;</li><li><strong>ОЗУ:&nbsp;</strong>8GB LPDDR3 SDRAM;</li><li><strong>Дисплей:</strong>&nbsp;13.3 дюйма FHD (1,920 x 1,080) IPS UWVA WLED;</li><li><strong>Накопитель:</strong>&nbsp;256GB &ndash; 512GB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Выглядит стильно и со вкусом;</li><li>Приятная клавиатура;</li></ul><p><strong>Минусы:</strong></p><ul><li>Время жизни от АКБ;</li><li>Тачпад;</li></ul>', 1, 1, 1),
(95, 'Razer Blade Stealth', 13, 6734092, 1449, 1, 'Razer ', '', '<p>Игровой ультрабук которого все ждали</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD Graphics 620;</li><li><strong>ОЗУ:</strong>&nbsp;8GB &ndash; 16GB;</li><li><strong>Дисплей:</strong>&nbsp;12.5 дюйма, QHD+ (2,560 x 1,440) &ndash; 4K (3,840 x 2,160) IGZO LED-подсветка, мультитач;</li><li><strong>Накопитель:</strong>&nbsp;128GB &ndash; 1TB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Очаровательный, красочный дисплей;</li><li>Большая автономность;</li></ul><p><strong>Минусы:</strong></p><ul><li>Громоздкое З/У;</li><li>Маленький ход клавиш клавиатуры;</li></ul>', 1, 1, 1),
(96, 'Samsung Notebook 9', 13, 6645891, 997, 1, 'Samsung ', '', '<p>Все гениальное - просто</p><ul><li><strong>Процессор:</strong>&nbsp;2.3GHz Intel Core i5-6200U;</li><li><strong>Графика:&nbsp;</strong>Intel HD Graphics 520;</li><li><strong>ОЗУ:</strong>&nbsp;8GB;</li><li><strong>Дисплей:&nbsp;</strong>13.3 дюйма, FHD (1,920 x 1,080) LED с антибликовым покрытием;</li><li><strong>Накопитель:</strong>&nbsp;256GB;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Цена;</li><li>Хорошее качество изображения;</li></ul><p><strong>Минусы:</strong></p><ul><li>Micro версии видеовыходов;</li><li>Слабый аккумулятор;</li></ul>', 1, 1, 1),
(97, 'Surface Book', 13, 5736230, 1499, 1, 'Microsoft', '', '<p>Классный гибрид на Windows 10</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i5 &ndash; i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD graphics 520 &ndash; Nvidia GeForce graphics;</li><li><strong>ОЗУ:</strong>&nbsp;8GB &ndash; 16GB;</li><li><strong>Дисплей:</strong>&nbsp;13.5 дюйма, 3,000x2,000 PixelSense;</li><li><strong>Накопитель:</strong>&nbsp;128GB &ndash; 256GB PCIe3.0 SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Футуристический дизайн;</li><li>Быстрое отделение планшетной части;</li></ul><p><strong>Минусы:</strong></p><ul><li>Время жизни от АКБ намного меньше обещанной;</li><li>Долго не было крупных обновлений;</li></ul>', 1, 1, 1),
(98, 'HP Spectre', 13, 5757463, 1299, 1, 'HP', '', '<p>Тонкий, мощный и восхитительный с виду</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i5 &ndash; i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD Graphics 520;</li><li><strong>ОЗУ:&nbsp;</strong>8GB LPDDR3 SDRAM;</li><li><strong>Дисплей:</strong>&nbsp;13.3 дюйма FHD (1,920 x 1,080) IPS UWVA WLED;</li><li><strong>Накопитель:</strong>&nbsp;256GB &ndash; 512GB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Выглядит стильно и со вкусом;</li><li>Приятная клавиатура;</li></ul><p><strong>Минусы:</strong></p><ul><li>Время жизни от АКБ;</li><li>Тачпад;</li></ul>', 1, 1, 1),
(99, 'Samsung Notebook 7 Spin', 13, 56783347, 1600, 1, 'Samsung ', '', '<p>Премиум-класс, который можно себе позволить</p><ul><li><strong>Процессор:</strong>&nbsp;2.5GHz Intel Core i7-6500U;</li><li><strong>Графика:</strong>&nbsp;Nvidia GeForce 940MX (2GB DDR3L); Intel HD Graphics 520;</li><li><strong>ОЗУ:</strong>&nbsp;12GB &ndash; 16GB;</li><li><strong>Дисплей:</strong>&nbsp;15.6 дюйма Full HD (1,920 x 1,080) LED с сенсорной панелью;</li><li><strong>Накопитель:</strong>&nbsp;1 TB HDD &ndash; 1TB HDD; 128GB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Отличная цена;</li><li>HDR экран;</li></ul><p><strong>Минусы:</strong></p><ul><li>Тяжелый;</li><li>Samsung прогадали с графикой</li></ul>', 1, 1, 1),
(100, 'HP Spectre x360', 13, 5634128, 1300, 1, 'HP', '', '<p>Тоньше, симпатичнее и быстрее чем когда либо</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core i5 &ndash; i7;</li><li><strong>Графика:</strong>&nbsp;Intel HD Graphics 620;</li><li><strong>ОЗУ:</strong>&nbsp;4GB &ndash; 16GB;</li><li><strong>Дисплей:</strong>&nbsp;13.3 дюйма, FHD (1,920 x 1,080) &ndash; UHD (3,840 x 2,160) IPS UWVA с технологией мультитач;</li><li><strong>Накопитель:&nbsp;</strong>128GB &ndash; 512GB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Клавиатура;</li><li>Долгоиграющий и быстро заряжается;</li></ul><p><strong>Минусы:</strong></p><ul><li>Отсутствие кардридера;</li><li>Крайне толстая рамка у дна;</li></ul>', 1, 1, 1),
(101, 'MacBook (2016)', 13, 5544567, 1599, 1, 'Apple', '', '<p>Привлекателен, тонок и легок</p><ul><li><strong>Процессор:</strong>&nbsp;Intel Core m3 &ndash; m5;</li><li><strong>Графика:</strong>&nbsp;Intel HD Graphics 515;</li><li><strong>ОЗУ:</strong>&nbsp;8GB;</li><li><strong>Дисплей:</strong>&nbsp;12 дюймов, 2304 x 1,440 IPS;</li><li><strong>Накопитель:</strong>&nbsp;256GB &ndash; 512GB SSD;</li></ul><p><strong>Плюсы:</strong></p><ul><li>Очаровательный дизайн;</li><li>На удивление качественные динамики;</li></ul><p><strong>Минусы:</strong></p><ul><li>Слабый процессор;</li><li>Дорогой для своей &quot;начинки&quot;;</li></ul>', 1, 1, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `product_order`
--

CREATE TABLE `product_order` (
  `id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `products` text NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `product_order`
--

INSERT INTO `product_order` (`id`, `user_id`, `date`, `products`, `status`) VALUES
(45, 2, '2015-05-14 09:54:45', '{"1":1,"2":1,"3":2}', 3),
(46, 2, '2015-05-18 15:34:42', '{"44":3,"43":3}', 1),
(47, 6, '2016-07-17 19:26:10', '{"45":1,"44":1}', 1),
(60, 1, '2017-03-22 19:12:24', '{"50":1,"45":1,"47":2}', 1),
(61, 7, '2017-04-25 15:10:04', '{"50":1}', 1),
(62, 9, '2017-04-25 17:46:10', '{"99":2,"98":1,"42":1}', 1),
(63, 9, '2017-04-25 17:49:07', '{"98":1,"97":2,"99":1,"42":1}', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Дамп данных таблицы `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password`, `role`) VALUES
(1, 'Admin', 'admin@mail.com', 'qwerty123', 'admin'),
(7, 'newuser', 'user@mail.com', 'qwertyuiop', ''),
(9, 'Иван Иванов', 'iivanov@mail.com', 'qwerty123456', '');

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `product_order`
--
ALTER TABLE `product_order`
  ADD PRIMARY KEY (`id`);

--
-- Индексы таблицы `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
--
-- AUTO_INCREMENT для таблицы `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=111;
--
-- AUTO_INCREMENT для таблицы `product_order`
--
ALTER TABLE `product_order`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=64;
--
-- AUTO_INCREMENT для таблицы `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
