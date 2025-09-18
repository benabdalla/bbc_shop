-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : jeu. 18 sep. 2025 à 22:47
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `bbc_db`
--

-- --------------------------------------------------------

--
-- Structure de la table `admins`
--

CREATE TABLE `admins` (
  `admin_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `role` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `admins`
--

INSERT INTO `admins` (`admin_id`, `name`, `email`, `role`, `password`) VALUES
(1, 'mootez', 'mootezbenabdallah96@gmail.com', 'ADMIN', '123456');

-- --------------------------------------------------------

--
-- Structure de la table `carts`
--

CREATE TABLE `carts` (
  `cart_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_thumbnail_url` varchar(255) DEFAULT NULL,
  `product_unit_price` decimal(15,2) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `sub_total` decimal(15,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `categories`
--

CREATE TABLE `categories` (
  `category_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `description` text DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `categories`
--

INSERT INTO `categories` (`category_id`, `title`, `description`, `icon`, `parent_id`) VALUES
(7, 'zezez', 'dfdf', '', 0),
(8, 'smar phone ', 'test', '', 0),
(9, 'tele', 'ttt', '', 0);

-- --------------------------------------------------------

--
-- Structure de la table `collection_point`
--

CREATE TABLE `collection_point` (
  `id` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `district` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `collection_point`
--

INSERT INTO `collection_point` (`id`, `address`, `district`, `name`) VALUES
(1, 'menzeh  1', 'koba', 'agile ');

-- --------------------------------------------------------

--
-- Structure de la table `coupons`
--

CREATE TABLE `coupons` (
  `coupon_id` int(11) NOT NULL,
  `coupon_code` varchar(50) NOT NULL,
  `coupon_value` decimal(15,2) NOT NULL,
  `coupon_type` varchar(20) NOT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `coupons`
--

INSERT INTO `coupons` (`coupon_id`, `coupon_code`, `coupon_value`, `coupon_type`, `status`) VALUES
(1, 'solde', 10.00, 'Percentage', 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `customers`
--

CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active',
  `email_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `customers`
--

INSERT INTO `customers` (`customer_id`, `name`, `email`, `password`, `role`, `address`, `status`, `email_verified`) VALUES
(1, 'Mootez Ben Abdallah', 'comelitrsi@gmail.com', '123456789', 'CUSTOMER', 'manzeh 9b', 'Active', 0),
(2, 'mootez RSI', 'mootezbenabdallah966@gmail.com', '20KFCs1iJg', 'CUSTOMER', '123456', 'Active', 0);

-- --------------------------------------------------------

--
-- Structure de la table `orders`
--

CREATE TABLE `orders` (
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_total` decimal(15,2) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `discount` decimal(15,2) DEFAULT 0.00,
  `shipping_charge` decimal(15,2) DEFAULT 0.00,
  `tax` decimal(15,2) DEFAULT 0.00,
  `shipping_street` varchar(255) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_post_code` varchar(20) DEFAULT NULL,
  `shipping_state` varchar(100) DEFAULT NULL,
  `shipping_country` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `sub_total` decimal(15,2) DEFAULT NULL,
  `payment_status` varchar(20) DEFAULT NULL,
  `payment_method` varchar(50) DEFAULT NULL,
  `card_number` varchar(30) DEFAULT NULL,
  `card_cvv` varchar(10) DEFAULT NULL,
  `card_holder_name` varchar(100) DEFAULT NULL,
  `card_expiry_date` varchar(10) DEFAULT NULL,
  `gateway_fee` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `order_details`
--

CREATE TABLE `order_details` (
  `order_details_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `product_name` varchar(100) DEFAULT NULL,
  `product_unit_price` decimal(15,2) DEFAULT NULL,
  `product_thumbnail_url` varchar(255) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending',
  `quantity` int(11) NOT NULL,
  `sub_total` decimal(15,2) DEFAULT NULL,
  `delivery_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `products`
--

CREATE TABLE `products` (
  `product_id` int(11) NOT NULL,
  `title` varchar(100) NOT NULL,
  `thumbnail_url` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `regular_price` decimal(15,2) NOT NULL,
  `sale_price` decimal(15,2) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `stock_status` varchar(20) DEFAULT NULL,
  `stock_count` int(11) DEFAULT 0,
  `status` varchar(20) DEFAULT 'Active',
  `seller_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `products`
--

INSERT INTO `products` (`product_id`, `title`, `thumbnail_url`, `description`, `regular_price`, `sale_price`, `category`, `stock_status`, `stock_count`, `status`, `seller_id`) VALUES
(1, 'phone', 'uploads/flousi(3).png', 'fiche technique', 12.00, 20.00, 8, 'In Stock', 20, 'Active', 5);

-- --------------------------------------------------------

--
-- Structure de la table `refund_history`
--

CREATE TABLE `refund_history` (
  `refund_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `bank_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `amount` decimal(15,2) NOT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `revenue_profit`
--

CREATE TABLE `revenue_profit` (
  `rp_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `order_date` date NOT NULL,
  `order_details_id` int(11) NOT NULL,
  `revenue` decimal(15,2) NOT NULL,
  `costs` decimal(15,2) DEFAULT 0.00,
  `platform_profit` decimal(15,2) DEFAULT 0.00,
  `seller_profit` decimal(15,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `review`
--

CREATE TABLE `review` (
  `review_id` int(11) NOT NULL,
  `comment` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `product_id` int(11) NOT NULL,
  `star` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `sellers`
--

CREATE TABLE `sellers` (
  `seller_id` int(11) NOT NULL,
  `name` varchar(100) NOT NULL,
  `store_name` varchar(100) NOT NULL,
  `office_address` varchar(255) DEFAULT NULL,
  `email` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `role` varchar(50) NOT NULL,
  `balance` decimal(15,2) DEFAULT 0.00,
  `holder_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Active'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `sellers`
--

INSERT INTO `sellers` (`seller_id`, `name`, `store_name`, `office_address`, `email`, `password`, `role`, `balance`, `holder_name`, `account_number`, `bank_name`, `branch_name`, `status`) VALUES
(1, 'ben abdallah', 'bbc', 'manzeh 9b', 'comelitrsi@gmail.com', '123456789', 'SELLER', 0.00, NULL, NULL, NULL, NULL, 'Active'),
(2, 'ben abdallah', 'bbc', 'manzeh 9b', 'MOOTEZBENABDALLAH96@GMAIL.COM', 'M@@tez123', 'SELLER', 0.00, NULL, NULL, NULL, NULL, 'Active'),
(5, 'BEN ABDALLAH ben abdallah', 'bbc1', 'NABEUL - MENZEL TEMIME - EL OUDIANE 8054-4856', 'MOOTEZBENABDALLAH396@GMAIL.COM', 'M@@tez123', 'SELLER', 0.00, NULL, NULL, NULL, NULL, 'Active');

-- --------------------------------------------------------

--
-- Structure de la table `seller_withdrawals`
--

CREATE TABLE `seller_withdrawals` (
  `sw_id` int(11) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `store_name` varchar(100) DEFAULT NULL,
  `holder_name` varchar(100) DEFAULT NULL,
  `account_number` varchar(50) DEFAULT NULL,
  `bank_name` varchar(100) DEFAULT NULL,
  `branch_name` varchar(100) DEFAULT NULL,
  `request_date` date NOT NULL,
  `amount` decimal(15,2) NOT NULL,
  `payment_date` date DEFAULT NULL,
  `status` varchar(20) DEFAULT 'Pending'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `verification_code`
--

CREATE TABLE `verification_code` (
  `vc_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `code` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Structure de la table `wishlist`
--

CREATE TABLE `wishlist` (
  `wishlist_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`admin_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`cart_id`),
  ADD KEY `customer_id` (`customer_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`category_id`);

--
-- Index pour la table `collection_point`
--
ALTER TABLE `collection_point`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `coupons`
--
ALTER TABLE `coupons`
  ADD PRIMARY KEY (`coupon_id`),
  ADD UNIQUE KEY `coupon_code` (`coupon_code`);

--
-- Index pour la table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`customer_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Index pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD PRIMARY KEY (`order_details_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`product_id`),
  ADD KEY `category` (`category`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `refund_history`
--
ALTER TABLE `refund_history`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_details_id` (`order_details_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `revenue_profit`
--
ALTER TABLE `revenue_profit`
  ADD PRIMARY KEY (`rp_id`),
  ADD KEY `seller_id` (`seller_id`),
  ADD KEY `order_id` (`order_id`),
  ADD KEY `order_details_id` (`order_details_id`);

--
-- Index pour la table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`review_id`);

--
-- Index pour la table `sellers`
--
ALTER TABLE `sellers`
  ADD PRIMARY KEY (`seller_id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- Index pour la table `seller_withdrawals`
--
ALTER TABLE `seller_withdrawals`
  ADD PRIMARY KEY (`sw_id`),
  ADD KEY `seller_id` (`seller_id`);

--
-- Index pour la table `verification_code`
--
ALTER TABLE `verification_code`
  ADD PRIMARY KEY (`vc_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Index pour la table `wishlist`
--
ALTER TABLE `wishlist`
  ADD PRIMARY KEY (`wishlist_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `admins`
--
ALTER TABLE `admins`
  MODIFY `admin_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `carts`
--
ALTER TABLE `carts`
  MODIFY `cart_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `categories`
--
ALTER TABLE `categories`
  MODIFY `category_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT pour la table `collection_point`
--
ALTER TABLE `collection_point`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `coupons`
--
ALTER TABLE `coupons`
  MODIFY `coupon_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `customers`
--
ALTER TABLE `customers`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `orders`
--
ALTER TABLE `orders`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `order_details`
--
ALTER TABLE `order_details`
  MODIFY `order_details_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `products`
--
ALTER TABLE `products`
  MODIFY `product_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT pour la table `refund_history`
--
ALTER TABLE `refund_history`
  MODIFY `refund_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `revenue_profit`
--
ALTER TABLE `revenue_profit`
  MODIFY `rp_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `review`
--
ALTER TABLE `review`
  MODIFY `review_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `sellers`
--
ALTER TABLE `sellers`
  MODIFY `seller_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT pour la table `seller_withdrawals`
--
ALTER TABLE `seller_withdrawals`
  MODIFY `sw_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `verification_code`
--
ALTER TABLE `verification_code`
  MODIFY `vc_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `wishlist`
--
ALTER TABLE `wishlist`
  MODIFY `wishlist_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `carts`
--
ALTER TABLE `carts`
  ADD CONSTRAINT `carts_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`),
  ADD CONSTRAINT `carts_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `carts_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`customer_id`);

--
-- Contraintes pour la table `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`product_id`),
  ADD CONSTRAINT `order_details_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_1` FOREIGN KEY (`category`) REFERENCES `categories` (`category_id`),
  ADD CONSTRAINT `products_ibfk_2` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `refund_history`
--
ALTER TABLE `refund_history`
  ADD CONSTRAINT `refund_history_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `refund_history_ibfk_2` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`order_details_id`),
  ADD CONSTRAINT `refund_history_ibfk_3` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `revenue_profit`
--
ALTER TABLE `revenue_profit`
  ADD CONSTRAINT `revenue_profit_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`),
  ADD CONSTRAINT `revenue_profit_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`order_id`),
  ADD CONSTRAINT `revenue_profit_ibfk_3` FOREIGN KEY (`order_details_id`) REFERENCES `order_details` (`order_details_id`);

--
-- Contraintes pour la table `seller_withdrawals`
--
ALTER TABLE `seller_withdrawals`
  ADD CONSTRAINT `seller_withdrawals_ibfk_1` FOREIGN KEY (`seller_id`) REFERENCES `sellers` (`seller_id`);

--
-- Contraintes pour la table `verification_code`
--
ALTER TABLE `verification_code`
  ADD CONSTRAINT `verification_code_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `customers` (`customer_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
