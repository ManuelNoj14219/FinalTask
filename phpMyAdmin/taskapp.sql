-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-10-2024 a las 09:04:37
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `taskapp`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `migrations`
--

CREATE TABLE `migrations` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `version` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `group` varchar(255) NOT NULL,
  `namespace` varchar(255) NOT NULL,
  `time` int(11) NOT NULL,
  `batch` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `migrations`
--

INSERT INTO `migrations` (`id`, `version`, `class`, `group`, `namespace`, `time`, `batch`) VALUES
(2, '2024-10-07-160412', 'App\\Database\\Migrations\\CreateTask', 'default', 'App', 1728318768, 1),
(3, '2024-10-07-114500', 'App\\Database\\Migrations\\AddTimestampsToTask', 'default', 'App', 1728320269, 2),
(4, '2024-10-09-074449', 'App\\Database\\Migrations\\CreateUser', 'default', 'App', 1728460713, 3),
(5, '2024-10-11-053558', 'App\\Database\\Migrations\\AddUserIdToTask', 'default', 'App', 1728625985, 4),
(6, '2024-10-11-144204', 'App\\Database\\Migrations\\AddIndexToTaskCreatedAt', 'default', 'App', 1728657980, 5),
(7, '2024-10-14-162005', 'App\\Database\\Migrations\\AddIsAdminToUser', 'default', 'App', 1728923413, 6),
(8, '2024-10-14-195032', 'App\\Database\\Migrations\\AddAccountActivationToUser', 'default', 'App', 1728935939, 7),
(9, '2024-10-15-001741', 'App\\Database\\Migrations\\AddPasswordResetToUser', 'default', 'App', 1728951831, 8),
(10, '2024-10-16-050358', 'App\\Database\\Migrations\\AddProfileImageToUser', 'default', 'App', 1729055236, 9),
(11, '2024-10-16-134112', 'App\\Database\\Migrations\\CreateRememberedLogin', 'default', 'App', 1729086569, 10);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `remembered_login`
--

