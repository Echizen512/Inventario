-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-06-2024 a las 14:01:46
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `sistema`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auditoria`
--

CREATE TABLE `auditoria` (
  `id` int(11) NOT NULL,
  `tabla_afectada` varchar(255) NOT NULL,
  `accion_realizada` varchar(255) NOT NULL,
  `registro_afectado_id` int(11) NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) NOT NULL,
  `cambios_realizados` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `auditoria`
--

INSERT INTO `auditoria` (`id`, `tabla_afectada`, `accion_realizada`, `registro_afectado_id`, `fecha_hora`, `usuario_id`, `cambios_realizados`) VALUES
(2, 'cliente', 'INSERT', 11, '2024-06-01 08:13:20', 1, 'Nuevo registro insertado con ID: 11'),
(3, 'cliente', 'UPDATE', 11, '2024-06-01 08:34:42', 1, 'Registro actualizado con ID: 11'),
(4, 'cliente', 'DELETE', 11, '2024-06-01 08:34:57', 1, 'Registro eliminado con ID: 11'),
(5, 'producto', 'INSERT', 2, '2024-06-01 08:50:22', 1, 'Nuevo registro insertado con ID: 2'),
(6, 'producto', 'UPDATE', 2, '2024-06-01 08:52:39', 1, 'Registro actualizado con ID: 2'),
(7, 'producto', 'DELETE', 2, '2024-06-01 08:52:49', 1, 'Registro eliminado con ID: 2'),
(8, 'configuracion', 'UPDATE', 1, '2024-06-01 08:59:22', 1, 'Registro actualizado con ID: 1'),
(9, 'configuracion', 'UPDATE', 1, '2024-06-01 22:55:44', 1, 'Registro actualizado con ID: 1'),
(10, 'configuracion', 'UPDATE', 1, '2024-06-01 22:55:54', 1, 'Registro actualizado con ID: 1'),
(11, 'configuracion', 'UPDATE', 1, '2024-06-01 22:59:39', 1, 'Registro actualizado con ID: 1'),
(12, 'configuracion', 'UPDATE', 1, '2024-06-01 22:59:46', 1, 'Registro actualizado con ID: 1'),
(13, 'configuracion', 'UPDATE', 1, '2024-06-01 23:00:41', 1, 'Registro actualizado con ID: 1'),
(14, 'configuracion', 'UPDATE', 1, '2024-06-01 23:01:59', 1, 'Registro actualizado con ID: 1'),
(15, 'configuracion', 'UPDATE', 1, '2024-06-01 23:02:19', 1, 'Registro actualizado con ID: 1'),
(16, 'configuracion', 'UPDATE', 1, '2024-06-01 23:02:52', 1, 'Registro actualizado con ID: 1'),
(17, 'producto', 'INSERT', 1, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 1'),
(18, 'producto', 'INSERT', 2, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 2'),
(19, 'producto', 'INSERT', 3, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 3'),
(20, 'producto', 'INSERT', 4, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 4'),
(21, 'producto', 'INSERT', 5, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 5'),
(22, 'producto', 'INSERT', 6, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 6'),
(23, 'producto', 'INSERT', 7, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 7'),
(24, 'producto', 'INSERT', 8, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 8'),
(25, 'producto', 'INSERT', 9, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 9'),
(26, 'producto', 'INSERT', 10, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 10'),
(27, 'producto', 'INSERT', 11, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 11'),
(28, 'producto', 'INSERT', 12, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 12'),
(29, 'producto', 'INSERT', 13, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 13'),
(30, 'producto', 'INSERT', 14, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 14'),
(31, 'producto', 'INSERT', 15, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 15'),
(32, 'producto', 'INSERT', 16, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 16'),
(33, 'producto', 'INSERT', 17, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 17'),
(34, 'producto', 'INSERT', 18, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 18'),
(35, 'producto', 'INSERT', 19, '2024-06-01 23:24:09', 1, 'Nuevo registro insertado con ID: 19'),
(36, 'producto', 'INSERT', 20, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 20'),
(37, 'producto', 'INSERT', 21, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 21'),
(38, 'producto', 'INSERT', 22, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 22'),
(39, 'producto', 'INSERT', 23, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 23'),
(40, 'producto', 'INSERT', 24, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 24'),
(41, 'producto', 'INSERT', 25, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 25'),
(42, 'producto', 'INSERT', 26, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 26'),
(43, 'producto', 'INSERT', 27, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 27'),
(44, 'producto', 'INSERT', 28, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 28'),
(45, 'producto', 'INSERT', 29, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 29'),
(46, 'producto', 'INSERT', 30, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 30'),
(47, 'producto', 'INSERT', 31, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 31'),
(48, 'producto', 'INSERT', 32, '2024-06-01 23:25:12', 1, 'Nuevo registro insertado con ID: 32'),
(49, 'producto', 'INSERT', 33, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 33'),
(50, 'producto', 'INSERT', 34, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 34'),
(51, 'producto', 'INSERT', 35, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 35'),
(52, 'producto', 'INSERT', 36, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 36'),
(53, 'producto', 'INSERT', 37, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 37'),
(54, 'producto', 'INSERT', 38, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 38'),
(55, 'producto', 'INSERT', 39, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 39'),
(56, 'producto', 'INSERT', 40, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 40'),
(57, 'producto', 'INSERT', 41, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 41'),
(58, 'producto', 'INSERT', 42, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 42'),
(59, 'producto', 'INSERT', 43, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 43'),
(60, 'producto', 'INSERT', 44, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 44'),
(61, 'producto', 'INSERT', 45, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 45'),
(62, 'producto', 'INSERT', 46, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 46'),
(63, 'producto', 'INSERT', 47, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 47'),
(64, 'producto', 'INSERT', 48, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 48'),
(65, 'producto', 'INSERT', 49, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 49'),
(66, 'producto', 'INSERT', 50, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 50'),
(67, 'producto', 'INSERT', 51, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 51'),
(68, 'producto', 'INSERT', 52, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 52'),
(69, 'producto', 'INSERT', 53, '2024-06-01 23:26:46', 1, 'Nuevo registro insertado con ID: 53'),
(70, 'producto', 'INSERT', 54, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 54'),
(71, 'producto', 'INSERT', 55, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 55'),
(72, 'producto', 'INSERT', 56, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 56'),
(73, 'producto', 'INSERT', 57, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 57'),
(74, 'producto', 'INSERT', 58, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 58'),
(75, 'producto', 'INSERT', 59, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 59'),
(76, 'producto', 'INSERT', 60, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 60'),
(77, 'producto', 'INSERT', 61, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 61'),
(78, 'producto', 'INSERT', 62, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 62'),
(79, 'producto', 'INSERT', 63, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 63'),
(80, 'producto', 'INSERT', 64, '2024-06-01 23:29:02', 1, 'Nuevo registro insertado con ID: 64'),
(81, 'producto', 'INSERT', 65, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 65'),
(82, 'producto', 'INSERT', 66, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 66'),
(83, 'producto', 'INSERT', 67, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 67'),
(84, 'producto', 'INSERT', 68, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 68'),
(85, 'producto', 'INSERT', 69, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 69'),
(86, 'producto', 'INSERT', 70, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 70'),
(87, 'producto', 'INSERT', 71, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 71'),
(88, 'producto', 'INSERT', 72, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 72'),
(89, 'producto', 'INSERT', 73, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 73'),
(90, 'producto', 'INSERT', 74, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 74'),
(91, 'producto', 'INSERT', 75, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 75'),
(92, 'producto', 'INSERT', 76, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 76'),
(93, 'producto', 'INSERT', 77, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 77'),
(94, 'producto', 'INSERT', 78, '2024-06-01 23:29:49', 1, 'Nuevo registro insertado con ID: 78'),
(95, 'producto', 'INSERT', 79, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 79'),
(96, 'producto', 'INSERT', 80, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 80'),
(97, 'producto', 'INSERT', 81, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 81'),
(98, 'producto', 'INSERT', 82, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 82'),
(99, 'producto', 'INSERT', 83, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 83'),
(100, 'producto', 'INSERT', 84, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 84'),
(101, 'producto', 'INSERT', 85, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 85'),
(102, 'producto', 'INSERT', 86, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 86'),
(103, 'producto', 'INSERT', 87, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 87'),
(104, 'producto', 'INSERT', 88, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 88'),
(105, 'producto', 'INSERT', 89, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 89'),
(106, 'producto', 'INSERT', 90, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 90'),
(107, 'producto', 'INSERT', 91, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 91'),
(108, 'producto', 'INSERT', 92, '2024-06-01 23:30:39', 1, 'Nuevo registro insertado con ID: 92'),
(109, 'producto', 'INSERT', 93, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 93'),
(110, 'producto', 'INSERT', 94, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 94'),
(111, 'producto', 'INSERT', 95, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 95'),
(112, 'producto', 'INSERT', 96, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 96'),
(113, 'producto', 'INSERT', 97, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 97'),
(114, 'producto', 'INSERT', 98, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 98'),
(115, 'producto', 'INSERT', 99, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 99'),
(116, 'producto', 'INSERT', 100, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 100'),
(117, 'producto', 'INSERT', 101, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 101'),
(118, 'producto', 'INSERT', 102, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 102'),
(119, 'producto', 'INSERT', 103, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 103'),
(120, 'producto', 'INSERT', 104, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 104'),
(121, 'producto', 'INSERT', 105, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 105'),
(122, 'producto', 'INSERT', 106, '2024-06-01 23:31:49', 1, 'Nuevo registro insertado con ID: 106'),
(123, 'producto', 'INSERT', 107, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 107'),
(124, 'producto', 'INSERT', 108, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 108'),
(125, 'producto', 'INSERT', 109, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 109'),
(126, 'producto', 'INSERT', 110, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 110'),
(127, 'producto', 'INSERT', 111, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 111'),
(128, 'producto', 'INSERT', 112, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 112'),
(129, 'producto', 'INSERT', 113, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 113'),
(130, 'producto', 'INSERT', 114, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 114'),
(131, 'producto', 'INSERT', 115, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 115'),
(132, 'producto', 'INSERT', 116, '2024-06-01 23:32:33', 1, 'Nuevo registro insertado con ID: 116'),
(133, 'producto', 'INSERT', 117, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 117'),
(134, 'producto', 'INSERT', 118, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 118'),
(135, 'producto', 'INSERT', 119, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 119'),
(136, 'producto', 'INSERT', 120, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 120'),
(137, 'producto', 'INSERT', 121, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 121'),
(138, 'producto', 'INSERT', 122, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 122'),
(139, 'producto', 'INSERT', 123, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 123'),
(140, 'producto', 'INSERT', 124, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 124'),
(141, 'producto', 'INSERT', 125, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 125'),
(142, 'producto', 'INSERT', 126, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 126'),
(143, 'producto', 'INSERT', 127, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 127'),
(144, 'producto', 'INSERT', 128, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 128'),
(145, 'producto', 'INSERT', 129, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 129'),
(146, 'producto', 'INSERT', 130, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 130'),
(147, 'producto', 'INSERT', 131, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 131'),
(148, 'producto', 'INSERT', 132, '2024-06-01 23:33:18', 1, 'Nuevo registro insertado con ID: 132'),
(149, 'producto', 'INSERT', 133, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 133'),
(150, 'producto', 'INSERT', 134, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 134'),
(151, 'producto', 'INSERT', 135, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 135'),
(152, 'producto', 'INSERT', 136, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 136'),
(153, 'producto', 'INSERT', 137, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 137'),
(154, 'producto', 'INSERT', 138, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 138'),
(155, 'producto', 'INSERT', 139, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 139'),
(156, 'producto', 'INSERT', 140, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 140'),
(157, 'producto', 'INSERT', 141, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 141'),
(158, 'producto', 'INSERT', 142, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 142'),
(159, 'producto', 'INSERT', 143, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 143'),
(160, 'producto', 'INSERT', 144, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 144'),
(161, 'producto', 'INSERT', 145, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 145'),
(162, 'producto', 'INSERT', 146, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 146'),
(163, 'producto', 'INSERT', 147, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 147'),
(164, 'producto', 'INSERT', 148, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 148'),
(165, 'producto', 'INSERT', 149, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 149'),
(166, 'producto', 'INSERT', 150, '2024-06-01 23:34:14', 1, 'Nuevo registro insertado con ID: 150'),
(167, 'producto', 'INSERT', 151, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 151'),
(168, 'producto', 'INSERT', 152, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 152'),
(169, 'producto', 'INSERT', 153, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 153'),
(170, 'producto', 'INSERT', 154, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 154'),
(171, 'producto', 'INSERT', 155, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 155'),
(172, 'producto', 'INSERT', 156, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 156'),
(173, 'producto', 'INSERT', 157, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 157'),
(174, 'producto', 'INSERT', 158, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 158'),
(175, 'producto', 'INSERT', 159, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 159'),
(176, 'producto', 'INSERT', 160, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 160'),
(177, 'producto', 'INSERT', 161, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 161'),
(178, 'producto', 'INSERT', 162, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 162'),
(179, 'producto', 'INSERT', 163, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 163'),
(180, 'producto', 'INSERT', 164, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 164'),
(181, 'producto', 'INSERT', 165, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 165'),
(182, 'producto', 'INSERT', 166, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 166'),
(183, 'producto', 'INSERT', 167, '2024-06-01 23:35:28', 1, 'Nuevo registro insertado con ID: 167'),
(184, 'producto', 'INSERT', 168, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 168'),
(185, 'producto', 'INSERT', 169, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 169'),
(186, 'producto', 'INSERT', 170, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 170'),
(187, 'producto', 'INSERT', 171, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 171'),
(188, 'producto', 'INSERT', 172, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 172'),
(189, 'producto', 'INSERT', 173, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 173'),
(190, 'producto', 'INSERT', 174, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 174'),
(191, 'producto', 'INSERT', 175, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 175'),
(192, 'producto', 'INSERT', 176, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 176'),
(193, 'producto', 'INSERT', 177, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 177'),
(194, 'producto', 'INSERT', 178, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 178'),
(195, 'producto', 'INSERT', 179, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 179'),
(196, 'producto', 'INSERT', 180, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 180'),
(197, 'producto', 'INSERT', 181, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 181'),
(198, 'producto', 'INSERT', 182, '2024-06-01 23:36:22', 1, 'Nuevo registro insertado con ID: 182'),
(199, 'producto', 'INSERT', 183, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 183'),
(200, 'producto', 'INSERT', 184, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 184'),
(201, 'producto', 'INSERT', 185, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 185'),
(202, 'producto', 'INSERT', 186, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 186'),
(203, 'producto', 'INSERT', 187, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 187'),
(204, 'producto', 'INSERT', 188, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 188'),
(205, 'producto', 'INSERT', 189, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 189'),
(206, 'producto', 'INSERT', 190, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 190'),
(207, 'producto', 'INSERT', 191, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 191'),
(208, 'producto', 'INSERT', 192, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 192'),
(209, 'producto', 'INSERT', 193, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 193'),
(210, 'producto', 'INSERT', 194, '2024-06-01 23:37:04', 1, 'Nuevo registro insertado con ID: 194'),
(211, 'cliente', 'INSERT', 1, '2024-06-01 23:38:09', 1, 'Nuevo registro insertado con ID: 1'),
(212, 'producto', 'UPDATE', 1, '2024-06-01 23:38:52', 1, 'Registro actualizado con ID: 1'),
(213, 'producto', 'UPDATE', 1, '2024-06-01 23:50:09', 1, 'Registro actualizado con ID: 1'),
(214, 'producto', 'UPDATE', 1, '2024-06-01 23:53:48', 1, 'Registro actualizado con ID: 1'),
(215, 'producto', 'UPDATE', 1, '2024-06-01 23:56:53', 1, 'Registro actualizado con ID: 1'),
(216, 'cliente', 'INSERT', 1, '2024-06-02 07:51:42', 1, 'Nuevo registro insertado con ID: 1'),
(217, 'cliente', 'INSERT', 2, '2024-06-02 07:52:47', 1, 'Nuevo registro insertado con ID: 2'),
(218, 'cliente', 'INSERT', 3, '2024-06-02 07:53:50', 1, 'Nuevo registro insertado con ID: 3'),
(219, 'configuracion', 'UPDATE', 1, '2024-06-02 07:55:35', 1, 'Registro actualizado con ID: 1'),
(220, 'configuracion', 'UPDATE', 1, '2024-06-02 07:55:50', 1, 'Registro actualizado con ID: 1'),
(221, 'usuario', 'UPDATE', 1, '2024-06-02 07:59:03', 1, 'Registro actualizado con ID: 1'),
(222, 'producto', 'UPDATE', 116, '2024-06-02 08:00:30', 1, 'Registro actualizado con ID: 116');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idcliente` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `cedula` varchar(20) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`idcliente`, `nombre`, `telefono`, `direccion`, `email`, `cedula`, `idUser`) VALUES
(1, 'Arley Dos Santos', '04124407966', 'Zuata, La Victoria', 'arleyds29@gmail.com', '30578057', 1),
(2, 'Carlos Escobar', '04243562464', 'La Victoria', 'carlescobar47@gmail.com', '30459848', 1),
(3, 'Christian Toro', '04120367383', 'La Vcitoria', 'chrstiantoro23@gmail.com', '30644099', 1);

