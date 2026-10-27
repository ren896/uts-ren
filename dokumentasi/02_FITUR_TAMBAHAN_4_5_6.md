# 02. Penjelasan Fitur Tambahan (Menu 4, 5, dan 6)

Dokumen ini menjelaskan secara mendalam implementasi kode untuk 3 fitur pilihan yang diminta dan dikerjakan pada `fitur.dart`. Seluruh fitur lain yang tidak digunakan (Menu 7 s.d. 10) telah dihapus dari sistem agar kode menjadi ringkas, bersih, dan optimal.

---

## 1. Menu 4 — Cari Mahasiswa Berdasarkan NIM (`cariMahasiswa()`)

- **Tingkat Kesulitan**: Mudah
- **Tujuan**: Meminta input NIM dari pengguna. Jika mahasiswa ditemukan, tampilkan data komponen nilainya dan nilai akhirnya. Jika tidak ditemukan, tampilkan pesan peringatan.

### Kode Program
```dart
/// Menu 4 [Mudah]: mencari mahasiswa berdasarkan NIM.
void cariMahasiswa() {
  print('\n=== Cari Mahasiswa ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);
  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }
  cetakMahasiswa(mhs);
  cetakNilaiAkhir(mhs);
}
```

### Penjelasan Langkah Kerja:
1. **Pengecekan Koleksi Kosong**:
   Sebelum meminta input, kode memeriksa apakah `daftarMahasiswa.isEmpty`. Jika kosong, langsung mencetak pesan dan `return`.
2. **Membaca Input**:
   Fungsi `bacaTeks('NIM')` meminta user memasukkan NIM, menghapus spasi yang tidak disengaja (*trimming*), dan memastikan input tidak boleh kosong.
3. **Pencarian Data**:
   Memanggil `cariByNim(nim)`. Fungsi ini menelusuri list dan mengembalikan `Map` mahasiswa terkait atau `null`.
4. **Kondisi Tidak Ditemukan**:
   Jika hasil pencarian `null`, sistem mencetak pesan jelas:
   `Mahasiswa dengan NIM <nim> tidak ditemukan.`
5. **Kondisi Ditemukan**:
   Jika ditemukan, sistem mencetak dua baris info sesuai ketentuan soal:
   - Baris 1 (`cetakMahasiswa`): Data komponen nilai (Tugas, UTS, UAS).
   - Baris 2 (`cetakNilaiAkhir`): Nilai akhir (1 angka di belakang koma) dan huruf mutu.

---

## 2. Menu 5 — Rata-rata Nilai Akhir Kelas (`tampilkanRataRata()`)

- **Tingkat Kesulitan**: Mudah
- **Tujuan**: Menghitung rata-rata nilai akhir seluruh mahasiswa yang ada di kelas, lalu menampilkannya dengan format 1 angka di belakang koma.

### Kode Program
```dart
/// Menu 5 [Mudah]: menampilkan rata-rata nilai akhir kelas.
void tampilkanRataRata() {
  print('\n=== Rata-rata Kelas ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  var total = 0.0;
  for (final mhs in daftarMahasiswa) {
    total += hitungNilaiAkhir(mhs);
  }
  final rataRata = total / daftarMahasiswa.length;
  print('Jumlah mahasiswa: ${daftarMahasiswa.length}');
  print('Rata-rata nilai akhir: ${rataRata.toStringAsFixed(1)}');
}
```

### Penjelasan Langkah Kerja:
1. **Validasi Data Kosong**:
   Mencegah *division by zero* (pembagian dengan nol) jika daftar mahasiswa kosong.
2. **Akumulasi Nilai Akhir**:
   Inisialisasi variabel `total = 0.0`. Melalui perulangan `for (final mhs in daftarMahasiswa)`, setiap mahasiswa dihitung nilai akhirnya menggunakan fungsi `hitungNilaiAkhir(mhs)` dan ditambahkan ke variabel `total`.
3. **Pembagian Rata-rata**:
   `rataRata = total / daftarMahasiswa.length`.
4. **Format Tampilan**:
   - `Jumlah mahasiswa: 5`
   - `Rata-rata nilai akhir: ${rataRata.toStringAsFixed(1)}`
   - Metode `.toStringAsFixed(1)` memastikan angka desimal dibulatkan tepat 1 digit di belakang koma (misal `64.32` menjadi `64.3`).

