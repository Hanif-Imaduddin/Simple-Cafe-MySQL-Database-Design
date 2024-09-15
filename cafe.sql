CREATE DATABASE cafe;
USE cafe;
CREATE TABLE supplier(
	id_supplier INT NOT NULL AUTO_INCREMENT,
	nama_supplier VARCHAR(20) NOT NULL,
	alamat VARCHAR(255) NOT NULL,
	jenis_produk VARCHAR(20),
	nomor_telepon CHAR(12),
	PRIMARY KEY(id_supplier)
);

CREATE TABLE pembelian(
	id_pembelian INT NOT NULL AUTO_INCREMENT,
	tanggal_pembelian DATETIME NOT NULL,
	total_biaya DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(id_pembelian)
);

ALTER TABLE pembelian
	ADD COLUMN nomor_referensi_transaksi INT NOT NULL;
	
CREATE TABLE pembayaran(
	nomor_referensi_transaksi INT NOT NULL AUTO_INCREMENT,
	tanggal_pembayaran DATETIME NOT NULL,
	metode_pembayaran VARCHAR(20),
	total_pembayaran DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(nomor_referensi_transaksi)
);

DESC pembelian;
ALTER TABLE pembelian
	ADD FOREIGN KEY (nomor_referensi_transaksi) REFERENCEs pembayaran(nomor_referensi_transaksi);
	
CREATE TABLE baha_baku(
	id_bahan_baku INT NOT NULL AUTO_INCREMENT,
	nama VARCHAR(20) NOT NULL,
	kategori VARCHAR(20) NOT NULL,
	stok INT,
	PRIMARY KEY(id_bahan_baku)
);

ALTER TABLE pembelian
	ADD COLUMN id_supplier INT NOT NULL;
	
ALTER TABLE pembelian
	ADD FOREIGN KEY(id_supplier) REFERENCES supplier(id_supplier);

RENAME TABLE baha_baku TO bahan_baku;

CREATE TABLE membeli(
	id_pembelian INT NOT NULL,
	id_bahan_baku INT NOT NULL,
	jumlah_barang INT NOT NULL,
	harga_satuan DECIMAL(10,2) NOT NULL,
	PRIMARY KEY(id_pembelian,id_bahan_baku),
	FOREIGN KEY(id_pembelian) REFERENCES pembelian(id_pembelian),
	FOREIGN KEY(id_bahan_baku) REFERENCES bahan_baku(id_bahan_baku)
);

SHOW TABLES;