# 01. Struktur Proyek & Fitur Dasar

Dokumen ini menjelaskan struktur arsitektur sistem, aturan penilaian, serta fungsi dasar dan pembantu yang sudah tersedia.

---

## 1. Struktur File Proyek

Proyek ini tersusun dari 4 berkas Dart:

| File | Peran & Tanggung Jawab |
| :--- | :--- |
| `main.dart` | Titik masuk utama program (`main()`), menampilkan menu interaktif dan mengarahkan pilihan user menggunakan `switch-case`. |
| `data.dart` | Menyimpan konstanta bobot nilai (`bobotTugas`, `bobotUts`, `bobotUas`), batas lulus (`batasLulus`), dan data in-memory mahasiswa (`daftarMahasiswa`). |
| `input.dart` | Berisi fungsi utilitas untuk membaca input dari keyboard dengan validasi (`bacaTeks()`, `bacaInt()`, `bacaDouble()`). |
| `fitur.dart` | Berisi semua fungsi logika bisnis: fungsi pembantu, fitur bawaan (Menu 1-3), dan fitur pilihan (Menu 4-10). |

---

## 2. Aturan Perhitungan Nilai

1. **Bobot Komponen Nilai Akhir:**
   $$\text{Nilai Akhir} = (30\% \times \text{Tugas}) + (30\% \times \text{UTS}) + (40\% \times \text{UAS})$$
   Konstanta di `data.dart`:
   - `bobotTugas = 0.3`
   - `bobotUts = 0.3`
   - `bobotUas = 0.4`

2. **Aturan Huruf Mutu:**
   - **A** : $\ge 85$
   - **B** : $\ge 70$
   - **C** : $\ge 55$
   - **D** : $\ge 40$
   - **E** : $< 40$

3. **Status Kelulusan:**
   - Mahasiswa dinyatakan lulus jika $\text{Nilai Akhir} \ge 55$ (`batasLulus = 55`).

---

## 3. Data Awal Mahasiswa (`data.dart`)

Data disimpan dalam memori menggunakan tipe data `List<Map<String, dynamic>>`:

```dart
final List<Map<String, dynamic>> daftarMahasiswa = [
  {'nim': '2401001', 'nama': 'Andi', 'tugas': 85, 'uts': 78, 'uas': 80},
  {'nim': '2401002', 'nama': 'Budi', 'tugas': 70, 'uts': 65, 'uas': 60},
  {'nim': '2401003', 'nama': 'Citra', 'tugas': 90, 'uts': 88, 'uas': 92},
  {'nim': '2401004', 'nama': 'Dewi', 'tugas': 60, 'uts': 45, 'uas': 50},
  {'nim': '2401005', 'nama': 'Eko', 'tugas': 40, 'uts': 35, 'uas': 30},
];
```

*Catatan: Karena data hanya disimpan di memori (RAM), setiap kali program ditutup dan dibuka kembali, data akan kembali seperti semula.*

---

## 4. Fungsi-Fungsi Pembantu (`fitur.dart`)

Fungsi pembantu dibuat untuk menghindari duplikasi kode (*Don't Repeat Yourself / DRY*):

### a. `hitungNilaiAkhir(Map<String, dynamic> mhs)`
- **Tujuan**: Menghitung nilai akhir dengan mengalikan masing-masing nilai dengan konstanta bobot.
- **Implementasi**:
  ```dart
  double hitungNilaiAkhir(Map<String, dynamic> mhs) {
    final tugas = mhs['tugas'] as int;
    final uts = mhs['uts'] as int;
    final uas = mhs['uas'] as int;
    return tugas * bobotTugas + uts * bobotUts + uas * bobotUas;
  }
  ```

### b. `hurufMutu(double nilai)`
- **Tujuan**: Menentukan huruf mutu berdasarkan nilai akhir. Menggunakan sintaks modern Dart pattern matching `switch expression`.
- **Implementasi**:
  ```dart
  String hurufMutu(double nilai) => switch (nilai) {
    >= 85 => 'A',
    >= 70 => 'B',
    >= 55 => 'C',
    >= 40 => 'D',
    _ => 'E',
  };
  ```

### c. `cariByNim(String nim)`
- **Tujuan**: Mencari data mahasiswa di `daftarMahasiswa` berdasarkan NIM. Mengembalikan objek `Map` mahasiswa jika ditemukan, atau `null` jika tidak ditemukan.
- **Implementasi**:
  ```dart
  Map<String, dynamic>? cariByNim(String nim) {
    for (final mhs in daftarMahasiswa) {
      if (mhs['nim'] == nim) return mhs;
    }
    return null;
  }
  ```

### d. `cetakMahasiswa(Map<String, dynamic> mhs)`
- **Tujuan**: Mencetak informasi lengkap komponen nilai mahasiswa (NIM, Nama, Nilai Tugas, Nilai UTS, Nilai UAS).

### e. `cetakNilaiAkhir(Map<String, dynamic> mhs)`
- **Tujuan**: Menghitung nilai akhir dan mencetak NIM, Nama, Nilai Akhir (dibulatkan 1 desimal), dan Huruf Mutu.

---

## 5. Fitur Bawaan yang Sudah Jadi

1. **Menu 1 — `tampilkanDaftar()`**: Menampilkan seluruh mahasiswa beserta nilai mentahnya.
2. **Menu 2 — `tambahMahasiswa()`**: Menambahkan mahasiswa baru dengan validasi agar NIM tidak boleh ganda/duplikat.
3. **Menu 3 — `tampilkanNilaiAkhir()`**: Menampilkan seluruh mahasiswa dengan nilai akhir dan huruf mutunya.
