-- tables
-- Table: Cabang
CREATE TABLE Cabang (
    ID char(8)  NOT NULL,
    Alamat varchar(100)  NOT NULL,
    Kecamatan varchar(50)  NOT NULL,
    Tanggal_Pembukaan date  NOT NULL,
    CONSTRAINT Cabang_pk PRIMARY KEY (ID)
) ;

-- Table: Membership
CREATE TABLE Membership (
    ID char(10)  NOT NULL,
    Tanggal_Pendaftaran date  NOT NULL,
    Tanggal_Kadaluwarsa date  NOT NULL,
    CONSTRAINT Membership_pk PRIMARY KEY (ID)
) ;

-- Table: Pegawai
CREATE TABLE Pegawai (
    ID char(8)  NOT NULL,
    Nama varchar(50)  NOT NULL,
    Asal_Kota varchar(50)  NOT NULL,
    Nomor_Telepon char(12)  NOT NULL,
    Tanggal_Mulai_Bekerja date  NOT NULL,
    Tanggal_Lahir date  NOT NULL,
    CONSTRAINT Pegawai_pk PRIMARY KEY (ID)
) ;

-- Table: Pelanggan
CREATE TABLE Pelanggan (
    NIK char(16)  NOT NULL,
    Nama varchar(50)  NOT NULL,
    Asal_Kota varchar(50)  NOT NULL,
    Nomor_Telepon char(12)  NOT NULL,
    Usia integer  NULL,
    Membership_ID char(10)  NULL,
    CONSTRAINT Pelanggan_pk PRIMARY KEY (NIK),
    CONSTRAINT Pelanggan_Membership FOREIGN KEY (Membership_ID) REFERENCES Membership (ID)
) ;

-- Table: Sepeda
CREATE TABLE Sepeda (
    ID char(6)  NOT NULL,
    Jenis varchar(20)  NOT NULL,
    Merek varchar(20)  NOT NULL,
    Harga_Sewa_Per_Jam integer  NOT NULL,
    CONSTRAINT Sepeda_pk PRIMARY KEY (ID)
) ;

-- Table: Transaksi
CREATE TABLE Transaksi (
    ID char(10)  NOT NULL,
    Tanggal_Sewa date  NOT NULL,
    Waktu_Mulai timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Waktu_Selesai timestamp  NOT NULL DEFAULT CURRENT_TIMESTAMP,
    Sepeda_ID char(6)  NOT NULL,
    Pegawai_ID char(8)  NOT NULL,
    Pelanggan_NIK char(16)  NOT NULL,
    Cabang_ID char(8)  NOT NULL,
    CONSTRAINT Transaksi_pk PRIMARY KEY (ID),

    CONSTRAINT Transaksi_Cabang FOREIGN KEY (Cabang_ID) REFERENCES Cabang (ID),
    CONSTRAINT Transaksi_Pegawai FOREIGN KEY (Pegawai_ID) REFERENCES Pegawai (ID),
    CONSTRAINT Transaksi_Pelanggan FOREIGN KEY (Pelanggan_NIK) REFERENCES Pelanggan (NIK),
    CONSTRAINT Transaksi_Sepeda FOREIGN KEY (Sepeda_ID) REFERENCES Sepeda (ID)
) ;

-- INSERT DATA

-- Tabel Cabang
INSERT INTO Cabang (ID, Alamat, Kecamatan, Tanggal_Pembukaan) VALUES
('CAB01001', 'Jalan Mandala No. 123', 'Abepura', '2021-01-10'),
('CAB02001', 'Jalan Beringin No. 42', 'Herkulanus', '2021-12-15'),
('CAB01002', 'Jalan Anggrek No. 8', 'Abepura', '2022-03-20'),
('CAB01004', 'Bukit Auri Blok D-2', 'Abepura', '2022-03-25'),
('CAB02002', 'Taman Cenderawasih No. 20', 'Herkulanus', '2023-05-30'),
('CAB03001', 'Jalan Veteran No. 126', 'Koya', '2022-05-30'),
('CAB03002', 'Taman Bhayangkara No. 53', 'Koya', '2022-07-10'),
('CAB04001', 'Taman Bunga Mawar Sari No. 20', 'Sentani', '2022-08-15'),
('CAB04002', 'Bukit Batu Blok F-11', 'Sentani', '2022-08-20'),
('CAB05001', 'Jalan Pemuda No. 30', 'Nimboran', '2022-08-25');

