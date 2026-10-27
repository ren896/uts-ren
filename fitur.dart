import 'data.dart';
import 'input.dart';

// ============================================================
// Fungsi bantu
// ============================================================

/// Menghitung nilai akhir dari nilai tugas, UTS, dan UAS.
double hitungNilaiAkhir(Map<String, dynamic> mhs) {
  final tugas = mhs['tugas'] as int;
  final uts = mhs['uts'] as int;
  final uas = mhs['uas'] as int;
  return tugas * bobotTugas + uts * bobotUts + uas * bobotUas;
}

/// Mengubah nilai akhir menjadi huruf mutu.
String hurufMutu(double nilai) => switch (nilai) {
  >= 85 => 'A',
  >= 70 => 'B',
  >= 55 => 'C',
  >= 40 => 'D',
  _ => 'E',
};

/// Mencari mahasiswa berdasarkan NIM. Mengembalikan null jika tidak ada.
Map<String, dynamic>? cariByNim(String nim) {
  for (final mhs in daftarMahasiswa) {
    if (mhs['nim'] == nim) return mhs;
  }
  return null;
}

/// Mencetak satu baris data mahasiswa.
void cetakMahasiswa(Map<String, dynamic> mhs) {
  print(
    '${mhs['nim']} | ${mhs['nama']} | '
    'Tugas ${mhs['tugas']} | UTS ${mhs['uts']} | UAS ${mhs['uas']}',
  );
}

/// Mencetak nilai akhir dan huruf mutu satu mahasiswa.
void cetakNilaiAkhir(Map<String, dynamic> mhs) {
  final akhir = hitungNilaiAkhir(mhs);
  print(
    '${mhs['nim']} | ${mhs['nama']} | '
    '${akhir.toStringAsFixed(1)} | ${hurufMutu(akhir)}',
  );
}

// ============================================================
// Fitur yang sudah jadi
// ============================================================

/// Menu 1: menampilkan semua mahasiswa.
void tampilkanDaftar() {
  print('\n=== Daftar Mahasiswa ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakMahasiswa(mhs);
  }
}

/// Menu 2: menambah mahasiswa baru.
void tambahMahasiswa() {
  print('\n=== Tambah Mahasiswa ===');
  final nim = bacaTeks('NIM');
  if (cariByNim(nim) != null) {
    print('NIM $nim sudah terdaftar.');
    return;
  }
  final nama = bacaTeks('Nama');
  final tugas = bacaInt('Nilai tugas', min: 0, max: 100);
  final uts = bacaInt('Nilai UTS', min: 0, max: 100);
  final uas = bacaInt('Nilai UAS', min: 0, max: 100);

  daftarMahasiswa.add({
    'nim': nim,
    'nama': nama,
    'tugas': tugas,
    'uts': uts,
    'uas': uas,
  });
  print('Mahasiswa $nama berhasil ditambahkan.');
}

/// Menu 3: menampilkan nilai akhir dan huruf mutu semua mahasiswa.
void tampilkanNilaiAkhir() {
  print('\n=== Nilai Akhir ===');
  if (daftarMahasiswa.isEmpty) {
    print('Belum ada data mahasiswa.');
    return;
  }
  for (final mhs in daftarMahasiswa) {
    cetakNilaiAkhir(mhs);
  }
}

// ============================================================
// Fitur pilihan
// ============================================================

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
