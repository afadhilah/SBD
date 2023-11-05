CREATE TABLE Customer (
	ID_customer CHAR(6) NOT NULL,
	Nama_customer VARCHAR(100) NOT NULL,
	CONSTRAINT Customer_PK PRIMARY KEY(ID_customer)
);
 
CREATE TABLE Pegawai (
	NIK CHAR(16) NOT NULL,
	Nama_pegawai VARCHAR(100) NOT NULL,
	Jenis_kelamin CHAR(1) NOT NULL,
	Email VARCHAR(50) NOT NULL,
	Umur INT NOT NULL,
	CONSTRAINT Pegawai_PK PRIMARY KEY (NIK)	
);

CREATE TABLE Menu_minuman (
	ID_minuman CHAR(6) NOT NULL,
	Nama_minuman VARCHAR(50) NOT NULL,
	Harga_minuman FLOAT(2) NOT NULL,
	CONSTRAINT Menu_minuman_PK PRIMARY KEY (ID_minuman)
);

CREATE TABLE Telepon (
	No_telp_pegawai VARCHAR(15) NOT NULL,
	Pegawai_NIK CHAR(16) NOT NULL,
	CONSTRAINT Telepon_PK PRIMARY KEY (No_telp_pegawai),
	CONSTRAINT Telepon_Pegawai_FK FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai(NIK)
);

CREATE TABLE Transaksi (
	ID_transaksi CHAR(10) NOT NULL,
	Tanggal_transaksi DATE NOT NULL,
	Metode_pembayaran VARCHAR(15) NOT NULL,
	Customer_id_customer CHAR(6) NOT NULL,
	Pegawai_NIK CHAR(16) NOT NULL,
	CONSTRAINT Transaksi_PK PRIMARY KEY (ID_transaksi),
	CONSTRAINT Transaksi_Customer_FK FOREIGN KEY (Customer_id_customer) REFERENCES Customer(ID_customer),
	CONSTRAINT Transaksi_Pegawai_FK FOREIGN KEY (Pegawai_NIK) REFERENCES Pegawai(NIK)
);

CREATE TABLE Transaksi_minuman (
	TM_Menu_minuman_ID CHAR(6) NOT NULL,
	TM_Transaksi_ID CHAR(10) NOT NULL,
	Jumlah_cup INT NOT NULL,
	CONSTRAINT Transaksi_minuman_PK PRIMARY KEY (TM_Menu_minuman_ID, TM_Transaksi_ID),
	CONSTRAINT TM_ID_Menu_minuman_FK FOREIGN KEY (TM_Menu_minuman_ID) REFERENCES Customer(ID_customer),
	CONSTRAINT TM_ID_Transaksi_FK FOREIGN KEY (TM_Transaksi_ID) REFERENCES Transaksi(ID_transaksi)
);

CREATE TABLE Membership(
    id_membership CHAR(6) NOT NULL,
    no_telepon_customer VARCHAR(15) NOT NULL,
    alamat_customer VARCHAR(100) NOT NULL,
    tanggal_pembuatan_kartu_membership DATE NOT NULL,
    tanggal_kedaluawarsa_kartu_membership DATE,
    total_poin INT NOT NULL,
    customer_id_customer CHAR(6) NOT NULL
);

ALTER TABLE Membership ADD CONSTRAINT PK_Membership PRIMARY KEY (id_membership);
ALTER TABLE Membership ADD CONSTRAINT FK_Customer_Membership FOREIGN KEY (customer_id_customer) REFERENCES Customer(ID_customer) ON DELETE RESTRICT ON UPDATE CASCADE;
ALTER TABLE transaksi DROP FOREIGN KEY transaksi_ibfk_1;
ALTER TABLE Transaksi ADD CONSTRAINT FK_Customer_Transaksi FOREIGN KEY (Customer_id_customer) REFERENCES Customer(ID_customer) ON UPDATE CASCADE ON DELETE CASCADE;
ALTER TABLE Membership ALTER tanggal_pembuatan_kartu_membership SET DEFAULT(CURDATE());
ALTER TABLE Membership ADD CHECK (total_poin >= 0);
ALTER TABLE membership MODIFY alamat_customer VARCHAR(150);

DROP TABLE Telepon;
ALTER TABLE Pegawai ADD No_Telp_Pegawai VARCHAR(15);

INSERT INTO Customer (ID_customer, Nama_customer) 
VALUES ('CTR001','Budi Santoso');

INSERT INTO Customer (ID_customer, Nama_customer) 
VALUES ('CTR002','Sisil Triana');