-- Tabel Membership
INSERT INTO Membership (ID, Tanggal_Pendaftaran, Tanggal_Kadaluwarsa) VALUES
('MID2212001', '2022-12-01', '2023-12-01'),
('MID2301002', '2023-01-05', '2024-01-05'),
('MID2302003', '2023-02-10', '2024-02-10'),
('MID2312004', '2022-12-15', '2024-12-15'),
('MID2304005', '2023-04-20', '2024-04-20'),
('MID2302006', '2023-02-25', '2024-02-25'),
('MID2303007', '2023-03-30', '2024-03-30'),
('MID2303008', '2023-03-05', '2024-03-05'),
('MID2305009', '2023-05-10', '2024-05-10'),
('MID2305010', '2023-05-15', '2024-05-15');

-- Tabel Pegawai
INSERT INTO Pegawai (ID, Nama, Asal_Kota, Nomor_Telepon, Tanggal_Mulai_Bekerja, Tanggal_Lahir) VALUES
('PEG22001', 'Budi Santoso', 'Jayapura', '083227194332', '2022-05-01', '1995-03-15'),
('PEG22002', 'Anita Wijaya', 'Jayapura', '084778201563', '2022-05-05', '1997-08-20'),
('PEG22003', 'Ricky Pratama', 'Jayapura', '086666882220', '2022-10-06', '1990-05-10'),
('PEG22004', 'Siti Rahayu', 'Teluk Wondama', '083428119774', '2022-12-12', '1993-12-25'),
('PEG23005', 'Joko Susanto', 'Biak', '086789012303', '2023-01-20', '1996-10-30'),
('PEG23006', 'Lina Wati', 'Jayapura', '085678901234', '2023-01-27', '1991-07-05'),
('PEG23007', 'Hendra Firmansyah', 'Biak', '086798013452', '2023-03-01', '1992-04-18'),
('PEG23008', 'Maya Setiawan', 'Teluk Wondama', '081249005664', '2023-02-07', '1996-01-20'),
('PEG23009', 'Agus Hermawan', 'Jayapura', '083742900320', '2023-02-10', '1989-09-10'),
('PEG23010', 'Dewi Wulandari', 'Biak', '089444883290', '2023-02-12', '1993-06-05');

-- Tabel Pelanggan
INSERT INTO Pelanggan (NIK, Nama, Asal_Kota, Nomor_Telepon, Usia, Membership_ID) VALUES
('1234567890123456', 'Linda Susanti', 'Jayapura', '082994557281', 24, 'MID2212001'),
('1224367890123456', 'Wandi Hermanto', 'Poso', '081111777888', 24, NULL),
('1224367888723456', 'Lisa Hermanto', 'Poso', '085663773993', 17, NULL),
('2224357890122466', 'Indah Cahyani', 'Semarang', '080889453218', 24, 'MID2301002'),
('2345678901234567', 'Ahmad Rizki', 'Semarang', '083445992001', 27, 'MID2302003'),
('2456789012345678', 'Siti Nurhaliza', 'Bima', '082886445321', 30, 'MID2312004'),
('4567890123456789', 'Bayu Kusuma', 'Baturaja', '082335987220', 23, 'MID2304005'),
('5678901234567890', 'Dewi Anggraini', 'Jayapura', '088334728901', 26, 'MID2302006'),
('5678900034567890', 'Dewi Ayudya', 'Bali', '085555556667', 26, NULL),
('6789012345678901', 'Rudi Hermawan', 'Tarakan', '086674432290', 29, NULL),
('7890123456789012', 'Sinta Dewi', 'Blitar', '087773219990', 32, 'MID2303007'),
('8901234567890123', 'Bambang Setiawan', 'Malang', '088550983271', 25, 'MID2303008'),
('8999234567890123', 'Agus Junianto', 'Malang', '088894533820', 25, NULL),
('9012345678901234', 'Larasati Putri', 'Jayapura', '087600011115', 28, 'MID2305009'),
('0123456789012345', 'Eko Prasetyo', 'Jambi', '083765491203', 31, 'MID2305010');

