-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 20 Tem 2025, 02:54:55
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `scope_db`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `categories`
--

INSERT INTO `categories` (`id`, `name`) VALUES
(1, 'Markalama Çalışmaları'),
(2, 'Markalama Çalışmaları'),
(3, 'Kreatif Çalışmalar'),
(4, 'Kitapçık Çalışması'),
(5, 'Sunum Çalışması'),
(6, 'Kampanya'),
(7, 'Video Üretimi'),
(8, 'Sosyal Medya'),
(9, 'Online Görsel Çalışmaları'),
(10, 'Deneme2');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `items`
--

CREATE TABLE `items` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `items`
--

INSERT INTO `items` (`id`, `name`, `category_id`, `description`) VALUES
(1, 'Logo / Logotype (Dış İletişim)', 1, 'EVP gibi dış iletişimde de yansıması olan süreçler için gerekli logo veya logotype\'ın tasarımı (3 alternatif)'),
(2, 'Logo / Logotype (İçİletişim)', 1, 'Sadece iç iletişim uygulamaları için iç iletişimde değerlendirilecek logo veya logotype\'ın tasarımı (3 alternatif)'),
(3, 'Veri/Araştırma veya Marka Analizi', 1, 'ÇBA gibi iç anketlerin ve Universum veya genel itibar araştırması gibi dış araştırma raporlarının çıktıları doğrultusunda kapsamlı analiz sunumunun hazırlanması. Verilerin yorumlanması ile birlikte bu verilere dayalı iletişim veya uygulama önerileri de sunulacaktır.'),
(4, 'Marka / Uygulama İsim Çalışması (İç İletişim)', 1, 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.'),
(5, 'Marka / Uygulama İsim Çalışması (İç ve Dış İletişim)', 1, 'İlgili konuya uygun olarak hem iç hem de dış iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.'),
(6, 'Slogan / Motto Çalışması (İç İletişim)', 1, 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak slogan/ motto çalışmasının yapılması.'),
(7, 'Key Visual (İç İletişim)', 2, 'Sadece iç iletişimde kullanılmak üzere genel yaratıcı çatı referans görselin oluşturulması.'),
(8, 'Key Visual (İç ve Dış İletişim)', 2, 'İç ve dış iletişimde kullanılacak genel yaratıcı çatı referans görselin oluşturulması.'),
(9, 'İç İletişim Tasarım Guideline Çalışması', 2, 'İç iletişim için üretilecek tüm iletişim materyallerinde referans alınacak temel guideline’ın belirlenmesi ve ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.'),
(10, 'İç İletişim Brandbook Çalışması', 2, 'İç iletişim için genel iletişim ve metin/içerik dilinin oluşturulması/belirlenmesi ile birlikte görsel dünyanın oluşturulması; ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.'),
(11, 'EVP Brandbook Çalışması', 2, 'Mevcut veya yeni oluşturulacak işveren markasını ve bu markanın varoluş nedenini, amaç ve hedeflerini, sınırlarını, uygulama alanlarını belirleyerek ifade eden ve tüm paydaşlarının referans olarak kullanacağı marka kitapçığı.'),
(12, 'Tasarım Uygulama (Her bir materyale var olan tasarımın doğrudan uygulanması ya da logo yerleştirmesi)', 2, 'Mevcut bir tasarım diline uygun olarak dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.'),
(13, 'Kreatif Tasarım Geliştirme - Grup 1 (Yeni kreatif tasarım geliştirme ve her bir materyale uygulanması)', 2, 'Yeni oluşturulacak bir görsel tasarım dili üzerinden dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.'),
(14, 'Kreatif Tasarım Geliştirme - Grup 1 (Fuarlar için olanları ayır)', 2, 'FUARLAR İÇİN OLANLARI AYIR'),
(15, 'Kit Tasarımı veya Tasarım Seti (10 İç Tasarım Uygulamaya Kadar)', 2, 'Mevcut bir tasarım diline uygun olarak yaka ipi, bez çanta, tshirt, sweatshirt, termos/matara, bardak altlığı, defter/ajanda vb. gibi markalı kit materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.'),
(16, 'Broşür / Kitapçık Tasarımı (Sayfa başı)', 3, 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması.'),
(17, 'Stratejik Broşür / Kitapçık Tasarımı (Sayfa başı)', 3, 'Yeni bir kreatif tasarım geliştirerek markadan gelen datanın belirtilen amaç doğrultusunda hem metin hem de tasarım anlamında yeniden oluşturulması ve tasarımın tümüne uygulanması çalışması.'),
(18, 'Sunum Şablonu Oluşturma', 4, 'Yeni bir kreatif tasarım geliştirerek yaklaşık 10-12 sayfa büyüklüğünde boş bir sunum template hazırlanması.'),
(19, 'Basit Sunum Çalışması (slide başı)', 4, 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda uygulama çalışması. Metin ve stratejik akış markadan gelir ve animasyon içermeyen tasarım uygulanır.'),
(20, 'Dinamik Sunum Çalışması', 4, 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması. Metin ve stratejik akış markadan gelir ancak her sayfa üzerinde tasarımla birlikte gerekli PPT animasyonlar uygulanır.'),
(21, 'Stratejik Sunum Çalışması', 4, 'Genel data ve ilk brief doğrultusunda tüm sunumun stratejik akışı ve içeriği hazırlanır. Yeni bir kreatif tasarım geliştirerek sunumun tümüne uygulanır. Her bir slayta gerekli tüm görsel ve animatif efektler uygulanır.'),
(22, 'Basit Kampanya veya Markalama Tasarımı (İç İletişim)', 5, 'Logo/Logotype, KV, İsim / Slogan, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)'),
(23, 'Orta Ölçekli Kampanya Tasarımı (İç veya Dış İletişim)', 5, 'Stratejik İletişim Çözümlemesi, Dönemsel İletişim Planı, Logo/Logotype, KV, İsim, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)'),
(24, 'Kapsamlı Kampanya Tasarımı (İç veya Dış İletişim)', 5, 'Stratejik İletişim Çözümlemesi, Yıllık İletişim Planı, Logo/Logotype, KV, İsim, Motto, Diğer Alt Kalemlerin Tespiti ve Üretilmesi'),
(25, 'Basic 1 Günlük Çekim', 6, 'Mini röportaj veya tek kamera ile basit çekim için 1 kamera ve 1 kameraman eşliğinde 1 günlük çekimdir'),
(26, 'Pro 1 Günlük Çekim', 6, 'İhtiyaca göre ekipman ve ekibe göre ek olarak projelendirilir'),
(27, 'Basic Animasyon Kısa', 6, '1-3 sahnenin tasarlanarak hareketlendirilmesidir. Maks 15 sn. Stok illüstrasyonlara minimum müdahale ederek üretilir.'),
(28, 'Basic Masaüstü Video 1dk', 6, 'Müşteriden gelen Fotoğraf veya videoların birleştirilerek basit kurgu yapılması ve giriş çıkış animasyonlarının yapılmasıdır. 15sn -1 dk arası videolar içindir'),
(29, 'Pro Animasyon', 6, '10-12 sahnenin tasarlanarak hareketlendirilmesidir. Maks 59 sn. Stok illüstrasyonlara sınırlı müdahale edilerek üretilir.'),
(30, 'Basic Masaüstü Video 2dk', 6, 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Basit kurgu öğeleri içerir, template kullanılabilir. Maks 120 sn'),
(31, 'Pro Masaüstü Video', 6, 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Maks 59 sn. Genellikle dış sesli, sese uygun senaryo ve müzikle desteklenir. Özel tasarım öğeleri ve efektlerle beslenir.'),
(32, 'SM İçerik Konsepti (5 Konsept)', 7, 'Konuya veya projeye özel olarak kariyer hesaplarına uygun sosyal medya konseptlerinin yaratılması ve tasarlanması'),
(33, 'Post/story (Statik) (varolan konseptten uygulama)', 7, 'Kariyer hesapları için metin destekli statik içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması'),
(34, 'Post/story (15 sn\'ye kadar Basic Animasyon) (varolan konseptten uygulama)', 7, 'Kariyer hesapları için metin destekli 15 sn\'ye kadar basit animasyon içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması'),
(35, 'Carousel/Story Set (varolan konseptten uygulama)  (10 görsel)', 7, 'Carousel veya hikâye seti olarak, mevcut konsepte bağlı şekilde 10 görsellik setin hazırlanması'),
(36, 'HMTL5 Youtube Masthead Video/Richmedia Banner', 8, 'HMTL5 Youtube Masthead Video/Richmedia Banner'),
(37, 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))', 8, 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))'),
(38, 'Display Banner Uyarlama', 8, 'Display Banner Uyarlama'),
(39, 'Google Seti (10 Banner) GDN Hareketli set', 8, 'Google Seti (10 Banner) GDN Hareketli set'),
(40, 'E-Bülten Tasarım ve Yazılım', 8, 'E-Bülten Tasarım ve Yazılım'),
(41, 'E-Mailing Tasarım', 8, 'html hariç sadece tasarım içerir'),
(42, 'E-Mailing Tasarım ve Yazılım', 8, 'html uygulama ve teknik destek dahil mailing tasarımıdır'),
(43, 'Website/Landing Page', 8, 'Website/Landing Page'),
(44, 'Website/Landing Page Dil Uyarlama', 8, 'Website/Landing Page Dil Uyarlama');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `scopes`
--

CREATE TABLE `scopes` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `scopes`
--

INSERT INTO `scopes` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'Deneme', '2025-07-14 20:59:12', '2025-07-14 20:59:12'),
(2, 's', '2025-07-14 21:45:46', NULL),
(3, 'a', '2025-07-14 21:53:49', NULL),
(4, 'DEneme2', '2025-07-19 23:24:51', NULL),
(5, 'Deneme 3', '2025-07-20 00:03:07', NULL),
(7, 'Deneme 4', '2025-07-20 00:52:10', NULL),
(8, 'DEneme 5', '2025-07-20 00:52:41', NULL);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `scope_selections`
--

CREATE TABLE `scope_selections` (
  `id` int(11) NOT NULL,
  `scope_id` int(11) NOT NULL,
  `item_id` int(11) NOT NULL,
  `category_name` varchar(255) DEFAULT NULL,
  `item_name` varchar(255) DEFAULT NULL,
  `description` text DEFAULT NULL,
  `included` tinyint(1) NOT NULL DEFAULT 1,
  `quantity` int(11) DEFAULT 0,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `scope_selections`
--

INSERT INTO `scope_selections` (`id`, `scope_id`, `item_id`, `category_name`, `item_name`, `description`, `included`, `quantity`, `created_at`) VALUES
(45, 7, 25, 'Kampanya', 'Basic 1 Günlük Çekim', 'Mini röportaj veya tek kamera ile basit çekim için 1 kamera ve 1 kameraman eşliğinde 1 günlük çekimdir.', 1, 0, '2025-07-20 00:52:10'),
(46, 7, 27, 'Kampanya', 'Basic Animasyon Kısa', '1-3 sahnenin tasarlanarak hareketlendirilmesidir. Maks 15 sn. Stok illüstrasyonlara minimum müdahale ederek üretilir.', 0, 0, '2025-07-20 00:52:10'),
(47, 7, 28, 'Kampanya', 'Basic Masaüstü Video 1dk', 'Müşteriden gelen Fotoğraf veya videoların birleştirilerek basit kurgu yapılması ve giriş çıkış animasyonlarının yapılmasıdır. 15sn -1 dk arası videolar içindir', 0, 0, '2025-07-20 00:52:10'),
(48, 7, 30, 'Kampanya', 'Basic Masaüstü Video 2dk', 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Basit kurgu öğeleri içerir, template kullanılabilir. Maks 120 sn', 0, 0, '2025-07-20 00:52:10'),
(49, 7, 26, 'Kampanya', 'Pro 1 Günlük Çekim', 'İhtiyaca göre ekipman ve ekibe göre ek olarak projelendirilir', 0, 0, '2025-07-20 00:52:10'),
(50, 7, 29, 'Kampanya', 'Pro Animasyon', '10-12 sahnenin tasarlanarak hareketlendirilmesidir. Maks 59 sn. Stok illüstrasyonlara sınırlı müdahale edilerek üretilir.', 0, 0, '2025-07-20 00:52:10'),
(51, 7, 31, 'Kampanya', 'Pro Masaüstü Video', 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Maks 59 sn. Genellikle dış sesli, sese uygun senaryo ve müzikle desteklenir. Özel tasarım öğeleri ve efektlerle beslenir.', 0, 0, '2025-07-20 00:52:10'),
(52, 7, 19, 'Kitapçık Çalışması', 'Basit Sunum Çalışması (slide başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda uygulama çalışması. Metin ve stratejik akış markadan gelir ve animasyon içermeyen tasarım uygulanır.', 0, 0, '2025-07-20 00:52:10'),
(53, 7, 20, 'Kitapçık Çalışması', 'Dinamik Sunum Çalışması', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması. Metin ve stratejik akış markadan gelir ancak her sayfa üzerinde tasarımla birlikte gerekli PPT animasyonlar uygulanır.', 0, 0, '2025-07-20 00:52:10'),
(54, 7, 21, 'Kitapçık Çalışması', 'Stratejik Sunum Çalışması', 'Genel data ve ilk brief doğrultusunda tüm sunumun stratejik akışı ve içeriği hazırlanır. Yeni bir kreatif tasarım geliştirerek sunumun tümüne uygulanır. Her bir slayta gerekli tüm görsel ve animatif efektler uygulanır.', 0, 0, '2025-07-20 00:52:10'),
(55, 7, 18, 'Kitapçık Çalışması', 'Sunum Şablonu Oluşturma', 'Yeni bir kreatif tasarım geliştirerek yaklaşık 10-12 sayfa büyüklüğünde boş bir sunum template hazırlanması.', 0, 0, '2025-07-20 00:52:10'),
(56, 7, 16, 'Kreatif Çalışmalar', 'Broşür / Kitapçık Tasarımı (Sayfa başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması.', 0, 0, '2025-07-20 00:52:10'),
(57, 7, 17, 'Kreatif Çalışmalar', 'Stratejik Broşür / Kitapçık Tasarımı (Sayfa başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen datanın belirtilen amaç doğrultusunda hem metin hem de tasarım anlamında yeniden oluşturulması ve tasarımın tümüne uygulanması çalışması.', 0, 0, '2025-07-20 00:52:10'),
(58, 7, 11, 'Markalama Çalışmaları', 'EVP Brandbook Çalışması', 'Mevcut veya yeni oluşturulacak işveren markasını ve bu markanın varoluş nedenini, amaç ve hedeflerini, sınırlarını, uygulama alanlarını belirleyerek ifade eden ve tüm paydaşlarının referans olarak kullanacağı marka kitapçığı.', 0, 0, '2025-07-20 00:52:10'),
(59, 7, 10, 'Markalama Çalışmaları', 'İç İletişim Brandbook Çalışması', 'İç iletişim için genel iletişim ve metin/içerik dilinin oluşturulması/belirlenmesi ile birlikte görsel dünyanın oluşturulması; ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.', 0, 0, '2025-07-20 00:52:10'),
(60, 7, 9, 'Markalama Çalışmaları', 'İç İletişim Tasarım Guideline Çalışması', 'İç iletişim için üretilecek tüm iletişim materyallerinde referans alınacak temel guideline’ın belirlenmesi ve ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.', 0, 0, '2025-07-20 00:52:10'),
(61, 7, 7, 'Markalama Çalışmaları', 'Key Visual (İç İletişim)', 'Sadece iç iletişimde kullanılmak üzere genel yaratıcı çatı referans görselin oluşturulması.', 0, 0, '2025-07-20 00:52:10'),
(62, 7, 8, 'Markalama Çalışmaları', 'Key Visual (İç ve Dış İletişim)', 'İç ve dış iletişimde kullanılacak genel yaratıcı çatı referans görselin oluşturulması.', 0, 0, '2025-07-20 00:52:10'),
(63, 7, 15, 'Markalama Çalışmaları', 'Kit Tasarımı veya Tasarım Seti (10 İç Tasarım Uygulamaya Kadar)', 'Mevcut bir tasarım diline uygun olarak yaka ipi, bez çanta, tshirt, sweatshirt, termos/matara, bardak altlığı, defter/ajanda vb. gibi markalı kit materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:10'),
(64, 7, 14, 'Markalama Çalışmaları', 'Kreatif Tasarım Geliştirme - Grup 1 (Fuarlar için olanları ayır)', 'FUARLAR İÇİN OLANLARI AYIR', 0, 0, '2025-07-20 00:52:10'),
(65, 7, 13, 'Markalama Çalışmaları', 'Kreatif Tasarım Geliştirme - Grup 1 (Yeni kreatif tasarım geliştirme ve her bir materyale uygulanması)', 'Yeni oluşturulacak bir görsel tasarım dili üzerinden dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:10'),
(66, 7, 1, 'Markalama Çalışmaları', 'Logo / Logotype (Dış İletişim)', 'EVP gibi dış iletişimde de yansıması olan süreçler için gerekli logo veya logotype\'ın tasarımı (3 alternatif)', 0, 0, '2025-07-20 00:52:10'),
(67, 7, 2, 'Markalama Çalışmaları', 'Logo / Logotype (İçİletişim)', 'Sadece iç iletişim uygulamaları için iç iletişimde değerlendirilecek logo veya logotype\'ın tasarımı (3 alternatif)', 0, 0, '2025-07-20 00:52:10'),
(68, 7, 4, 'Markalama Çalışmaları', 'Marka / Uygulama İsim Çalışması (İç İletişim)', 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:10'),
(69, 7, 5, 'Markalama Çalışmaları', 'Marka / Uygulama İsim Çalışması (İç ve Dış İletişim)', 'İlgili konuya uygun olarak hem iç hem de dış iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:10'),
(70, 7, 6, 'Markalama Çalışmaları', 'Slogan / Motto Çalışması (İç İletişim)', 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak slogan/ motto çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:10'),
(71, 7, 12, 'Markalama Çalışmaları', 'Tasarım Uygulama (Her bir materyale var olan tasarımın doğrudan uygulanması ya da logo yerleştirmesi)', 'Mevcut bir tasarım diline uygun olarak dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:10'),
(72, 7, 3, 'Markalama Çalışmaları', 'Veri/Araştırma veya Marka Analizi', 'ÇBA gibi iç anketlerin ve Universum veya genel itibar araştırması gibi dış araştırma raporlarının çıktıları doğrultusunda kapsamlı analiz sunumunun hazırlanması. Verilerin yorumlanması ile birlikte bu verilere dayalı iletişim veya uygulama önerileri de sunulacaktır.', 0, 0, '2025-07-20 00:52:10'),
(73, 7, 37, 'Sosyal Medya', 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))', 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))', 0, 0, '2025-07-20 00:52:10'),
(74, 7, 38, 'Sosyal Medya', 'Display Banner Uyarlama', 'Display Banner Uyarlama', 0, 0, '2025-07-20 00:52:10'),
(75, 7, 40, 'Sosyal Medya', 'E-Bülten Tasarım ve Yazılım', 'E-Bülten Tasarım ve Yazılım', 0, 0, '2025-07-20 00:52:10'),
(76, 7, 41, 'Sosyal Medya', 'E-Mailing Tasarım', 'html hariç sadece tasarım içerir', 0, 0, '2025-07-20 00:52:10'),
(77, 7, 42, 'Sosyal Medya', 'E-Mailing Tasarım ve Yazılım', 'html uygulama ve teknik destek dahil mailing tasarımıdır', 0, 0, '2025-07-20 00:52:10'),
(78, 7, 39, 'Sosyal Medya', 'Google Seti (10 Banner) GDN Hareketli set', 'Google Seti (10 Banner) GDN Hareketli set', 0, 0, '2025-07-20 00:52:10'),
(79, 7, 36, 'Sosyal Medya', 'HMTL5 Youtube Masthead Video/Richmedia Banner', 'HMTL5 Youtube Masthead Video/Richmedia Banner', 0, 0, '2025-07-20 00:52:10'),
(80, 7, 43, 'Sosyal Medya', 'Website/Landing Page', 'Website/Landing Page', 0, 0, '2025-07-20 00:52:10'),
(81, 7, 44, 'Sosyal Medya', 'Website/Landing Page Dil Uyarlama', 'Website/Landing Page Dil Uyarlama', 0, 0, '2025-07-20 00:52:10'),
(82, 7, 22, 'Sunum Çalışması', 'Basit Kampanya veya Markalama Tasarımı (İç İletişim)', 'Logo/Logotype, KV, İsim / Slogan, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)', 0, 0, '2025-07-20 00:52:10'),
(83, 7, 24, 'Sunum Çalışması', 'Kapsamlı Kampanya Tasarımı (İç veya Dış İletişim)', 'Stratejik İletişim Çözümlemesi, Yıllık İletişim Planı, Logo/Logotype, KV, İsim, Motto, Diğer Alt Kalemlerin Tespiti ve Üretilmesi', 0, 0, '2025-07-20 00:52:10'),
(84, 7, 23, 'Sunum Çalışması', 'Orta Ölçekli Kampanya Tasarımı (İç veya Dış İletişim)', 'Stratejik İletişim Çözümlemesi, Dönemsel İletişim Planı, Logo/Logotype, KV, İsim, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)', 0, 0, '2025-07-20 00:52:10'),
(85, 7, 35, 'Video Üretimi', 'Carousel/Story Set (varolan konseptten uygulama)  (10 görsel)', 'Carousel veya hikâye seti olarak, mevcut konsepte bağlı şekilde 10 görsellik setin hazırlanması', 0, 0, '2025-07-20 00:52:10'),
(86, 7, 34, 'Video Üretimi', 'Post/story (15 sn\'ye kadar Basic Animasyon) (varolan konseptten uygulama)', 'Kariyer hesapları için metin destekli 15 sn\'ye kadar basit animasyon içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması', 0, 0, '2025-07-20 00:52:10'),
(87, 7, 33, 'Video Üretimi', 'Post/story (Statik) (varolan konseptten uygulama)', 'Kariyer hesapları için metin destekli statik içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması', 0, 0, '2025-07-20 00:52:10'),
(88, 7, 32, 'Video Üretimi', 'SM İçerik Konsepti (5 Konsept)', 'Konuya veya projeye özel olarak kariyer hesaplarına uygun sosyal medya konseptlerinin yaratılması ve tasarlanması', 0, 0, '2025-07-20 00:52:10'),
(89, 8, 25, 'Kampanya', 'Basic 1 Günlük Çekim', 'Mini röportaj veya tek kamera ile basit çekim için 1 kamera ve 1 kameraman eşliğinde 1 günlük çekimdir.', 1, 0, '2025-07-20 00:52:41'),
(90, 8, 27, 'Kampanya', 'Basic Animasyon Kısa', '1-3 sahnenin tasarlanarak hareketlendirilmesidir. Maks 15 sn. Stok illüstrasyonlara minimum müdahale ederek üretilir.', 0, 0, '2025-07-20 00:52:41'),
(91, 8, 28, 'Kampanya', 'Basic Masaüstü Video 1dk', 'Müşteriden gelen Fotoğraf veya videoların birleştirilerek basit kurgu yapılması ve giriş çıkış animasyonlarının yapılmasıdır. 15sn -1 dk arası videolar içindir', 0, 0, '2025-07-20 00:52:41'),
(92, 8, 30, 'Kampanya', 'Basic Masaüstü Video 2dk', 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Basit kurgu öğeleri içerir, template kullanılabilir. Maks 120 sn', 0, 0, '2025-07-20 00:52:41'),
(93, 8, 26, 'Kampanya', 'Pro 1 Günlük Çekim', 'İhtiyaca göre ekipman ve ekibe göre ek olarak projelendirilir', 0, 0, '2025-07-20 00:52:41'),
(94, 8, 29, 'Kampanya', 'Pro Animasyon', '10-12 sahnenin tasarlanarak hareketlendirilmesidir. Maks 59 sn. Stok illüstrasyonlara sınırlı müdahale edilerek üretilir.', 0, 0, '2025-07-20 00:52:41'),
(95, 8, 31, 'Kampanya', 'Pro Masaüstü Video', 'Stok video veya markadan gelen videoların süperlerle desteklenerek videolaştırılmasıdır. Maks 59 sn. Genellikle dış sesli, sese uygun senaryo ve müzikle desteklenir. Özel tasarım öğeleri ve efektlerle beslenir.', 0, 0, '2025-07-20 00:52:41'),
(96, 8, 19, 'Kitapçık Çalışması', 'Basit Sunum Çalışması (slide başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda uygulama çalışması. Metin ve stratejik akış markadan gelir ve animasyon içermeyen tasarım uygulanır.', 0, 0, '2025-07-20 00:52:41'),
(97, 8, 20, 'Kitapçık Çalışması', 'Dinamik Sunum Çalışması', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması. Metin ve stratejik akış markadan gelir ancak her sayfa üzerinde tasarımla birlikte gerekli PPT animasyonlar uygulanır.', 0, 0, '2025-07-20 00:52:41'),
(98, 8, 21, 'Kitapçık Çalışması', 'Stratejik Sunum Çalışması', 'Genel data ve ilk brief doğrultusunda tüm sunumun stratejik akışı ve içeriği hazırlanır. Yeni bir kreatif tasarım geliştirerek sunumun tümüne uygulanır. Her bir slayta gerekli tüm görsel ve animatif efektler uygulanır.', 0, 0, '2025-07-20 00:52:41'),
(99, 8, 18, 'Kitapçık Çalışması', 'Sunum Şablonu Oluşturma', 'Yeni bir kreatif tasarım geliştirerek yaklaşık 10-12 sayfa büyüklüğünde boş bir sunum template hazırlanması.', 0, 0, '2025-07-20 00:52:41'),
(100, 8, 16, 'Kreatif Çalışmalar', 'Broşür / Kitapçık Tasarımı (Sayfa başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen içeriğe sadece tasarımsal anlamda aynen uygulanması çalışması.', 0, 0, '2025-07-20 00:52:41'),
(101, 8, 17, 'Kreatif Çalışmalar', 'Stratejik Broşür / Kitapçık Tasarımı (Sayfa başı)', 'Yeni bir kreatif tasarım geliştirerek markadan gelen datanın belirtilen amaç doğrultusunda hem metin hem de tasarım anlamında yeniden oluşturulması ve tasarımın tümüne uygulanması çalışması.', 0, 0, '2025-07-20 00:52:41'),
(102, 8, 11, 'Markalama Çalışmaları', 'EVP Brandbook Çalışması', 'Mevcut veya yeni oluşturulacak işveren markasını ve bu markanın varoluş nedenini, amaç ve hedeflerini, sınırlarını, uygulama alanlarını belirleyerek ifade eden ve tüm paydaşlarının referans olarak kullanacağı marka kitapçığı.', 0, 0, '2025-07-20 00:52:41'),
(103, 8, 10, 'Markalama Çalışmaları', 'İç İletişim Brandbook Çalışması', 'İç iletişim için genel iletişim ve metin/içerik dilinin oluşturulması/belirlenmesi ile birlikte görsel dünyanın oluşturulması; ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.', 0, 0, '2025-07-20 00:52:41'),
(104, 8, 9, 'Markalama Çalışmaları', 'İç İletişim Tasarım Guideline Çalışması', 'İç iletişim için üretilecek tüm iletişim materyallerinde referans alınacak temel guideline’ın belirlenmesi ve ana görsel referans ile birlikte alt uygulama görsel set, mailing gibi gerekli tüm şablonların oluşturulması.', 0, 0, '2025-07-20 00:52:41'),
(105, 8, 7, 'Markalama Çalışmaları', 'Key Visual (İç İletişim)', 'Sadece iç iletişimde kullanılmak üzere genel yaratıcı çatı referans görselin oluşturulması.', 0, 0, '2025-07-20 00:52:41'),
(106, 8, 8, 'Markalama Çalışmaları', 'Key Visual (İç ve Dış İletişim)', 'İç ve dış iletişimde kullanılacak genel yaratıcı çatı referans görselin oluşturulması.', 0, 0, '2025-07-20 00:52:41'),
(107, 8, 15, 'Markalama Çalışmaları', 'Kit Tasarımı veya Tasarım Seti (10 İç Tasarım Uygulamaya Kadar)', 'Mevcut bir tasarım diline uygun olarak yaka ipi, bez çanta, tshirt, sweatshirt, termos/matara, bardak altlığı, defter/ajanda vb. gibi markalı kit materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:41'),
(108, 8, 14, 'Markalama Çalışmaları', 'Kreatif Tasarım Geliştirme - Grup 1 (Fuarlar için olanları ayır)', 'FUARLAR İÇİN OLANLARI AYIR', 0, 0, '2025-07-20 00:52:41'),
(109, 8, 13, 'Markalama Çalışmaları', 'Kreatif Tasarım Geliştirme - Grup 1 (Yeni kreatif tasarım geliştirme ve her bir materyale uygulanması)', 'Yeni oluşturulacak bir görsel tasarım dili üzerinden dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:41'),
(110, 8, 1, 'Markalama Çalışmaları', 'Logo / Logotype (Dış İletişim)', 'EVP gibi dış iletişimde de yansıması olan süreçler için gerekli logo veya logotype\'ın tasarımı (3 alternatif)', 0, 0, '2025-07-20 00:52:41'),
(111, 8, 2, 'Markalama Çalışmaları', 'Logo / Logotype (İçİletişim)', 'Sadece iç iletişim uygulamaları için iç iletişimde değerlendirilecek logo veya logotype\'ın tasarımı (3 alternatif)', 0, 0, '2025-07-20 00:52:41'),
(112, 8, 4, 'Markalama Çalışmaları', 'Marka / Uygulama İsim Çalışması (İç İletişim)', 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:41'),
(113, 8, 5, 'Markalama Çalışmaları', 'Marka / Uygulama İsim Çalışması (İç ve Dış İletişim)', 'İlgili konuya uygun olarak hem iç hem de dış iletişimde kullanılmak üzere 3 alternatifli olarak isimlendirme çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:41'),
(114, 8, 6, 'Markalama Çalışmaları', 'Slogan / Motto Çalışması (İç İletişim)', 'İlgili konuya uygun olarak sadece iç iletişimde kullanılmak üzere 3 alternatifli olarak slogan/ motto çalışmasının yapılması.', 0, 0, '2025-07-20 00:52:41'),
(115, 8, 12, 'Markalama Çalışmaları', 'Tasarım Uygulama (Her bir materyale var olan tasarımın doğrudan uygulanması ya da logo yerleştirmesi)', 'Mevcut bir tasarım diline uygun olarak dönkart, wobbler, yer grafiği, sticker, bayrak, tişört, şapka, tebrik kartı, davetiye, zarf, antetli kağıt, dosya, poşet, Rollup, Stand, Ayaklı pano, Tabela, Pankart vb. gibi görsel materyallerinin tasarlanması ve baskı dosyalarının teslim edilmesi.', 0, 0, '2025-07-20 00:52:41'),
(116, 8, 3, 'Markalama Çalışmaları', 'Veri/Araştırma veya Marka Analizi', 'ÇBA gibi iç anketlerin ve Universum veya genel itibar araştırması gibi dış araştırma raporlarının çıktıları doğrultusunda kapsamlı analiz sunumunun hazırlanması. Verilerin yorumlanması ile birlikte bu verilere dayalı iletişim veya uygulama önerileri de sunulacaktır.', 0, 0, '2025-07-20 00:52:41'),
(117, 8, 37, 'Sosyal Medya', 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))', 'Display Banner Tasarım (masthead, pageskin, fulpage skin (flash, jpeg, gif, png))', 0, 0, '2025-07-20 00:52:41'),
(118, 8, 38, 'Sosyal Medya', 'Display Banner Uyarlama', 'Display Banner Uyarlama', 0, 0, '2025-07-20 00:52:41'),
(119, 8, 40, 'Sosyal Medya', 'E-Bülten Tasarım ve Yazılım', 'E-Bülten Tasarım ve Yazılım', 0, 0, '2025-07-20 00:52:41'),
(120, 8, 41, 'Sosyal Medya', 'E-Mailing Tasarım', 'html hariç sadece tasarım içerir', 0, 0, '2025-07-20 00:52:41'),
(121, 8, 42, 'Sosyal Medya', 'E-Mailing Tasarım ve Yazılım', 'html uygulama ve teknik destek dahil mailing tasarımıdır', 0, 0, '2025-07-20 00:52:41'),
(122, 8, 39, 'Sosyal Medya', 'Google Seti (10 Banner) GDN Hareketli set', 'Google Seti (10 Banner) GDN Hareketli set', 0, 0, '2025-07-20 00:52:41'),
(123, 8, 36, 'Sosyal Medya', 'HMTL5 Youtube Masthead Video/Richmedia Banner', 'HMTL5 Youtube Masthead Video/Richmedia Banner', 0, 0, '2025-07-20 00:52:41'),
(124, 8, 43, 'Sosyal Medya', 'Website/Landing Page', 'Website/Landing Page', 0, 0, '2025-07-20 00:52:41'),
(125, 8, 44, 'Sosyal Medya', 'Website/Landing Page Dil Uyarlama', 'Website/Landing Page Dil Uyarlama', 0, 0, '2025-07-20 00:52:41'),
(126, 8, 22, 'Sunum Çalışması', 'Basit Kampanya veya Markalama Tasarımı (İç İletişim)', 'Logo/Logotype, KV, İsim / Slogan, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)', 0, 0, '2025-07-20 00:52:41'),
(127, 8, 24, 'Sunum Çalışması', 'Kapsamlı Kampanya Tasarımı (İç veya Dış İletişim)', 'Stratejik İletişim Çözümlemesi, Yıllık İletişim Planı, Logo/Logotype, KV, İsim, Motto, Diğer Alt Kalemlerin Tespiti ve Üretilmesi', 0, 0, '2025-07-20 00:52:41'),
(128, 8, 23, 'Sunum Çalışması', 'Orta Ölçekli Kampanya Tasarımı (İç veya Dış İletişim)', 'Stratejik İletişim Çözümlemesi, Dönemsel İletişim Planı, Logo/Logotype, KV, İsim, Motto, Afiş, Poster vb. gibi dijital tasarımların hazırlanması. (5 materyale kadar)', 0, 0, '2025-07-20 00:52:41'),
(129, 8, 35, 'Video Üretimi', 'Carousel/Story Set (varolan konseptten uygulama)  (10 görsel)', 'Carousel veya hikâye seti olarak, mevcut konsepte bağlı şekilde 10 görsellik setin hazırlanması', 0, 0, '2025-07-20 00:52:41'),
(130, 8, 34, 'Video Üretimi', 'Post/story (15 sn\'ye kadar Basic Animasyon) (varolan konseptten uygulama)', 'Kariyer hesapları için metin destekli 15 sn\'ye kadar basit animasyon içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması', 0, 0, '2025-07-20 00:52:41'),
(131, 8, 33, 'Video Üretimi', 'Post/story (Statik) (varolan konseptten uygulama)', 'Kariyer hesapları için metin destekli statik içeriklerin oluşturulması ve platformlara uygun boyutlandırmalarının yapılması', 0, 0, '2025-07-20 00:52:41'),
(132, 8, 32, 'Video Üretimi', 'SM İçerik Konsepti (5 Konsept)', 'Konuya veya projeye özel olarak kariyer hesaplarına uygun sosyal medya konseptlerinin yaratılması ve tasarlanması', 0, 0, '2025-07-20 00:52:41');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `items`
--
ALTER TABLE `items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `category_id` (`category_id`);

--
-- Tablo için indeksler `scopes`
--
ALTER TABLE `scopes`
  ADD PRIMARY KEY (`id`);

--
-- Tablo için indeksler `scope_selections`
--
ALTER TABLE `scope_selections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_scope_id` (`scope_id`),
  ADD KEY `fk_item_id` (`item_id`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Tablo için AUTO_INCREMENT değeri `scopes`
--
ALTER TABLE `scopes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- Tablo için AUTO_INCREMENT değeri `scope_selections`
--
ALTER TABLE `scope_selections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=133;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `items`
--
ALTER TABLE `items`
  ADD CONSTRAINT `items_ibfk_1` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`);

--
-- Tablo kısıtlamaları `scope_selections`
--
ALTER TABLE `scope_selections`
  ADD CONSTRAINT `fk_item_id` FOREIGN KEY (`item_id`) REFERENCES `items` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_scope_id` FOREIGN KEY (`scope_id`) REFERENCES `scopes` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
