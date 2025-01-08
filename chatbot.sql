-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jan 08, 2025 at 06:01 PM
-- Server version: 8.0.31
-- PHP Version: 8.0.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chatbot`
--

-- --------------------------------------------------------

--
-- Table structure for table `anecdotes`
--

DROP TABLE IF EXISTS `anecdotes`;
CREATE TABLE IF NOT EXISTS `anecdotes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chatbot_id` int DEFAULT NULL,
  `texte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_id` (`chatbot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `anecdotes`
--

INSERT INTO `anecdotes` (`id`, `chatbot_id`, `texte`) VALUES
(1, 1, 'Quand j’étais petit, je croyais que les nuages étaient faits de barbe à papa.'),
(2, 1, 'Un jour, j’ai essayé de parler avec un perroquet… il m’a ignoré !'),
(3, 1, 'Quand j\'étais enfant, je pensais que si je creusais assez profond dans le sable à la plage, j\'arriverais en Chine. J\'ai creusé... mais j\'ai juste trouvé de l\'eau.'),
(4, 1, 'Un jour, j\'ai essayé d\'impressionner mes amis en sautant dans une piscine... sauf qu\'il n\'y avait pas d\'eau dedans. Résultat : plus de peur que de mal et beaucoup de rires.'),
(5, 1, 'J\'ai passé tout un après-midi à chercher mes lunettes… qui étaient sur ma tête. Mes amis en parlent encore !'),
(6, 1, 'Une fois, j\'ai suivi une recette de cuisine et oublié d\'ajouter le sucre dans un gâteau… c\'était un dessert \"surprise\".'),
(7, 1, 'Quand j\'étais petit, je croyais que la Lune me suivait partout où j\'allais… et je faisais tout pour lui échapper.'),
(8, 1, 'Un jour, j\'ai essayé d\'imiter le cri d\'un animal en pleine forêt… et un vrai animal m\'a répondu. Je ne suis jamais parti aussi vite !'),
(9, 1, 'J\'ai mis des heures à assembler un meuble IKEA, juste pour me rendre compte que j\'avais oublié une pièce essentielle dès le début.'),
(10, 1, 'Lors d\'une randonnée, je me suis perdu… mais j\'ai trouvé un endroit magnifique qui n\'était même pas sur la carte.'),
(11, 1, 'Quand j\'ai voulu faire du vélo sans les mains pour la première fois, j\'ai crié \"Regardez !\" et suis tombé instantanément.'),
(12, 1, 'Un jour, j\'ai serré la main d\'une célébrité sans savoir qui c\'était. C\'est après, en regardant la télé, que j\'ai compris.');

-- --------------------------------------------------------

--
-- Table structure for table `blagues`
--

DROP TABLE IF EXISTS `blagues`;
CREATE TABLE IF NOT EXISTS `blagues` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chatbot_id` int DEFAULT NULL,
  `texte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_id` (`chatbot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `blagues`
--