-- Tabel Sepeda
INSERT INTO Sepeda (ID, Jenis, Merek, Harga_Sewa_Per_Jam) VALUES
('SPD001', 'Gunung', 'Giant', 100.000),
('SPD002', 'Gunung', 'Scott', 75.000),
('SPD003', 'Gunung', 'Trek', 80.000),
('SPD004', 'Kota', 'Electra', 60.000),
('SPD005', 'Kota', 'Breezer', 70.000),
('SPD006', 'Lipat', 'Giant', 55.000),
('SPD007', 'Lipat', 'Brompthon', 60.000),
('SPD008', 'Lipat', 'Tern', 65.000),
('SPD009', 'BMX', 'GT', 70.000),
('SPD010', 'BMX', 'Redline', 90.000);

-- Tabel Transaksi
INSERT INTO Transaksi (ID, Tanggal_Sewa, Waktu_Mulai, Waktu_Selesai, Sepeda_ID, Pegawai_ID, Pelanggan_NIK, Cabang_ID) VALUES
('TRX2301001', '2023-01-01', '2023-01-01 08:00:00', '2023-01-03 10:00:00', 'SPD001', 'PEG22001', '1234567890123456', 'CAB01001'),
('TRX2302002', '2023-02-05', '2023-02-05 10:30:00', '2023-02-05 13:30:00', 'SPD005', 'PEG22001', '1224367890123456', 'CAB01001'),
('TRX2302003', '2023-02-05', '2023-02-05 10:30:00', '2023-02-05 16:30:00', 'SPD004', 'PEG22001', '1224367888723456', 'CAB01001'),
('TRX2303004', '2023-03-10', '2023-03-10 08:00:00', '2023-03-10 18:00:00', 'SPD003', 'PEG22003', '2224357890122466', 'CAB01002'),
('TRX2304005', '2023-04-15', '2023-04-15 14:30:00', '2023-04-15 15:30:00', 'SPD002', 'PEG22004', '2345678901234567', 'CAB01004'),
('TRX2305006', '2023-05-20', '2023-05-20 07:00:00', '2023-05-20 20:00:00', 'SPD001', 'PEG23005', '2456789012345678', 'CAB02002'),
('TRX2306007', '2023-06-25', '2023-06-25 09:00:00', '2023-06-25 13:00:00', 'SPD006', 'PEG23006', '4567890123456789', 'CAB03001'),
('TRX2307008', '2023-07-30', '2023-07-30 10:30:00', '2023-07-30 12:30:00', 'SPD007', 'PEG23007', '5678901234567890', 'CAB03002'),
('TRX2308009', '2023-08-05', '2023-08-05 12:00:00', '2023-08-05 15:00:00', 'SPD005', 'PEG23007', '5678900034567890', 'CAB03002'),
('TRX2309010', '2023-09-10', '2023-09-10 14:30:00', '2023-09-10 16:30:00', 'SPD009', 'PEG23009', '6789012345678901', 'CAB04001'),
('TRX2310011', '2023-10-15', '2023-10-15 16:00:00', '2023-10-15 17:00:00', 'SPD008', 'PEG23010', '7890123456789012', 'CAB05001'),
('TRX2311012', '2023-11-01', '2023-11-01 08:00:00', '2023-11-01 14:00:00', 'SPD010', 'PEG22001', '1234567890123456', 'CAB01001'),
('TRX2311013', '2023-11-21', '2023-11-21 12:00:00', '2023-11-21 19:00:00', 'SPD001', 'PEG22002', '1234567890123456', 'CAB01001'),
('TRX2303014', '2023-03-11', '2023-03-11 13:00:00', '2023-03-11 15:00:00', 'SPD004', 'PEG22003', '2224357890122466', 'CAB01002'),
('TRX2304015', '2023-04-11', '2023-04-11 12:00:00', '2023-04-11 14:00:00', 'SPD004', 'PEG23008', '8901234567890123', 'CAB04001'),
('TRX2304016', '2023-04-21', '2023-04-21 07:00:00', '2023-02-21 12:00:00', 'SPD004', 'PEG23008', '8999234567890123', 'CAB04002'),
('TRX2304017', '2023-04-28', '2023-04-28 08:00:00', '2023-04-28 16:00:00', 'SPD006', 'PEG22004', '9012345678901234', 'CAB01004'),
('TRX2305018', '2023-05-10', '2023-05-10 12:30:00', '2023-05-10 15:30:00', 'SPD009', 'PEG22004', '9012345678901234', 'CAB01004'),
('TRX2306019', '2023-06-08', '2023-06-08 12:00:00', '2023-06-08 18:00:00', 'SPD002', 'PEG22003', '0123456789012345', 'CAB01002'),
('TRX2306020', '2023-06-27', '2023-06-27 10:00:00', '2023-06-27 14:00:00', 'SPD005', 'PEG23005', '4567890123456789', 'CAB03001');


