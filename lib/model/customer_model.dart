import 'dart:convert';

class Customer {
    
    List<Datum> data;
    

    Customer({
        
        required this.data,
        
    });

    factory Customer.fromRawJson(String str) => Customer.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Customer.fromJson(Map<String, dynamic> json) => Customer(
       
        data: List<Datum>.from(json["data"].map((x) => Datum.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Datum {
    int id;
    String name;
    String? profilePic;
    String mobileNumber;
    String email;
    String street;
    String streetTwo;
    String city;
    int pincode;
    Country country;
    State state;
    DateTime createdDate;
    String createdTime;
    DateTime modifiedDate;
    String modifiedTime;
    bool flag;

    Datum({
        required this.id,
        required this.name,
        required this.profilePic,
        required this.mobileNumber,
        required this.email,
        required this.street,
        required this.streetTwo,
        required this.city,
        required this.pincode,
        required this.country,
        required this.state,
        required this.createdDate,
        required this.createdTime,
        required this.modifiedDate,
        required this.modifiedTime,
        required this.flag,
    });

    factory Datum.fromRawJson(String str) => Datum.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Datum.fromJson(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        profilePic: json["profile_pic"],
        mobileNumber: json["mobile_number"],
        email: json["email"],
        street: json["street"],
        streetTwo: json["street_two"],
        city: json["city"],
        pincode: json["pincode"],
        country: countryValues.map[json["country"]]!,
        state: stateValues.map[json["state"]]!,
        createdDate: DateTime.parse(json["created_date"]),
        createdTime: json["created_time"],
        modifiedDate: DateTime.parse(json["modified_date"]),
        modifiedTime: json["modified_time"],
        flag: json["flag"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "profile_pic": profilePic,
        "mobile_number": mobileNumber,
        "email": email,
        "street": street,
        "street_two": streetTwo,
        "city": city,
        "pincode": pincode,
        "country": countryValues.reverse[country],
        "state": stateValues.reverse[state],
        "created_date": "${createdDate.year.toString().padLeft(4, '0')}-${createdDate.month.toString().padLeft(2, '0')}-${createdDate.day.toString().padLeft(2, '0')}",
        "created_time": createdTime,
        "modified_date": "${modifiedDate.year.toString().padLeft(4, '0')}-${modifiedDate.month.toString().padLeft(2, '0')}-${modifiedDate.day.toString().padLeft(2, '0')}",
        "modified_time": modifiedTime,
        "flag": flag,
    };
}

enum Country {
    COUNTRY_INDIA,
    INDIA
}

final countryValues = EnumValues({
    "india": Country.COUNTRY_INDIA,
    "India": Country.INDIA
});

enum State {
    KERALA,
    STATE_KERALA
}

final stateValues = EnumValues({
    "Kerala": State.KERALA,
    "kerala": State.STATE_KERALA
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
        reverseMap = map.map((k, v) => MapEntry(v, k));
        return reverseMap;
    }
}