INSERT INTO `blagues` (`id`, `chatbot_id`, `texte`) VALUES
(1, 3, 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !'),
(2, 3, 'Quel est le comble pour un électricien ? Ne pas être au courant.'),
(3, 3, 'Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant ? Parce que sinon, ils tombent dans le bateau !'),
(4, 3, 'Quel est le comble pour un jardinier ? Avoir un râteau et se prendre un vent.'),
(5, 3, 'Pourquoi les canards sont toujours à l\'heure ? Parce qu’ils sont dans l’étang !'),
(6, 3, 'Que fait une fraise sur un cheval ? Tagada, tagada !'),
(7, 3, 'Pourquoi les maths sont-elles tristes ? Parce qu\'elles ont plein de problèmes.'),
(8, 3, 'Pourquoi les vampires n\'aiment pas les pizzas ? Parce qu\'il y a trop d\'ail.'),
(9, 3, 'Quel est le comble pour un plombier ? Ne pas pouvoir rester dans son bain !'),
(10, 3, 'Pourquoi les poissons travaillent-ils illégalement ? Parce qu\'ils n\'ont pas de FISH-papiers.'),
(11, 3, 'Quel est le comble pour un couturier ? Perdre le fil de la conversation.'),
(12, 3, 'Que dit une tasse à une cafetière ? \"Tu es trop pressée !\"');

-- --------------------------------------------------------

--
-- Table structure for table `chatbot`
--

DROP TABLE IF EXISTS `chatbot`;
CREATE TABLE IF NOT EXISTS `chatbot` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(255) NOT NULL,
  `caractere` varchar(255) NOT NULL,
  `exemple_phrases` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chatbot`
--

INSERT INTO `chatbot` (`id`, `nom`, `caractere`, `exemple_phrases`) VALUES
(1, 'Bob', 'amical', 'Exemples : \"comment ca va\", \"       raconte moi une anecdote\" , \"Salut\"'),
(2, 'Pascal', 'formel', 'Exemples : \"apprends moi quelque chose\", \"raconte moi un fait culturel\", \"bonjour\", \"ca va\"'),
(3, 'Remi', 'drole', 'Exemples : \"Raconte moi une blague\", \"coucou\", \"salut\", \"comment ça va\"');

-- --------------------------------------------------------

--
-- Table structure for table `chats`
--

DROP TABLE IF EXISTS `chats`;
CREATE TABLE IF NOT EXISTS `chats` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `chatbot_id` int DEFAULT NULL,
  `message_utilisateur` text NOT NULL,
  `message_chatbot` text NOT NULL,
  `date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `chatbot_id` (`chatbot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=80 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `chats`
--

INSERT INTO `chats` (`id`, `user_id`, `chatbot_id`, `message_utilisateur`, `message_chatbot`, `date`) VALUES
(1, NULL, NULL, 'bonjour', 'Bonjour ! Comment puis-je vous aider ?', '2025-01-02 12:51:35'),
(2, NULL, NULL, 'bonjour', 'Bonjour ! Comment puis-je vous aider ?', '2025-01-02 13:04:26'),
(3, 2, NULL, 'bonjour', 'Bonjour ! Comment puis-je vous aider ?', '2025-01-03 10:30:55'),
(4, 2, NULL, 'raconte-moi une blague', 'Je ne comprends pas votre question.', '2025-01-03 10:31:08'),
(5, 2, NULL, 'raconte-moi une blague\r\n', 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !', '2025-01-03 12:33:55'),
(6, 2, NULL, 'raconte-moi une blague\r\n', 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !', '2025-01-03 12:34:48'),
(7, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-03 12:35:16'),
(8, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-03 12:37:56'),
(9, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-03 12:40:50'),
(10, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 11:24:45'),
(11, 2, NULL, 'raconte une blague', 'Je ne comprends pas votre question.', '2025-01-05 11:24:56'),
(12, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-05 11:25:04'),
(13, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 11:25:18'),
(14, 2, NULL, 'raconte une blague', 'Je ne comprends pas votre question.', '2025-01-05 11:25:20'),
(15, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 11:28:11'),
(16, 2, NULL, 'ca va', 'Je ne comprends pas votre question.', '2025-01-05 11:28:16'),
(17, 2, NULL, 'comment cava', 'Je ne comprends pas votre question.', '2025-01-05 11:28:28'),
(18, 2, NULL, 'comment ca va', 'Je vais bien, et vous ?', '2025-01-05 11:28:36'),
(19, 2, NULL, 'comment ca va', 'Je vais bien, et vous ?', '2025-01-05 12:22:53'),
(20, 2, NULL, 'comment ca va', 'Je vais bien, et vous ?', '2025-01-05 12:22:55'),
(21, 2, NULL, 'ca va', 'Je vais bien, et vous ?', '2025-01-05 12:23:00'),
(22, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-05 12:23:07'),
(23, 2, NULL, 'anecdote', 'Quand j’étais petit, je croyais que les nuages étaient faits de barbe à papa.', '2025-01-05 12:23:30'),
(24, 2, NULL, 'anecdote', 'Quand j’étais petit, je croyais que les nuages étaient faits de barbe à papa.', '2025-01-05 12:23:38'),
(25, 2, NULL, 'anecdote', 'Quand j’étais petit, je croyais que les nuages étaient faits de barbe à papa.', '2025-01-05 12:24:10'),
(26, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 12:38:34'),
(27, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-05 12:38:39'),
(28, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 12:48:47'),
(29, 2, NULL, 'ca va', 'Je vais bien, et vous ?', '2025-01-05 12:48:50'),
(30, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-05 13:05:16'),
(31, 2, NULL, 'ca va', 'Je vais bien, et vous ?', '2025-01-05 13:05:20'),
(32, 2, NULL, 'bonjour', 'Bonjour, ravi de vous voir !', '2025-01-06 18:33:25'),
(33, 2, NULL, 'ca va', 'Je vais bien, et vous ?', '2025-01-06 18:33:27'),
(34, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 11:10:01'),
(35, 2, NULL, 'raconte une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:10:15'),
(36, 2, NULL, 'Raconte-moi une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:10:24'),
(37, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-07 11:10:33'),
(38, 2, NULL, 'fait', 'Saviez-vous que la Tour Eiffel mesure 324 mètres de haut ?', '2025-01-07 11:14:32'),
(39, 2, NULL, 'fait', 'Saviez-vous que la Tour Eiffel mesure 324 mètres de haut ?', '2025-01-07 11:14:42'),
(40, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 11:53:06'),
(41, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 11:56:28'),
(42, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 11:56:59'),
(43, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-07 11:57:05'),
(44, 2, NULL, 'raconte une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:57:10'),
(45, 2, NULL, 'raconte moi une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:57:25'),
(46, 2, NULL, 'raconte moi une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:58:56'),
(47, 2, NULL, 'raconte une blague', 'Je ne comprends pas votre question.', '2025-01-07 11:59:00'),
(48, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 11:59:11'),
(49, 2, NULL, 'anecdote', 'Un jour, j’ai essayé de parler avec un perroquet… il m’a ignoré !', '2025-01-07 11:59:53'),
(50, 2, NULL, 'anecdote', 'Lors d\'une randonnée, je me suis perdu… mais j\'ai trouvé un endroit magnifique qui n\'était même pas sur la carte.', '2025-01-07 12:05:09'),
(51, 2, NULL, 'anecdote', 'Un jour, j\'ai serré la main d\'une célébrité sans savoir qui c\'était. C\'est après, en regardant la télé, que j\'ai compris.', '2025-01-07 12:05:14'),
(52, 2, NULL, 'fait', 'Le premier alphabet connu a été inventé par les Phéniciens vers 1200 avant J.-C. Il est l\'ancêtre direct de l\'alphabet latin que nous utilisons aujourd\'hui.', '2025-01-07 12:07:22'),
(53, 2, NULL, 'fait', 'La fête de Holi en Inde est connue comme le \"festival des couleurs\". Les gens jettent des poudres colorées pour célébrer la victoire du bien sur le mal.', '2025-01-07 12:07:26'),
(54, 2, NULL, 'fait', 'Le Louvre est le plus grand musée d’art du monde.', '2025-01-07 12:12:35'),
(55, 2, NULL, 'blague', 'Pourquoi les maths sont-elles tristes ? Parce qu\'elles ont plein de problèmes.', '2025-01-07 12:13:46'),
(56, 2, NULL, 'apprends moi quelque chose', 'La plus ancienne recette de cuisine connue remonte à 1750 avant J.-C. Elle a été trouvée sur une tablette en Mésopotamie et décrit comment préparer un ragoût.', '2025-01-07 12:30:26'),
(57, 2, NULL, 'bonjour', 'Bonjour. Comment puis-je vous aider ?', '2025-01-07 12:30:43'),
(58, 2, NULL, 'blague', 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !', '2025-01-07 22:23:47'),
(59, 2, NULL, 'blague', 'Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant ? Parce que sinon, ils tombent dans le bateau !', '2025-01-07 22:24:04'),
(60, 2, NULL, 'blague', 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !', '2025-01-07 22:24:18'),
(61, 2, NULL, 'blague', 'Quel est le comble pour un couturier ? Perdre le fil de la conversation.', '2025-01-07 22:24:21'),
(62, 2, NULL, 'raconte une blague', 'Que dit une tasse à une cafetière ? \"Tu es trop pressée !\"', '2025-01-07 22:24:30'),
(63, 2, NULL, 'bonjour', 'Bonjour, ravi de te voir !', '2025-01-07 22:25:52'),
(64, 2, NULL, 'anecdote', 'Quand j’étais petit, je croyais que les nuages étaient faits de barbe à papa.', '2025-01-07 22:26:24'),
(65, 2, NULL, 'anecdote', 'Un jour, j\'ai essayé d\'imiter le cri d\'un animal en pleine forêt… et un vrai animal m\'a répondu. Je ne suis jamais parti aussi vite !', '2025-01-07 22:26:37'),
(66, 2, NULL, 'bonjour', 'Bonjour, ravi de te voir !', '2025-01-07 22:26:49'),
(67, 2, NULL, 'bonjour', 'Bonjour. Comment puis-je vous aider ?', '2025-01-07 22:26:55'),
(68, 2, NULL, 'apprends moi quelque chose', 'La Tour Eiffel a été peinte plus de 20 fois depuis sa construction en 1889, dans différentes teintes, allant du brun au jaune et même au gris.', '2025-01-07 22:27:09'),
(69, 2, NULL, 'blague', 'Je ne comprends pas votre question.', '2025-01-07 22:27:25'),
(70, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-07 22:28:14'),
(71, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-07 22:28:42'),
(72, 2, NULL, 'raconte une blague', 'Pourquoi les poissons travaillent-ils illégalement ? Parce qu\'ils n\'ont pas de FISH-papiers.', '2025-01-07 22:28:48'),
(73, 2, NULL, 'blague', 'Pourquoi les poules n\'ont pas de téléphone ? Parce qu\'elles préfèrent les œufs !', '2025-01-07 22:29:02'),
(74, 2, NULL, 'blague', 'Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant ? Parce que sinon, ils tombent dans le bateau !', '2025-01-07 22:29:05'),
(75, 2, NULL, 'blague', 'Pourquoi les maths sont-elles tristes ? Parce qu\'elles ont plein de problèmes.', '2025-01-07 22:29:08'),
(76, 2, NULL, 'blague', 'Quel est le comble pour un plombier ? Ne pas pouvoir rester dans son bain !', '2025-01-07 22:29:16'),
(77, 2, NULL, 'ca va', 'Je vais comme une horloge mal réglée... toujours en retard !', '2025-01-07 22:29:27'),
(78, 2, NULL, 'bonjour', 'Salut, ça roule ?', '2025-01-07 22:29:46'),
(79, 2, NULL, 'blague', 'Pourquoi les plongeurs plongent-ils toujours en arrière et jamais en avant ? Parce que sinon, ils tombent dans le bateau !', '2025-01-07 22:29:49');

-- --------------------------------------------------------

--
-- Table structure for table `reponses_culturelles`
--

DROP TABLE IF EXISTS `reponses_culturelles`;
CREATE TABLE IF NOT EXISTS `reponses_culturelles` (
  `id` int NOT NULL AUTO_INCREMENT,
  `chatbot_id` int DEFAULT NULL,
  `texte` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `chatbot_id` (`chatbot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `reponses_culturelles`
--

INSERT INTO `reponses_culturelles` (`id`, `chatbot_id`, `texte`) VALUES
(1, 2, 'Saviez-vous que la Tour Eiffel mesure 324 mètres de haut ?'),
(2, 2, 'Le Louvre est le plus grand musée d’art du monde.'),
(3, 2, 'Saviez-vous que la Grande Muraille de Chine mesure environ 21 196 kilomètres ? Elle est si longue qu\'elle pourrait traverser plusieurs pays en ligne droite !'),
(4, 2, 'Les Égyptiens de l\'Antiquité croyaient que les chats étaient sacrés. Ils les vénéraient au point de les momifier après leur mort.'),
(5, 2, 'Au Japon, il existe une île appelée Tashirojima où les chats sont plus nombreux que les humains. Elle est aussi surnommée \"l\'île aux chats\".'),
(6, 2, 'La Tour Eiffel a été peinte plus de 20 fois depuis sa construction en 1889, dans différentes teintes, allant du brun au jaune et même au gris.'),
(7, 2, 'En Finlande, il existe une tradition de concours de portage d\'épouses, où le vainqueur remporte le poids de son épouse en bière.'),
(8, 2, 'Le premier alphabet connu a été inventé par les Phéniciens vers 1200 avant J.-C. Il est l\'ancêtre direct de l\'alphabet latin que nous utilisons aujourd\'hui.'),
(9, 2, 'La ville de Venise en Italie est construite sur plus de 100 petites îles reliées par des ponts, et il n\'y a pas de routes, seulement des canaux.'),
(10, 2, 'La plus ancienne recette de cuisine connue remonte à 1750 avant J.-C. Elle a été trouvée sur une tablette en Mésopotamie et décrit comment préparer un ragoût.'),
(11, 2, 'La fête de Holi en Inde est connue comme le \"festival des couleurs\". Les gens jettent des poudres colorées pour célébrer la victoire du bien sur le mal.'),
(12, 2, 'La langue française a environ 300 mots liés au vin, reflétant l\'importance culturelle de cette boisson en France.');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  `prenom` varchar(30) NOT NULL,
  `email` varchar(50) NOT NULL,
  `mdp` varchar(60) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `chatbot_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `email` (`email`),
  KEY `chatbot_id` (`chatbot_id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `nom`, `prenom`, `email`, `mdp`, `chatbot_id`) VALUES
(2, 'El Osta', 'Marine', 'marineesta05@gmail.com', '$2y$10$YC89g5XZ1EUVX..yL0FWlOgKDOVk3Yiu8M3H2c8pub5R0yiyPLuXW', NULL),
(3, 'Hamdan', 'Meyss', 'meysshamdan@gmail.com', '$2y$10$1HfFZVFfKZdaNze8tbddruImxc7g2SLKZPiwJU3UwgVSNdEf8d8Da', NULL);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