--1
SELECT 
    P.NIK,
    P.Nama AS Customer_Name,
    P.Asal_Kota AS Customer_City
FROM 
    Pelanggan P
JOIN 
    Transaksi T ON P.NIK = T.Pelanggan_NIK
WHERE 
    P.Membership_ID IS NOT NULL
    AND T.Waktu_Mulai > '2023-01-01 08:00:00';


--2
SELECT
    C.*,
    COUNT(T.ID) AS Transaction_Count
FROM
    Cabang C
LEFT JOIN
    Transaksi T ON C.ID = T.Cabang_ID
GROUP BY
    C.ID, C.Alamat, C.Kecamatan, C.Tanggal_Pembukaan
ORDER BY
    C.ID;


--3
SELECT
    P.NIK,
    P.Nama AS Customer_Name,
    P.Asal_Kota AS Customer_City,
    P.Usia
FROM
    Pelanggan P
WHERE
    P.Usia > (
        SELECT
            AVG(TIMESTAMPDIFF(YEAR, Tanggal_Lahir, CURDATE()))
        FROM
            Pegawai
    );

--4
SELECT
    T.Cabang_ID AS Branch_ID,
    GROUP_CONCAT(S.ID) AS Bike_ID_List,
    COUNT(T.ID) AS Brand_Transaction_Count
FROM
    Transaksi T
JOIN
    Sepeda S ON T.Sepeda_ID = S.ID
JOIN (
    SELECT
        T1.Cabang_ID,
        S1.Merek,
        COUNT(T1.ID) AS Brand_Count
    FROM
        Transaksi T1
    JOIN
        Sepeda S1 ON T1.Sepeda_ID = S1.ID
    GROUP BY
        T1.Cabang_ID, S1.Merek
) AS BrandCount ON T.Cabang_ID = BrandCount.Cabang_ID AND S.Merek = BrandCount.Merek
WHERE
    (S.Merek, BrandCount.Brand_Count) IN (
        SELECT
            Merek,
            MAX(Brand_Count)
        FROM
            (
                SELECT
                    T2.Cabang_ID,
                    S2.Merek,
                    COUNT(T2.ID) AS Brand_Count
                FROM
                    Transaksi T2
                JOIN
                    Sepeda S2 ON T2.Sepeda_ID = S2.ID
                GROUP BY
                    T2.Cabang_ID, S2.Merek
            ) AS MaxBrandCount
        GROUP BY
            Merek
    )
