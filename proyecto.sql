-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 24-02-2018 a las 22:10:35
-- Versión del servidor: 10.1.30-MariaDB
-- Versión de PHP: 7.2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `brands`
--

CREATE TABLE `brands` (
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `img` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `brands`
--

INSERT INTO `brands` (`brand_id`, `name`, `description`, `img`) VALUES
(1, 'Prozis', '', '/img/levis_logo.jpg'),
(2, 'Xcore', '', '/img/sony_logo.jpg'),
(3, 'Amix', '', '/img/findus_logo.jpg'),
(4, 'BSN', '', '/img/nutella_logo.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categories`
--

CREATE TABLE `categories` (
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` text COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `categories`
--

INSERT INTO `categories` (`category_id`, `name`, `description`) VALUES
(1, 'Masa Muscular', ''),
(2, 'Energia', ''),
(3, 'Alimentación', ''),
(4, 'Proteina', ''),
(5, 'Perder Peso', ''),
(6, 'Marcas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comments`
--

CREATE TABLE `comments` (
  `comment_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `rating` int(10) UNSIGNED NOT NULL,
  `title` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `body` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `comments`
--

INSERT INTO `comments` (`comment_id`, `user_id`, `product_id`, `rating`, `title`, `body`, `posted`) VALUES
(1, 1, 1, 5, 'Los mejores', 'Nunca defraudan, soy fiel a esta marca', '2018-02-12 17:53:36'),
(2, 2, 1, 4, 'Esperaba más', 'No están mal, pero por el precio esperaba más calidad', '2018-02-12 17:53:36'),
(3, 3, 2, 3, 'Volumen escaso', 'La marca se supone que es de confianza, pero el sonido de esta radio es demasiado bajo', '2018-02-12 17:53:36'),
(4, 3, 4, 5, 'Excelente', 'Mataría por mi Nutella', '2018-02-12 17:53:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `category_id` bigint(20) UNSIGNED NOT NULL,
  `brand_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `description` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `img` varchar(256) COLLATE utf8_general_mysql500_ci NOT NULL,
  `price` float NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`product_id`, `category_id`, `brand_id`, `name`, `description`, `img`, `price`, `posted`) VALUES
(1, 1, 1, 'WheyIsolate Zero', '', 'img/proteina5.jpeg', 49.99, '2018-02-24 10:33:54'),
(2, 1, 2, 'Real Whey Protein', '', 'img/proteina2.jpeg', 20, '2018-02-24 10:37:45'),
(3, 1, 2, 'Real Whey Protein', '', 'img/proteina8.jpeg', 0.6, '2018-02-24 10:38:20'),
(5, 1, 1, 'Predators Prey Protein Zero', '', 'img/proteina6.jpeg', 50.99, '2018-02-24 10:39:23'),
(4, 1, 1, 'Predators Prey Protein', '', 'img/proteinaEner2.jpg', 50.99, '2018-02-24 10:39:23'),
(6, 1, 3, 'Xtreme Whey Protein ', '', 'img/proteina10.jpeg', 65.9, '2018-02-24 11:03:59'),
(7, 1, 4, 'Eggs White Protein', '', 'img/proteina13.jpeg', 2.5, '2018-02-24 21:02:36'),
(8, 1, 4, 'White Protein', '', 'img/proteinaEner.jpg', 2.5, '2018-02-24 21:02:36'),
(14, 3, 1, 'Whey Protein & Oats', '', 'img/proteinaAlim.jpg', 18.59, '2018-02-24 10:37:45'),
(15, 3, 1, 'Diet bar x12', '', 'img/proteinaAlim2.jpg', 16.99, '2018-02-24 11:35:19'),
(16, 3, 1, 'Zero Snack Bars', '', 'img/proteinaAlim3.jpg', 14.99, '2018-02-24 11:27:49'),
(18, 4, 1, 'Whey Protein Advanced', '', 'img/proteina15.jpg', 40.99, '2018-02-24 12:36:43');


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `shoppingcarts`
--

CREATE TABLE `shoppingcarts` (
  `item_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `item_number` int(10) UNSIGNED NOT NULL,
  `posted` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `shoppingcarts`
--

INSERT INTO `shoppingcarts` (`item_id`, `user_id`, `product_id`, `item_number`, `posted`) VALUES
(1, 1, 1, 1, '2018-02-12 17:53:36'),
(2, 1, 4, 1, '2018-02-12 17:53:36'),
(3, 2, 3, 10, '2018-02-12 17:53:36'),
(4, 3, 2, 1, '2018-02-12 17:53:36'),
(5, 3, 2, 1, '2018-02-12 17:53:36');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stores`
--

CREATE TABLE `stores` (
  `store_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(150) COLLATE utf8_general_mysql500_ci NOT NULL,
  `address` text COLLATE utf8_general_mysql500_ci NOT NULL,
  `lat` float NOT NULL,
  `lng` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `stores`
--

INSERT INTO `stores` (`store_id`, `name`, `address`, `lat`, `lng`) VALUES
(1, 'Juan de Garay', 'c/Juan de Garay, 25, 46017 Valencia', 39.4548, -0.395748),
(2, 'Malvarrosa', 'Playa de la Malvarrosa', 39.4773, -0.323375);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `first_name` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `last_name` varchar(100) COLLATE utf8_general_mysql500_ci NOT NULL,
  `age` int(11) NOT NULL,
  `username` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL,
  `password` varchar(50) COLLATE utf8_general_mysql500_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_mysql500_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`user_id`, `first_name`, `last_name`, `age`, `username`, `password`) VALUES
(1, 'Juan', 'Sánchez', 20, 'sergio', '1234'),
(2, 'Antonia', 'González', 15, 'agonzalez', '5f4dcc3b5aa765d61d8327deb882cf99'),
(3, 'Luisa', 'García', 18, 'lgarcia', 'ea847988ba59727dbf4e34ee75726dc3');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`brand_id`);

--
-- Indices de la tabla `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Indices de la tabla `comments`
--
ALTER TABLE `comments`
  ADD PRIMARY KEY (`comment_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category_id` (`category_id`),
  ADD KEY `brand_id` (`brand_id`);

--
-- Indices de la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD PRIMARY KEY (`item_id`),
  ADD KEY `user_id` (`user_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indices de la tabla `stores`
--
ALTER TABLE `stores`
  ADD PRIMARY KEY (`store_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `brands`
--
ALTER TABLE `brands`
  MODIFY `brand_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comments`
--
ALTER TABLE `comments`
  MODIFY `comment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `product_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  MODIFY `item_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `stores`
--
ALTER TABLE `stores`
  MODIFY `store_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `comments`
--
ALTER TABLE `comments`
  ADD CONSTRAINT `comments_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `comments_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);

--
-- Filtros para la tabla `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`brand_id`) REFERENCES `brands` (`brand_id`);

--
-- Filtros para la tabla `shoppingcarts`
--
ALTER TABLE `shoppingcarts`
  ADD CONSTRAINT `shoppingcarts_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `shoppingcarts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
