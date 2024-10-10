-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 23, 2024 at 09:45 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `shopnow`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` varchar(600) NOT NULL,
  `product_id` varchar(600) NOT NULL,
  `quantity` varchar(600) NOT NULL,
  `price` varchar(600) NOT NULL,
  `total_price` varchar(600) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `customer_id`, `product_id`, `quantity`, `price`, `total_price`, `created_at`, `updated_at`) VALUES
(1, '3', '1', '3', '123', '369', '2024-09-22 23:24:51', '2024-09-22 23:24:51'),
(2, '2', '2', '8', '123', '984', '2024-09-22 23:38:30', '2024-09-22 23:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_name` varchar(600) NOT NULL,
  `category_image` varchar(600) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `category_image`, `created_at`, `updated_at`) VALUES
(1, 'cat', 'http://192.168.0.104:8000/storage/category/1725349744.jpg', '2024-09-03 02:19:04', '2024-09-03 02:19:04'),
(2, 'dog', 'http://192.168.0.104:8000/storage/category/1725349756.jpg', '2024-09-03 02:19:16', '2024-09-03 02:19:16');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `c_name` varchar(600) NOT NULL,
  `c_email` varchar(600) NOT NULL,
  `c_phone` varchar(600) NOT NULL,
  `c_password` varchar(600) NOT NULL,
  `c_address` varchar(600) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `c_name`, `c_email`, `c_phone`, `c_password`, `c_address`, `created_at`, `updated_at`) VALUES
(1, 'divya', 'divya@gmail.com', '7894561235', '123', 'rrere', '2024-09-03 00:36:30', '2024-09-03 00:36:30'),
(2, 'athira', 'athira@gmail.com', '7894561235', '123', 'rrere', '2024-09-03 00:41:15', '2024-09-03 00:41:15'),
(3, 'anisha', 'anisha@gmail.com', '7894561235', '123', 'rrere', '2024-09-21 05:41:32', '2024-09-21 05:41:32');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_resets_table', 1),
(3, '2019_08_19_000000_create_failed_jobs_table', 1),
(4, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(5, '2024_09_03_050546_create_customers_table', 1),
(6, '2024_09_03_071838_create_categories_table', 2),
(7, '2024_09_03_084851_create_products_table', 3),
(8, '2024_09_23_043014_create_bookings_table', 4);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `personal_access_tokens`
--

INSERT INTO `personal_access_tokens` (`id`, `tokenable_type`, `tokenable_id`, `name`, `token`, `abilities`, `last_used_at`, `created_at`, `updated_at`) VALUES
(4, 'App\\Models\\customer', 2, 'jjj', '70512fb084c801d1e2292e5ef15e116f9c591e97ca6b4eb1692a92b6a6033b8c', '[\"*\"]', '2024-09-03 01:45:45', '2024-09-03 01:45:22', '2024-09-03 01:45:45'),
(5, 'App\\Models\\customer', 2, 'jjj', '9f692acd77a3ce49443ae5caba6e2fb4c3740e546dc0ebc454c0c75c992c05c4', '[\"*\"]', NULL, '2024-09-21 05:29:46', '2024-09-21 05:29:46'),
(6, 'App\\Models\\customer', 2, 'jjj', '051a061b362d8cc337ff1b6eb17229fd79284db1fcc8ca30bf79bafad4c72edd', '[\"*\"]', NULL, '2024-09-21 05:30:45', '2024-09-21 05:30:45'),
(7, 'App\\Models\\customer', 2, 'jjj', '55622be1fac1f171145f9baf3071e072f43cc478d194480560f372971b300c91', '[\"*\"]', NULL, '2024-09-21 05:36:04', '2024-09-21 05:36:04'),
(8, 'App\\Models\\customer', 1, 'jjj', '4a8fe7810a6fa584bc88ccd683ec2882a15c08093a3d3c8a652bc6cc8b891215', '[\"*\"]', NULL, '2024-09-21 05:38:11', '2024-09-21 05:38:11'),
(9, 'App\\Models\\customer', 1, 'jjj', 'fcab820d7615336ff311346d8aaa0ea0825db79664c4315c50d816f5a72931df', '[\"*\"]', NULL, '2024-09-21 05:40:50', '2024-09-21 05:40:50'),
(10, 'App\\Models\\customer', 1, 'jjj', '4d47fcf3b534fdb81f031d0990833446362fbaa9ef668ff3577b730281527405', '[\"*\"]', NULL, '2024-09-21 05:41:09', '2024-09-21 05:41:09'),
(11, 'App\\Models\\customer', 3, 'jjj', 'ec2efbe65d4d7b204219f5ad6a9341922bf01ff042fc0512c49416d0cacda145', '[\"*\"]', NULL, '2024-09-21 05:41:54', '2024-09-21 05:41:54'),
(12, 'App\\Models\\customer', 3, 'jjj', 'ecc7e8d8b51b09dde63fb7c7a3539c8ff93e7e70c8672a9140ab8ed2f7236c00', '[\"*\"]', NULL, '2024-09-21 05:42:45', '2024-09-21 05:42:45'),
(13, 'App\\Models\\customer', 3, 'jjj', '9fe18612f9514a89a8f5255e096ebf8c3f2f21bcc8435365fafb75a4bd290652', '[\"*\"]', '2024-09-23 02:00:54', '2024-09-22 22:26:20', '2024-09-23 02:00:54');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `category_id` varchar(600) NOT NULL,
  `product_name` varchar(600) NOT NULL,
  `product_price` varchar(600) NOT NULL,
  `product_description` varchar(600) NOT NULL,
  `product_prdct_image` varchar(600) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `product_price`, `product_description`, `product_prdct_image`, `created_at`, `updated_at`) VALUES
(1, '1', 'aaaaaaaaa', '123', 'rrrrrrrrrrrr', 'http://192.168.0.104:8000/storage/product/1725354350.jpg', '2024-09-03 03:35:50', '2024-09-03 03:35:50'),
(2, '2', 'aaaaaaaaa', '123', 'rrrrrrrrrrrr', 'http://192.168.0.104:8000/storage/product/1725354352.jpg', '2024-09-03 03:35:52', '2024-09-03 03:35:52'),
(3, '1', 'aftiuh', '123', 'rrrrrrrrrrrr', 'http://192.168.0.104:8000/storage/product/1725354398.jpg', '2024-09-03 03:36:39', '2024-09-03 03:36:39');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