GROUP BY
    T.Cabang_ID, S.Merek
ORDER BY
    T.Cabang_ID;

--5
SELECT
    P.Nama AS Customer_Name,
    P.Membership_ID,
    COUNT(T.ID) AS Total_Transactions
FROM
    Pelanggan P
JOIN
    Transaksi T ON P.NIK = T.Pelanggan_NIK
JOIN
    Membership M ON P.Membership_ID = M.ID
WHERE
    DATE(M.Tanggal_Pendaftaran) = DATE(T.Tanggal_Sewa)
GROUP BY
    P.NIK, P.Membership_ID
ORDER BY
    Total_Transactions DESC;

--6
SELECT
    P.Nama AS Employee_Name,
    P.Tanggal_Mulai_Bekerja AS Start_Date,
    COUNT(T.ID) AS Number_of_Transactions
FROM
    Pegawai P
JOIN
    Transaksi T ON P.ID = T.Pegawai_ID
WHERE
    YEAR(P.Tanggal_Mulai_Bekerja) = 2023
GROUP BY
    P.ID, P.Nama, P.Tanggal_Mulai_Bekerja
ORDER BY
    Number_of_Transactions DESC;

--7
SELECT
    S.Jenis AS Bike_Type,
    COUNT(T.ID) AS Number_of_Bikes_Rented
FROM
    Sepeda S
JOIN
    Transaksi T ON S.ID = T.Sepeda_ID
WHERE
    MONTH(T.Tanggal_Sewa) = MONTH(CURRENT_DATE())
    AND YEAR(T.Tanggal_Sewa) = YEAR(CURRENT_DATE())
GROUP BY
    S.Jenis
ORDER BY
    Number_of_Bikes_Rented DESC;

--8
SELECT
    P.Nama AS Customer_Name,
    P.Nomor_Telepon AS Phone_Number,
    P.Membership_ID
FROM
    Pelanggan P
JOIN
    Transaksi T ON P.NIK = T.Pelanggan_NIK
JOIN
    Sepeda S ON T.Sepeda_ID = S.ID
WHERE
    S.Jenis = 'Gunung'
GROUP BY
    P.NIK, P.Nama, P.Nomor_Telepon, P.Membership_ID
HAVING
    COUNT(T.ID) > 1;

--9
SELECT
    T.ID AS Transaction_ID,
    T.Tanggal_Sewa AS Rental_Date,
    TIMESTAMPDIFF(HOUR, T.Waktu_Mulai, T.Waktu_Selesai) AS Rental_Duration,
    S.Jenis AS Bike_Type,
    (TIMESTAMPDIFF(HOUR, T.Waktu_Mulai, T.Waktu_Selesai) * S.Harga_Sewa_Per_Jam) AS Total_Rental_Cost
FROM
    Transaksi T
JOIN
    Sepeda S ON T.Sepeda_ID = S.ID
WHERE
    TIMESTAMPDIFF(HOUR, T.Waktu_Mulai, T.Waktu_Selesai) > (
        SELECT
            AVG(TIMESTAMPDIFF(HOUR, Waktu_Mulai, Waktu_Selesai))
        FROM
            Transaksi
    )
ORDER BY
    Rental_Duration DESC;


--10
SELECT
    Cabang_ID AS Branch_ID,
    COUNT(ID) AS Number_of_Transactions
FROM
    Transaksi
GROUP BY
    Cabang_ID
HAVING
    COUNT(ID) = (
        SELECT
            MIN(TransactionCount)
        FROM (
            SELECT
                Cabang_ID,
                COUNT(ID) AS TransactionCount
            FROM
                Transaksi
            GROUP BY
                Cabang_ID
        ) AS BranchTransactionCounts
    );

