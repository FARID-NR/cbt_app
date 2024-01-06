import 'dart:convert';

class KirimSkRequestModel {
    final String dosenPenguji;
    final int mataKuliahId;
    final String mataKuliah;
    final String namaMahasiswa;
    final String nimMahasiswa;
    final String nilaiAngka;
    final String tanggalSk;
    final String keterangan;

    KirimSkRequestModel({
        required this.dosenPenguji,
        required this.mataKuliahId,
        required this.mataKuliah,
        required this.namaMahasiswa,
        required this.nimMahasiswa,
        required this.nilaiAngka,
        required this.tanggalSk,
        required this.keterangan,
    });

    factory KirimSkRequestModel.fromJson(String str) => KirimSkRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory KirimSkRequestModel.fromMap(Map<String, dynamic> json) => KirimSkRequestModel(
        dosenPenguji: json["dosen_penguji"],
        mataKuliahId: json["mata_kuliah_id"],
        mataKuliah: json["mata_kuliah"],
        namaMahasiswa: json["nama_mahasiswa"],
        nimMahasiswa: json["nim_mahasiswa"],
        nilaiAngka: json["nilai_angka"],
        tanggalSk: json["tanggal_sk"],
        keterangan: json["keterangan"],
    );

    Map<String, dynamic> toMap() => {
        "dosen_penguji": dosenPenguji,
        "mata_kuliah_id": mataKuliahId,
        "mata_kuliah": mataKuliah,
        "nama_mahasiswa": namaMahasiswa,
        "nim_mahasiswa": nimMahasiswa,
        "nilai_angka": nilaiAngka,
        "tanggal_sk": tanggalSk,
        "keterangan": keterangan,
    };
}
