/// Bobot setiap komponen nilai akhir (total 1.0).
const double bobotTugas = 0.3;
const double bobotUts = 0.3;
const double bobotUas = 0.4;

/// Nilai akhir minimal agar mahasiswa dinyatakan lulus.
const double batasLulus = 55;

/// Data awal mahasiswa. Setiap mahasiswa disimpan sebagai Map.
final List<Map<String, dynamic>> daftarMahasiswa = [
  {'nim': '2401001', 'nama': 'Andi', 'tugas': 85, 'uts': 78, 'uas': 80},
  {'nim': '2401002', 'nama': 'Budi', 'tugas': 70, 'uts': 65, 'uas': 60},
  {'nim': '2401003', 'nama': 'Citra', 'tugas': 90, 'uts': 88, 'uas': 92},
  {'nim': '2401004', 'nama': 'Dewi', 'tugas': 60, 'uts': 45, 'uas': 50},
  {'nim': '2401005', 'nama': 'Eko', 'tugas': 40, 'uts': 35, 'uas': 30},
];
