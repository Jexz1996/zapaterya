-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 04-08-2019 a las 19:49:40
-- Versión del servidor: 10.1.37-MariaDB
-- Versión de PHP: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_links`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cart`
--

CREATE TABLE `cart` (
  `folio` int(11) NOT NULL,
  `product` int(11) NOT NULL,
  `pay` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `total` int(11) NOT NULL,
  `user` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `links`
--

CREATE TABLE `links` (
  `id` int(11) NOT NULL,
  `title` varchar(150) NOT NULL,
  `url` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title` text NOT NULL,
  `description` text NOT NULL,
  `price` double NOT NULL,
  `stock` int(11) NOT NULL,
  `image` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `products`
--

INSERT INTO `products` (`id`, `title`, `description`, `price`, `stock`, `image`) VALUES
(12, 'Tenis Skate para DC Shoes ', 'Se trata de un modelo de color azul, el cual presenta una corte de material textil, brindándole un especial cuidado y comodidad, ideales para una facilidad de movimiento. Además, son de ajuste con agujeta, logrando que su seguridad sea la ideal. ', 564.23, 0, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564005613/qrpvmdzvhscretsmcwfm.jpg'),
(13, 'Tenis Converse Blancos ', '¡Tu atuendo define parte de tu personalidad! Es tiempo de darle un look más relajado y cómodo con estos fabulosos tenis Converse.\r\n\r\nNo son los clásicos en tela, éstos tienen un acabado sintético tipo piel, luciendo superbien con cualquier outfit. Los detalles en color negro lucen mucho gracias al fondo en color blanco. Mantén el paso firme, pues su suela de caucho es antiderrapante.', 849, 5, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564026656/jlzawknommgsvaxsykr6.jpg'),
(14, 'Tenis Nike Star Runner Azules para Hombre ', 'Supera tus retos deportivos con los tenis Nike Star Runner en color azul, con aplicación naranja.\r\n\r\nEste calzado es ideal para correr y ejercitarte. Su diseño Soft lo hace cómodo, ligero y flexible para cubrir todas tus necesidades. Además, su suela antiderrapante permite afianzar el pie para una mayor seguridad al momento de correr en terreno inclinado.', 999, 20, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564026828/xo5spnh7ig72n3mgtklu.jpg'),
(15, 'Tenis Rosas para Niña Girls Attitude ', 'La más pequeña de tu casa se va a sentir súper especial cuando se ponga sus nuevos tenis color oro rosado Girls Attitude.\r\n\r\nLos tenis cuentan con lentejuelas en los costados, lo que le da un toque único al diseño. La parte de enfrente es lisa y brillosita. Cuenta con cordones para anudar y así ajustarlos perfecto a sus piecitos.', 259, 16, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564026903/jjpmieofgmhosbte87fh.jpg'),
(16, 'Sandalias Stars Of The World Rosas para Niña ', 'Tu pequeña merece diseños modernos como el de las sandalias Stars Of The World.\r\n\r\nEl calzado es de diseño de sirena; cuenta con aplicación de cola de sirena y una concha color lila en la parte de enfrente. Tiene una cinta en la suela, con textura tipo cola de pez, en color verde y el resto de la sandalia es rosa. Cuenta con suela antiderrapante y el corte es sintético.', 199, 25, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564027021/qapebulwz6z4xxzb62jb.jpg'),
(17, 'Tenis Blancos de Unicornio para Mujer 18 Forever ', 'Dale a tus pies un estilo increíble siguiendo las tendencias de moda con estos tenis de unicornio 18 Forever, el calzado más moderno y cómodo de esta temporada.\r\n\r\nEstán diseñados en color blanco con detalles de corte láser en forma de estrellas rosas y franjas tornasol en los costados y en la parte trasera. Cuentan con agujeta para darle a tus pies el soporte que merecen.', 299, 0, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564027112/oysugtanqfxc7rtcy2hy.jpg'),
(18, 'Tenis Azules para Niño Refill Kids ', 'Se trata de un modelo de color azul, el cual presenta una corte de material textil, brindándole un especial cuidado y comodidad, ideales para una facilidad de movimiento. Además, son de ajuste con agujeta, logrando que su seguridad sea la ideal. ', 229, 25, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564079476/vp7kovbvcowlxqu4jcq4.jpg'),
(19, 'Zapatos Blancos marca Baby Colors para Niña ', 'Este par tiene un diseño tipo alpargata, son blancos y cuentan con detalles de mecate de ixtle alrededor de la suela para darles una vista más fresca. Están confeccionados con materiales textiles de gran ligereza y suavidad.', 119, 58, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564079551/yb9z7togtpambyhmivfy.jpg'),
(20, 'Tenis Azules para Urbant Star para Mujer ', 'Son amplios y con interior acojinado, además, tienen agujetas coral que hacen un bonito contraste con el fondo azul marino. En el corte presentan vistas sintéticas al tono.', 299, 12, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564079633/jte6ahsntsuoevgs8dnb.jpg'),
(21, 'Tenis Efecto Espejo para Mujer 18 Forever ', 'Se tratan de unos cómodos tenis en color oscuro, con detalle tipo espejo que refleja la luz de manera sensacional. La suela es gruesa, de color blanco con textura para un mejor agarre, mientras que las agujetas las tiene al frente para amararse mejor a ti. ', 229, 10, 'http://res.cloudinary.com/dyhowxkye/image/upload/v1564079679/kxtpakerfirfwbwdctob.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sessions`
--

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) UNSIGNED NOT NULL,
  `data` text CHARACTER SET utf8mb4 COLLATE utf8mb4_bin
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `sessions`
--

INSERT INTO `sessions` (`session_id`, `expires`, `data`) VALUES
('H01JsjddIe7jbZCZm8Wt5x1bO1XAYyhi', 1565027325, '{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"flash\":{}}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(16) NOT NULL,
  `password` varchar(60) NOT NULL,
  `fullname` varchar(100) NOT NULL,
  `rol` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `fullname`, `rol`) VALUES
(5, 'YucatanSur', '$2a$10$2vV.cSjDOH3aDQE82SkOKeTqQA3kOEkGU/jaeQr5K9xA2QknYP3qm', 'Admin', 1);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`folio`);

--
-- Indices de la tabla `links`
--
ALTER TABLE `links`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`session_id`);

--
-- Indices de la tabla `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cart`
--
ALTER TABLE `cart`
  MODIFY `folio` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=46;

--
-- AUTO_INCREMENT de la tabla `links`
--
ALTER TABLE `links`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- AUTO_INCREMENT de la tabla `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
