# 03. Panduan & Skrip Presentasi (Pertemuan #8)

Dokumen ini adalah panduan lengkap untuk membantu Anda melakukan presentasi di depan dosen/asisten lab pada **Pertemuan #8**.

---

## 1. Persiapan Sebelum Presentasi

1. Buka terminal (PowerShell / Command Prompt / Terminal VS Code) di folder proyek:
   ```powershell
   cd c:\Users\DoubleRR_Acer\OneDrive\Documents\01-sistem-nilai
   ```
2. Jalankan program dengan perintah:
   ```powershell
   dart run main.dart
   ```
3. Buka berkas `fitur.dart` di editor (VS Code) pada bagian **Fitur Pilihan** (baris 105–157) sehingga Anda siap menunjukkan kodenya saat diminta.

---

## 2. Skrip Presentasi (Langkah Demi Langkah)

### Pembukaan (30 Detik)
> *"Selamat pagi/siang Bapak/Ibu dosen dan teman-teman sekalian. Pada kesempatan kali ini, saya akan mempresentasikan tugas UTS Sistem Nilai Mahasiswa. Dari daftar fitur pilihan yang tersedia, saya memilih dan menyelesaikan 3 fitur, yaitu:*
> 1. *Menu 4: Cari mahasiswa berdasarkan NIM (Tingkat Mudah)*
> 2. *Menu 5: Rata-rata nilai akhir kelas (Tingkat Mudah)*
> 3. *Menu 6: Ubah nilai mahasiswa (Tingkat Sedang)*
>
> *Untuk menjaga agar kode program tetap rapi, bersih, dan fokus, menu yang tidak digunakan (Menu 7 s.d. 10) telah dihapus dari sistem sehingga menu utama kini ringkas dengan pilihan 1 sampai 6.*
> *Sekarang saya akan mendemonstrasikan jalannya program dan menjelaskan implementasi kodenya."*

---

### Demonstrasi & Penjelasan Fitur

#### A. Demonstrasi Menu 4 (Cari Mahasiswa)
1. **Langkah Demo:**
   - Di menu utama, ketik `4` lalu tekan Enter.
   - Masukkan NIM: `2401003` (NIM Citra).
   - Program akan menampilkan:
     ```text
     2401003 | Citra | Tugas 90 | UTS 88 | UAS 92
     2401003 | Citra | 90.2 | A
     ```
   - Uji juga kasus NIM tidak ada: pilih `4` lagi, masukkan NIM `9999999`.
   - Program akan menampilkan:
     ```text
     Mahasiswa dengan NIM 9999999 tidak ditemukan.
     ```
2. **Penjelasan Kode ke Dosen:**
   > *"Pada fungsi `cariMahasiswa()`, pertama program meminta input NIM melalui fungsi `bacaTeks('NIM')`. Kemudian NIM tersebut dicari di koleksi data menggunakan fungsi pembantu `cariByNim(nim)`. Jika tidak ditemukan atau bernilai null, program menampilkan pesan bahwa mahasiswa tidak ditemukan. Namun jika ditemukan, program memanggil `cetakMahasiswa(mhs)` untuk menampilkan rincian nilai tugas, UTS, UAS, dan `cetakNilaiAkhir(mhs)` untuk menampilkan nilai akhir beserta huruf mutunya."*

---

#### B. Demonstrasi Menu 5 (Rata-rata Kelas)
1. **Langkah Demo:**
   - Di menu utama, ketik `5` lalu tekan Enter.
   - Program langsung menampilkan:
     ```text
     === Rata-rata Kelas ===
     Jumlah mahasiswa: 5
     Rata-rata nilai akhir: 64.3
     ```
2. **Penjelasan Kode ke Dosen:**
   > *"Pada fungsi `tampilkanRataRata()`, kita menghitung total nilai akhir dari seluruh mahasiswa yang ada di `daftarMahasiswa` menggunakan perulangan for-in dan fungsi `hitungNilaiAkhir(mhs)`. Nilai total tersebut kemudian dibagi dengan jumlah mahasiswa (`daftarMahasiswa.length`). Terakhir, hasilnya ditampilkan dengan pembulatan 1 angka di belakang koma menggunakan metode `.toStringAsFixed(1)` sehingga menghasilkan angka 64.3."*

