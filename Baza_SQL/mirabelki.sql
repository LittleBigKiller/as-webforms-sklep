-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Czas generowania: 29 Lis 2019, 14:27
-- Wersja serwera: 5.5.28
-- Wersja PHP: 7.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `mpiwowarski`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `access_levels`
--

CREATE TABLE `access_levels` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` tinytext COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `access_levels`
--

INSERT INTO `access_levels` (`id`, `name`) VALUES
(0, 'USER'),
(1, 'ADMIN'),
(2, 'ROOT');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `orders`
--

CREATE TABLE `orders` (
  `id` int(10) UNSIGNED NOT NULL,
  `user` int(10) NOT NULL,
  `datetime` datetime NOT NULL,
  `state` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `orders`
--

INSERT INTO `orders` (`id`, `user`, `datetime`, `state`) VALUES
(1, 1, '2019-11-08 00:00:00', 3),
(2, 2, '2019-11-21 00:00:00', 0),
(3, 0, '2019-11-22 00:00:00', 2),
(4, 2, '2019-11-03 00:00:00', 3),
(5, -1, '2026-11-20 00:00:00', 0),
(6, 2, '2019-11-26 23:41:14', 0),
(7, -1, '2019-11-26 23:44:43', 0),
(8, -1, '2019-11-27 15:21:01', 0),
(9, 4, '2019-11-27 15:28:12', 0),
(10, -1, '2019-11-27 15:28:24', 0),
(11, -1, '2019-11-27 17:29:53', 1),
(12, -1, '2019-11-27 17:34:24', 0),
(13, -1, '2019-11-27 17:35:44', 0),
(14, -1, '2019-11-27 17:36:24', 0),
(15, -1, '2019-11-27 17:38:27', 0),
(16, 1, '2019-11-27 19:15:02', 0),
(17, 5, '2019-11-27 21:12:15', 0),
(18, -1, '2019-11-28 13:07:49', 0),
(19, 1, '2019-11-28 17:31:51', 0),
(20, 1, '2019-11-28 18:04:33', 2),
(21, 1, '2019-11-28 18:29:25', 0),
(23, 1, '2019-11-28 22:28:44', 0),
(24, -1, '2019-11-28 22:38:22', 0),
(25, -1, '2019-11-28 22:39:31', 0),
(26, -1, '2019-11-28 22:48:37', 0),
(27, -1, '2019-11-28 22:51:52', 0),
(28, -1, '2019-11-29 01:19:22', 0),
(29, 30, '2019-11-29 01:42:00', 0),
(30, 31, '2019-11-29 01:52:27', 0),
(31, 31, '2019-11-29 02:23:22', 0),
(32, 31, '2019-11-29 02:24:33', 0),
(33, -1, '2019-11-29 02:42:14', 0),
(34, -1, '2019-11-29 02:45:58', 0),
(35, -1, '2019-11-29 06:57:40', 0),
(36, -1, '2019-11-29 10:54:00', 0),
(37, 32, '2019-11-29 11:22:07', 0),
(38, -1, '2019-11-29 11:35:31', 0),
(39, -1, '2019-11-29 11:46:23', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_contents`
--

