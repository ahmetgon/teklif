-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 14 Tem 2025, 22:12:06
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
(9, 'Online Görsel Çalışmaları');

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
(25, 'Basic 1 Günlük Çekim', 6, 'Mini röportaj veya tek kamera ile basit çekim için 1 kamera ve 1 kameraman eşliğinde 1 günlük çekimdir.'),
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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Tablo için AUTO_INCREMENT değeri `items`
--
ALTER TABLE `items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- Tablo için AUTO_INCREMENT değeri `scopes`
--
ALTER TABLE `scopes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Tablo için AUTO_INCREMENT değeri `scope_selections`
--
ALTER TABLE `scope_selections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

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