---

#### C. Demonstrasi Menu 6 (Ubah Nilai Mahasiswa)
1. **Langkah Demo:**
   - Di menu utama, ketik `6` lalu tekan Enter.
   - Masukkan NIM: `2401002` (NIM Budi).
   - Layar akan menampilkan nilai lama Budi:
     ```text
     2401002 | Budi | Tugas 70 | UTS 65 | UAS 60
     ```
   - Masukkan nilai baru:
     - Nilai tugas baru: `75`
     - Nilai UTS baru: `70`
     - Nilai UAS baru: `68`
   - Program akan menampilkan konfirmasi dan nilai akhir baru:
     ```text
     Nilai Budi berhasil diubah.
     2401002 | Budi | 70.7 | B
     ```
   - *(Buktikan ke dosen bahwa data benar-benar berubah)*: Pilih Menu `1` atau `3` untuk menunjukkan bahwa nilai Budi di daftar utama memang sudah ter-update.
2. **Penjelasan Kode ke Dosen:**
   > *"Pada fungsi `ubahNilai()`, program mencari mahasiswa berdasarkan NIM terlebih dahulu. Data mahasiswa yang lama ditampilkan terlebih dahulu agar user tahu nilai sebelumnya. Kemudian program meminta nilai tugas, UTS, dan UAS yang baru menggunakan fungsi `bacaInt()` dengan batasan min 0 dan max 100 untuk memastikan validitas data. Nilai di dalam Map mahasiswa langsung diperbarui, dan program mencetak pesan sukses beserta nilai akhir dan huruf mutu yang baru melalui `cetakNilaiAkhir(mhs)`."*

---

## 3. Prediksi Pertanyaan Dosen & Kunci Jawabannya

### Q1: *"Mengapa setelah kamu mengubah nilai di Menu 6, saat membuka Menu 1 atau 3 nilainya juga otomatis ikut terubah?"*
> **Jawaban:**
> *"Karena di Dart, variabel bertipe `Map` dilewatkan secara referensi (*pass-by-reference*). Variabel `mhs` yang dikembalikan oleh fungsi `cariByNim()` merujuk langsung ke objek Map yang sama yang berada di dalam `daftarMahasiswa`. Sehingga ketika kita mengubah `mhs['tugas'] = ...`, data di dalam `daftarMahasiswa` otomatis langsung ikut diperbarui."*

### Q2: *"Bagaimana kamu memastikan user tidak memasukkan nilai minus atau lebih dari 100 pada Menu 6?"*
> **Jawaban:**
> *"Saya menggunakan fungsi pembantu `bacaInt('Nilai tugas baru', min: 0, max: 100)` dari `input.dart`. Fungsi tersebut melakukan validasi perulangan: jika user memasukkan karakter non-angka atau angka di luar 0–100, program akan menampilkan peringatan dan meminta input ulang sampai nilainya valid."*

### Q3: *"Bagaimana fungsi `hurufMutu()` menentukan grade A, B, C, D, E?"*
> **Jawaban:**
> *"Fungsi `hurufMutu()` menggunakan fitur pattern matching switch expression di Dart modern: `>= 85 => 'A'`, `>= 70 => 'B'`, `>= 55 => 'C'`, `>= 40 => 'D'`, dan default `_ => 'E'`."*

### Q4: *"Apakah data yang diubah di Menu 6 akan tersimpan permanen di file?"*
> **Jawaban:**
> *"Tidak, sesuai deskripsi tugas, penyimpanan saat ini bersifat in-memory (disimpan di RAM selama program berjalan). Ketika program ditutup dan dijalankan ulang, data akan ter-reset kembali ke nilai awal yang didefinisikan pada `data.dart`."*