CREATE TABLE `order_contents` (
  `order_id` int(10) UNSIGNED NOT NULL,
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `order_contents`
--

INSERT INTO `order_contents` (`order_id`, `product_id`, `quantity`) VALUES
(1, 1, 3),
(5, 1, 2),
(5, 2, 3),
(5, 3, 5),
(6, 5, 2137),
(7, 1, 1),
(7, 2, 1),
(7, 3, 1),
(7, 4, 1),
(7, 5, 1),
(8, 3, 1),
(9, 1, 2),
(11, 1, 1),
(11, 2, 1),
(11, 3, 1),
(11, 4, 1),
(11, 5, 1),
(15, 1, 1),
(16, 1, 1),
(16, 2, 1),
(17, 1, 1),
(18, 2, 1),
(18, 3, 1),
(18, 4, 1),
(18, 6, 1),
(18, 5, 1),
(19, 3, 1),
(19, 4, 1),
(19, 5, 1),
(19, 6, 1),
(19, 1, 1),
(20, 1, 17),
(21, 1, 1),
(21, 2, 1),
(21, 3, 1),
(21, 4, 1),
(21, 6, 1),
(23, 9, 1),
(24, 1, 1),
(26, 1, 1),
(26, 3, 1),
(27, 1, 1),
(28, 2, 1),
(28, 1, 1),
(29, 1, 1),
(30, 1, 1),
(30, 2, 1),
(30, 3, 1),
(31, 1, 1),
(32, 1, 1),
(33, 1, 5),
(33, 2, 12),
(33, 3, 6),
(33, 4, 7),
(34, 1, 2),
(34, 3, 1),
(34, 2, 1),
(34, 4, 1),
(34, 5, 1),
(34, 6, 1),
(34, 7, 1),
(34, 8, 1),
(34, 9, 1),
(35, 11, 69),
(36, 11, 69),
(37, 1, 2),
(38, 1, 1),
(39, 1, 1),
(39, 2, 1);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `order_states`
--

CREATE TABLE `order_states` (
  `id` tinyint(1) UNSIGNED NOT NULL,
  `name` varchar(16) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `order_states`
--

INSERT INTO `order_states` (`id`, `name`) VALUES
(0, 'PENDING'),
(1, 'SENT'),
(2, 'FINISHED'),
(3, 'CANCELLED');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_categories`
--

CREATE TABLE `product_categories` (
  `id` tinyint(10) UNSIGNED NOT NULL,
  `name` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `product_categories`
--

INSERT INTO `product_categories` (`id`, `name`) VALUES
(1, 'Strategiczne'),
(2, 'Inne'),
(3, 'Akcji'),
(4, 'Sportowe');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `product_info`
--

CREATE TABLE `product_info` (
  `id` int(10) UNSIGNED NOT NULL,
  `category` tinyint(3) UNSIGNED NOT NULL,
  `name` varchar(64) COLLATE utf8_polish_ci NOT NULL,
  `img_path` varchar(260) COLLATE utf8_polish_ci NOT NULL DEFAULT 'assets/img/placeholder.png',
  `description` text COLLATE utf8_polish_ci NOT NULL,
  `price` decimal(65,2) UNSIGNED NOT NULL,
  `supplier` varchar(64) COLLATE utf8_polish_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `product_info`
--

INSERT INTO `product_info` (`id`, `category`, `name`, `img_path`, `description`, `price`, `supplier`) VALUES
(1, 1, 'Frostpunk', 'https://static.muve.pl/uploads/product-cover/0083/0236/frostpunk-season-pass-2d-cover-min.jpg', 'Frostpunk wprowadza gracza do fikcyjnego świata w mroźnej krainie. Początkowo gracz musi się zaopiekować garstką ludzi, którzy powoli starają się budować schronienie w okolicach generatora ciepła. Z czasem jednak mieszkańców zacznie przybywać, a nam coraz trudniej będzie zapanować nad rosnącą „metropolią”', '69.90', 'muve'),
(2, 1, 'Total War: Three Kingdoms', 'https://static.muve.pl/uploads/product-cover/0048/0648/tw3k-pc-2dpack-web-temp-pch.jpg', 'Total War Three Kingdoms na PC to produkcja, która przyciągnie do siebie niejednego wielbiciela gier turowych. Tytuł ten przeniesie nas w dalekie czasy, kiedy to Chiny były podzielone na kilka tytułowych królestw. Każde z nich rywalizowało o panowanie w całym państwie. Tylko od Ciebie zależy jednak, na którą stronę przechyli się szala zwycięstwa.', '159.90', 'muve'),
(3, 1, 'Beholder 2', 'https://static.muve.pl/uploads/product-cover/0066/1686/beholder2-box2d.jpg', 'Poznaj Ministerstwo! Ukryte za zimnymi, złowrogimi i szarymi murami, których końca nie widać. Wejście do tego labiryntu, skrywającego największe tajemnice państwowe wiedzie przez masywne, dębowe drzwi. A Ty... Ty właśnie zostałeś pracownikiem Ministerstwa. W państwie totalitarnym. Mówi się, że przed tobą świetlana przyszłość - otoczenie widzi cię nawet na stanowisku Premiera. Twoja droga na szczyt nie będzie jednak łatwa. Zdrada, szantaż, oszustwa, przesłuchania? Jak daleko się posuniesz? Decyzja należy do ciebie!', '9.90', 'muve'),
(4, 1, 'Age of Wonders: Planetfall', 'https://static.muve.pl/uploads/product-cover/0079/8004/age-of-wonders-planetfall-cover-pc-min.jpg', 'Wyjdź z kosmicznego mrocznego wieku upadłego galaktycznego impe rium i zadbaj o lepszą przyszłość dla swojego ludu. Age of W onders: Planetfall to nowa gra strategiczna Triumph Studios, twórców cieszącej się uznaniem serii Age of Wonders, która oferuje ekscytującą taktyczną walk ę turową i pogłębione spojrzenie na budow ę imperium poprzedników w nowych realiach science-fiction.', '129.90', 'muve'),
(5, 3, 'CyberPunk 2077', 'https://static.muve.pl/uploads/product-cover/0077/6329/cyberpunk-2077-cover-pc-min.jpg', 'W trakcie rozgrywki w Cyberpunk 2077 wcielimy się w V. Bohater ma jedną, niesamowicie ważną misję - musi odnaleźć jedyny w swoim rodzaju implant, który daje nieśmiertelność. Nie będzie to jednak proste zadanie - megalopolia Night City jest potężna i szalenie niebezpieczna.', '199.00', 'muve'),
(6, 3, 'DOOM Eternal', 'https://static.muve.pl/uploads/product-cover/0075/7825/doom-eternal-stnadart-edition-cover-pc-min.jpg', 'Stworzony przez id Software DOOM® Eternal™ to bezpośrednia kontynuacja nagradzanej i bestsellerowej gry DOOM® z 2016 r. Doświadcz doskonałej kombinacji szybkości i mocy, walcząc i zabijając, by przedrzeć się przez mroczne wymiary, oraz całkiem nowej jakości w tej pierwszoosobowej grze ciągłej walki. Napędzany technologią idTech 7 i rozbrzmiewający zupełnie nową, pulsującą rytmem ścieżką dźwiękową stworzoną przez Micka Gordona DOOM Eternal pozwoli ci wcielić się w niepowstrzymanego DOOM Slayera, wykańczającego nowe i klasyczne demony za pomocą potężnych broni w niewidzianych dotąd światach.', '219.90', 'muve'),
(7, 3, 'Children of Morta', 'https://static.muve.pl/uploads/product-cover/0084/5401/children-of-morta-cover-pc-min.jpg', 'To pełna dramatyzmu fabularna gra akcji o niezwykłej rodzinie bohaterów. Pomóż niepozbawionym wad, ale też cnót Bergsonom stawić czoła nadciągającemu Zepsuciu. Czy zdołasz poświęcić wszystko, by ocalić tych, na których ci zależy? Choć akcja w Children of Morta toczy się w odległej krainie, jej nicią przewodnią są motywy zaskakująco bliskie współczesnej codzienności. To opowieść o zwyczajnych emocjach, które wszyscy dobrze znamy i cenimy bardziej, niż czasami mamy odwagę przyznać – o miłości i nadziei, pragnieniu i niepewności, wreszcie o poczuciu straty i poświęceniu.', '119.90', 'muve'),
(8, 4, 'The Crew 2', 'https://static.muve.pl/uploads/product-cover/0036/3378/pc-dvd-tc2-pol.jpg', 'Najnowsza odsłona przełomowej serii The Crew®, The Crew® 2, przedstawia emocje związane z duchem amerykańskich sportów motorowych w jednym z najbardziej ekscytujących otwartych światów, jakie kiedykolwiek powstały. Witamy w Motornation, ogromnym, zróżnicowanym, pełnym akcji i przepięknym miejscu, idealnym dla sportów motorowych w całych Stanach Zjednoczonych. Od wybrzeża do wybrzeża, zbierają się cztery rodziny miłośników motoryzacji: kierowcy uliczni, terenowi, zawodowcy i freestylersi. Dołącz do nich w wysokooktanowych zawodach i sprawdź się w różnych dyscyplinach, z udziałem samochodów, motocykli, łodzi i samolotów. Szukasz wolności i chcesz odkrywać i podbijać USA tak, jak zechcesz? Możesz teraz płynnie przełączać pomiędzy pojazdami naziemnymi, wodnymi i powietrznymi i cieszyć się absolutnie unikatową rozgrywką we własnym stylu. Nagrywaj i udostępniaj każdą niesamowitą chwilę. The Crew 2 daje ci szansę na popisanie się umiejętnościami i zdobycie tytułu ostatecznego mistrza sportów motorowych.', '132.99', 'muve'),
(9, 4, 'Need for Speed Heat', 'https://static.muve.pl/uploads/product-cover/0080/8993/nfsh-pc-2d-v2-min.jpg', 'Pracuj za dnia, a nocą stawiaj wszystko na jedną kartę w Need for Speed™ Heat, zapierającej dech w piersiach wyścigowej przygodzie, w której zmierzysz się ze skorumpowaną policją, próbując się dostać do elity wyścigów ulicznych. Za dnia bierz udział w Speedhunters Showdown, legalnych zawodach, w których możesz zdobywać środki na ulepszenia garażu pełnego naprawdę potężnych maszyn. Gdy twoja bryka jest odpicowana i ulepszona, możesz podkręcić tempo zmagań. Zanurz się w mroku nocy, gdzie wraz ze swoją ekipą weźmiecie udział w nielegalnych wyścigach ulicznych, które poprawią twoją reputację i zapewnią ci dostęp do większych zawodów i lepszych części. Pod osłoną ciemności grupy wyjętych spod prawa łotrów tylko czekają na okazję, by cię sprzątnąć i zabrać wszystko, co udało ci się zgromadzić. Załatw ich i postaw wszystko na jedną kartę w rywalizacji o sławę w półświatku albo udaj się do kryjówki, by przeżyć kolejny dzień pełen wrażeń. W tej ulicznej grze wyścigowej drogi, ryzyko i szaleńcze wyścigi nigdy się nie kończą. Możesz bujać się po mieście ze swoją ekipą, twój garaż pełen jest samochodów, a miasto to twój osobisty plac zabaw.', '209.90', 'muve'),
(10, 4, 'Football Manager 2019', 'https://static.muve.pl/uploads/product-cover/0044/6766/fm19-2d.jpg', 'Football Manager 2019 pomoże ci spełnić najskrytsze pragnienia odnośnie posiadania własnej drużyny piłkarskiej. Oto wcielasz się w managera pewnej drużyny i starasz się poprowadzić ją na sam szczyt piłkarskiej kariery. To Ty masz tutaj decydujący głos - decydujesz zarówno o samych piłkarzach, jak i ich treningach i najmniejszych szczegółach. Możesz być ich wybawicielem, albo pogrążyć drużynę - wszystko zależy od Ciebie!', '74.90', 'muve'),
(11, 2, 'GamerGirl Bath Water', 'https://belledelphine.club/wp-content/uploads/2019/07/7ce6df_58bc85465e1f4b4dab465233e1faf712mv2_d_5183_7771_s_4_2-1.jpg', 'Oryginalna woda z wanny znanej modelki. JESTEŚMY JEDYNYM DYSTRYBUTOREM NA TERENIE POLSKI!!!', '30.00', 'Belle Delphine');

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `stock`
--

CREATE TABLE `stock` (
  `product_id` int(10) UNSIGNED NOT NULL,
  `quantity` smallint(5) UNSIGNED NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `stock`
--

INSERT INTO `stock` (`product_id`, `quantity`) VALUES
(1, 5);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `id` int(10) NOT NULL,
  `username` varchar(16) COLLATE utf8_polish_ci NOT NULL,
  `password_hash` char(32) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `access_level` tinyint(1) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_polish_ci;

--
-- Zrzut danych tabeli `users`
--

INSERT INTO `users` (`id`, `username`, `password_hash`, `access_level`) VALUES
(-1, 'anon', '', 0),
(0, 'root', '63a9f0ea7bb98050796b649e85481845', 2),
(1, 'admin', '21232f297a57a5a743894a0e4a801fc3', 1),
(2, 'tt', '9e38e8d688743e0d07d669a1fcbcd35b', 1),
(4, 'aaaaaa', '0b4e7a0e5fe84ad35fb5f95b9ceeac79', 0),
(5, 'TestTest', '25d55ad283aa400af464c76d713c07ad', 0),
(6, 'q', '7694f4a66316e53c8cdd9d9954bd611d', 0),
(7, 'TestTest2', '25d55ad283aa400af464c76d713c07ad', 0),
(8, '1234', '81dc9bdb52d04dc20036dbd8313ed055', 0),
(9, 'JanuszKorwin', '62c74a4f5694239fa00bced6bb301609', 0),
(10, 'JanuszKorwin2', '62c74a4f5694239fa00bced6bb301609', 0),
(11, 'fgjhdtrnyjdrt', 'dd4b21e9ef71e1291183a46b913ae6f2', 0),
(12, 'TestTest3', '25d55ad283aa400af464c76d713c07ad', 0),
(13, 'TestTest4', '25d55ad283aa400af464c76d713c07ad', 0),
(17, 'TestTest6', '25d55ad283aa400af464c76d713c07ad', 0),
(18, 'TestTest7', '25d55ad283aa400af464c76d713c07ad', 0),
(19, 'TestTest8', '25d55ad283aa400af464c76d713c07ad', 0),
(20, 'TestTest9', '25d55ad283aa400af464c76d713c07ad', 0),
(21, 'TestTest10', '25d55ad283aa400af464c76d713c07ad', 0),
(22, 'TestTest11', '25d55ad283aa400af464c76d713c07ad', 0),
(23, 'TestTest12', '25d55ad283aa400af464c76d713c07ad', 0),
(24, 'TestTest13', '25d55ad283aa400af464c76d713c07ad', 0),
(25, 'test', '098f6bcd4621d373cade4e832627b4f6', 0),
(28, 'email-test0', '7455608329aeef2cf1e7cef30e5defa9', 0),
(29, 'email-test1', '282b449246366d2db4cadee1a184af27', 0),
(30, 'email-test2', 'f14019ee320a63fe287fefb396af0ad7', 0),
(31, 'email-test3', '7f3a59020d9ad4f3df4877b25c4712a3', 0),
(32, 'email-test4', '19a61d26011fb068cc3465f220bba027', 0);

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `user_data`
--

CREATE TABLE `user_data` (
  `user_id` int(10) NOT NULL,
  `email` varchar(320) CHARACTER SET ascii NOT NULL,
  `first_name` tinytext,
  `last_name` tinytext,
  `billing_address` tinytext,
  `verified` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Zrzut danych tabeli `user_data`
--

INSERT INTO `user_data` (`user_id`, `email`, `first_name`, `last_name`, `billing_address`, `verified`) VALUES
(0, 'root@sklep.pl', NULL, NULL, NULL, b'1'),
(1, 'admin@sklep.pl', NULL, NULL, NULL, b'1'),
(2, 'technicaltad@gmail.com', 'Tad', 'Tech', '-', b'1'),
(4, 'mirabelki.sklep@gmail.com', 'aaa', 'aaa', '', b'0'),
(5, 'mirabelki.sklep@gmail.com', 'sdadsa', 'asdads', 'daffaggsgds', b'0'),
(6, 'a@b.com', '', '', '', b'0'),
(7, 'mirabelki.sklep@gmail.com', 'd', 'asdsda', 'asdsadsaddsad', b'1'),
(8, '12@34.com', '', '', '', b'0'),
(9, 'jkm@2137.com', 'Janusz', 'Korwin', 'Wiejska 4/6/8, 00-902 Warszawa', b'0'),
(10, 'mirabelki.sklep@gmail.com', 'Janusz', 'Korzwin2', 'Wiejska 4/6/8, 00-902 Warszawa', b'0'),
(11, 'w@w.w', 'edwsfwf', 'rjthnr', 'rtjhne', b'0'),
(12, 'mirabelki.sklep@gmail.com', 'dasd', 'asdds', 'asdsadasdsad', b'0'),
(13, 'mirabelki.sklep@gmail.com', 'asd', 'asdsad', 'asdsadasd', b'0'),
(17, 'mirabelki.sklep@gmail.com', 'asdasd', 'asdsad', 'asdsad', b'0'),
(18, 'mirabelki.sklep@gmail.com', 'dasd', 'asd', 'sadsaddddddd', b'0'),
(19, 'mirabelki.sklep@gmail.com', 'sad', 'asd', 'dd', b'0'),
(20, 'mirabelki.sklep@gmail.com', 'sad', 'asdd', 'dassd', b'0'),
(21, 'mirabelki.sklep@gmail.com', 'sad', 'das', 'asd', b'0'),
(22, 'mirabelki.sklep@gmail.com', 'asd', 'sad', 'asddas', b'0'),
(23, 'mirabelki.sklep@gmail.com', 'fds', 'fds', 'sdf', b'0'),
(24, 'mirabelki.sklep@gmail.com', 'dsa', 'asdd', 'dasdas', b'1'),
(25, 'test@test.test', 'test', 'test', 'test', b'0'),
(28, 'mirabelki.sklep@gmail.com', 'email-test0', 'email-test0', 'email-test0', b'1'),
(29, 'mirabelki.sklep@gmail.com', 'email-test1', 'email-test1', 'email-test1', b'0'),
(30, 'mirabelki.sklep@gmail.com', 'email-test2', 'email-test2', 'email-test2', b'1'),
(31, 'mirabelki.sklep@gmail.com', 'email-test3', 'email-test3', 'email-test3', b'0'),
(32, 'mirabelki.sklep@gmail.com', 'email-test4', 'email-test4', 'email-test4', b'1');

--
-- Indeksy dla zrzutów tabel
--

--
-- Indexes for table `access_levels`
--
ALTER TABLE `access_levels`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user` (`user`),
  ADD KEY `state` (`state`);

--
-- Indexes for table `order_contents`
--
ALTER TABLE `order_contents`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `order_states`
--
ALTER TABLE `order_states`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_categories`
--
ALTER TABLE `product_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_info`
--
ALTER TABLE `product_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category` (`category`);

--
-- Indexes for table `stock`
--
ALTER TABLE `stock`
  ADD UNIQUE KEY `product_id` (`product_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`),
  ADD KEY `access_level` (`access_level`);

--
-- Indexes for table `user_data`
--
ALTER TABLE `user_data`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `product_categories`
--
ALTER TABLE `product_categories`
  MODIFY `id` tinyint(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT dla tabeli `product_info`
--
ALTER TABLE `product_info`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT dla tabeli `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;

--
-- Ograniczenia dla zrzutów tabel
--

--
-- Ograniczenia dla tabeli `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`state`) REFERENCES `order_states` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`user`) REFERENCES `users` (`id`);

--
-- Ograniczenia dla tabeli `order_contents`
--
ALTER TABLE `order_contents`
  ADD CONSTRAINT `order_contents_ibfk_2` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_contents_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`id`);

--
-- Ograniczenia dla tabeli `product_info`
--
ALTER TABLE `product_info`
  ADD CONSTRAINT `product_info_ibfk_1` FOREIGN KEY (`category`) REFERENCES `product_categories` (`id`);

--
-- Ograniczenia dla tabeli `stock`
--
ALTER TABLE `stock`
  ADD CONSTRAINT `stock_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `product_info` (`id`);

--
-- Ograniczenia dla tabeli `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_1` FOREIGN KEY (`access_level`) REFERENCES `access_levels` (`id`);

--
-- Ograniczenia dla tabeli `user_data`
--
ALTER TABLE `user_data`
  ADD CONSTRAINT `user_data_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
