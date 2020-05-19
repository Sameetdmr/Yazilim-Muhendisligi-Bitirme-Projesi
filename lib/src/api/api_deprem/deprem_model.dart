import 'dart:convert';

List<Deprem> depremFromJson(String str) => List<Deprem>.from(json.decode(str).map((x) => Deprem.fromJson(x)));

String depremToJson(List<Deprem> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Deprem {
    String saat;
    String enlem;
    String boylam;
    String derinlik;
    String siddet;
    String yer;
    String tarih;

    Deprem({
        this.saat,
        this.enlem,
        this.boylam,
        this.derinlik,
        this.siddet,
        this.yer,
        this.tarih,
    });

    factory Deprem.fromJson(Map<String, dynamic> json) => Deprem(
        saat: json["saat"],
        enlem: json["enlem"],
        boylam: json["boylam"],
        derinlik: json["derinlik"],
        siddet: json["siddet"],
        yer: json["yer"],
        tarih: json["tarih"],
    );

    Map<String, dynamic> toJson() => {
        "saat": saat,
        "enlem": enlem,
        "boylam": boylam,
        "derinlik": derinlik,
        "siddet": siddet,
        "yer": yer,
        "tarih":tarih,
        
    };
}