--
-- Disparadores `cliente`
--
DELIMITER $$
CREATE TRIGGER `trg_cliente` AFTER INSERT ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('cliente', 'INSERT', NEW.idcliente, NEW.idUser, CONCAT('Nuevo registro insertado con ID: ', NEW.idcliente));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_cliente_delete` AFTER DELETE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('cliente', 'DELETE', OLD.idcliente, OLD.idUser, CONCAT('Registro eliminado con ID: ', OLD.idcliente));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_cliente_update` AFTER UPDATE ON `cliente` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('cliente', 'UPDATE', NEW.idcliente, NEW.idUser, CONCAT('Registro actualizado con ID: ', NEW.idcliente));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `configuracion`
--

CREATE TABLE `configuracion` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` text NOT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`, `idUser`) VALUES
(1, 'Mi Bendición', '04120498117', 'farmaciamibendicion.ca@gmail.com', 'Zuata, La Victoria', 1);

--
-- Disparadores `configuracion`
--
DELIMITER $$
CREATE TRIGGER `trg_configuracion_update` AFTER UPDATE ON `configuracion` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('configuracion', 'UPDATE', NEW.id, NEW.idUser, CONCAT('Registro actualizado con ID: ', NEW.id));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_permisos`
--

CREATE TABLE `detalle_permisos` (
  `id` int(11) NOT NULL,
  `id_permiso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_temp`
--

CREATE TABLE `detalle_temp` (
  `id` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio_venta` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_venta`
--

CREATE TABLE `detalle_venta` (
  `id` int(11) NOT NULL,
  `id_producto` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` decimal(10,2) NOT NULL DEFAULT 0.00,
  `precio` decimal(10,2) NOT NULL,
  `total` decimal(10,2) NOT NULL DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_venta`
--

INSERT INTO `detalle_venta` (`id`, `id_producto`, `id_venta`, `cantidad`, `descuento`, `precio`, `total`) VALUES
(15, 1, 8, 1, 0.00, 1500.00, 1500.00),
(16, 1, 9, 1, 0.00, 100.00, 100.00),
(17, 1, 10, 12, 0.00, 100.00, 1200.00),
(18, 1, 11, 5, 0.00, 100.00, 500.00),
(19, 1, 12, 15, 0.00, 100.00, 1500.00),
(20, 1, 13, 1, 0.00, 100.00, 100.00),
(21, 1, 14, 1, 0.00, 100.00, 100.00),
(22, 1, 16, 1, 0.00, 100.00, 100.00),
(23, 1, 17, 1, 0.00, 100.00, 100.00),
(24, 1, 18, 1, 0.00, 100.00, 100.00),
(25, 1, 19, 4, 0.00, 100.00, 400.00),
(26, 1, 20, 1, 0.00, 100.00, 100.00),
(27, 1, 21, 10, 0.00, 100.00, 1000.00),
(28, 1, 22, 3, 0.00, 100.00, 300.00),
(29, 1, 24, 1, 0.00, 100.00, 100.00),
(30, 1, 1, 10, 0.00, 330.92, 3309.20),
(31, 1, 2, 1, 0.00, 330.92, 330.92),
(32, 1, 3, 1, 0.00, 330.92, 330.92),
(33, 1, 4, 1, 0.00, 330.92, 330.92),
(34, 116, 1, 4, 0.00, 306.00, 1224.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

CREATE TABLE `permisos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`id`, `nombre`) VALUES
(1, 'configuración'),
(2, 'usuarios'),
(3, 'clientes'),
(4, 'productos'),
(5, 'ventas'),
(6, 'nueva_venta'),
(7, 'auditoria');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `codproducto` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `existencia` int(11) NOT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `idUser`) VALUES
(1, '7326541098', 'acetaminofén anaty x 120ml', 330.92, 179, 1),
(2, '8901234567', 'ácido folico 10 mg tab x 30 klinos', 824.40, 249, 1),
(3, '2345678901', 'ácido folico meyer 10mg x 20comp', 755.23, 8, 1),
(4, '4567890123', 'ácido folico plus andex 10mg x 20comp', 919.78, 299, 1),
(5, '6789012345', 'ácido folico plus andex 10mg x 30comp', 228.81, 223, 1),
(6, '7890123456', 'adhesivo tela 2\" (5cm)', 419.35, 46, 1),
(7, '9876543210', 'afoklin gotas x 15 ml klinos', 1378.40, 51, 1),
(8, '4321098765', 'alantamida 20gr crema', 125.40, 263, 1),
(9, '6543210987', 'albisec 166.66mg/33.33 mg cap x 12 vivax', 246.96, 50, 1),
(10, '8765432109', 'alipal dia y noche x 6caps', 513.58, 63, 1),
(11, '2109876543', 'amoxicilina cap 500 mg x 12 cap lister fénix', 45.41, 148, 1),
(12, '5432109876', 'amoxicilina pvo susp 250mg/5ml x 45ml lister fénix', 590.62, 145, 1),
(13, '9876543210', 'amoxiduo 750 mg susp x 70 ml klinos', 363.01, 223, 1),
(14, '2345678901', 'amoxiduo 875 mg com x 14 klinos', 11.70, 232, 1),
(15, '4567890123', 'amylin 750 mg susp x 70 ml klinos', 1305.19, 15, 1),
(16, '6789012345', 'amylin 875 mg tab x 14 rowe', 923.35, 282, 1),
(17, '7890123456', 'angrip dia com x 6 klinos', 1266.97, 128, 1),
(18, '8901234567', 'angrip noche com x 3 klinos', 872.33, 190, 1),
(19, '2345678901', 'aplicador c/algodon x 100 und', 641.51, 69, 1),
(20, '0987654321', 'baycuten 20gr crema', 144.81, 184, 1),
(21, '7890123456', 'beducen 80gr en crema', 1194.75, 48, 1),
(22, '5678901234', 'betagen sospen ampolla', 586.94, 142, 1),
(23, '3456789012', 'biotalol 5mg x 10comp', 309.08, 176, 1),
(24, '1234567890', 'bral 500mg x 20tab', 500.07, 268, 1),
(25, '4321098765', 'brane 600mg x 10comp', 709.63, 205, 1),
(26, '2109876543', 'brasartan 80mg x 10tab', 12.26, 286, 1),
(27, '6543210987', 'brolat 5mg/30mg x 10tab', 1156.23, 2, 1),
(28, '8765432109', 'brudol 200mg x 20comp', 1048.12, 148, 1),
(29, '8901234567', 'brudol 400mg x 20comp', 538.11, 92, 1),
(30, '2345678901', 'brugesic 200mg x 10comp', 701.04, 124, 1),
(31, '4567890123', 'brugesic 200mg x 20comp', 986.74, 19, 1),
(32, '6789012345', 'butilamina compuesta x 20grag', 508.77, 148, 1),
(33, '1234567890', 'canesfast crema 1% 30gr', 695.86, 277, 1),
(34, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1),
(35, '3456789012', 'cevax 500 mg (vit c) cap x 30 vivax', 564.03, 185, 1),
(36, '4567890123', 'ciclokan 500 mg/5 ml x 1 amp klinos', 1430.29, 284, 1),
(37, '5678901234', 'ciproxina 500mg x 6tab', 1289.25, 143, 1),
(38, '6789012345', 'ciproxina 750mg x 6tab', 1173.21, 151, 1),
(39, '7890123456', 'clenbuxol jbe pediatrico 120 ml klinos', 237.67, 79, 1),
(40, '8901234567', 'clopidogrel 75mg x 14 tab vivax', 1266.88, 138, 1),
(41, '9012345678', 'colypan 200mg x 10comp', 1121.62, 113, 1),
(42, '0123456789', 'coropres 16 mg x 30 comp klinos', 938.81, 3, 1),
(43, '1029384756', 'coropres 8 mg x 30 comp klinos', 252.81, 237, 1),
(44, '9876543210', 'cyprodin 4 mg com x 30 klinos', 704.15, 290, 1),
(45, '8765432109', 'dayflu dia 500/10/2 mg cap x 10 vivax', 653.63, 81, 1),
(46, '7654321098', 'dayflu noche 500/2 mg cap x 10 vivax', 71.63, 120, 1),
(47, '6543210987', 'deconfen gel 1.16% x 40gr', 1308.28, 56, 1),
(48, '5432109876', 'dencorub ice 80gr', 442.71, 272, 1),
(49, '4321098765', 'diaformina 1000 mg x 30 com rec klinos', 987.02, 173, 1),
(50, '3210987654', 'diclodex 50mg x 10comp', 1358.95, 246, 1),
(51, '2109876543', 'diclodex 50mg x 20comp', 566.96, 125, 1),
(52, '1098765432', 'diclofenac sodico 50mg tab x 30 vivax', 1411.60, 147, 1),
(53, '9876543210', 'difen plus 50mg x 10comp', 907.78, 169, 1),
(54, '1122334455', 'diglet 1000mg x 30comp', 689.87, 43, 1),
(55, '2233445566', 'dioxogen roll on desodorante 90gr', 510.39, 78, 1),
(56, '3344556677', 'disodex 50mg x 20comp', 438.54, 199, 1),
(57, '4455667788', 'dologinex 125/10 mg x 20 com klinos', 688.77, 89, 1),
(58, '5566778899', 'dorixina flex 125/5 mg com x 10 klinos', 169.80, 195, 1),
(59, '6677889900', 'ducha fem vaginal x 135ml', 1377.34, 201, 1),
(60, '7788990011', 'ducha fem vaginal x 250mg/10ml', 871.25, 269, 1),
(61, '8899001122', 'enalapril 20 mg tab x 30 vivax', 1107.64, 5, 1),
(62, '9900112233', 'enalapril 20mg x 30tab genven', 1273.89, 67, 1),
(63, '0011223344', 'enalapril 20mg x 30tab plusandex', 825.16, 26, 1),
(64, '7788119922', 'erilon crema tubo 15gr', 1163.06, 191, 1),
(65, '6677001122', 'farma d 1000und x 30tab', 1196.16, 196, 1),
(66, '7788002233', 'febratic 10 mg jbe x 120 ml klinos', 1290.57, 109, 1),
(67, '8899003344', 'ferganic 40 mg/15 ml jbe x 120 ml klinos', 345.41, 12, 1),
(68, '9900004455', 'ferganic folic jbe x 120 ml klinos', 777.56, 142, 1),
(69, '0011225566', 'ferroce con b12 jbe x 120ml', 1214.97, 194, 1),
(70, '1122336677', 'fitex 20mg x 1tab', 1196.41, 19, 1),
(71, '2233447788', 'flodont ungüento bucal x 15 gr klinos', 1347.02, 100, 1),
(72, '3344558899', 'flomed topico bucal 180ml', 1415.77, 226, 1),
(73, '4455669900', 'flucon 200 mg cap x 4', 1366.45, 97, 1),
(74, '5566770011', 'fluconazol 150mg 2caps', 1290.66, 107, 1),
(75, '6677881122', 'flutixair 250-50mcg x 120 aer inh klinos', 294.49, 266, 1),
(76, '7788992233', 'fugolin al 1% 100ml x 30ml sol.', 1289.35, 197, 1),
(77, '8899003344', 'furosemida 40mg x 12tab', 1037.25, 149, 1),
(78, '9900114455', 'furoxil suspensión 90ml', 613.56, 163, 1),
(79, '1122334477', 'gasa esteril 4x4 sobre x 2', 1437.90, 276, 1),
(80, '2233445577', 'gencivol 150mg-150mg x 15ml sol', 1059.86, 235, 1),
(81, '3344556677', 'gerdex 240ml frasco (reg)', 1186.14, 186, 1),
(82, '4455667778', 'ginacol sol vaginal 135cc', 1067.88, 214, 1),
(83, '5566778899', 'givotan 100 mg susp x 30 ml klinos', 644.57, 299, 1),
(84, '6677889900', 'givotan 100 mg susp x 60 ml klinos', 1065.87, 170, 1),
(85, '7788990011', 'givotan 500 mg com x 6 klinos', 1040.47, 234, 1),
(86, '8899001122', 'glymar 2mg x 20tab', 1206.05, 211, 1),
(87, '9900112233', 'glymar 4mg x 20tab', 140.70, 100, 1),
(88, '0011223344', 'guante esteril talla 8', 608.93, 7, 1),
(89, '1122334455', 'gyno canesten 3 tab vaginales', 1333.28, 122, 1),
(90, '2233445566', 'gyno canesten crema vaginal x tratamiento 3dias', 522.02, 154, 1),
(91, '3344556677', 'gyno canesten dual crema compuesta', 788.79, 28, 1),
(92, '4455667788', 'gynotran crema vaginal 40gr', 1318.79, 44, 1),
(93, '1122334466', 'hepafol b12 jarabe 120ml', 790.07, 283, 1),
(94, '2233445577', 'hexant 30 mg elixir x 120 ml klinos', 229.56, 271, 1),
(95, '3344556688', 'ibandromet 150mg x 1tab meyer', 121.02, 199, 1),
(96, '4455667799', 'ibutan suspensión 200mg/5 x 60ml', 143.38, 138, 1),
(97, '5566778800', 'ilana 600 mg cap blanda vaginal x 1 vivax', 65.10, 240, 1),
(98, '6677889900', 'imazol 1% polvo x 20gr', 1336.40, 23, 1),
(99, '7788990011', 'imazol solucion 20cc', 1035.72, 71, 1),
(100, '8899001122', 'inyectadora 1cc (insulina 29g x 1/2)', 161.14, 240, 1),
(101, '9900112233', 'inyectadora 20cc', 1050.21, 33, 1),
(102, '0011223344', 'inyectadora 5cc (21gx1 1/2)', 653.71, 254, 1),
(103, '1122334455', 'ipatrixair 20mcg/dosis x 200 aer inh klinos', 1398.51, 44, 1),
(104, '2233445566', 'jelco 18g', 1358.33, 36, 1),
(105, '3344556677', 'jelco 22g', 1291.77, 291, 1),
(106, '4455667788', 'jelco 24g', 388.59, 110, 1),
(107, '1212121212', 'kayivis gel gel 5gr', 431.69, 262, 1),
(108, '2323232323', 'ketoprofeno 10mg x 10tab plus andex', 780.21, 293, 1),
(109, '3434343434', 'kleartos 8 mg cap x 10 vivax', 488.73, 206, 1),
(110, '4545454545', 'lactibon fem locion x 240 ml klinos', 693.93, 76, 1),
(111, '5656565656', 'letisan gotas ped x 20ml', 1296.09, 177, 1),
(112, '6767676767', 'levoferin sol 30mg/5ml x 90ml', 530.43, 294, 1),
(113, '7878787878', 'linazer granulado x 15 sobres', 1283.39, 106, 1),
(114, '8989898989', 'liolactil x 6 sobres', 280.47, 256, 1),
(115, '9090909090', 'lipontal 900mg x 10tab', 1088.43, 24, 1),
(116, '1010101010', 'loratadina genven 10mg x 20comp', 306.00, 226, 1),
(117, '1234123412', 'macrodantina 50mg x 30caps', 786.68, 155, 1),
(118, '2345234523', 'macrogotero', 29.00, 154, 1),
(119, '3456345634', 'mailen 2.5 mg jbe x 50 ml klinos', 780.90, 21, 1),
(120, '4567456745', 'mailen 5 mg comp x 10 klinos', 1166.00, 210, 1),
(121, '5678567856', 'martesia 75 mg cap x 14 klinos', 236.00, 200, 1),
(122, '6789678967', 'meloxicam 7.5mg x 10tab', 1300.01, 108, 1),
(123, '7890789078', 'microgotero', 286.20, 255, 1),
(124, '8901890189', 'migraval 100 mg com x 2 klinos', 1047.78, 284, 1),
(125, '9012901290', 'migren comp 650/50mg x 20tab', 962.04, 111, 1),
(126, '1013101310', 'misellim 10 mg com x 20 klinos', 1358.66, 136, 1),
(127, '1124112411', 'misulvan gotas 7.5mg x 30ml', 786.27, 81, 1),
(128, '1235123512', 'naproxen 550 mg tab x 10 vivax', 1141.13, 6, 1),
(129, '1346134613', 'nasin gotas adulto x 15cc', 1195.13, 284, 1),
(130, '1457145714', 'nasin gotas ped x 15cc', 507.30, 251, 1),
(131, '1568156815', 'normix 200mg x 12tab', 272.54, 113, 1),
(132, '1679167916', 'nytaxin 500 mg cap x 6 vivax', 522.62, 181, 1),
(133, '2315231523', 'obturador (tapa jelco)', 422.59, 167, 1),
(134, '3426342634', 'ofaflan suspensión 2mg/ml x 120ml', 1423.23, 30, 1),
(135, '4537453745', 'pamezone 20 mg cap x 14 klinos', 948.03, 261, 1),
(136, '5648564856', 'pamezone 40 mg cap x 14 klinos', 673.58, 189, 1),
(137, '6759675967', 'papaveryl gotas 10mg/15mg', 1215.70, 54, 1),
(138, '7860786078', 'perebron frambuesa adulto 50mg/5ml', 666.09, 205, 1),
(139, '8971897189', 'perebron frambuesa ped 50mg/5ml', 144.41, 121, 1),
(140, '9082908290', 'perten crema 1% 20gr', 1099.05, 142, 1),
(141, '1013101310', 'plexamin jarabe 120ml', 252.31, 119, 1),
(142, '1124112411', 'plidan 10 mg gotas x 20 ml klinos', 732.32, 76, 1),
(143, '1235123512', 'plidan compuesto 10 mg com x 10 klinos', 1193.34, 72, 1),
(144, '1346134613', 'poenflox (ofloxacina) 0,3g/10 ml klinos', 1192.55, 83, 1),
(145, '1457145714', 'poentobral 0,3% got x 5 ml klinos', 1468.43, 30, 1),
(146, '1568156815', 'poentobral plus gotas x 5 ml klinos', 797.20, 110, 1),
(147, '1679167916', 'poli-otico gotas otica x 5 ml klinos', 360.95, 26, 1),
(148, '1790179017', 'propanolol 40mg x 20comp plus andex', 1073.22, 100, 1),
(149, '1801180118', 'prospan jbe x 100 ml klinos', 772.61, 172, 1),
(150, '1912191219', 'provin polivitaminico x 20tab', 490.55, 270, 1),
(151, '2902290229', 'racor 10mg x 30comp', 120.60, 142, 1),
(152, '3903390339', 'recolector heces', 210.93, 79, 1),
(153, '4904490449', 'recolector orina', 1352.27, 224, 1),
(154, '5905590559', 'recolector orina ped', 24.69, 243, 1),
(155, '6906690669', 'ridal 2 mg com x 20 klinos', 48.76, 209, 1),
(156, '7907790779', 'ridal 3 mg com x 20 klinos', 614.26, 284, 1),
(157, '8908890889', 'ridal 1mg/ml gotas x 20 ml klinos', 781.99, 228, 1),
(158, '9909990999', 'roweluk 10 mg x 30 com klinos', 359.53, 270, 1),
(159, '1010101010', 'roweluk 5 mg x 30 com klinos', 1183.18, 79, 1),
(160, '1111111111', 'rowetos jbe x 120 ml klinos', 1394.60, 266, 1),
(161, '1212121212', 'sax soluc vaginal x 135ml', 958.78, 161, 1),
(162, '1313131313', 'saxacid solc vaginal 135ml', 1135.35, 58, 1),
(163, '1414141414', 'scalp #21', 1012.64, 243, 1),
(164, '1515151515', 'scalp #23', 52.06, 211, 1),
(165, '1616161616', 'scalp #25', 665.45, 30, 1),
(166, '1717171717', 'secnivax 500 mg susp x 18 ml vivax', 244.93, 150, 1),
(167, '1818181818', 'sesaren xr 150 mg cap x 15 klinos', 54.63, 194, 1),
(168, '2222222222', 'sildex 50mg x 1tab plus andex', 1151.73, 114, 1),
(169, '2323232323', 'sinutil jarabe 325mg-32mg x 90ml', 866.84, 227, 1),
(170, '2424242424', 'solunovar sol x 30ml', 94.29, 3, 1),
(171, '2525252525', 'tachiforte 1gr x 20tab', 1299.90, 100, 1),
(172, '2626262626', 'tachipirin forte tabletas x 10', 79.57, 72, 1),
(173, '2727272727', 'tachipirin forte tabletas x 20', 82.75, 159, 1),
(174, '2828282828', 'tachipirin supositorio pediatrico 250mg x 6', 766.16, 287, 1),
(175, '2929292929', 'tadifil 20 mg com x 1 klinos', 402.26, 134, 1),
(176, '3030303030', 'talzic gotas 20cc', 657.43, 254, 1),
(177, '3131313131', 'tantum enjuague bucal', 1380.85, 27, 1),
(178, '3232323232', 'tantum spray topico bucal', 989.24, 14, 1),
(179, '3333333333', 'tapa boca 4 tiras', 357.91, 13, 1),
(180, '3434343434', 'teragrip fort tratamiento x 4 dias', 767.15, 128, 1),
(181, '3535353535', 'teragrip forte dia x 36 sobres', 904.60, 221, 1),
(182, '3636363636', 'teragrip forte x 6 sobres dia', 1313.12, 56, 1),
(183, '3737373737', 'tilodrin jarabe 120ml', 151.05, 72, 1),
(184, '3838383838', 'tolnaftan crema x 30 gr klinos', 1353.18, 246, 1),
(185, '3939393939', 'tolnaftan gotas x 15 ml klinos', 580.95, 139, 1),
(186, '4040404040', 'trittico 50mg x 30tab', 249.46, 125, 1),
(187, '4141414141', 'ulcon 1gr x 20 tab', 901.12, 227, 1),
(188, '4242424242', 'valeriana x 60 grageas', 1466.14, 193, 1),
(189, '4343434343', 'virosupril 5% cre x 5 gr klinos', 416.53, 131, 1),
(190, '4444444444', 'vitamina c 100/5ml mg jbe x 120 ml klinos', 548.77, 152, 1),
(191, '4545454545', 'vitamina b12 1ml x 3 amp klinos', 667.84, 210, 1),
(192, '4646464646', 'vitamina k-1 10 mg/ml 2.5 amp x 3 klinos', 259.99, 223, 1),
(193, '4747474747', 'wampole tuti-fruti 240cc', 319.28, 244, 1),
(194, '4848484848', 'wampole tuti-fruti 360cc', 676.36, 241, 1);

