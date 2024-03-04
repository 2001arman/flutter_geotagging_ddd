class PegawaiProfile {
  final int? id;
  final String? name;
  final String? nip;
  final String? email;
  final String? password;
  final String? gender;
  final DateTime? tanggalLahir;
  final String? phone;
  final String? divisi;
  final String? createdAt;
  final String? updatedAt;

  PegawaiProfile({
    this.id,
    this.name,
    this.nip,
    this.email,
    this.password,
    this.gender,
    this.tanggalLahir,
    this.phone,
    this.divisi,
    this.createdAt,
    this.updatedAt,
  });

  factory PegawaiProfile.fromMap(Map<String, dynamic> json) => PegawaiProfile(
        id: json["id"],
        name: json["name"],
        nip: json["nip"],
        email: json["email"],
        password: json["password"],
        gender: json["gender"],
        tanggalLahir: json["tanggal_lahir"] == null
            ? null
            : DateTime.parse(json["tanggal_lahir"]),
        phone: json["phone"],
        divisi: json["divisi"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "nip": nip,
        "email": email,
        "password": password,
        "gender": gender,
        "tanggal_lahir":
            "${tanggalLahir!.year.toString().padLeft(4, '0')}-${tanggalLahir!.month.toString().padLeft(2, '0')}-${tanggalLahir!.day.toString().padLeft(2, '0')}",
        "phone": phone,
        "divisi": divisi,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