INSERT INTO Customer (ID_customer, Nama_customer) 
VALUES ('CTR003','Davi Liam');

INSERT INTO Customer (ID_customer, Nama_customer) 
VALUES ('CTRo04','Sutris Ten An');

INSERT INTO Customer (ID_customer, Nama_customer) 
VALUES ('CTR005','Hendra Asto');

INSERT INTO Membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluawarsa_kartu_membership, total_poin, customer_id_customer) 
VALUES ('MBR001', '08123456789', 'Jl. Imam Bonjol', '2023-10-24', '2023-11-30', '0', 'CTR001');

INSERT INTO Membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluawarsa_kartu_membership, total_poin, customer_id_customer) 
VALUES ('MBR002', '0812345678', 'Jl. Kelinci', '2023-10-24', '2023-11-30', '3', 'CTR002');

INSERT INTO Membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluawarsa_kartu_membership, total_poin, customer_id_customer) 
VALUES ('MBR003', '081234567890', 'Jl. Abah Ojak', '2023-10-25', '2023-12-01', '2', 'CTR003');

INSERT INTO Membership (id_membership, no_telepon_customer, alamat_customer, tanggal_pembuatan_kartu_membership, tanggal_kedaluawarsa_kartu_membership, total_poin, customer_id_customer) 
VALUES ('MBR004', '0898765432', 'Jl. Kenangan', '2023-10-26', '2023-12-02', '6', 'CTR005');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_Telp_Pegawai)
VALUES ('1234567890123456', 'Naufal Raf', 'L', 'nuafal@gmail.com', '19', '62123456789');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_Telp_Pegawai)
VALUES ('2345678901234561', 'Surinala ', 'P', 'surinala@gmail.com', '24', '621234567890');

INSERT INTO Pegawai (NIK, Nama_pegawai, Jenis_kelamin, Email, Umur, No_Telp_Pegawai)
VALUES ('3456789012345612', 'Ben John ', 'L', 'benjohn@gmail.com', '22', '6212345678');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000001','2023-10-01', 'Kartu kredit', '2345678901234561', 'CTR002');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000002','2023-10-03', 'Transfer bank', '3456789012345612', 'CTRo04');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000003','2023-10-05', 'Tunai', '3456789012345612', 'CTR001');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000004','2023-10-15', 'Kartu debit', '1234567890123456', 'CTR003');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000005','2023-10-15', 'E-wallet', '1234567890123456 ', 'CTRo04');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000006','2023-10-21', 'Tunai', '2345678901234561', 'CTR001');

INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM001', 'Expresso', '18000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM002', 'Cappuccino', '20000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM003', 'Latte', '21000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM004', 'Americano', '19000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM005', 'Mocha', '22000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM006', 'Macchiato', '23000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM007', 'Cold Brew', '21000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM008', 'Iced Coffee', '18000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM009', 'Affogato', '23000');
INSERT INTO Menu_minuman (ID_minuman, Nama_minuman, Harga_minuman)
VALUES ('MNM010', 'Coffee Frappe', '22000');


INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000005', 'MNM006', '2');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000001', 'MNM010', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000002', 'MNM005', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000005', 'MNM009', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000003', 'MNM001', '3');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000006', 'MNM003', '2');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000004', 'MNM004', '2');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000004', 'MNM010', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000002', 'MNM003', '2');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000001', 'MNM007', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000005', 'MNM001', '1');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000003', 'MNM003', '1');

INSERT INTO Transaksi (ID_transaksi, Tanggal_transaksi, Metode_pembayaran, Pegawai_NIK, Customer_id_customer)
VALUES ('TRX0000007','2023-10-3', 'Transfer bank', '2345678901234561', 'CTRo04');
INSERT INTO Transaksi_minuman(TM_Transaksi_ID, TM_Menu_minuman_ID,Jumlah_cup)
VALUES ('TRX0000007', 'MNM005', '1');

INSERT INTO Pegawai (NIK, Nama_pegawai, Umur)
VALUES ('1111222233334444', 'Maimunah', '25');


UPDATE Customer SET ID_customer = 'CTR004' WHERE ID_customer = 'CTRo04';
UPDATE Pegawai SET Jenis_kelamin = 'P', Email = 'maimunah@gmail.com', No_Telp_Pegawai = '621234567' WHERE NIK = 1111222233334444;

UPDATE Membership SET total_poin = '0' WHERE tanggal_kedaluawarsa_kartu_membership = '2023-11-30';

DELETE FROM Membership;

DELETE FROM Pegawai WHERE Nama_pegawai = 'Maimunah';