--
-- Disparadores `producto`
--
DELIMITER $$
CREATE TRIGGER `trg_producto` AFTER INSERT ON `producto` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('producto', 'INSERT', NEW.codproducto, NEW.idUser, CONCAT('Nuevo registro insertado con ID: ', NEW.codproducto));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_producto_delete` AFTER DELETE ON `producto` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('producto', 'DELETE', OLD.codproducto, OLD.idUser, CONCAT('Registro eliminado con ID: ', OLD.codproducto));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_producto_update` AFTER UPDATE ON `producto` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('producto', 'UPDATE', NEW.codproducto, NEW.idUser, CONCAT('Registro actualizado con ID: ', NEW.codproducto));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `idusuario` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `usuario` varchar(20) NOT NULL,
  `clave` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`idusuario`, `nombre`, `correo`, `usuario`, `clave`) VALUES
(1, 'Gerente', 'farmaciamibendicion.ca@gmail.com', 'admin', '21232f297a57a5a743894a0e4a801fc3');

--
-- Disparadores `usuario`
--
DELIMITER $$
CREATE TRIGGER `trg_usuario` AFTER INSERT ON `usuario` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('usuario', 'INSERT', NEW.idusuario, NEW.idusuario, CONCAT('Nuevo registro insertado con ID: ', NEW.idusuario));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_usuario_delete` AFTER DELETE ON `usuario` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('usuario', 'DELETE', OLD.idusuario, OLD.idusuario, CONCAT('Registro eliminado con ID: ', OLD.idusuario));
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_usuario_update` AFTER UPDATE ON `usuario` FOR EACH ROW BEGIN
    INSERT INTO auditoria (tabla_afectada, accion_realizada, registro_afectado_id, usuario_id, cambios_realizados)
    VALUES ('usuario', 'UPDATE', NEW.idusuario, NEW.idusuario, CONCAT('Registro actualizado con ID: ', NEW.idusuario));
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `id_cliente` int(11) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`) VALUES
(1, 1, 1224.00, 1, '2024-06-02 12:00:30');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idcliente`);

--
-- Indices de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_permiso` (`id_permiso`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_producto` (`id_producto`);

--
-- Indices de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_producto` (`id_producto`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`codproducto`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`idusuario`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_cliente` (`id_cliente`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `auditoria`
--
ALTER TABLE `auditoria`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=223;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `configuracion`
--
ALTER TABLE `configuracion`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=195;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `detalle_permisos`
--
ALTER TABLE `detalle_permisos`
  ADD CONSTRAINT `detalle_permisos_ibfk_1` FOREIGN KEY (`id_permiso`) REFERENCES `permisos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_permisos_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_temp`
--
ALTER TABLE `detalle_temp`
  ADD CONSTRAINT `detalle_temp_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_temp_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  ADD CONSTRAINT `detalle_venta_ibfk_1` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`codproducto`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_venta_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`idcliente`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`idusuario`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
