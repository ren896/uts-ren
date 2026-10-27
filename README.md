# UTS: 01 Sistem Nilai Mahasiswa

Aplikasi console berbasis bahasa pemrograman **Dart** untuk mengelola data dan nilai mahasiswa (Tugas, UTS, UAS), menghitung nilai akhir secara otomatis, menentukan huruf mutu, serta mengelola fitur pencarian dan pembaruan nilai.

Dikerjakan untuk memenuhi tugas Ujian Tengah Semester (UTS) - Pertemuan #8.

---

## Fitur Aplikasi

### 1. Fitur Bawaan
- **Menu 1 — Lihat Daftar Mahasiswa**: Menampilkan seluruh data mahasiswa dan nilai mentahnya.
- **Menu 2 — Tambah Mahasiswa**: Menambahkan data mahasiswa baru dengan validasi NIM unik.
- **Menu 3 — Lihat Nilai Akhir**: Menghitung dan menampilkan nilai akhir serta huruf mutu.

### 2. Fitur Pilihan yang Diimplementasikan
- **Menu 4 [Mudah] — Cari Mahasiswa (NIM)**: Mencari mahasiswa berdasarkan NIM dan menampilkan rincian nilai beserta nilai akhirnya.
- **Menu 5 [Mudah] — Rata-rata Kelas**: Menghitung rata-rata nilai akhir seluruh kelas dengan format 1 desimal.
- **Menu 6 [Sedang] — Ubah Nilai Mahasiswa**: Memperbarui nilai tugas, UTS, dan UAS mahasiswa (validasi 0–100) dan langsung menghitung ulang nilai akhir.

---

## Struktur Berkas

```text
├── data.dart        # Data awal mahasiswa dan konstanta bobot nilai
├── input.dart       # Fungsi pembantu input keyboard dengan validasi
├── fitur.dart       # Logika bisnis dan fungsi fitur (Menu 1-6)
├── main.dart        # Entry point aplikasi (menu utama loop)
└── dokumentasi/     # Dokumentasi mendalam dan panduan presentasi
    ├── README.md
    ├── 01_STRUKTUR_DAN_FITUR_DASAR.md
    ├── 02_FITUR_TAMBAHAN_4_5_6.md
    └── 03_PANDUAN_PRESENTASI_UTS.md
```

---

## Cara Menjalankan Program

Pastikan Dart SDK sudah terinstal di komputer Anda:

```bash
dart run main.dart
```

---

## Dokumentasi Lengkap & Panduan Presentasi

Penjelasan teknis baris demi baris, alur logika, dan skrip presentasi tersedia di folder **[dokumentasi/](./dokumentasi/README.md)**.
