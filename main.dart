import 'fitur.dart';
import 'input.dart';

void main() {
  print('=== Sistem Nilai Mahasiswa ===');
  var berjalan = true;

  while (berjalan) {
    print('');
    print('1. Lihat daftar mahasiswa');
    print('2. Tambah mahasiswa');
    print('3. Lihat nilai akhir');
    print('4. Cari mahasiswa (NIM)');
    print('5. Rata-rata kelas');
    print('6. Ubah nilai mahasiswa');
    print('0. Keluar');

    final pilihan = bacaInt('Pilih menu', min: 0, max: 6);
    switch (pilihan) {
      case 1:
        tampilkanDaftar();
      case 2:
        tambahMahasiswa();
      case 3:
        tampilkanNilaiAkhir();
      case 4:
        cariMahasiswa();
      case 5:
        tampilkanRataRata();
      case 6:
        ubahNilai();
      case 0:
        berjalan = false;
    }
  }

  print('Terima kasih.');
}
