-- Yazarlar Tablosu
CREATE TABLE Yazarlar (
    yazar_id SERIAL PRIMARY KEY,
    ad VARCHAR(100) NOT NULL,
    soyad VARCHAR(100) NOT NULL,
    uyruk VARCHAR(50) NOT NULL,
    dogum_yili DATE NOT NULL
);

-- Kitaplar Tablosu
CREATE TABLE Kitaplar (
    kitap_id SERIAL PRIMARY KEY,
    ISBN VARCHAR(20) NOT NULL UNIQUE,
    baslik VARCHAR(200) NOT NULL,
    yazar_id INT NOT NULL REFERENCES Yazarlar(yazar_id),
    yayinevi VARCHAR(100) NOT NULL,
    tur VARCHAR(50) NOT NULL,
    basim_yili INT NOT NULL CHECK (basim_yili >= 1000),
    stok_adedi INT NOT NULL CHECK (stok_adedi >= 0)
);

-- Üyeler Tablosu
CREATE TABLE Uyeler (
    uye_id SERIAL PRIMARY KEY,
    ad VARCHAR(100) NOT NULL,
    soyad VARCHAR(100) NOT NULL,
    telefon VARCHAR(20) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    uyelik_tarihi DATE NOT NULL CHECK (uyelik_tarihi <= CURRENT_DATE),
    ceza_puani INT NOT NULL CHECK (ceza_puani >= 0)
);

-- Ödünç Hareketleri Tablosu
CREATE TABLE Odunc_hareketleri (
    hareket_id SERIAL PRIMARY KEY,
    kitap_id INT NOT NULL REFERENCES Kitaplar(kitap_id),
    uye_id INT NOT NULL REFERENCES Uyeler(uye_id),
    verilis_tarihi DATE NOT NULL,
    iade_tarihi DATE,
    durum VARCHAR(20) NOT NULL CHECK (durum IN ('iade edildi', 'gecikmiş', 'devam ediyor')),
    CHECK (iade_tarihi IS NULL OR iade_tarihi >= verilis_tarihi)
);

INSERT INTO Yazarlar (ad, soyad, uyruk, dogum_yili) VALUES
('Orhan', 'Pamuk', 'Türk', '1952-06-07'),
('Elif', 'Şafak', 'Türk', '1971-10-25'),
('George', 'Orwell', 'İngiliz', '1903-06-25'),
('J.K.', 'Rowling', 'İngiliz', '1965-07-31'),
('Stephen', 'King', 'Amerikan', '1947-09-21'),
('Victor', 'Hugo', 'Fransız', '1802-02-26'),
('Fyodor', 'Dostoyevski', 'Rus', '1821-11-11'),
('Jane', 'Austen', 'İngiliz', '1775-12-16'),
('Albert', 'Camus', 'Fransız', '1913-11-07'),
('Franz', 'Kafka', 'Alman', '1883-07-03'),
('Sabahattin', 'Ali', 'Türk', '1907-02-25'),
('Ahmet', 'Ümit', 'Türk', '1960-09-30'),
('Paulo', 'Coelho', 'Brezilyalı', '1947-08-24'),
('Haruki', 'Murakami', 'Japon', '1949-01-12'),
('Charles', 'Dickens', 'İngiliz', '1812-02-07'),
('Hermann', 'Hesse', 'Alman', '1877-07-02'),
('Nazım', 'Hikmet', 'Türk', '1902-01-15'),
('Yaşar', 'Kemal', 'Türk', '1923-10-06'),
('Umberto', 'Eco', 'İtalyan', '1932-01-05'),
('Milan', 'Kundera', 'Çek', '1929-04-01');

