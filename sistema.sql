-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 19-12-2024 a las 17:03:50
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
(222, 'producto', 'UPDATE', 116, '2024-06-02 08:00:30', 1, 'Registro actualizado con ID: 116'),
(223, 'producto', 'UPDATE', 1, '2024-11-07 21:51:30', 1, 'Registro actualizado con ID: 1'),
(224, 'producto', 'UPDATE', 1, '2024-11-07 21:59:51', 1, 'Registro actualizado con ID: 1'),
(225, 'producto', 'UPDATE', 1, '2024-11-07 22:00:32', 1, 'Registro actualizado con ID: 1'),
(226, 'producto', 'UPDATE', 1, '2024-11-07 22:04:05', 1, 'Registro actualizado con ID: 1'),
(227, 'producto', 'UPDATE', 1, '2024-11-07 22:06:55', 1, 'Registro actualizado con ID: 1'),
(228, 'producto', 'UPDATE', 1, '2024-11-07 22:12:19', 1, 'Registro actualizado con ID: 1'),
(229, 'producto', 'UPDATE', 1, '2024-11-07 22:19:30', 1, 'Registro actualizado con ID: 1'),
(230, 'producto', 'UPDATE', 96, '2024-11-08 06:26:05', 1, 'Registro actualizado con ID: 96'),
(231, 'producto', 'UPDATE', 96, '2024-11-08 06:26:52', 1, 'Registro actualizado con ID: 96'),
(232, 'producto', 'UPDATE', 96, '2024-11-08 06:28:43', 1, 'Registro actualizado con ID: 96'),
(233, 'producto', 'UPDATE', 96, '2024-11-08 06:37:55', 1, 'Registro actualizado con ID: 96'),
(234, 'producto', 'UPDATE', 36, '2024-11-08 06:42:03', 1, 'Registro actualizado con ID: 36'),
(235, 'producto', 'UPDATE', 189, '2024-11-08 06:43:03', 1, 'Registro actualizado con ID: 189'),
(236, 'producto', 'UPDATE', 6, '2024-11-08 07:04:06', 1, 'Registro actualizado con ID: 6'),
(237, 'configuracion', 'UPDATE', 1, '2024-11-19 21:58:37', 1, 'Registro actualizado con ID: 1'),
(238, 'producto', 'UPDATE', 1, '2024-12-03 10:55:15', 1, 'Registro actualizado con ID: 1'),
(239, 'configuracion', 'UPDATE', 1, '2024-12-03 11:02:59', 1, 'Registro actualizado con ID: 1'),
(240, 'producto', 'UPDATE', 1, '2024-12-03 11:07:23', 1, 'Registro actualizado con ID: 1'),
(241, 'producto', 'UPDATE', 55, '2024-12-03 11:45:55', 1, 'Registro actualizado con ID: 55'),
(242, 'producto', 'UPDATE', 1, '2024-12-03 12:07:23', 1, 'Registro actualizado con ID: 1'),
(243, 'producto', 'UPDATE', 1, '2024-12-03 12:09:26', 1, 'Registro actualizado con ID: 1'),
(244, 'producto', 'UPDATE', 1, '2024-12-03 12:10:43', 1, 'Registro actualizado con ID: 1'),
(245, 'producto', 'UPDATE', 1, '2024-12-03 12:12:23', 1, 'Registro actualizado con ID: 1'),
(246, 'producto', 'UPDATE', 190, '2024-12-03 12:48:34', 1, 'Registro actualizado con ID: 190'),
(247, 'producto', 'UPDATE', 192, '2024-12-03 18:52:07', 1, 'Registro actualizado con ID: 192'),
(248, 'producto', 'UPDATE', 190, '2024-12-03 18:54:41', 1, 'Registro actualizado con ID: 190'),
(249, 'producto', 'UPDATE', 150, '2024-12-03 18:56:35', 1, 'Registro actualizado con ID: 150'),
(250, 'producto', 'UPDATE', 35, '2024-12-03 19:01:27', 1, 'Registro actualizado con ID: 35'),
(251, 'producto', 'UPDATE', 55, '2024-12-03 19:06:03', 1, 'Registro actualizado con ID: 55'),
(252, 'producto', 'UPDATE', 150, '2024-12-04 16:18:08', 1, 'Registro actualizado con ID: 150'),
(253, 'producto', 'UPDATE', 191, '2024-12-04 16:19:45', 1, 'Registro actualizado con ID: 191'),
(254, 'producto', 'UPDATE', 55, '2024-12-04 16:20:19', 1, 'Registro actualizado con ID: 55'),
(255, 'producto', 'UPDATE', 190, '2024-12-04 16:23:09', 1, 'Registro actualizado con ID: 190'),
(256, 'producto', 'UPDATE', 192, '2024-12-04 16:24:59', 1, 'Registro actualizado con ID: 192'),
(257, 'producto', 'UPDATE', 55, '2024-12-04 16:26:32', 1, 'Registro actualizado con ID: 55'),
(258, 'producto', 'UPDATE', 150, '2024-12-04 16:53:29', 1, 'Registro actualizado con ID: 150'),
(259, 'producto', 'UPDATE', 150, '2024-12-04 16:53:44', 1, 'Registro actualizado con ID: 150'),
(260, 'producto', 'UPDATE', 47, '2024-12-04 16:58:28', 1, 'Registro actualizado con ID: 47'),
(261, 'producto', 'UPDATE', 150, '2024-12-04 17:03:05', 1, 'Registro actualizado con ID: 150'),
(262, 'producto', 'UPDATE', 190, '2024-12-04 17:04:51', 1, 'Registro actualizado con ID: 190'),
(263, 'producto', 'UPDATE', 150, '2024-12-04 17:16:14', 1, 'Registro actualizado con ID: 150'),
(264, 'producto', 'UPDATE', 190, '2024-12-04 17:24:07', 1, 'Registro actualizado con ID: 190'),
(265, 'producto', 'UPDATE', 190, '2024-12-04 17:30:30', 1, 'Registro actualizado con ID: 190'),
(266, 'producto', 'UPDATE', 190, '2024-12-04 17:36:44', 1, 'Registro actualizado con ID: 190'),
(267, 'producto', 'UPDATE', 190, '2024-12-04 17:44:57', 1, 'Registro actualizado con ID: 190'),
(268, 'producto', 'UPDATE', 150, '2024-12-04 17:46:54', 1, 'Registro actualizado con ID: 150'),
(269, 'producto', 'UPDATE', 150, '2024-12-04 18:00:55', 1, 'Registro actualizado con ID: 150'),
(270, 'producto', 'UPDATE', 150, '2024-12-04 18:01:56', 1, 'Registro actualizado con ID: 150'),
(271, 'producto', 'UPDATE', 150, '2024-12-04 18:03:45', 1, 'Registro actualizado con ID: 150'),
(272, 'producto', 'UPDATE', 150, '2024-12-04 18:09:03', 1, 'Registro actualizado con ID: 150'),
(273, 'producto', 'UPDATE', 150, '2024-12-04 18:14:09', 1, 'Registro actualizado con ID: 150'),
(274, 'producto', 'UPDATE', 35, '2024-12-04 18:14:52', 1, 'Registro actualizado con ID: 35'),
(275, 'producto', 'UPDATE', 35, '2024-12-04 18:17:30', 1, 'Registro actualizado con ID: 35'),
(276, 'producto', 'UPDATE', 190, '2024-12-05 10:29:35', 1, 'Registro actualizado con ID: 190'),
(277, 'producto', 'UPDATE', 35, '2024-12-05 10:29:35', 1, 'Registro actualizado con ID: 35'),
(278, 'producto', 'UPDATE', 1, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 1'),
(279, 'producto', 'UPDATE', 2, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 2'),
(280, 'producto', 'UPDATE', 18, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 18'),
(281, 'producto', 'UPDATE', 29, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 29'),
(282, 'producto', 'UPDATE', 40, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 40'),
(283, 'producto', 'UPDATE', 3, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 3'),
(284, 'producto', 'UPDATE', 14, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 14'),
(285, 'producto', 'UPDATE', 19, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 19'),
(286, 'producto', 'UPDATE', 30, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 30'),
(287, 'producto', 'UPDATE', 34, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 34'),
(288, 'producto', 'UPDATE', 4, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 4'),
(289, 'producto', 'UPDATE', 15, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 15'),
(290, 'producto', 'UPDATE', 31, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 31'),
(291, 'producto', 'UPDATE', 36, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 36'),
(292, 'producto', 'UPDATE', 5, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 5'),
(293, 'producto', 'UPDATE', 16, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 16'),
(294, 'producto', 'UPDATE', 32, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 32'),
(295, 'producto', 'UPDATE', 38, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 38'),
(296, 'producto', 'UPDATE', 6, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 6'),
(297, 'producto', 'UPDATE', 17, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 17'),
(298, 'producto', 'UPDATE', 21, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 21'),
(299, 'producto', 'UPDATE', 39, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 39'),
(300, 'producto', 'UPDATE', 7, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 7'),
(301, 'producto', 'UPDATE', 13, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 13'),
(302, 'producto', 'UPDATE', 44, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 44'),
(303, 'producto', 'UPDATE', 53, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 53'),
(304, 'producto', 'UPDATE', 8, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 8'),
(305, 'producto', 'UPDATE', 25, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 25'),
(306, 'producto', 'UPDATE', 49, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 49'),
(307, 'producto', 'UPDATE', 9, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 9'),
(308, 'producto', 'UPDATE', 27, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 27'),
(309, 'producto', 'UPDATE', 47, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 47'),
(310, 'producto', 'UPDATE', 10, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 10'),
(311, 'producto', 'UPDATE', 28, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 28'),
(312, 'producto', 'UPDATE', 45, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 45'),
(313, 'producto', 'UPDATE', 11, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 11'),
(314, 'producto', 'UPDATE', 26, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 26'),
(315, 'producto', 'UPDATE', 51, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 51'),
(316, 'producto', 'UPDATE', 12, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 12'),
(317, 'producto', 'UPDATE', 48, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 48'),
(318, 'producto', 'UPDATE', 7, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 7'),
(319, 'producto', 'UPDATE', 13, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 13'),
(320, 'producto', 'UPDATE', 44, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 44'),
(321, 'producto', 'UPDATE', 53, '2024-12-11 08:31:13', 1, 'Registro actualizado con ID: 53'),
(322, 'producto', 'UPDATE', 3, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 3'),
(323, 'producto', 'UPDATE', 14, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 14'),
(324, 'producto', 'UPDATE', 19, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 19'),
(325, 'producto', 'UPDATE', 30, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 30'),
(326, 'producto', 'UPDATE', 34, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 34'),
(327, 'producto', 'UPDATE', 4, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 4'),
(328, 'producto', 'UPDATE', 15, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 15'),
(329, 'producto', 'UPDATE', 31, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 31'),
(330, 'producto', 'UPDATE', 36, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 36'),
(331, 'producto', 'UPDATE', 5, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 5'),
(332, 'producto', 'UPDATE', 16, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 16'),
(333, 'producto', 'UPDATE', 32, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 32'),
(334, 'producto', 'UPDATE', 38, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 38'),
(335, 'producto', 'UPDATE', 6, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 6'),
(336, 'producto', 'UPDATE', 17, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 17'),
(337, 'producto', 'UPDATE', 21, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 21'),
(338, 'producto', 'UPDATE', 39, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 39'),
(339, 'producto', 'UPDATE', 2, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 2'),
(340, 'producto', 'UPDATE', 18, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 18'),
(341, 'producto', 'UPDATE', 29, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 29'),
(342, 'producto', 'UPDATE', 40, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 40'),
(343, 'producto', 'UPDATE', 3, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 3'),
(344, 'producto', 'UPDATE', 14, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 14'),
(345, 'producto', 'UPDATE', 19, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 19'),
(346, 'producto', 'UPDATE', 30, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 30'),
(347, 'producto', 'UPDATE', 34, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 34'),
(348, 'producto', 'UPDATE', 20, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 20'),
(349, 'producto', 'UPDATE', 6, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 6'),
(350, 'producto', 'UPDATE', 17, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 17'),
(351, 'producto', 'UPDATE', 21, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 21'),
(352, 'producto', 'UPDATE', 39, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 39'),
(353, 'producto', 'UPDATE', 22, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 22'),
(354, 'producto', 'UPDATE', 37, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 37'),
(355, 'producto', 'UPDATE', 23, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 23'),
(356, 'producto', 'UPDATE', 35, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 35'),
(357, 'producto', 'UPDATE', 24, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 24'),
(358, 'producto', 'UPDATE', 33, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 33'),
(359, 'producto', 'UPDATE', 8, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 8'),
(360, 'producto', 'UPDATE', 25, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 25'),
(361, 'producto', 'UPDATE', 49, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 49'),
(362, 'producto', 'UPDATE', 11, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 11'),
(363, 'producto', 'UPDATE', 26, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 26'),
(364, 'producto', 'UPDATE', 51, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 51'),
(365, 'producto', 'UPDATE', 9, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 9'),
(366, 'producto', 'UPDATE', 27, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 27'),
(367, 'producto', 'UPDATE', 47, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 47'),
(368, 'producto', 'UPDATE', 10, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 10'),
(369, 'producto', 'UPDATE', 28, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 28'),
(370, 'producto', 'UPDATE', 45, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 45'),
(371, 'producto', 'UPDATE', 2, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 2'),
(372, 'producto', 'UPDATE', 18, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 18'),
(373, 'producto', 'UPDATE', 29, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 29'),
(374, 'producto', 'UPDATE', 40, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 40'),
(375, 'producto', 'UPDATE', 3, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 3'),
(376, 'producto', 'UPDATE', 14, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 14'),
(377, 'producto', 'UPDATE', 19, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 19'),
(378, 'producto', 'UPDATE', 30, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 30'),
(379, 'producto', 'UPDATE', 34, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 34'),
(380, 'producto', 'UPDATE', 4, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 4'),
(381, 'producto', 'UPDATE', 15, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 15'),
(382, 'producto', 'UPDATE', 31, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 31'),
(383, 'producto', 'UPDATE', 36, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 36'),
(384, 'producto', 'UPDATE', 5, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 5'),
(385, 'producto', 'UPDATE', 16, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 16'),
(386, 'producto', 'UPDATE', 32, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 32'),
(387, 'producto', 'UPDATE', 38, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 38'),
(388, 'producto', 'UPDATE', 24, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 24'),
(389, 'producto', 'UPDATE', 33, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 33'),
(390, 'producto', 'UPDATE', 3, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 3'),
(391, 'producto', 'UPDATE', 14, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 14'),
(392, 'producto', 'UPDATE', 19, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 19'),
(393, 'producto', 'UPDATE', 30, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 30'),
(394, 'producto', 'UPDATE', 34, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 34'),
(395, 'producto', 'UPDATE', 23, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 23'),
(396, 'producto', 'UPDATE', 35, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 35'),
(397, 'producto', 'UPDATE', 4, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 4'),
(398, 'producto', 'UPDATE', 15, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 15'),
(399, 'producto', 'UPDATE', 31, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 31'),
(400, 'producto', 'UPDATE', 36, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 36'),
(401, 'producto', 'UPDATE', 22, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 22'),
(402, 'producto', 'UPDATE', 37, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 37'),
(403, 'producto', 'UPDATE', 5, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 5'),
(404, 'producto', 'UPDATE', 16, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 16'),
(405, 'producto', 'UPDATE', 32, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 32'),
(406, 'producto', 'UPDATE', 38, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 38'),
(407, 'producto', 'UPDATE', 6, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 6'),
(408, 'producto', 'UPDATE', 17, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 17'),
(409, 'producto', 'UPDATE', 21, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 21'),
(410, 'producto', 'UPDATE', 39, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 39'),
(411, 'producto', 'UPDATE', 2, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 2'),
(412, 'producto', 'UPDATE', 18, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 18'),
(413, 'producto', 'UPDATE', 29, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 29'),
(414, 'producto', 'UPDATE', 40, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 40'),
(415, 'producto', 'UPDATE', 41, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 41'),
(416, 'producto', 'UPDATE', 42, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 42'),
(417, 'producto', 'UPDATE', 43, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 43'),
(418, 'producto', 'UPDATE', 7, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 7'),
(419, 'producto', 'UPDATE', 13, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 13'),
(420, 'producto', 'UPDATE', 44, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 44'),
(421, 'producto', 'UPDATE', 53, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 53'),
(422, 'producto', 'UPDATE', 10, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 10'),
(423, 'producto', 'UPDATE', 28, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 28'),
(424, 'producto', 'UPDATE', 45, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 45'),
(425, 'producto', 'UPDATE', 46, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 46'),
(426, 'producto', 'UPDATE', 9, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 9'),
(427, 'producto', 'UPDATE', 27, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 27'),
(428, 'producto', 'UPDATE', 47, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 47'),
(429, 'producto', 'UPDATE', 12, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 12'),
(430, 'producto', 'UPDATE', 48, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 48'),
(431, 'producto', 'UPDATE', 8, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 8'),
(432, 'producto', 'UPDATE', 25, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 25'),
(433, 'producto', 'UPDATE', 49, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 49'),
(434, 'producto', 'UPDATE', 50, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 50'),
(435, 'producto', 'UPDATE', 11, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 11'),
(436, 'producto', 'UPDATE', 26, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 26'),
(437, 'producto', 'UPDATE', 51, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 51'),
(438, 'producto', 'UPDATE', 52, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 52'),
(439, 'producto', 'UPDATE', 7, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 7'),
(440, 'producto', 'UPDATE', 13, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 13'),
(441, 'producto', 'UPDATE', 44, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 44'),
(442, 'producto', 'UPDATE', 53, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 53'),
(443, 'producto', 'UPDATE', 54, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 54'),
(444, 'producto', 'UPDATE', 89, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 89'),
(445, 'producto', 'UPDATE', 103, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 103'),
(446, 'producto', 'UPDATE', 55, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 55'),
(447, 'producto', 'UPDATE', 90, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 90'),
(448, 'producto', 'UPDATE', 104, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 104'),
(449, 'producto', 'UPDATE', 56, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 56'),
(450, 'producto', 'UPDATE', 81, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 81'),
(451, 'producto', 'UPDATE', 91, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 91'),
(452, 'producto', 'UPDATE', 105, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 105'),
(453, 'producto', 'UPDATE', 57, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 57'),
(454, 'producto', 'UPDATE', 92, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 92'),
(455, 'producto', 'UPDATE', 106, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 106'),
(456, 'producto', 'UPDATE', 58, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 58'),
(457, 'producto', 'UPDATE', 83, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 83'),
(458, 'producto', 'UPDATE', 59, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 59'),
(459, 'producto', 'UPDATE', 84, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 84'),
(460, 'producto', 'UPDATE', 98, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 98'),
(461, 'producto', 'UPDATE', 60, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 60'),
(462, 'producto', 'UPDATE', 85, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 85'),
(463, 'producto', 'UPDATE', 99, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 99'),
(464, 'producto', 'UPDATE', 61, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 61'),
(465, 'producto', 'UPDATE', 86, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 86'),
(466, 'producto', 'UPDATE', 100, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 100'),
(467, 'producto', 'UPDATE', 62, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 62'),
(468, 'producto', 'UPDATE', 87, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 87'),
(469, 'producto', 'UPDATE', 101, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 101'),
(470, 'producto', 'UPDATE', 63, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 63'),
(471, 'producto', 'UPDATE', 88, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 88'),
(472, 'producto', 'UPDATE', 102, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 102'),
(473, 'producto', 'UPDATE', 64, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 64'),
(474, 'producto', 'UPDATE', 65, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 65'),
(475, 'producto', 'UPDATE', 66, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 66'),
(476, 'producto', 'UPDATE', 67, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 67'),
(477, 'producto', 'UPDATE', 77, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 77'),
(478, 'producto', 'UPDATE', 68, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 68'),
(479, 'producto', 'UPDATE', 69, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 69'),
(480, 'producto', 'UPDATE', 70, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 70'),
(481, 'producto', 'UPDATE', 71, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 71'),
(482, 'producto', 'UPDATE', 72, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 72'),
(483, 'producto', 'UPDATE', 73, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 73'),
(484, 'producto', 'UPDATE', 74, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 74'),
(485, 'producto', 'UPDATE', 75, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 75'),
(486, 'producto', 'UPDATE', 76, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 76'),
(487, 'producto', 'UPDATE', 67, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 67'),
(488, 'producto', 'UPDATE', 77, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 77'),
(489, 'producto', 'UPDATE', 78, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 78'),
(490, 'producto', 'UPDATE', 79, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 79'),
(491, 'producto', 'UPDATE', 80, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 80'),
(492, 'producto', 'UPDATE', 94, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 94'),
(493, 'producto', 'UPDATE', 56, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 56'),
(494, 'producto', 'UPDATE', 81, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 81'),
(495, 'producto', 'UPDATE', 91, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 91'),
(496, 'producto', 'UPDATE', 105, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 105'),
(497, 'producto', 'UPDATE', 82, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 82'),
(498, 'producto', 'UPDATE', 58, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 58'),
(499, 'producto', 'UPDATE', 83, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 83'),
(500, 'producto', 'UPDATE', 59, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 59'),
(501, 'producto', 'UPDATE', 84, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 84'),
(502, 'producto', 'UPDATE', 98, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 98'),
(503, 'producto', 'UPDATE', 60, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 60'),
(504, 'producto', 'UPDATE', 85, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 85'),
(505, 'producto', 'UPDATE', 99, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 99'),
(506, 'producto', 'UPDATE', 61, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 61'),
(507, 'producto', 'UPDATE', 86, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 86'),
(508, 'producto', 'UPDATE', 100, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 100'),
(509, 'producto', 'UPDATE', 62, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 62'),
(510, 'producto', 'UPDATE', 87, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 87'),
(511, 'producto', 'UPDATE', 101, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 101'),
(512, 'producto', 'UPDATE', 63, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 63'),
(513, 'producto', 'UPDATE', 88, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 88'),
(514, 'producto', 'UPDATE', 102, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 102'),
(515, 'producto', 'UPDATE', 54, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 54'),
(516, 'producto', 'UPDATE', 89, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 89'),
(517, 'producto', 'UPDATE', 103, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 103'),
(518, 'producto', 'UPDATE', 55, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 55'),
(519, 'producto', 'UPDATE', 90, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 90'),
(520, 'producto', 'UPDATE', 104, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 104'),
(521, 'producto', 'UPDATE', 56, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 56'),
(522, 'producto', 'UPDATE', 81, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 81'),
(523, 'producto', 'UPDATE', 91, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 91'),
(524, 'producto', 'UPDATE', 105, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 105'),
(525, 'producto', 'UPDATE', 57, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 57'),
(526, 'producto', 'UPDATE', 92, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 92'),
(527, 'producto', 'UPDATE', 106, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 106'),
(528, 'producto', 'UPDATE', 93, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 93'),
(529, 'producto', 'UPDATE', 80, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 80'),
(530, 'producto', 'UPDATE', 94, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 94'),
(531, 'producto', 'UPDATE', 95, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 95'),
(532, 'producto', 'UPDATE', 96, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 96'),
(533, 'producto', 'UPDATE', 97, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 97');
INSERT INTO `auditoria` (`id`, `tabla_afectada`, `accion_realizada`, `registro_afectado_id`, `fecha_hora`, `usuario_id`, `cambios_realizados`) VALUES
(534, 'producto', 'UPDATE', 59, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 59'),
(535, 'producto', 'UPDATE', 84, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 84'),
(536, 'producto', 'UPDATE', 98, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 98'),
(537, 'producto', 'UPDATE', 60, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 60'),
(538, 'producto', 'UPDATE', 85, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 85'),
(539, 'producto', 'UPDATE', 99, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 99'),
(540, 'producto', 'UPDATE', 61, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 61'),
(541, 'producto', 'UPDATE', 86, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 86'),
(542, 'producto', 'UPDATE', 100, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 100'),
(543, 'producto', 'UPDATE', 62, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 62'),
(544, 'producto', 'UPDATE', 87, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 87'),
(545, 'producto', 'UPDATE', 101, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 101'),
(546, 'producto', 'UPDATE', 63, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 63'),
(547, 'producto', 'UPDATE', 88, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 88'),
(548, 'producto', 'UPDATE', 102, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 102'),
(549, 'producto', 'UPDATE', 54, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 54'),
(550, 'producto', 'UPDATE', 89, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 89'),
(551, 'producto', 'UPDATE', 103, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 103'),
(552, 'producto', 'UPDATE', 55, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 55'),
(553, 'producto', 'UPDATE', 90, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 90'),
(554, 'producto', 'UPDATE', 104, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 104'),
(555, 'producto', 'UPDATE', 56, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 56'),
(556, 'producto', 'UPDATE', 81, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 81'),
(557, 'producto', 'UPDATE', 91, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 91'),
(558, 'producto', 'UPDATE', 105, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 105'),
(559, 'producto', 'UPDATE', 57, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 57'),
(560, 'producto', 'UPDATE', 92, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 92'),
(561, 'producto', 'UPDATE', 106, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 106'),
(562, 'producto', 'UPDATE', 107, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 107'),
(563, 'producto', 'UPDATE', 161, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 161'),
(564, 'producto', 'UPDATE', 108, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 108'),
(565, 'producto', 'UPDATE', 169, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 169'),
(566, 'producto', 'UPDATE', 109, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 109'),
(567, 'producto', 'UPDATE', 180, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 180'),
(568, 'producto', 'UPDATE', 110, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 110'),
(569, 'producto', 'UPDATE', 191, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 191'),
(570, 'producto', 'UPDATE', 111, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 111'),
(571, 'producto', 'UPDATE', 112, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 112'),
(572, 'producto', 'UPDATE', 113, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 113'),
(573, 'producto', 'UPDATE', 114, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 114'),
(574, 'producto', 'UPDATE', 115, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 115'),
(575, 'producto', 'UPDATE', 116, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 116'),
(576, 'producto', 'UPDATE', 159, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 159'),
(577, 'producto', 'UPDATE', 117, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 117'),
(578, 'producto', 'UPDATE', 118, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 118'),
(579, 'producto', 'UPDATE', 119, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 119'),
(580, 'producto', 'UPDATE', 120, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 120'),
(581, 'producto', 'UPDATE', 121, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 121'),
(582, 'producto', 'UPDATE', 122, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 122'),
(583, 'producto', 'UPDATE', 123, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 123'),
(584, 'producto', 'UPDATE', 124, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 124'),
(585, 'producto', 'UPDATE', 125, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 125'),
(586, 'producto', 'UPDATE', 126, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 126'),
(587, 'producto', 'UPDATE', 141, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 141'),
(588, 'producto', 'UPDATE', 127, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 127'),
(589, 'producto', 'UPDATE', 142, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 142'),
(590, 'producto', 'UPDATE', 128, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 128'),
(591, 'producto', 'UPDATE', 143, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 143'),
(592, 'producto', 'UPDATE', 129, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 129'),
(593, 'producto', 'UPDATE', 144, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 144'),
(594, 'producto', 'UPDATE', 130, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 130'),
(595, 'producto', 'UPDATE', 145, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 145'),
(596, 'producto', 'UPDATE', 131, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 131'),
(597, 'producto', 'UPDATE', 146, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 146'),
(598, 'producto', 'UPDATE', 132, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 132'),
(599, 'producto', 'UPDATE', 147, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 147'),
(600, 'producto', 'UPDATE', 133, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 133'),
(601, 'producto', 'UPDATE', 134, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 134'),
(602, 'producto', 'UPDATE', 135, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 135'),
(603, 'producto', 'UPDATE', 136, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 136'),
(604, 'producto', 'UPDATE', 137, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 137'),
(605, 'producto', 'UPDATE', 138, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 138'),
(606, 'producto', 'UPDATE', 139, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 139'),
(607, 'producto', 'UPDATE', 140, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 140'),
(608, 'producto', 'UPDATE', 126, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 126'),
(609, 'producto', 'UPDATE', 141, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 141'),
(610, 'producto', 'UPDATE', 127, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 127'),
(611, 'producto', 'UPDATE', 142, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 142'),
(612, 'producto', 'UPDATE', 128, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 128'),
(613, 'producto', 'UPDATE', 143, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 143'),
(614, 'producto', 'UPDATE', 129, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 129'),
(615, 'producto', 'UPDATE', 144, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 144'),
(616, 'producto', 'UPDATE', 130, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 130'),
(617, 'producto', 'UPDATE', 145, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 145'),
(618, 'producto', 'UPDATE', 131, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 131'),
(619, 'producto', 'UPDATE', 146, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 146'),
(620, 'producto', 'UPDATE', 132, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 132'),
(621, 'producto', 'UPDATE', 147, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 147'),
(622, 'producto', 'UPDATE', 148, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 148'),
(623, 'producto', 'UPDATE', 149, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 149'),
(624, 'producto', 'UPDATE', 150, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 150'),
(625, 'producto', 'UPDATE', 151, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 151'),
(626, 'producto', 'UPDATE', 152, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 152'),
(627, 'producto', 'UPDATE', 153, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 153'),
(628, 'producto', 'UPDATE', 154, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 154'),
(629, 'producto', 'UPDATE', 155, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 155'),
(630, 'producto', 'UPDATE', 156, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 156'),
(631, 'producto', 'UPDATE', 157, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 157'),
(632, 'producto', 'UPDATE', 158, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 158'),
(633, 'producto', 'UPDATE', 116, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 116'),
(634, 'producto', 'UPDATE', 159, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 159'),
(635, 'producto', 'UPDATE', 160, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 160'),
(636, 'producto', 'UPDATE', 107, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 107'),
(637, 'producto', 'UPDATE', 161, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 161'),
(638, 'producto', 'UPDATE', 162, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 162'),
(639, 'producto', 'UPDATE', 163, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 163'),
(640, 'producto', 'UPDATE', 164, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 164'),
(641, 'producto', 'UPDATE', 165, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 165'),
(642, 'producto', 'UPDATE', 166, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 166'),
(643, 'producto', 'UPDATE', 167, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 167'),
(644, 'producto', 'UPDATE', 168, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 168'),
(645, 'producto', 'UPDATE', 108, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 108'),
(646, 'producto', 'UPDATE', 169, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 169'),
(647, 'producto', 'UPDATE', 170, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 170'),
(648, 'producto', 'UPDATE', 171, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 171'),
(649, 'producto', 'UPDATE', 172, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 172'),
(650, 'producto', 'UPDATE', 173, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 173'),
(651, 'producto', 'UPDATE', 174, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 174'),
(652, 'producto', 'UPDATE', 175, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 175'),
(653, 'producto', 'UPDATE', 176, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 176'),
(654, 'producto', 'UPDATE', 177, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 177'),
(655, 'producto', 'UPDATE', 178, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 178'),
(656, 'producto', 'UPDATE', 179, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 179'),
(657, 'producto', 'UPDATE', 109, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 109'),
(658, 'producto', 'UPDATE', 180, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 180'),
(659, 'producto', 'UPDATE', 181, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 181'),
(660, 'producto', 'UPDATE', 182, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 182'),
(661, 'producto', 'UPDATE', 183, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 183'),
(662, 'producto', 'UPDATE', 184, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 184'),
(663, 'producto', 'UPDATE', 185, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 185'),
(664, 'producto', 'UPDATE', 186, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 186'),
(665, 'producto', 'UPDATE', 187, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 187'),
(666, 'producto', 'UPDATE', 188, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 188'),
(667, 'producto', 'UPDATE', 189, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 189'),
(668, 'producto', 'UPDATE', 190, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 190'),
(669, 'producto', 'UPDATE', 110, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 110'),
(670, 'producto', 'UPDATE', 191, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 191'),
(671, 'producto', 'UPDATE', 192, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 192'),
(672, 'producto', 'UPDATE', 193, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 193'),
(673, 'producto', 'UPDATE', 194, '2024-12-11 08:31:14', 1, 'Registro actualizado con ID: 194'),
(674, 'producto', 'UPDATE', 1, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 1'),
(675, 'producto', 'UPDATE', 2, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 2'),
(676, 'producto', 'UPDATE', 18, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 18'),
(677, 'producto', 'UPDATE', 29, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 29'),
(678, 'producto', 'UPDATE', 40, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 40'),
(679, 'producto', 'UPDATE', 3, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 3'),
(680, 'producto', 'UPDATE', 14, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 14'),
(681, 'producto', 'UPDATE', 19, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 19'),
(682, 'producto', 'UPDATE', 30, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 30'),
(683, 'producto', 'UPDATE', 34, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 34'),
(684, 'producto', 'UPDATE', 4, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 4'),
(685, 'producto', 'UPDATE', 15, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 15'),
(686, 'producto', 'UPDATE', 31, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 31'),
(687, 'producto', 'UPDATE', 36, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 36'),
(688, 'producto', 'UPDATE', 5, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 5'),
(689, 'producto', 'UPDATE', 16, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 16'),
(690, 'producto', 'UPDATE', 32, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 32'),
(691, 'producto', 'UPDATE', 38, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 38'),
(692, 'producto', 'UPDATE', 6, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 6'),
(693, 'producto', 'UPDATE', 17, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 17'),
(694, 'producto', 'UPDATE', 21, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 21'),
(695, 'producto', 'UPDATE', 39, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 39'),
(696, 'producto', 'UPDATE', 7, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 7'),
(697, 'producto', 'UPDATE', 13, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 13'),
(698, 'producto', 'UPDATE', 44, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 44'),
(699, 'producto', 'UPDATE', 53, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 53'),
(700, 'producto', 'UPDATE', 8, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 8'),
(701, 'producto', 'UPDATE', 25, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 25'),
(702, 'producto', 'UPDATE', 49, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 49'),
(703, 'producto', 'UPDATE', 9, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 9'),
(704, 'producto', 'UPDATE', 27, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 27'),
(705, 'producto', 'UPDATE', 47, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 47'),
(706, 'producto', 'UPDATE', 10, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 10'),
(707, 'producto', 'UPDATE', 28, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 28'),
(708, 'producto', 'UPDATE', 45, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 45'),
(709, 'producto', 'UPDATE', 11, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 11'),
(710, 'producto', 'UPDATE', 26, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 26'),
(711, 'producto', 'UPDATE', 51, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 51'),
(712, 'producto', 'UPDATE', 12, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 12'),
(713, 'producto', 'UPDATE', 48, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 48'),
(714, 'producto', 'UPDATE', 7, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 7'),
(715, 'producto', 'UPDATE', 13, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 13'),
(716, 'producto', 'UPDATE', 44, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 44'),
(717, 'producto', 'UPDATE', 53, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 53'),
(718, 'producto', 'UPDATE', 3, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 3'),
(719, 'producto', 'UPDATE', 14, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 14'),
(720, 'producto', 'UPDATE', 19, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 19'),
(721, 'producto', 'UPDATE', 30, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 30'),
(722, 'producto', 'UPDATE', 34, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 34'),
(723, 'producto', 'UPDATE', 4, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 4'),
(724, 'producto', 'UPDATE', 15, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 15'),
(725, 'producto', 'UPDATE', 31, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 31'),
(726, 'producto', 'UPDATE', 36, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 36'),
(727, 'producto', 'UPDATE', 5, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 5'),
(728, 'producto', 'UPDATE', 16, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 16'),
(729, 'producto', 'UPDATE', 32, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 32'),
(730, 'producto', 'UPDATE', 38, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 38'),
(731, 'producto', 'UPDATE', 6, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 6'),
(732, 'producto', 'UPDATE', 17, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 17'),
(733, 'producto', 'UPDATE', 21, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 21'),
(734, 'producto', 'UPDATE', 39, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 39'),
(735, 'producto', 'UPDATE', 2, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 2'),
(736, 'producto', 'UPDATE', 18, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 18'),
(737, 'producto', 'UPDATE', 29, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 29'),
(738, 'producto', 'UPDATE', 40, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 40'),
(739, 'producto', 'UPDATE', 3, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 3'),
(740, 'producto', 'UPDATE', 14, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 14'),
(741, 'producto', 'UPDATE', 19, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 19'),
(742, 'producto', 'UPDATE', 30, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 30'),
(743, 'producto', 'UPDATE', 34, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 34'),
(744, 'producto', 'UPDATE', 20, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 20'),
(745, 'producto', 'UPDATE', 6, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 6'),
(746, 'producto', 'UPDATE', 17, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 17'),
(747, 'producto', 'UPDATE', 21, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 21'),
(748, 'producto', 'UPDATE', 39, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 39'),
(749, 'producto', 'UPDATE', 22, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 22'),
(750, 'producto', 'UPDATE', 37, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 37'),
(751, 'producto', 'UPDATE', 23, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 23'),
(752, 'producto', 'UPDATE', 35, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 35'),
(753, 'producto', 'UPDATE', 24, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 24'),
(754, 'producto', 'UPDATE', 33, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 33'),
(755, 'producto', 'UPDATE', 8, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 8'),
(756, 'producto', 'UPDATE', 25, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 25'),
(757, 'producto', 'UPDATE', 49, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 49'),
(758, 'producto', 'UPDATE', 11, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 11'),
(759, 'producto', 'UPDATE', 26, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 26'),
(760, 'producto', 'UPDATE', 51, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 51'),
(761, 'producto', 'UPDATE', 9, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 9'),
(762, 'producto', 'UPDATE', 27, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 27'),
(763, 'producto', 'UPDATE', 47, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 47'),
(764, 'producto', 'UPDATE', 10, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 10'),
(765, 'producto', 'UPDATE', 28, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 28'),
(766, 'producto', 'UPDATE', 45, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 45'),
(767, 'producto', 'UPDATE', 2, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 2'),
(768, 'producto', 'UPDATE', 18, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 18'),
(769, 'producto', 'UPDATE', 29, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 29'),
(770, 'producto', 'UPDATE', 40, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 40'),
(771, 'producto', 'UPDATE', 3, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 3'),
(772, 'producto', 'UPDATE', 14, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 14'),
(773, 'producto', 'UPDATE', 19, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 19'),
(774, 'producto', 'UPDATE', 30, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 30'),
(775, 'producto', 'UPDATE', 34, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 34'),
(776, 'producto', 'UPDATE', 4, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 4'),
(777, 'producto', 'UPDATE', 15, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 15'),
(778, 'producto', 'UPDATE', 31, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 31'),
(779, 'producto', 'UPDATE', 36, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 36'),
(780, 'producto', 'UPDATE', 5, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 5'),
(781, 'producto', 'UPDATE', 16, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 16'),
(782, 'producto', 'UPDATE', 32, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 32'),
(783, 'producto', 'UPDATE', 38, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 38'),
(784, 'producto', 'UPDATE', 24, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 24'),
(785, 'producto', 'UPDATE', 33, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 33'),
(786, 'producto', 'UPDATE', 3, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 3'),
(787, 'producto', 'UPDATE', 14, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 14'),
(788, 'producto', 'UPDATE', 19, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 19'),
(789, 'producto', 'UPDATE', 30, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 30'),
(790, 'producto', 'UPDATE', 34, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 34'),
(791, 'producto', 'UPDATE', 23, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 23'),
(792, 'producto', 'UPDATE', 35, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 35'),
(793, 'producto', 'UPDATE', 4, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 4'),
(794, 'producto', 'UPDATE', 15, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 15'),
(795, 'producto', 'UPDATE', 31, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 31'),
(796, 'producto', 'UPDATE', 36, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 36'),
(797, 'producto', 'UPDATE', 22, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 22'),
(798, 'producto', 'UPDATE', 37, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 37'),
(799, 'producto', 'UPDATE', 5, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 5'),
(800, 'producto', 'UPDATE', 16, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 16'),
(801, 'producto', 'UPDATE', 32, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 32'),
(802, 'producto', 'UPDATE', 38, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 38'),
(803, 'producto', 'UPDATE', 6, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 6'),
(804, 'producto', 'UPDATE', 17, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 17'),
(805, 'producto', 'UPDATE', 21, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 21'),
(806, 'producto', 'UPDATE', 39, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 39'),
(807, 'producto', 'UPDATE', 2, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 2'),
(808, 'producto', 'UPDATE', 18, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 18'),
(809, 'producto', 'UPDATE', 29, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 29'),
(810, 'producto', 'UPDATE', 40, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 40'),
(811, 'producto', 'UPDATE', 41, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 41'),
(812, 'producto', 'UPDATE', 42, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 42'),
(813, 'producto', 'UPDATE', 43, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 43'),
(814, 'producto', 'UPDATE', 7, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 7'),
(815, 'producto', 'UPDATE', 13, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 13'),
(816, 'producto', 'UPDATE', 44, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 44'),
(817, 'producto', 'UPDATE', 53, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 53'),
(818, 'producto', 'UPDATE', 10, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 10'),
(819, 'producto', 'UPDATE', 28, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 28'),
(820, 'producto', 'UPDATE', 45, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 45'),
(821, 'producto', 'UPDATE', 46, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 46'),
(822, 'producto', 'UPDATE', 9, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 9'),
(823, 'producto', 'UPDATE', 27, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 27'),
(824, 'producto', 'UPDATE', 47, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 47'),
(825, 'producto', 'UPDATE', 12, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 12'),
(826, 'producto', 'UPDATE', 48, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 48'),
(827, 'producto', 'UPDATE', 8, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 8'),
(828, 'producto', 'UPDATE', 25, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 25'),
(829, 'producto', 'UPDATE', 49, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 49'),
(830, 'producto', 'UPDATE', 50, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 50'),
(831, 'producto', 'UPDATE', 11, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 11'),
(832, 'producto', 'UPDATE', 26, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 26'),
(833, 'producto', 'UPDATE', 51, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 51'),
(834, 'producto', 'UPDATE', 52, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 52'),
(835, 'producto', 'UPDATE', 7, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 7'),
(836, 'producto', 'UPDATE', 13, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 13'),
(837, 'producto', 'UPDATE', 44, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 44'),
(838, 'producto', 'UPDATE', 53, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 53'),
(839, 'producto', 'UPDATE', 54, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 54'),
(840, 'producto', 'UPDATE', 89, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 89'),
(841, 'producto', 'UPDATE', 103, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 103'),
(842, 'producto', 'UPDATE', 55, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 55'),
(843, 'producto', 'UPDATE', 90, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 90'),
(844, 'producto', 'UPDATE', 104, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 104'),
(845, 'producto', 'UPDATE', 56, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 56'),
(846, 'producto', 'UPDATE', 81, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 81'),
(847, 'producto', 'UPDATE', 91, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 91'),
(848, 'producto', 'UPDATE', 105, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 105'),
(849, 'producto', 'UPDATE', 57, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 57'),
(850, 'producto', 'UPDATE', 92, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 92'),
(851, 'producto', 'UPDATE', 106, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 106'),
(852, 'producto', 'UPDATE', 58, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 58'),
(853, 'producto', 'UPDATE', 83, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 83'),
(854, 'producto', 'UPDATE', 59, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 59'),
(855, 'producto', 'UPDATE', 84, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 84'),
(856, 'producto', 'UPDATE', 98, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 98'),
(857, 'producto', 'UPDATE', 60, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 60'),
(858, 'producto', 'UPDATE', 85, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 85'),
(859, 'producto', 'UPDATE', 99, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 99'),
(860, 'producto', 'UPDATE', 61, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 61'),
(861, 'producto', 'UPDATE', 86, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 86'),
(862, 'producto', 'UPDATE', 100, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 100'),
(863, 'producto', 'UPDATE', 62, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 62'),
(864, 'producto', 'UPDATE', 87, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 87'),
(865, 'producto', 'UPDATE', 101, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 101'),
(866, 'producto', 'UPDATE', 63, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 63'),
(867, 'producto', 'UPDATE', 88, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 88'),
(868, 'producto', 'UPDATE', 102, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 102'),
(869, 'producto', 'UPDATE', 64, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 64'),
(870, 'producto', 'UPDATE', 65, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 65'),
(871, 'producto', 'UPDATE', 66, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 66'),
(872, 'producto', 'UPDATE', 67, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 67'),
(873, 'producto', 'UPDATE', 77, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 77'),
(874, 'producto', 'UPDATE', 68, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 68'),
(875, 'producto', 'UPDATE', 69, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 69'),
(876, 'producto', 'UPDATE', 70, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 70'),
(877, 'producto', 'UPDATE', 71, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 71'),
(878, 'producto', 'UPDATE', 72, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 72'),
(879, 'producto', 'UPDATE', 73, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 73'),
(880, 'producto', 'UPDATE', 74, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 74'),
(881, 'producto', 'UPDATE', 75, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 75'),
(882, 'producto', 'UPDATE', 76, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 76'),
(883, 'producto', 'UPDATE', 67, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 67'),
(884, 'producto', 'UPDATE', 77, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 77'),
(885, 'producto', 'UPDATE', 78, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 78'),
(886, 'producto', 'UPDATE', 79, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 79'),
(887, 'producto', 'UPDATE', 80, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 80'),
(888, 'producto', 'UPDATE', 94, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 94'),
(889, 'producto', 'UPDATE', 56, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 56'),
(890, 'producto', 'UPDATE', 81, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 81'),
(891, 'producto', 'UPDATE', 91, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 91'),
(892, 'producto', 'UPDATE', 105, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 105'),
(893, 'producto', 'UPDATE', 82, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 82'),
(894, 'producto', 'UPDATE', 58, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 58'),
(895, 'producto', 'UPDATE', 83, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 83'),
(896, 'producto', 'UPDATE', 59, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 59'),
(897, 'producto', 'UPDATE', 84, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 84'),
(898, 'producto', 'UPDATE', 98, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 98'),
(899, 'producto', 'UPDATE', 60, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 60'),
(900, 'producto', 'UPDATE', 85, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 85'),
(901, 'producto', 'UPDATE', 99, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 99'),
(902, 'producto', 'UPDATE', 61, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 61'),
(903, 'producto', 'UPDATE', 86, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 86'),
(904, 'producto', 'UPDATE', 100, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 100'),
(905, 'producto', 'UPDATE', 62, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 62'),
(906, 'producto', 'UPDATE', 87, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 87'),
(907, 'producto', 'UPDATE', 101, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 101'),
(908, 'producto', 'UPDATE', 63, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 63'),
(909, 'producto', 'UPDATE', 88, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 88'),
(910, 'producto', 'UPDATE', 102, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 102'),
(911, 'producto', 'UPDATE', 54, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 54'),
(912, 'producto', 'UPDATE', 89, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 89'),
(913, 'producto', 'UPDATE', 103, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 103'),
(914, 'producto', 'UPDATE', 55, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 55'),
(915, 'producto', 'UPDATE', 90, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 90'),
(916, 'producto', 'UPDATE', 104, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 104'),
(917, 'producto', 'UPDATE', 56, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 56'),
(918, 'producto', 'UPDATE', 81, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 81'),
(919, 'producto', 'UPDATE', 91, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 91'),
(920, 'producto', 'UPDATE', 105, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 105'),
(921, 'producto', 'UPDATE', 57, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 57'),
(922, 'producto', 'UPDATE', 92, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 92'),
(923, 'producto', 'UPDATE', 106, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 106'),
(924, 'producto', 'UPDATE', 93, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 93'),
(925, 'producto', 'UPDATE', 80, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 80'),
(926, 'producto', 'UPDATE', 94, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 94'),
(927, 'producto', 'UPDATE', 95, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 95'),
(928, 'producto', 'UPDATE', 96, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 96'),
(929, 'producto', 'UPDATE', 97, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 97'),
(930, 'producto', 'UPDATE', 59, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 59'),
(931, 'producto', 'UPDATE', 84, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 84'),
(932, 'producto', 'UPDATE', 98, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 98'),
(933, 'producto', 'UPDATE', 60, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 60'),
(934, 'producto', 'UPDATE', 85, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 85'),
(935, 'producto', 'UPDATE', 99, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 99'),
(936, 'producto', 'UPDATE', 61, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 61'),
(937, 'producto', 'UPDATE', 86, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 86'),
(938, 'producto', 'UPDATE', 100, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 100'),
(939, 'producto', 'UPDATE', 62, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 62'),
(940, 'producto', 'UPDATE', 87, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 87'),
(941, 'producto', 'UPDATE', 101, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 101'),
(942, 'producto', 'UPDATE', 63, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 63'),
(943, 'producto', 'UPDATE', 88, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 88'),
(944, 'producto', 'UPDATE', 102, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 102'),
(945, 'producto', 'UPDATE', 54, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 54'),
(946, 'producto', 'UPDATE', 89, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 89'),
(947, 'producto', 'UPDATE', 103, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 103'),
(948, 'producto', 'UPDATE', 55, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 55'),
(949, 'producto', 'UPDATE', 90, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 90'),
(950, 'producto', 'UPDATE', 104, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 104'),
(951, 'producto', 'UPDATE', 56, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 56'),
(952, 'producto', 'UPDATE', 81, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 81'),
(953, 'producto', 'UPDATE', 91, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 91'),
(954, 'producto', 'UPDATE', 105, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 105'),
(955, 'producto', 'UPDATE', 57, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 57'),
(956, 'producto', 'UPDATE', 92, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 92'),
(957, 'producto', 'UPDATE', 106, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 106'),
(958, 'producto', 'UPDATE', 107, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 107'),
(959, 'producto', 'UPDATE', 161, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 161'),
(960, 'producto', 'UPDATE', 108, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 108'),
(961, 'producto', 'UPDATE', 169, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 169'),
(962, 'producto', 'UPDATE', 109, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 109'),
(963, 'producto', 'UPDATE', 180, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 180'),
(964, 'producto', 'UPDATE', 110, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 110'),
(965, 'producto', 'UPDATE', 191, '2024-12-11 09:07:48', 1, 'Registro actualizado con ID: 191'),
(966, 'producto', 'UPDATE', 111, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 111'),
(967, 'producto', 'UPDATE', 112, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 112'),
(968, 'producto', 'UPDATE', 113, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 113'),
(969, 'producto', 'UPDATE', 114, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 114'),
(970, 'producto', 'UPDATE', 115, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 115'),
(971, 'producto', 'UPDATE', 116, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 116'),
(972, 'producto', 'UPDATE', 159, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 159'),
(973, 'producto', 'UPDATE', 117, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 117'),
(974, 'producto', 'UPDATE', 118, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 118'),
(975, 'producto', 'UPDATE', 119, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 119'),
(976, 'producto', 'UPDATE', 120, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 120'),
(977, 'producto', 'UPDATE', 121, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 121'),
(978, 'producto', 'UPDATE', 122, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 122'),
(979, 'producto', 'UPDATE', 123, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 123'),
(980, 'producto', 'UPDATE', 124, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 124'),
(981, 'producto', 'UPDATE', 125, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 125'),
(982, 'producto', 'UPDATE', 126, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 126'),
(983, 'producto', 'UPDATE', 141, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 141'),
(984, 'producto', 'UPDATE', 127, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 127'),
(985, 'producto', 'UPDATE', 142, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 142'),
(986, 'producto', 'UPDATE', 128, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 128'),
(987, 'producto', 'UPDATE', 143, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 143'),
(988, 'producto', 'UPDATE', 129, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 129'),
(989, 'producto', 'UPDATE', 144, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 144'),
(990, 'producto', 'UPDATE', 130, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 130'),
(991, 'producto', 'UPDATE', 145, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 145'),
(992, 'producto', 'UPDATE', 131, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 131'),
(993, 'producto', 'UPDATE', 146, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 146'),
(994, 'producto', 'UPDATE', 132, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 132'),
(995, 'producto', 'UPDATE', 147, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 147'),
(996, 'producto', 'UPDATE', 133, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 133'),
(997, 'producto', 'UPDATE', 134, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 134'),
(998, 'producto', 'UPDATE', 135, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 135'),
(999, 'producto', 'UPDATE', 136, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 136'),
(1000, 'producto', 'UPDATE', 137, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 137'),
(1001, 'producto', 'UPDATE', 138, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 138'),
(1002, 'producto', 'UPDATE', 139, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 139'),
(1003, 'producto', 'UPDATE', 140, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 140'),
(1004, 'producto', 'UPDATE', 126, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 126'),
(1005, 'producto', 'UPDATE', 141, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 141'),
(1006, 'producto', 'UPDATE', 127, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 127'),
(1007, 'producto', 'UPDATE', 142, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 142'),
(1008, 'producto', 'UPDATE', 128, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 128'),
(1009, 'producto', 'UPDATE', 143, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 143'),
(1010, 'producto', 'UPDATE', 129, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 129'),
(1011, 'producto', 'UPDATE', 144, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 144'),
(1012, 'producto', 'UPDATE', 130, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 130'),
(1013, 'producto', 'UPDATE', 145, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 145'),
(1014, 'producto', 'UPDATE', 131, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 131'),
(1015, 'producto', 'UPDATE', 146, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 146'),
(1016, 'producto', 'UPDATE', 132, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 132'),
(1017, 'producto', 'UPDATE', 147, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 147'),
(1018, 'producto', 'UPDATE', 148, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 148'),
(1019, 'producto', 'UPDATE', 149, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 149'),
(1020, 'producto', 'UPDATE', 150, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 150'),
(1021, 'producto', 'UPDATE', 151, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 151'),
(1022, 'producto', 'UPDATE', 152, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 152'),
(1023, 'producto', 'UPDATE', 153, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 153'),
(1024, 'producto', 'UPDATE', 154, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 154'),
(1025, 'producto', 'UPDATE', 155, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 155'),
(1026, 'producto', 'UPDATE', 156, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 156'),
(1027, 'producto', 'UPDATE', 157, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 157'),
(1028, 'producto', 'UPDATE', 158, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 158'),
(1029, 'producto', 'UPDATE', 116, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 116'),
(1030, 'producto', 'UPDATE', 159, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 159'),
(1031, 'producto', 'UPDATE', 160, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 160'),
(1032, 'producto', 'UPDATE', 107, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 107'),
(1033, 'producto', 'UPDATE', 161, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 161'),
(1034, 'producto', 'UPDATE', 162, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 162'),
(1035, 'producto', 'UPDATE', 163, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 163'),
(1036, 'producto', 'UPDATE', 164, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 164'),
(1037, 'producto', 'UPDATE', 165, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 165'),
(1038, 'producto', 'UPDATE', 166, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 166'),
(1039, 'producto', 'UPDATE', 167, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 167'),
(1040, 'producto', 'UPDATE', 168, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 168'),
(1041, 'producto', 'UPDATE', 108, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 108'),
(1042, 'producto', 'UPDATE', 169, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 169'),
(1043, 'producto', 'UPDATE', 170, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 170'),
(1044, 'producto', 'UPDATE', 171, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 171'),
(1045, 'producto', 'UPDATE', 172, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 172'),
(1046, 'producto', 'UPDATE', 173, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 173'),
(1047, 'producto', 'UPDATE', 174, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 174'),
(1048, 'producto', 'UPDATE', 175, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 175'),
(1049, 'producto', 'UPDATE', 176, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 176'),
(1050, 'producto', 'UPDATE', 177, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 177'),
(1051, 'producto', 'UPDATE', 178, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 178'),
(1052, 'producto', 'UPDATE', 179, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 179'),
(1053, 'producto', 'UPDATE', 109, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 109'),
(1054, 'producto', 'UPDATE', 180, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 180'),
(1055, 'producto', 'UPDATE', 181, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 181'),
(1056, 'producto', 'UPDATE', 182, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 182'),
(1057, 'producto', 'UPDATE', 183, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 183'),
(1058, 'producto', 'UPDATE', 184, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 184'),
(1059, 'producto', 'UPDATE', 185, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 185'),
(1060, 'producto', 'UPDATE', 186, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 186'),
(1061, 'producto', 'UPDATE', 187, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 187'),
(1062, 'producto', 'UPDATE', 188, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 188'),
(1063, 'producto', 'UPDATE', 189, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 189'),
(1064, 'producto', 'UPDATE', 190, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 190'),
(1065, 'producto', 'UPDATE', 110, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 110'),
(1066, 'producto', 'UPDATE', 191, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 191'),
(1067, 'producto', 'UPDATE', 192, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 192'),
(1068, 'producto', 'UPDATE', 193, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 193'),
(1069, 'producto', 'UPDATE', 194, '2024-12-11 09:07:49', 1, 'Registro actualizado con ID: 194');
INSERT INTO `auditoria` (`id`, `tabla_afectada`, `accion_realizada`, `registro_afectado_id`, `fecha_hora`, `usuario_id`, `cambios_realizados`) VALUES
(1070, 'producto', 'INSERT', 195, '2024-12-11 12:52:13', 1, 'Nuevo registro insertado con ID: 195'),
(1071, 'producto', 'DELETE', 195, '2024-12-11 12:52:58', 1, 'Registro eliminado con ID: 195'),
(1072, 'producto', 'INSERT', 196, '2024-12-11 12:54:45', 1, 'Nuevo registro insertado con ID: 196'),
(1073, 'producto', 'UPDATE', 194, '2024-12-11 13:33:35', 1, 'Registro actualizado con ID: 194'),
(1074, 'producto', 'UPDATE', 1, '2024-12-11 13:56:27', 1, 'Registro actualizado con ID: 1'),
(1075, 'producto', 'UPDATE', 1, '2024-12-11 14:54:19', 1, 'Registro actualizado con ID: 1'),
(1076, 'producto', 'UPDATE', 1, '2024-12-11 14:54:28', 1, 'Registro actualizado con ID: 1'),
(1077, 'producto', 'DELETE', 196, '2024-12-11 15:09:36', 1, 'Registro eliminado con ID: 196'),
(1078, 'producto', 'DELETE', 1, '2024-12-11 15:09:45', 1, 'Registro eliminado con ID: 1'),
(1079, 'producto', 'UPDATE', 2, '2024-12-11 15:10:00', 1, 'Registro actualizado con ID: 2'),
(1080, 'producto', 'UPDATE', 2, '2024-12-11 15:11:58', 1, 'Registro actualizado con ID: 2'),
(1081, 'producto', 'UPDATE', 193, '2024-12-11 15:12:10', 1, 'Registro actualizado con ID: 193'),
(1082, 'producto', 'UPDATE', 193, '2024-12-11 15:12:50', 1, 'Registro actualizado con ID: 193'),
(1083, 'producto', 'UPDATE', 193, '2024-12-11 15:17:09', 1, 'Registro actualizado con ID: 193'),
(1084, 'producto', 'UPDATE', 194, '2024-12-11 15:27:52', 1, 'Registro actualizado con ID: 194'),
(1085, 'producto', 'UPDATE', 193, '2024-12-11 15:31:51', 1, 'Registro actualizado con ID: 193'),
(1086, 'producto', 'UPDATE', 193, '2024-12-11 15:32:52', 1, 'Registro actualizado con ID: 193'),
(1087, 'producto', 'UPDATE', 193, '2024-12-11 15:34:09', 1, 'Registro actualizado con ID: 193'),
(1088, 'producto', 'UPDATE', 193, '2024-12-11 15:36:46', 1, 'Registro actualizado con ID: 193'),
(1089, 'producto', 'UPDATE', 193, '2024-12-11 15:51:44', 1, 'Registro actualizado con ID: 193'),
(1090, 'producto', 'UPDATE', 194, '2024-12-11 15:54:21', 1, 'Registro actualizado con ID: 194'),
(1091, 'producto', 'UPDATE', 193, '2024-12-11 15:58:04', 1, 'Registro actualizado con ID: 193'),
(1092, 'configuracion', 'UPDATE', 1, '2024-12-19 11:49:13', 1, 'Registro actualizado con ID: 1'),
(1093, 'configuracion', 'UPDATE', 1, '2024-12-19 11:52:42', 1, 'Registro actualizado con ID: 1'),
(1094, 'producto', 'UPDATE', 110, '2024-12-19 12:00:56', 1, 'Registro actualizado con ID: 110');

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
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `idcompra` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `concepto` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `fecha` date NOT NULL,
  `tipo_pago` int(11) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compras`
--

INSERT INTO `compras` (`idcompra`, `proveedor_id`, `concepto`, `monto`, `fecha`, `tipo_pago`) VALUES
(1, 1, 'Mercancia', 10.00, '2024-11-22', 1),
(7, 1, 'Prueba', 12.00, '2024-12-03', 1);

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
  `rif` varchar(20) NOT NULL,
  `idUser` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `configuracion`
--

INSERT INTO `configuracion` (`id`, `nombre`, `telefono`, `email`, `direccion`, `rif`, `idUser`) VALUES
(1, 'Katha Collection', '04120498117', 'colletionkatha@gmail.com', 'C.C. Palma Center - La Victoria', '50564467-0', 1);

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
(34, 116, 1, 4, 0.00, 306.00, 1224.00),
(35, 1, 2, 1, 0.00, 330.92, 330.92),
(36, 1, 3, 1, 0.00, 330.92, 330.92),
(37, 1, 4, 1, 0.00, 330.92, 330.92),
(38, 1, 5, 1, 0.00, 330.92, 330.92),
(39, 1, 6, 1, 0.00, 330.92, 330.92),
(40, 1, 7, 1, 0.00, 330.92, 330.92),
(41, 1, 8, 1, 0.00, 330.92, 330.92),
(42, 96, 9, 1, 0.00, 143.38, 143.38),
(43, 96, 10, 2, 0.00, 143.38, 286.76),
(44, 96, 11, 1, 0.00, 143.38, 143.38),
(45, 96, 12, 1, 0.00, 143.38, 143.38),
(46, 36, 13, 1, 0.00, 1430.29, 1430.29),
(47, 189, 14, 1, 0.00, 416.53, 416.53),
(48, 6, 15, 1, 0.00, 419.35, 419.35),
(49, 1, 16, 1, 10.00, 330.92, 320.92),
(50, 1, 17, 1, 0.00, 330.92, 330.92),
(51, 55, 18, 1, 0.00, 510.39, 510.39),
(52, 1, 19, 1, 0.00, 330.92, 330.92),
(53, 1, 20, 1, 0.00, 330.92, 330.92),
(54, 1, 21, 1, 0.00, 330.92, 330.92),
(55, 1, 22, 1, 0.00, 330.92, 330.92),
(56, 190, 23, 1, 0.00, 548.77, 548.77),
(57, 192, 24, 2, 0.00, 259.99, 519.98),
(58, 190, 25, 1, 0.00, 548.77, 548.77),
(59, 150, 26, 1, 0.00, 490.55, 490.55),
(60, 35, 27, 1, 0.00, 564.03, 564.03),
(61, 55, 28, 1, 0.00, 510.39, 510.39),
(62, 150, 29, 4, 0.00, 490.55, 1962.20),
(63, 191, 30, 1, 0.00, 667.84, 667.84),
(64, 55, 31, 1, 0.00, 510.39, 510.39),
(65, 190, 32, 1, 0.00, 548.77, 548.77),
(66, 192, 33, 1, 0.00, 259.99, 259.99),
(67, 55, 34, 1, 0.00, 510.39, 510.39),
(68, 150, 35, 1, 0.00, 490.55, 490.55),
(69, 150, 37, 1, 0.00, 490.55, 490.55),
(70, 47, 40, 1, 0.00, 1308.28, 1308.28),
(71, 150, 41, 1, 0.00, 490.55, 490.55),
(72, 190, 42, 1, 0.00, 548.77, 548.77),
(73, 150, 43, 1, 0.00, 490.55, 490.55),
(74, 190, 44, 1, 0.00, 548.77, 548.77),
(75, 190, 45, 1, 0.00, 548.77, 548.77),
(76, 190, 46, 1, 0.00, 548.77, 548.77),
(77, 190, 47, 1, 0.00, 548.77, 548.77),
(78, 150, 48, 1, 0.00, 490.55, 490.55),
(79, 150, 49, 1, 0.00, 490.55, 490.55),
(80, 150, 50, 1, 0.00, 490.55, 490.55),
(81, 150, 51, 1, 0.00, 490.55, 490.55),
(82, 150, 52, 1, 0.00, 490.55, 490.55),
(83, 150, 53, 1, 0.00, 490.55, 490.55),
(84, 35, 57, 1, 0.00, 564.03, 564.03),
(85, 35, 58, 1, 0.00, 564.03, 564.03),
(86, 190, 59, 1, 0.00, 548.77, 548.77),
(87, 35, 59, 1, 0.00, 564.03, 564.03),
(88, 1, 60, 2, 0.00, 330.92, 661.84),
(89, 193, 61, 1, 0.00, 319.28, 319.28),
(90, 193, 62, 20, 0.00, 319.28, 6385.60),
(91, 194, 63, 1, 0.00, 676.36, 676.36),
(92, 193, 64, 1, 0.00, 319.28, 319.28),
(93, 193, 65, 1, 0.00, 319.28, 319.28),
(94, 193, 66, 1, 0.00, 319.28, 319.28),
(95, 193, 67, 1, 0.00, 51.08, 51.08),
(96, 193, 68, 1, 0.00, 319.28, 319.28),
(97, 194, 69, 1, 0.00, 108.22, 108.22),
(98, 193, 70, 1, 0.00, 370.36, 370.36),
(99, 110, 71, 1, 0.00, 774.69, 774.69);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `egresos`
--

CREATE TABLE `egresos` (
  `egreso_id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` int(11) NOT NULL,
  `observaciones` text DEFAULT NULL,
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `egresos`
--

INSERT INTO `egresos` (`egreso_id`, `descripcion`, `monto`, `metodo_pago`, `observaciones`, `usuario_id`) VALUES
(1, 'Pago de Empleados', 100.00, 1, 'Mensual', 1),
(2, 'Pago de Alquiler', 100.00, 1, 'Mensual', 1),
(3, 'Pago de Condominio', 100.00, 1, 'Mensual', 1),
(4, 'Pago de Fibex', 40.00, 1, 'Mensual', 1),
(5, 'Pago de Publicidad', 100.00, 1, 'Mensual', 1),
(6, 'Refrigerios ', 100.00, 1, 'Mensual', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `metodos_pago_venta`
--

CREATE TABLE `metodos_pago_venta` (
  `id_metodo_pago` int(11) NOT NULL,
  `id_venta` int(11) NOT NULL,
  `metodo_pago` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pagos`
--

CREATE TABLE `pagos` (
  `pago_id` int(11) NOT NULL,
  `descripcion` varchar(255) NOT NULL,
  `monto` decimal(10,2) NOT NULL,
  `metodo_pago` int(11) NOT NULL,
  `observaciones` enum('Pendiente','Pagado') DEFAULT 'Pendiente',
  `fecha` date DEFAULT curdate(),
  `usuario_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pagos`
--

INSERT INTO `pagos` (`pago_id`, `descripcion`, `monto`, `metodo_pago`, `observaciones`, `fecha`, `usuario_id`) VALUES
(1, 'Prestamo a Arley', 500.00, 1, 'Pendiente', '2024-12-05', 1),
(2, 'Prestamo a Miguel', 500.00, 1, 'Pagado', '2024-12-05', 1);

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
  `idUser` int(11) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`codproducto`, `codigo`, `descripcion`, `precio`, `existencia`, `idUser`, `imagen`) VALUES
(2, '8901234567', 'clopidogrel 75mg x 14 tab vivax', 1266.88, 136, 1, ''),
(3, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1, NULL),
(4, '4567890123', 'ciclokan 500 mg/5 ml x 1 amp klinos', 1430.29, 283, 1, NULL),
(5, '6789012345', 'ciproxina 750mg x 6tab', 1173.21, 151, 1, NULL),
(6, '7890123456', 'clenbuxol jbe pediatrico 120 ml klinos', 237.67, 79, 1, NULL),
(7, '9876543210', 'difen plus 50mg x 10comp', 907.78, 169, 1, NULL),
(8, '4321098765', 'diaformina 1000 mg x 30 com rec klinos', 987.02, 173, 1, NULL),
(9, '6543210987', 'deconfen gel 1.16% x 40gr', 1308.28, 55, 1, NULL),
(10, '8765432109', 'dayflu dia 500/10/2 mg cap x 10 vivax', 653.63, 81, 1, NULL),
(11, '2109876543', 'diclodex 50mg x 20comp', 566.96, 125, 1, NULL),
(12, '5432109876', 'dencorub ice 80gr', 442.71, 272, 1, NULL),
(13, '9876543210', 'difen plus 50mg x 10comp', 907.78, 169, 1, NULL),
(14, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1, NULL),
(15, '4567890123', 'ciclokan 500 mg/5 ml x 1 amp klinos', 1430.29, 283, 1, NULL),
(16, '6789012345', 'ciproxina 750mg x 6tab', 1173.21, 151, 1, NULL),
(17, '7890123456', 'clenbuxol jbe pediatrico 120 ml klinos', 237.67, 79, 1, NULL),
(18, '8901234567', 'clopidogrel 75mg x 14 tab vivax', 1266.88, 138, 1, NULL),
(19, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1, NULL),
(20, '0987654321', 'baycuten 20gr crema', 144.81, 184, 1, NULL),
(21, '7890123456', 'clenbuxol jbe pediatrico 120 ml klinos', 237.67, 79, 1, NULL),
(22, '5678901234', 'ciproxina 500mg x 6tab', 1289.25, 143, 1, NULL),
(23, '3456789012', 'cevax 500 mg (vit c) cap x 30 vivax', 564.03, 181, 1, NULL),
(24, '1234567890', 'canesfast crema 1% 30gr', 695.86, 277, 1, NULL),
(25, '4321098765', 'diaformina 1000 mg x 30 com rec klinos', 987.02, 173, 1, NULL),
(26, '2109876543', 'diclodex 50mg x 20comp', 566.96, 125, 1, NULL),
(27, '6543210987', 'deconfen gel 1.16% x 40gr', 1308.28, 55, 1, NULL),
(28, '8765432109', 'dayflu dia 500/10/2 mg cap x 10 vivax', 653.63, 81, 1, NULL),
(29, '8901234567', 'clopidogrel 75mg x 14 tab vivax', 1266.88, 138, 1, NULL),
(30, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1, NULL),
(31, '4567890123', 'ciclokan 500 mg/5 ml x 1 amp klinos', 1430.29, 283, 1, NULL),
(32, '6789012345', 'ciproxina 750mg x 6tab', 1173.21, 151, 1, NULL),
(33, '1234567890', 'canesfast crema 1% 30gr', 695.86, 277, 1, NULL),
(34, '2345678901', 'captopril 25 mg tab x 30 vivax', 364.04, 126, 1, NULL),
(35, '3456789012', 'cevax 500 mg (vit c) cap x 30 vivax', 564.03, 181, 1, NULL),
(36, '4567890123', 'ciclokan 500 mg/5 ml x 1 amp klinos', 1430.29, 283, 1, NULL),
(37, '5678901234', 'ciproxina 500mg x 6tab', 1289.25, 143, 1, NULL),
(38, '6789012345', 'ciproxina 750mg x 6tab', 1173.21, 151, 1, NULL),
(39, '7890123456', 'clenbuxol jbe pediatrico 120 ml klinos', 237.67, 79, 1, NULL),
(40, '8901234567', 'clopidogrel 75mg x 14 tab vivax', 1266.88, 138, 1, NULL),
(41, '9012345678', 'colypan 200mg x 10comp', 1121.62, 113, 1, NULL),
(42, '0123456789', 'coropres 16 mg x 30 comp klinos', 938.81, 3, 1, NULL),
(43, '1029384756', 'coropres 8 mg x 30 comp klinos', 252.81, 237, 1, NULL),
(44, '9876543210', 'difen plus 50mg x 10comp', 907.78, 169, 1, NULL),
(45, '8765432109', 'dayflu dia 500/10/2 mg cap x 10 vivax', 653.63, 81, 1, NULL),
(46, '7654321098', 'dayflu noche 500/2 mg cap x 10 vivax', 71.63, 120, 1, NULL),
(47, '6543210987', 'deconfen gel 1.16% x 40gr', 1308.28, 55, 1, NULL),
(48, '5432109876', 'dencorub ice 80gr', 442.71, 272, 1, NULL),
(49, '4321098765', 'diaformina 1000 mg x 30 com rec klinos', 987.02, 173, 1, NULL),
(50, '3210987654', 'diclodex 50mg x 10comp', 1358.95, 246, 1, NULL),
(51, '2109876543', 'diclodex 50mg x 20comp', 566.96, 125, 1, NULL),
(52, '1098765432', 'diclofenac sodico 50mg tab x 30 vivax', 1411.60, 147, 1, NULL),
(53, '9876543210', 'difen plus 50mg x 10comp', 907.78, 169, 1, NULL),
(54, '1122334455', 'ipatrixair 20mcg/dosis x 200 aer inh klinos', 1398.51, 44, 1, NULL),
(55, '2233445566', 'jelco 18g', 1358.33, 36, 1, NULL),
(56, '3344556677', 'jelco 22g', 1291.77, 291, 1, NULL),
(57, '4455667788', 'jelco 24g', 388.59, 110, 1, NULL),
(58, '5566778899', 'givotan 100 mg susp x 30 ml klinos', 644.57, 299, 1, NULL),
(59, '6677889900', 'imazol 1% polvo x 20gr', 1336.40, 23, 1, NULL),
(60, '7788990011', 'imazol solucion 20cc', 1035.72, 71, 1, NULL),
(61, '8899001122', 'inyectadora 1cc (insulina 29g x 1/2)', 161.14, 240, 1, NULL),
(62, '9900112233', 'inyectadora 20cc', 1050.21, 33, 1, NULL),
(63, '0011223344', 'inyectadora 5cc (21gx1 1/2)', 653.71, 254, 1, NULL),
(64, '7788119922', 'erilon crema tubo 15gr', 1163.06, 191, 1, NULL),
(65, '6677001122', 'farma d 1000und x 30tab', 1196.16, 196, 1, NULL),
(66, '7788002233', 'febratic 10 mg jbe x 120 ml klinos', 1290.57, 109, 1, NULL),
(67, '8899003344', 'furosemida 40mg x 12tab', 1037.25, 149, 1, NULL),
(68, '9900004455', 'ferganic folic jbe x 120 ml klinos', 777.56, 142, 1, NULL),
(69, '0011225566', 'ferroce con b12 jbe x 120ml', 1214.97, 194, 1, NULL),
(70, '1122336677', 'fitex 20mg x 1tab', 1196.41, 19, 1, NULL),
(71, '2233447788', 'flodont ungüento bucal x 15 gr klinos', 1347.02, 100, 1, NULL),
(72, '3344558899', 'flomed topico bucal 180ml', 1415.77, 226, 1, NULL),
(73, '4455669900', 'flucon 200 mg cap x 4', 1366.45, 97, 1, NULL),
(74, '5566770011', 'fluconazol 150mg 2caps', 1290.66, 107, 1, NULL),
(75, '6677881122', 'flutixair 250-50mcg x 120 aer inh klinos', 294.49, 266, 1, NULL),
(76, '7788992233', 'fugolin al 1% 100ml x 30ml sol.', 1289.35, 197, 1, NULL),
(77, '8899003344', 'furosemida 40mg x 12tab', 1037.25, 149, 1, NULL),
(78, '9900114455', 'furoxil suspensión 90ml', 613.56, 163, 1, NULL),
(79, '1122334477', 'gasa esteril 4x4 sobre x 2', 1437.90, 276, 1, NULL),
(80, '2233445577', 'hexant 30 mg elixir x 120 ml klinos', 229.56, 271, 1, NULL),
(81, '3344556677', 'jelco 22g', 1291.77, 291, 1, NULL),
(82, '4455667778', 'ginacol sol vaginal 135cc', 1067.88, 214, 1, NULL),
(83, '5566778899', 'givotan 100 mg susp x 30 ml klinos', 644.57, 299, 1, NULL),
(84, '6677889900', 'imazol 1% polvo x 20gr', 1336.40, 23, 1, NULL),
(85, '7788990011', 'imazol solucion 20cc', 1035.72, 71, 1, NULL),
(86, '8899001122', 'inyectadora 1cc (insulina 29g x 1/2)', 161.14, 240, 1, NULL),
(87, '9900112233', 'inyectadora 20cc', 1050.21, 33, 1, NULL),
(88, '0011223344', 'inyectadora 5cc (21gx1 1/2)', 653.71, 254, 1, NULL),
(89, '1122334455', 'ipatrixair 20mcg/dosis x 200 aer inh klinos', 1398.51, 44, 1, NULL),
(90, '2233445566', 'jelco 18g', 1358.33, 36, 1, NULL),
(91, '3344556677', 'jelco 22g', 1291.77, 291, 1, NULL),
(92, '4455667788', 'jelco 24g', 388.59, 110, 1, NULL),
(93, '1122334466', 'hepafol b12 jarabe 120ml', 790.07, 283, 1, NULL),
(94, '2233445577', 'hexant 30 mg elixir x 120 ml klinos', 229.56, 271, 1, NULL),
(95, '3344556688', 'ibandromet 150mg x 1tab meyer', 121.02, 199, 1, NULL),
(96, '4455667799', 'ibutan suspensión 200mg/5 x 60ml', 143.38, 133, 1, NULL),
(97, '5566778800', 'ilana 600 mg cap blanda vaginal x 1 vivax', 65.10, 240, 1, NULL),
(98, '6677889900', 'imazol 1% polvo x 20gr', 1336.40, 23, 1, NULL),
(99, '7788990011', 'imazol solucion 20cc', 1035.72, 71, 1, NULL),
(100, '8899001122', 'inyectadora 1cc (insulina 29g x 1/2)', 161.14, 240, 1, NULL),
(101, '9900112233', 'inyectadora 20cc', 1050.21, 33, 1, NULL),
(102, '0011223344', 'inyectadora 5cc (21gx1 1/2)', 653.71, 254, 1, NULL),
(103, '1122334455', 'ipatrixair 20mcg/dosis x 200 aer inh klinos', 1398.51, 44, 1, NULL),
(104, '2233445566', 'jelco 18g', 1358.33, 36, 1, NULL),
(105, '3344556677', 'jelco 22g', 1291.77, 291, 1, NULL),
(106, '4455667788', 'jelco 24g', 388.59, 110, 1, NULL),
(107, '1212121212', 'sax soluc vaginal x 135ml', 958.78, 161, 1, NULL),
(108, '2323232323', 'sinutil jarabe 325mg-32mg x 90ml', 866.84, 227, 1, NULL),
(109, '3434343434', 'teragrip fort tratamiento x 4 dias', 767.15, 128, 1, NULL),
(110, '4545454545', 'vitamina b12 1ml x 3 amp klinos', 667.84, 208, 1, NULL),
(111, '5656565656', 'letisan gotas ped x 20ml', 1296.09, 177, 1, NULL),
(112, '6767676767', 'levoferin sol 30mg/5ml x 90ml', 530.43, 294, 1, NULL),
(113, '7878787878', 'linazer granulado x 15 sobres', 1283.39, 106, 1, NULL),
(114, '8989898989', 'liolactil x 6 sobres', 280.47, 256, 1, NULL),
(115, '9090909090', 'lipontal 900mg x 10tab', 1088.43, 24, 1, NULL),
(116, '1010101010', 'roweluk 5 mg x 30 com klinos', 1183.18, 79, 1, NULL),
(117, '1234123412', 'macrodantina 50mg x 30caps', 786.68, 155, 1, NULL),
(118, '2345234523', 'macrogotero', 29.00, 154, 1, NULL),
(119, '3456345634', 'mailen 2.5 mg jbe x 50 ml klinos', 780.90, 21, 1, NULL),
(120, '4567456745', 'mailen 5 mg comp x 10 klinos', 1166.00, 210, 1, NULL),
(121, '5678567856', 'martesia 75 mg cap x 14 klinos', 236.00, 200, 1, NULL),
(122, '6789678967', 'meloxicam 7.5mg x 10tab', 1300.01, 108, 1, NULL),
(123, '7890789078', 'microgotero', 286.20, 255, 1, NULL),
(124, '8901890189', 'migraval 100 mg com x 2 klinos', 1047.78, 284, 1, NULL),
(125, '9012901290', 'migren comp 650/50mg x 20tab', 962.04, 111, 1, NULL),
(126, '1013101310', 'plexamin jarabe 120ml', 252.31, 119, 1, NULL),
(127, '1124112411', 'plidan 10 mg gotas x 20 ml klinos', 732.32, 76, 1, NULL),
(128, '1235123512', 'plidan compuesto 10 mg com x 10 klinos', 1193.34, 72, 1, NULL),
(129, '1346134613', 'poenflox (ofloxacina) 0,3g/10 ml klinos', 1192.55, 83, 1, NULL),
(130, '1457145714', 'poentobral 0,3% got x 5 ml klinos', 1468.43, 30, 1, NULL),
(131, '1568156815', 'poentobral plus gotas x 5 ml klinos', 797.20, 110, 1, NULL),
(132, '1679167916', 'poli-otico gotas otica x 5 ml klinos', 360.95, 26, 1, NULL),
(133, '2315231523', 'obturador (tapa jelco)', 422.59, 167, 1, NULL),
(134, '3426342634', 'ofaflan suspensión 2mg/ml x 120ml', 1423.23, 30, 1, NULL),
(135, '4537453745', 'pamezone 20 mg cap x 14 klinos', 948.03, 261, 1, NULL),
(136, '5648564856', 'pamezone 40 mg cap x 14 klinos', 673.58, 189, 1, NULL),
(137, '6759675967', 'papaveryl gotas 10mg/15mg', 1215.70, 54, 1, NULL),
(138, '7860786078', 'perebron frambuesa adulto 50mg/5ml', 666.09, 205, 1, NULL),
(139, '8971897189', 'perebron frambuesa ped 50mg/5ml', 144.41, 121, 1, NULL),
(140, '9082908290', 'perten crema 1% 20gr', 1099.05, 142, 1, NULL),
(141, '1013101310', 'plexamin jarabe 120ml', 252.31, 119, 1, NULL),
(142, '1124112411', 'plidan 10 mg gotas x 20 ml klinos', 732.32, 76, 1, NULL),
(143, '1235123512', 'plidan compuesto 10 mg com x 10 klinos', 1193.34, 72, 1, NULL),
(144, '1346134613', 'poenflox (ofloxacina) 0,3g/10 ml klinos', 1192.55, 83, 1, NULL),
(145, '1457145714', 'poentobral 0,3% got x 5 ml klinos', 1468.43, 30, 1, NULL),
(146, '1568156815', 'poentobral plus gotas x 5 ml klinos', 797.20, 110, 1, NULL),
(147, '1679167916', 'poli-otico gotas otica x 5 ml klinos', 360.95, 26, 1, NULL),
(148, '1790179017', 'propanolol 40mg x 20comp plus andex', 1073.22, 100, 1, NULL),
(149, '1801180118', 'prospan jbe x 100 ml klinos', 772.61, 172, 1, NULL),
(150, '1912191219', 'provin polivitaminico x 20tab', 490.55, 255, 1, NULL),
(151, '2902290229', 'racor 10mg x 30comp', 120.60, 142, 1, NULL),
(152, '3903390339', 'recolector heces', 210.93, 79, 1, NULL),
(153, '4904490449', 'recolector orina', 1352.27, 224, 1, NULL),
(154, '5905590559', 'recolector orina ped', 24.69, 243, 1, NULL),
(155, '6906690669', 'ridal 2 mg com x 20 klinos', 48.76, 209, 1, NULL),
(156, '7907790779', 'ridal 3 mg com x 20 klinos', 614.26, 284, 1, NULL),
(157, '8908890889', 'ridal 1mg/ml gotas x 20 ml klinos', 781.99, 228, 1, NULL),
(158, '9909990999', 'roweluk 10 mg x 30 com klinos', 359.53, 270, 1, NULL),
(159, '1010101010', 'roweluk 5 mg x 30 com klinos', 1183.18, 79, 1, NULL),
(160, '1111111111', 'rowetos jbe x 120 ml klinos', 1394.60, 266, 1, NULL),
(161, '1212121212', 'sax soluc vaginal x 135ml', 958.78, 161, 1, NULL),
(162, '1313131313', 'saxacid solc vaginal 135ml', 1135.35, 58, 1, NULL),
(163, '1414141414', 'scalp #21', 1012.64, 243, 1, NULL),
(164, '1515151515', 'scalp #23', 52.06, 211, 1, NULL),
(165, '1616161616', 'scalp #25', 665.45, 30, 1, NULL),
(166, '1717171717', 'secnivax 500 mg susp x 18 ml vivax', 244.93, 150, 1, NULL),
(167, '1818181818', 'sesaren xr 150 mg cap x 15 klinos', 54.63, 194, 1, NULL),
(168, '2222222222', 'sildex 50mg x 1tab plus andex', 1151.73, 114, 1, NULL),
(169, '2323232323', 'sinutil jarabe 325mg-32mg x 90ml', 866.84, 227, 1, NULL),
(170, '2424242424', 'solunovar sol x 30ml', 94.29, 3, 1, NULL),
(171, '2525252525', 'tachiforte 1gr x 20tab', 1299.90, 100, 1, NULL),
(172, '2626262626', 'tachipirin forte tabletas x 10', 79.57, 72, 1, NULL),
(173, '2727272727', 'tachipirin forte tabletas x 20', 82.75, 159, 1, NULL),
(174, '2828282828', 'tachipirin supositorio pediatrico 250mg x 6', 766.16, 287, 1, NULL),
(175, '2929292929', 'tadifil 20 mg com x 1 klinos', 402.26, 134, 1, NULL),
(176, '3030303030', 'talzic gotas 20cc', 657.43, 254, 1, NULL),
(177, '3131313131', 'tantum enjuague bucal', 1380.85, 27, 1, NULL),
(178, '3232323232', 'tantum spray topico bucal', 989.24, 14, 1, NULL),
(179, '3333333333', 'tapa boca 4 tiras', 357.91, 13, 1, NULL),
(180, '3434343434', 'teragrip fort tratamiento x 4 dias', 767.15, 128, 1, NULL),
(181, '3535353535', 'teragrip forte dia x 36 sobres', 904.60, 221, 1, NULL),
(182, '3636363636', 'teragrip forte x 6 sobres dia', 1313.12, 56, 1, NULL),
(183, '3737373737', 'tilodrin jarabe 120ml', 151.05, 72, 1, NULL),
(184, '3838383838', 'tolnaftan crema x 30 gr klinos', 1353.18, 246, 1, NULL),
(185, '3939393939', 'tolnaftan gotas x 15 ml klinos', 580.95, 139, 1, NULL),
(186, '4040404040', 'trittico 50mg x 30tab', 249.46, 125, 1, NULL),
(187, '4141414141', 'ulcon 1gr x 20 tab', 901.12, 227, 1, NULL),
(188, '4242424242', 'valeriana x 60 grageas', 1466.14, 193, 1, NULL),
(189, '4343434343', 'virosupril 5% cre x 5 gr klinos', 416.53, 130, 1, NULL),
(190, '4444444444', 'vitamina c 100/5ml mg jbe x 120 ml klinos', 548.77, 143, 1, NULL),
(191, '4545454545', 'vitamina b12 1ml x 3 amp klinos', 667.84, 209, 1, NULL),
(192, '4646464646', 'vitamina k-1 10 mg/ml 2.5 amp x 3 klinos', 259.99, 220, 1, NULL),
(193, '4747474747', 'wampole tuti-fruti 240cc', 319.28, 214, 1, NULL),
(194, '4848484848', 'wampole tuti-fruti 360cc', 676.36, 239, 1, 'uploads/6759ccef9ef5f.png');

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
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idproveedor` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `rif` varchar(20) NOT NULL,
  `idUser` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idproveedor`, `nombre`, `telefono`, `direccion`, `email`, `rif`, `idUser`, `created_at`, `updated_at`) VALUES
(1, 'Proveedor', '04243363970', 'El Bosque', 'jmrm19722@gmail.com', '30091390', 1, '2024-11-22 14:15:25', '2024-11-22 14:29:28');

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
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `metodo_pago` int(50) NOT NULL,
  `tipo_pago` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `ventas`
--

INSERT INTO `ventas` (`id`, `id_cliente`, `total`, `id_usuario`, `fecha`, `metodo_pago`, `tipo_pago`) VALUES
(1, 1, 1224.00, 1, '2024-06-02 12:00:30', 0, 0),
(2, 3, 330.92, 1, '2024-11-08 01:51:30', 0, 0),
(3, 3, 330.92, 1, '2024-11-08 01:59:51', 0, 0),
(4, 3, 330.92, 1, '2024-11-08 02:00:32', 0, 0),
(5, 3, 330.92, 1, '2024-11-08 02:04:05', 0, 0),
(6, 3, 330.92, 1, '2024-11-08 02:06:55', 0, 0),
(7, 3, 330.92, 1, '2024-11-08 02:12:19', 0, 0),
(8, 3, 330.92, 1, '2024-11-08 02:19:30', 0, 0),
(9, 3, 143.38, 1, '2024-11-08 10:26:05', 0, 0),
(10, 3, 286.76, 1, '2024-11-08 10:26:52', 0, 0),
(11, 2, 143.38, 1, '2024-11-08 10:28:43', 0, 0),
(12, 2, 143.38, 1, '2024-11-08 10:37:55', 0, 0),
(13, 3, 1430.29, 1, '2024-11-08 10:42:03', 0, 0),
(14, 3, 416.53, 1, '2024-11-08 10:43:03', 0, 0),
(15, 1, 18529.44, 1, '2024-11-08 11:04:06', 0, 0),
(16, 3, 15317.29, 1, '2024-12-03 14:55:15', 0, 0),
(17, 3, 15794.58, 1, '2024-12-03 15:07:23', 0, 0),
(18, 3, 24360.56, 1, '2024-12-03 15:45:55', 0, 0),
(19, 3, 15794.58, 1, '2024-12-03 16:07:23', 0, 0),
(20, 3, 15794.58, 1, '2024-12-03 16:09:26', 0, 0),
(21, 3, 15794.58, 1, '2024-12-03 16:10:43', 0, 0),
(22, 3, 15794.58, 1, '2024-12-03 16:12:23', 0, 0),
(23, 3, 26192.41, 1, '2024-12-03 16:48:34', 0, 0),
(24, 3, 24883.75, 1, '2024-12-03 22:52:07', 0, 0),
(25, 3, 26261.50, 1, '2024-12-03 22:54:41', 0, 0),
(26, 3, 23475.37, 1, '2024-12-03 22:56:35', 0, 0),
(27, 2, 26991.77, 1, '2024-12-03 23:01:27', 0, 0),
(28, 2, 24424.82, 1, '2024-12-03 23:06:03', 0, 0),
(29, 3, 93901.47, 1, '2024-12-04 20:18:08', 0, 0),
(30, 3, 31959.62, 1, '2024-12-04 20:19:45', 0, 0),
(31, 3, 24424.82, 1, '2024-12-04 20:20:19', 0, 0),
(32, 3, 26261.50, 1, '2024-12-04 20:23:09', 0, 0),
(33, 2, 12441.87, 1, '2024-12-04 20:24:59', 0, 0),
(34, 3, 24424.82, 1, '2024-12-04 20:26:32', 0, 0),
(35, 2, 23604.43, 1, '2024-12-04 20:53:29', 0, 0),
(36, 2, 0.00, 1, '2024-12-04 20:53:35', 0, 0),
(37, 2, 23475.37, 1, '2024-12-04 20:53:44', 0, 0),
(38, 2, 0.00, 1, '2024-12-04 20:53:46', 0, 0),
(39, 2, 0.00, 1, '2024-12-04 20:57:53', 0, 0),
(40, 3, 62952.21, 1, '2024-12-04 20:58:28', 0, 0),
(41, 3, 23604.43, 1, '2024-12-04 21:03:05', 0, 0),
(42, 3, 26405.88, 1, '2024-12-04 21:04:50', 0, 0),
(43, 3, 23604.43, 1, '2024-12-04 21:16:14', 0, 0),
(44, 3, 26405.88, 1, '2024-12-04 21:24:07', 0, 0),
(45, 3, 26405.88, 1, '2024-12-04 21:30:30', 0, 0),
(46, 3, 26405.88, 1, '2024-12-04 21:36:44', 0, 0),
(47, 3, 26405.88, 1, '2024-12-04 21:44:57', 0, 0),
(48, 3, 23604.43, 1, '2024-12-04 21:46:54', 0, 0),
(49, 2, 23604.43, 1, '2024-12-04 22:00:55', 0, 0),
(50, 2, 23604.43, 1, '2024-12-04 22:01:56', 0, 0),
(51, 3, 23604.43, 1, '2024-12-04 22:03:45', 0, 0),
(52, 3, 23604.43, 1, '2024-12-04 22:09:03', 0, 0),
(53, 3, 23604.43, 1, '2024-12-04 22:14:09', 0, 0),
(54, 3, 0.00, 1, '2024-12-04 22:14:12', 0, 0),
(55, 3, 0.00, 1, '2024-12-04 22:14:14', 0, 0),
(56, 3, 0.00, 1, '2024-12-04 22:14:15', 0, 0),
(57, 3, 27140.16, 1, '2024-12-04 22:14:52', 0, 0),
(58, 1, 27140.16, 1, '2024-12-05 22:17:30', 2, 2),
(59, 3, 53546.04, 1, '2024-12-05 14:29:35', 1, 1),
(60, 3, 32503.69, 1, '2024-12-11 17:56:27', 1, 1),
(61, 3, 15680.19, 1, '2024-12-11 19:12:50', 1, 1),
(62, 3, 313603.84, 1, '2024-12-11 19:17:09', 1, 1),
(63, 3, 5314.69, 1, '2024-12-11 19:27:52', 2, 1),
(64, 3, 2508.83, 1, '2024-12-11 19:31:51', 1, 2),
(65, 3, 2508.83, 1, '2024-12-11 19:32:52', 2, 1),
(66, 3, 15680.19, 1, '2024-12-11 19:34:09', 1, 1),
(67, 3, 2508.83, 1, '2024-12-11 19:36:46', 1, 1),
(68, 3, 18189.02, 1, '2024-12-11 19:51:44', 1, 1),
(69, 3, 5314.69, 1, '2024-12-11 19:54:21', 1, 1),
(70, 3, 18189.02, 1, '2024-12-11 19:58:04', 1, 1),
(71, 3, 39474.17, 1, '2024-12-19 16:00:56', 2, 1);

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
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`idcompra`),
  ADD KEY `proveedor_id` (`proveedor_id`);

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
-- Indices de la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD PRIMARY KEY (`egreso_id`),
  ADD KEY `usuario_id` (`usuario_id`);

--
-- Indices de la tabla `metodos_pago_venta`
--
ALTER TABLE `metodos_pago_venta`
  ADD PRIMARY KEY (`id_metodo_pago`),
  ADD KEY `id_venta` (`id_venta`);

--
-- Indices de la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD PRIMARY KEY (`pago_id`),
  ADD KEY `usuario_id` (`usuario_id`);

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
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idproveedor`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1095;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idcliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `idcompra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=127;

--
-- AUTO_INCREMENT de la tabla `detalle_venta`
--
ALTER TABLE `detalle_venta`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT de la tabla `egresos`
--
ALTER TABLE `egresos`
  MODIFY `egreso_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `metodos_pago_venta`
--
ALTER TABLE `metodos_pago_venta`
  MODIFY `id_metodo_pago` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pagos`
--
ALTER TABLE `pagos`
  MODIFY `pago_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `codproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=197;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idproveedor` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `idusuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `compras_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedor` (`idproveedor`) ON DELETE CASCADE;

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
-- Filtros para la tabla `egresos`
--
ALTER TABLE `egresos`
  ADD CONSTRAINT `egresos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

--
-- Filtros para la tabla `metodos_pago_venta`
--
ALTER TABLE `metodos_pago_venta`
  ADD CONSTRAINT `metodos_pago_venta_ibfk_1` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `pagos`
--
ALTER TABLE `pagos`
  ADD CONSTRAINT `pagos_ibfk_1` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`idusuario`);

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
