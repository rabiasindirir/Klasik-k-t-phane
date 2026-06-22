-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Anamakine: 127.0.0.1
-- Üretim Zamanı: 22 Haz 2026, 15:44:03
-- Sunucu sürümü: 10.4.32-MariaDB
-- PHP Sürümü: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Veritabanı: `klasikkütüphane`
--

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kategoriler`
--

CREATE TABLE `kategoriler` (
  `KategoriID` int(11) NOT NULL,
  `KategoriAdi` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kategoriler`
--

INSERT INTO `kategoriler` (`KategoriID`, `KategoriAdi`) VALUES
(1, 'Roman'),
(2, 'Öykü'),
(3, 'Deneme'),
(4, 'Şiir'),
(5, 'Tiyatro'),
(6, 'Anı'),
(7, 'Biyografi'),
(8, 'Eleştiri'),
(9, 'Klasik'),
(10, 'Tarihi Roman');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `kitaplar`
--

CREATE TABLE `kitaplar` (
  `KitapID` int(11) NOT NULL,
  `KitapAdi` varchar(150) NOT NULL,
  `SayfaSayisi` int(11) DEFAULT NULL,
  `YazarID` int(11) DEFAULT NULL,
  `KategoriID` int(11) DEFAULT NULL,
  `YayineviID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `kitaplar`
--

INSERT INTO `kitaplar` (`KitapID`, `KitapAdi`, `SayfaSayisi`, `YazarID`, `KategoriID`, `YayineviID`) VALUES
(1, 'Kürk Mantolu Madonna', 160, 1, 1, 1),
(2, 'Kuyucaklı Yusuf', 220, 1, 1, 1),
(3, 'Huzur', 390, 2, 1, 1),
(4, 'İnce Memed', 450, 3, 1, 2),
(5, 'Aşk-ı Memnu', 320, 4, 1, 3),
(6, 'Çalıkuşu', 400, 5, 1, 3),
(7, 'Dokuzuncu Hariciye', 120, 6, 1, 4),
(8, 'Sinekli Bakkal', 350, 7, 1, 3),
(9, 'Bereketli Topraklar', 380, 8, 1, 4),
(10, 'Tutunamayanlar', 724, 10, 1, 4);

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `oduncalanlar`
--

CREATE TABLE `oduncalanlar` (
  `OduncID` int(11) NOT NULL,
  `KitapID` int(11) DEFAULT NULL,
  `AlanKisi` varchar(100) DEFAULT NULL,
  `Tarih` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `oduncalanlar`
--

INSERT INTO `oduncalanlar` (`OduncID`, `KitapID`, `AlanKisi`, `Tarih`) VALUES
(1, 1, 'Ahmet', '2026-06-01'),
(2, 2, 'Ayşe', '2026-06-02'),
(3, 3, 'Mehmet', '2026-06-03'),
(4, 4, 'Fatma', '2026-06-04'),
(5, 5, 'Zeynep', '2026-06-05'),
(6, 6, 'Can', '2026-06-06'),
(7, 7, 'Deniz', '2026-06-07'),
(8, 8, 'Elif', '2026-06-08'),
(9, 9, 'Burak', '2026-06-09'),
(10, 10, 'Selin', '2026-06-10');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yayinevleri`
--

CREATE TABLE `yayinevleri` (
  `YayineviID` int(11) NOT NULL,
  `YayineviAdi` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yayinevleri`
--

INSERT INTO `yayinevleri` (`YayineviID`, `YayineviAdi`) VALUES
(1, 'Yapı Kredi'),
(2, 'Can Yayınları'),
(3, 'İş Bankası'),
(4, 'İletişim'),
(5, 'Everest'),
(6, 'Alfa'),
(7, 'Doğan Kitap'),
(8, 'Ötüken'),
(9, 'Bilgi Yayınevi'),
(10, 'Remzi Kitabevi');

-- --------------------------------------------------------

--
-- Tablo için tablo yapısı `yazarlar`
--

CREATE TABLE `yazarlar` (
  `YazarID` int(11) NOT NULL,
  `AdSoyad` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Tablo döküm verisi `yazarlar`
--

INSERT INTO `yazarlar` (`YazarID`, `AdSoyad`) VALUES
(1, 'Sabahattin Ali'),
(2, 'Ahmet Hamdi Tanpınar'),
(3, 'Yaşar Kemal'),
(4, 'Halit Ziya Uşaklıgil'),
(5, 'Reşat Nuri Güntekin'),
(6, 'Peyami Safa'),
(7, 'Halide Edip Adıvar'),
(8, 'Orhan Kemal'),
(9, 'Tarık Buğra'),
(10, 'Oğuz Atay');

--
-- Dökümü yapılmış tablolar için indeksler
--

--
-- Tablo için indeksler `kategoriler`
--
ALTER TABLE `kategoriler`
  ADD PRIMARY KEY (`KategoriID`);

--
-- Tablo için indeksler `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD PRIMARY KEY (`KitapID`),
  ADD KEY `YazarID` (`YazarID`),
  ADD KEY `KategoriID` (`KategoriID`),
  ADD KEY `YayineviID` (`YayineviID`);

--
-- Tablo için indeksler `oduncalanlar`
--
ALTER TABLE `oduncalanlar`
  ADD PRIMARY KEY (`OduncID`),
  ADD KEY `KitapID` (`KitapID`);

--
-- Tablo için indeksler `yayinevleri`
--
ALTER TABLE `yayinevleri`
  ADD PRIMARY KEY (`YayineviID`);

--
-- Tablo için indeksler `yazarlar`
--
ALTER TABLE `yazarlar`
  ADD PRIMARY KEY (`YazarID`);

--
-- Dökümü yapılmış tablolar için AUTO_INCREMENT değeri
--

--
-- Tablo için AUTO_INCREMENT değeri `kategoriler`
--
ALTER TABLE `kategoriler`
  MODIFY `KategoriID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `kitaplar`
--
ALTER TABLE `kitaplar`
  MODIFY `KitapID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `oduncalanlar`
--
ALTER TABLE `oduncalanlar`
  MODIFY `OduncID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yayinevleri`
--
ALTER TABLE `yayinevleri`
  MODIFY `YayineviID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Tablo için AUTO_INCREMENT değeri `yazarlar`
--
ALTER TABLE `yazarlar`
  MODIFY `YazarID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Dökümü yapılmış tablolar için kısıtlamalar
--

--
-- Tablo kısıtlamaları `kitaplar`
--
ALTER TABLE `kitaplar`
  ADD CONSTRAINT `kitaplar_ibfk_1` FOREIGN KEY (`YazarID`) REFERENCES `yazarlar` (`YazarID`),
  ADD CONSTRAINT `kitaplar_ibfk_2` FOREIGN KEY (`KategoriID`) REFERENCES `kategoriler` (`KategoriID`),
  ADD CONSTRAINT `kitaplar_ibfk_3` FOREIGN KEY (`YayineviID`) REFERENCES `yayinevleri` (`YayineviID`);

--
-- Tablo kısıtlamaları `oduncalanlar`
--
ALTER TABLE `oduncalanlar`
  ADD CONSTRAINT `oduncalanlar_ibfk_1` FOREIGN KEY (`KitapID`) REFERENCES `kitaplar` (`KitapID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