INSERT INTO Kitaplar (ISBN, baslik, yazar_id, yayinevi, tur, basim_yili, stok_adedi) VALUES
('9780000000001', 'Masumiyet Müzesi', 1, 'İletişim Yayınları', 'Roman', 2008, 5),
('9780000000002', 'Yeni Hayat', 1, 'İletişim Yayınları', 'Roman', 1994, 3),
('9780000000003', 'Aşk', 2, 'Doğan Kitap', 'Roman', 2009, 4),
('9780000000004', 'Baba ve Piç', 2, 'Doğan Kitap', 'Roman', 2003, 2),
('9780000000005', '1984', 3, 'Penguin Books', 'Distopya', 1949, 7),
('9780000000006', 'Hayvan Çiftliği', 3, 'Penguin Books', 'Distopya', 1945, 6),
('9780000000007', 'Harry Potter 1', 4, 'Bloomsbury', 'Fantastik', 1997, 10),
('9780000000008', 'Harry Potter 2', 4, 'Bloomsbury', 'Fantastik', 1998, 8),
('9780000000009', 'It', 5, 'Viking Press', 'Korku', 1986, 4),
('9780000000010', 'The Shining', 5, 'Doubleday', 'Korku', 1977, 5),
('9780000000011', 'Sefiller', 6, 'Gallimard', 'Klasik', 1862, 12),
('9780000000012', 'Suç ve Ceza', 7, 'Penguin Classics', 'Klasik', 1866, 9),
('9780000000013', 'Gurur ve Önyargı', 8, 'Penguin Classics', 'Roman', 1813, 6),
('9780000000014', 'Yabancı', 9, 'Gallimard', 'Roman', 1942, 7),
('9780000000015', 'Dönüşüm', 10, 'Penguin', 'Roman', 1915, 5),
('9780000000016', 'Kürk Mantolu Madonna', 11, 'YKY', 'Roman', 1943, 8),
('9780000000017', 'İçimizdeki Şeytan', 11, 'YKY', 'Roman', 1940, 4),
('9780000000018', 'Tutunamayanlar', 12, 'Everest', 'Roman', 2001, 6),
('9780000000019', 'Simyacı', 13, 'HarperOne', 'Roman', 1988, 10),
('9780000000020', 'Norwegian Wood', 14, 'Vintage', 'Roman', 1987, 7),
('9780000000021', 'Büyük Umutlar', 15, 'Penguin Classics', 'Roman', 1861, 5),
('9780000000022', 'Bozkırkurdu', 16, 'Suhrkamp', 'Roman', 1927, 4),
('9780000000023', 'Memleketimden İnsan Manzaraları', 17, 'YKY', 'Şiir', 1960, 3),
('9780000000024', 'İnce Memed', 18, 'YKY', 'Roman', 1955, 9),
('9780000000025', 'Gülün Adı', 19, 'Harcourt', 'Roman', 1980, 6),
('9780000000026', 'Varolmanın Dayanılmaz Hafifliği', 20, 'Harper', 'Roman', 1984, 7),
('9780000000027', 'Sessiz Ev', 1, 'İletişim Yayınları', 'Roman', 1983, 4),
('9780000000028', 'Mahrem', 2, 'Doğan Kitap', 'Roman', 2000, 3),
('9780000000029', 'İskender', 2, 'Doğan Kitap', 'Roman', 2011, 5),
('9780000000030', 'Animal Farm', 3, 'Signet Classics', 'Distopya', 1945, 7),
('9780000000031', 'Harry Potter 3', 4, 'Bloomsbury', 'Fantastik', 1999, 9),
('9780000000032', 'Harry Potter 4', 4, 'Bloomsbury', 'Fantastik', 2000, 8),
('9780000000033', 'Misery', 5, 'Viking Press', 'Korku', 1987, 4),
('9780000000034', 'Carrie', 5, 'Doubleday', 'Korku', 1974, 5),
('9780000000035', 'Notre Dame’ın Kamburu', 6, 'Gallimard', 'Klasik', 1831, 6),
('9780000000036', 'Budala', 7, 'Penguin Classics', 'Klasik', 1869, 7),
('9780000000037', 'Emma', 8, 'Penguin Classics', 'Roman', 1815, 5),
('9780000000038', 'Düşüş', 9, 'Gallimard', 'Roman', 1956, 4),
('9780000000039', 'Şato', 10, 'Penguin Classics', 'Roman', 1926, 6),
('9780000000040', 'Canım Aliye', 11, 'YKY', 'Mektup', 1998, 3),
('9780000000041', 'Beyoğlu Rapsodisi', 12, 'Everest', 'Polisiye', 2003, 5),
('9780000000042', 'Zahir', 13, 'HarperOne', 'Roman', 2005, 6),
('9780000000043', 'Kafka on the Shore', 14, 'Vintage', 'Roman', 2002, 7),
('9780000000044', 'İki Şehrin Hikayesi', 15, 'Penguin Classics', 'Roman', 1859, 5),
('9780000000045', 'Siddhartha', 16, 'Suhrkamp', 'Roman', 1922, 4),
('9780000000046', 'Şeyh Bedreddin Destanı', 17, 'YKY', 'Şiir', 1936, 3),
('9780000000047', 'Yer Demir Gök Bakır', 18, 'YKY', 'Roman', 1963, 6),
('9780000000048', 'Foucault’nun Sarkacı', 19, 'Harcourt', 'Roman', 1988, 7),
('9780000000049', 'Gülmenin ve Unutmanın Kitabı', 20, 'Harper', 'Roman', 1979, 5),
('9780000000050', 'Geceyarısı Kütüphanesi', 1, 'İletişim Yayınları', 'Roman', 2020, 6);