### Pembuktian Perhitungan Data Awal:
- Andi: $85 \times 0.3 + 78 \times 0.3 + 80 \times 0.4 = 80.9$
- Budi: $70 \times 0.3 + 65 \times 0.3 + 60 \times 0.4 = 64.5$
- Citra: $90 \times 0.3 + 88 \times 0.3 + 92 \times 0.4 = 90.2$
- Dewi: $60 \times 0.3 + 45 \times 0.3 + 50 \times 0.4 = 51.5$
- Eko: $40 \times 0.3 + 35 \times 0.3 + 30 \times 0.4 = 34.5$
- **Total**: $80.9 + 64.5 + 90.2 + 51.5 + 34.5 = 321.6$
- **Rata-rata**: $321.6 / 5 = 64.32 \approx 64.3$ (Sesuai 100% dengan modul soal).

---

## 3. Menu 6 — Ubah Nilai Mahasiswa (`ubahNilai()`)

- **Tingkat Kesulitan**: Sedang
- **Tujuan**: Meminta NIM, menampilkan data mahasiswa sebelum diubah, meminta input nilai baru untuk Tugas, UTS, dan UAS (rentang 0-100), memperbarui data, lalu menampilkan nilai akhir yang baru.

### Kode Program
```dart
/// Menu 6 [Sedang]: mengubah nilai tugas, UTS, dan UAS seorang mahasiswa.
void ubahNilai() {
  print('\n=== Ubah Nilai ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  final nim = bacaTeks('NIM');
  final mhs = cariByNim(nim);
  if (mhs == null) {
    print('Mahasiswa dengan NIM $nim tidak ditemukan.');
    return;
  }
  cetakMahasiswa(mhs);
  mhs['tugas'] = bacaInt('Nilai tugas baru', min: 0, max: 100);
  mhs['uts'] = bacaInt('Nilai UTS baru', min: 0, max: 100);
  mhs['uas'] = bacaInt('Nilai UAS baru', min: 0, max: 100);
  print('Nilai ${mhs['nama']} berhasil diubah.');
  cetakNilaiAkhir(mhs);
}
```

### Penjelasan Langkah Kerja:
1. **Validasi & Pencarian NIM**:
   Mencari objek mahasiswa berdasarkan NIM yang dimasukkan. Jika tidak ditemukan, keluar dengan pesan error.
2. **Menampilkan Data Saat Ini**:
   `cetakMahasiswa(mhs)` dipanggil untuk memberikan konfirmasi visual data nilai saat ini kepada pengguna.
3. **Membaca Nilai Baru dengan Validasi**:
   Menggunakan `bacaInt(..., min: 0, max: 100)`. Jika user menginput huruf atau angka di luar rentang $0 - 100$, fungsi `bacaInt()` di `input.dart` akan menolak input dan meminta user mengulang hingga valid.
4. **Memperbarui Data di Memori (*Reference Passing*)**:
   Karena `mhs` adalah referensi objek Map di dalam `daftarMahasiswa`, baris:
   ```dart
   mhs['tugas'] = ...
   mhs['uts'] = ...
   mhs['uas'] = ...
   ```
   secara langsung meng-update data mahasiswa yang bersangkutan.
5. **Konfirmasi & Nilai Akhir Baru**:
   Mencetak pesan sukses `'Nilai <nama> berhasil diubah.'`, lalu memanggil `cetakNilaiAkhir(mhs)` untuk menampilkan nilai akhir dan huruf mutu baru yang otomatis terhitung ulang.

---

## 4. Penghapusan Fitur yang Tidak Digunakan (Menu 7 - 10)

Seluruh fungsi yang tidak dipilih (Menu 7, 8, 9, 10) telah dihapus sepenuhnya dari `fitur.dart` dan `main.dart`.
Hal ini memberikan keuntungan:
- Menu aplikasi menjadi sangat rapi (hanya opsi 1 s.d. 6 dan 0 untuk keluar).
- Validasi pilihan menu disesuaikan menjadi `min: 0, max: 6`.
- Kode bebas dari *dead code* atau fungsi yang tidak terpakai.
