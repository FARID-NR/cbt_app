import 'dart:convert';

class DownloadSkRequestModel {
    final String dosenPenguji;
    final String mataKuliahId;
    final String mataKuliah;
    final String namaMahasiswa;
    final String nimMahasiswa;
    final dynamic nilaiAngka;

    DownloadSkRequestModel({
        required this.dosenPenguji,
        required this.mataKuliahId,
        required this.mataKuliah,
        required this.namaMahasiswa,
        required this.nimMahasiswa,
        required this.nilaiAngka,
    });

    factory DownloadSkRequestModel.fromJson(String str) => DownloadSkRequestModel.fromMap(json.decode(str));

    String toJson() => json.encode(toMap());

    factory DownloadSkRequestModel.fromMap(Map<String, dynamic> json) => DownloadSkRequestModel(
        dosenPenguji: json["dosen_penguji"],
        mataKuliahId: json["mata_kuliah_id"],
        mataKuliah: json["mata_kuliah"],
        namaMahasiswa: json["nama_mahasiswa"],
        nimMahasiswa: json["nim_mahasiswa"],
        nilaiAngka: json["nilai_angka"],
    );

    Map<String, dynamic> toMap() => {
        "dosen_penguji": dosenPenguji,
        "mata_kuliah_id": mataKuliahId,
        "mata_kuliah": mataKuliah,
        "nama_mahasiswa": namaMahasiswa,
        "nim_mahasiswa": nimMahasiswa,
        "nilai_angka": nilaiAngka,
    };
}