INSERT INTO Uyeler (ad, soyad, telefon, email, uyelik_tarihi, ceza_puani) VALUES
('Ayşe', 'Yılmaz', '05321234567', 'ayse.yilmaz@example.com', '2023-03-15', 0),
('Mehmet', 'Kaya', '05431234567', 'mehmet.kaya@example.com', '2022-11-20', 5),
('Zeynep', 'Demir', '05051234567', 'zeynep.demir@example.com', '2024-01-10', 2),
('Ali', 'Çelik', '05361234567', 'ali.celik@example.com', '2023-07-05', 0),
('Fatma', 'Koç', '05381234567', 'fatma.koc@example.com', '2022-09-12', 1),
('Ahmet', 'Şahin', '05391234567', 'ahmet.sahin@example.com', '2023-02-18', 0),
('Selin', 'Arslan', '05061234567', 'selin.arslan@example.com', '2024-05-22', 3),
('Burak', 'Öztürk', '05071234567', 'burak.ozturk@example.com', '2023-08-30', 0),
('Deniz', 'Acar', '05081234567', 'deniz.acar@example.com', '2022-12-01', 4),
('Ece', 'Güneş', '05091234567', 'ece.gunes@example.com', '2023-04-14', 0),
('Murat', 'Polat', '05311234567', 'murat.polat@example.com', '2023-06-20', 2),
('Hülya', 'Sezer', '05321234568', 'hulya.sezer@example.com', '2024-02-05', 0),
('Can', 'Aksoy', '05331234567', 'can.aksoy@example.com', '2023-09-11', 1),
('Emine', 'Yıldız', '05341234567', 'emine.yildiz@example.com', '2022-10-25', 0),
('Kerem', 'Taş', '05351234567', 'kerem.tas@example.com', '2023-01-19', 3),
('Gül', 'Erdoğan', '05361234568', 'gul.erdogan@example.com', '2024-03-08', 0),
('Onur', 'Kurt', '05371234567', 'onur.kurt@example.com', '2023-05-27', 2),
('Seda', 'Çınar', '05381234568', 'seda.cinar@example.com', '2022-07-15', 0),
('Yusuf', 'Bozkurt', '05391234567', 'yusuf.bozkurt@example.com', '2023-11-02', 1),
('Melis', 'Karaca', '05011234567', 'melis.karaca@example.com', '2024-04-21', 0),
('Serkan', 'Uslu', '05021234567', 'serkan.uslu@example.com', '2023-02-14', 2),
('Derya', 'Altun', '05031234567', 'derya.altun@example.com', '2022-08-09', 0),
('Okan', 'Çetin', '05041234567', 'okan.cetin@example.com', '2023-12-01', 4),
('Hande', 'Özdemir', '05051234567', 'hande.ozdemir@example.com', '2024-01-25', 0),
('Tolga', 'Ergin', '05061234567', 'tolga.ergin@example.com', '2023-06-30', 1);

INSERT INTO Odunc_hareketleri (kitap_id, uye_id, verilis_tarihi, iade_tarihi, durum) VALUES
(1, 1, '2025-11-01', '2025-11-10', 'iade edildi'),
(2, 2, '2025-11-05', NULL, 'devam ediyor'),
(3, 3, '2025-11-07', '2025-11-20', 'gecikmiş'),
(4, 4, '2025-11-10', '2025-11-15', 'iade edildi'),
(5, 5, '2025-11-12', NULL, 'devam ediyor'),
(6, 6, '2025-11-14', '2025-11-25', 'iade edildi'),
(7, 7, '2025-11-16', NULL, 'devam ediyor'),
(8, 8, '2025-11-18', '2025-11-28', 'iade edildi'),
(9, 9, '2025-11-20', '2025-12-01', 'gecikmiş'),
(10, 10, '2025-11-22', NULL, 'devam ediyor'),
(11, 11, '2025-11-24', '2025-12-02', 'iade edildi'),
(12, 12, '2025-11-26', NULL, 'devam ediyor'),
(13, 13, '2025-11-28', '2025-12-05', 'iade edildi'),
(14, 14, '2025-11-30', NULL, 'devam ediyor'),
(15, 15, '2025-12-02', '2025-12-12', 'gecikmiş'),
(16, 16, '2025-12-04', NULL, 'devam ediyor'),
(17, 17, '2025-12-06', '2025-12-15', 'iade edildi'),
(18, 18, '2025-12-08', NULL, 'devam ediyor'),
(19, 19, '2025-12-10', '2025-12-20', 'iade edildi'),
(20, 20, '2025-12-12', NULL, 'devam ediyor'),
(21, 21, '2025-12-14', '2025-12-22', 'iade edildi'),
(22, 22, '2025-12-16', NULL, 'devam ediyor'),
(23, 23, '2025-12-18', '2025-12-28', 'gecikmiş'),
(24, 24, '2025-12-20', NULL, 'devam ediyor'),
(25, 25, '2025-12-22', '2025-12-30', 'iade edildi'),
(26, 1, '2025-12-24', NULL, 'devam ediyor'),
(27, 2, '2025-12-26', '2026-01-05', 'iade edildi'),
(28, 3, '2025-12-27', NULL, 'devam ediyor'),
(29, 4, '2025-12-28', '2026-01-07', 'gecikmiş'),
(30, 5, '2025-12-29', NULL, 'devam ediyor');

SELECT * FROM Odunc_hareketleri;
SELECT * FROM Kitaplar;
SELECT * FROM Uyeler;
SELECT * FROM Yazarlar;