CREATE TABLE `remembered_login` (
  `token_hash` varchar(64) NOT NULL,
  `user_id` int(5) UNSIGNED NOT NULL,
  `expires_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `task`
--

CREATE TABLE `task` (
  `id` int(5) UNSIGNED NOT NULL,
  `description` varchar(128) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `user_id` int(5) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `task`
--

INSERT INTO `task` (`id`, `description`, `created_at`, `updated_at`, `user_id`) VALUES
(1, 'Task one', NULL, NULL, 1),
(2, 'This task', NULL, NULL, 7),
(3, 'Another task', NULL, NULL, 7),
(4, 'An important task', NULL, NULL, 7),
(5, 'something to do', NULL, NULL, 7),
(6, 'An interesting task', NULL, NULL, 7),
(7, 'An interesting task', NULL, NULL, 7),
(8, '<em>XSS?</em>', NULL, NULL, 7),
(9, 'To do today urgently', NULL, NULL, 7),
(10, 'A task with timestamps edited ', '2024-10-09 04:55:01', '2024-10-09 04:55:52', 7),
(14, 'Something interesting', '2024-10-11 05:05:01', '2024-10-11 05:05:01', 7),
(15, 'A new task', '2024-10-11 14:23:56', '2024-10-11 14:23:56', NULL),
(16, 'a fun task changed', '2024-10-11 14:26:14', '2024-10-11 14:30:11', 7),
(17, 'Urgent task now', '2024-10-11 14:35:53', '2024-10-17 17:04:58', 7),
(18, 'Here is another task', '2024-10-17 05:23:10', '2024-10-17 05:23:10', 7),
(19, 'Hola mundo 1', '2024-10-18 05:33:30', '2024-10-18 05:44:07', 17);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `user`
--

CREATE TABLE `user` (
  `id` int(5) UNSIGNED NOT NULL,
  `name` varchar(128) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `is_admin` tinyint(1) NOT NULL DEFAULT 0,
  `activation_hash` varchar(64) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 0,
  `reset_hash` varchar(64) DEFAULT NULL,
  `reset_expires_at` datetime DEFAULT NULL,
  `profile_image` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `user`
--

INSERT INTO `user` (`id`, `name`, `email`, `password_hash`, `created_at`, `updated_at`, `is_admin`, `activation_hash`, `is_active`, `reset_hash`, `reset_expires_at`, `profile_image`) VALUES
(1, 'David', 'dave@example.com', '$2y$10$Ih6rWz9IwJvcqghAxeI8kuOn9IHuowTeoqOwXm1W7c8TziX901adG', '2024-10-09 08:35:47', '2024-10-14 19:41:41', 0, NULL, 0, NULL, NULL, NULL),
(5, 'Alice', 'alice@example.com', '$2y$10$0J1bDciCvgI7t3QTiVWNOu32rHlekD.LSxfiqT4AhiAVRhWu191NG', '2024-10-10 05:23:48', '2024-10-17 04:26:47', 0, NULL, 0, NULL, NULL, NULL),
(7, 'Mary', 'mary@example.com', '$2y$10$zIg6.qtevG6ioIQKRWApyebOepFEH/z91TCRNzJPeXY7ez5kjBm1G', '2024-10-10 14:17:46', '2024-10-18 07:03:01', 1, NULL, 1, NULL, NULL, '1729234981_eba1c7fe0c062c8a7ee9.jpg'),
(11, 'Admin', 'admin@example.com', '$2y$10$1QnVPmzZRYHXozsZ3pu9DuPCC2Op3NXOd/8clNCwzOhVJd9LIObwu', '2024-10-14 16:55:48', '2024-10-18 07:03:37', 1, NULL, 1, NULL, NULL, '1729235016_c7f3f17547cf431d9a13.jpg'),
(12, 'Another Admin', 'admin2@example.com', '$2y$10$iyzdFeG6zpPYJ0BdGcaLsuWlCSxecmkFBylKcHBlyy8E9TotCyuMO', '2024-10-14 18:18:55', '2024-10-14 18:18:55', 0, NULL, 0, NULL, NULL, NULL),
(13, 'Yet another admin', 'admin3@example.com', '$2y$10$NzJgy1qwfHXRMpIDQiG9qusjrggDtC9FG56c5Rvmza7L/LOGYGxjC', '2024-10-14 18:29:19', '2024-10-14 18:29:19', 1, NULL, 0, NULL, NULL, NULL),
(14, 'ansjdnsaj', 'adasd@jsndjadnasj.sfd', '$2y$10$T.dmRP6vry3AC0y1qWf5bO0V2QrTiduro5TamHBtOWwykLORid9BC', '2024-10-14 19:46:59', '2024-10-14 19:46:59', 0, NULL, 0, NULL, NULL, NULL),
(15, 'Emily', 'emily@example.com', '$2y$10$s4j3oKEB7BbDOv5bUr/1U.fw8at3bHCh7qgCE1lcetrCT0P6k3o0e', '2024-10-14 20:39:11', '2024-10-14 20:39:11', 0, '6466de0e9ddf180e2e9390e1c95649c04fcf994037c8697e50636580b989b320', 1, NULL, NULL, NULL),
(17, 'Anthony', 'tzalamjose69@gmail.com', '$2y$10$ng58lAtU.mU4cmVxmqVUxOeG6p0nrcFgClM0ctayRmRj1DEPWQlIK', '2024-10-14 22:59:51', '2024-10-18 05:48:16', 0, NULL, 1, NULL, NULL, '1729230496_51a0420621562f5ba814.jpg'),
(18, 'And another admin', 'admin4@example.com', '$2y$10$P5rdc6uwZgqd73A3tcpo7uRXS292JcoXu83gG4VPjx0fBbFYw/Pw2', '2024-10-14 23:43:06', '2024-10-14 23:43:29', 0, NULL, 0, NULL, NULL, NULL);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD PRIMARY KEY (`token_hash`),
  ADD KEY `remembered_login_user_id_foreign` (`user_id`),
  ADD KEY `expires_at` (`expires_at`);

--
-- Indices de la tabla `task`
--
ALTER TABLE `task`
  ADD PRIMARY KEY (`id`),
  ADD KEY `task_user_id_fk` (`user_id`),
  ADD KEY `created_at` (`created_at`);

--
-- Indices de la tabla `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `activation_hash` (`activation_hash`),
  ADD UNIQUE KEY `reset_hash` (`reset_hash`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `task`
--
ALTER TABLE `task`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `user`
--
ALTER TABLE `user`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `remembered_login`
--
ALTER TABLE `remembered_login`
  ADD CONSTRAINT `remembered_login_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `task`
--
ALTER TABLE `task`
  ADD CONSTRAINT `task_user_id_fk` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
