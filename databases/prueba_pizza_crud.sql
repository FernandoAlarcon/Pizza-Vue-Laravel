-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 22-01-2021 a las 08:40:59
-- Versión del servidor: 10.4.14-MariaDB
-- Versión de PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `prueba_pizza_crud`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ingredientes`
--

CREATE TABLE `ingredientes` (
  `id_ingrediente` int(11) NOT NULL,
  `costo` varchar(50) NOT NULL,
  `ingrediente` varchar(100) NOT NULL,
  `foto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `ingredientes`
--

INSERT INTO `ingredientes` (`id_ingrediente`, `costo`, `ingrediente`, `foto`) VALUES
(2, '1000', 'pollo', 'https://www.polloolympico.com/recetas/wp-content/uploads/2015/11/desmechado.jpg'),
(7, '0', 'Solo Queso', 'https://colanta.com/aprende-de/wp-content/uploads/2019/01/Queso-mozzarella-1.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `id_pedido` int(11) NOT NULL,
  `id_size` int(11) NOT NULL,
  `id_ingredientes` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `tipo_pedido` enum('Administrador','Cliente') NOT NULL,
  `precio` varchar(50) NOT NULL,
  `Estado_Pedido` varchar(50) NOT NULL,
  `fecha_pedido` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pedidos`
--

INSERT INTO `pedidos` (`id_pedido`, `id_size`, `id_ingredientes`, `id_cliente`, `tipo_pedido`, `precio`, `Estado_Pedido`, `fecha_pedido`) VALUES
(1, 2, 2, 7, 'Administrador', '16000', 'Preparacion', '2021-01-21 03:50:09'),
(3, 3, 2, 7, 'Administrador', '23000', 'Preparacion', '2021-01-21 04:02:02'),
(4, 4, 2, 7, 'Administrador', '31000', 'Preparacion', '2021-01-21 04:05:27'),
(5, 5, 7, 7, 'Administrador', '50000', 'Realizado', '2021-01-22 06:04:07'),
(6, 1, 7, 7, 'Administrador', '10000', 'Realizado', '2021-01-22 06:53:45'),
(7, 1, 7, 7, 'Administrador', '10000', 'Preparacion', '2021-01-22 06:25:25'),
(8, 1, 7, 7, 'Administrador', '10000', 'Preparacion', '2021-01-22 06:26:26'),
(9, 1, 7, 7, 'Administrador', '10000', 'Preparacion', '2021-01-22 06:28:23'),
(10, 1, 7, 7, 'Administrador', '10000', 'Preparacion', '2021-01-22 06:29:01'),
(11, 1, 7, 7, 'Administrador', '10000', 'Preparacion', '2021-01-22 06:29:57'),
(16, 5, 2, 7, 'Administrador', '51000', 'Realizado', '2021-01-22 06:51:42'),
(17, 3, 2, 7, 'Administrador', '23000', 'Realizado', '2021-01-22 06:50:24'),
(18, 2, 2, 7, 'Administrador', '16000', 'Preparacion', '2021-01-22 07:00:49'),
(19, 5, 2, 7, 'Cliente', '51000', 'Preparacion', '2021-01-22 07:32:38');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pizzas`
--

CREATE TABLE `pizzas` (
  `id_pizza` int(11) NOT NULL,
  `nombre_pizza` varchar(150) NOT NULL,
  `precio` varchar(500) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `pizzas`
--

INSERT INTO `pizzas` (`id_pizza`, `nombre_pizza`, `precio`) VALUES
(1, 'Small', '10000'),
(2, 'Medium', '17000'),
(3, 'Large', '25000'),
(4, 'Extra Large', '33000');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `id_roll` int(11) NOT NULL,
  `nombre_roll` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`id_roll`, `nombre_roll`) VALUES
(1, 'Administrador'),
(2, 'Cliente');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roll_user`
--

CREATE TABLE `roll_user` (
  `id_roll_user` int(11) NOT NULL,
  `id_roll` int(11) NOT NULL,
  `id_user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `roll_user`
--

INSERT INTO `roll_user` (`id_roll_user`, `id_roll`, `id_user`) VALUES
(1, 1, 6),
(3, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `size_pizza`
--

CREATE TABLE `size_pizza` (
  `id_size` int(11) NOT NULL,
  `size` varchar(200) NOT NULL,
  `precio_base` int(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `size_pizza`
--

INSERT INTO `size_pizza` (`id_size`, `size`, `precio_base`) VALUES
(1, 'Small', 10000),
(2, 'Medium', 15000),
(3, 'Large', 22000),
(4, 'Extra Large', 30000),
(5, 'Pizza Especial Extra Large ( Todas las Carnes )', 50000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipo_pizza`
--

CREATE TABLE `tipo_pizza` (
  `id_tipo_pizza` int(11) NOT NULL,
  `nombre_tipo_pizza` varchar(150) NOT NULL,
  `descripcion_tipo_pizza` varchar(500) NOT NULL,
  `valor_adicional` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`) VALUES
(6, 'Fernando Alarcon', 'pruebas.pizzas@gmail.com', '2021-01-17 05:01:56', '$2y$10$iQWAC1NSQy9mf5Z86II8zeaUc5/D8mhzp7Reg3uOjICbs4Q84P8Yy', 'RCyF5SJaLUwleFyMynNl0AfmNMwb33lMjAAIkD4ZM9a5zupBd6J72bjgZ3FJ', '2021-01-17 04:59:42', '2021-01-22 12:38:36'),
(7, 'Fernando Alarcon', 'erickpufi@gmail.com', '2021-01-20 04:14:45', '$2y$10$.gvJ3CWqj0GMr0co4AOwSum0mu2pb/B67L7kpQbTfAmcdaWQ5mFOu', NULL, '2021-01-20 04:04:13', '2021-01-20 04:14:45');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indices de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  ADD PRIMARY KEY (`id_ingrediente`);

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id_pedido`);

--
-- Indices de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  ADD PRIMARY KEY (`id_pizza`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id_roll`);

--
-- Indices de la tabla `roll_user`
--
ALTER TABLE `roll_user`
  ADD PRIMARY KEY (`id_roll_user`);

--
-- Indices de la tabla `size_pizza`
--
ALTER TABLE `size_pizza`
  ADD PRIMARY KEY (`id_size`);

--
-- Indices de la tabla `tipo_pizza`
--
ALTER TABLE `tipo_pizza`
  ADD PRIMARY KEY (`id_tipo_pizza`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ingredientes`
--
ALTER TABLE `ingredientes`
  MODIFY `id_ingrediente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id_pedido` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `pizzas`
--
ALTER TABLE `pizzas`
  MODIFY `id_pizza` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `id_roll` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `roll_user`
--
ALTER TABLE `roll_user`
  MODIFY `id_roll_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `size_pizza`
--
ALTER TABLE `size_pizza`
  MODIFY `id_size` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `tipo_pizza`
--
ALTER TABLE `tipo_pizza`
  MODIFY `id_tipo_pizza` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
