import 'dart:convert';

class Pokemon {
  Pokemon({
    required this.id,
    required this.name,
    required this.weight,
    required this.types,
    required this.species,
    required this.sprites,
  });

  int id;
  String name;
  int weight;
  List<Type> types;
  Species species;
  Sprites sprites;

  factory Pokemon.fromJson(String str) => Pokemon.fromMap(json.decode(str));

  factory Pokemon.fromMap(Map<String, dynamic> json) => Pokemon(
    id: json["id"],
    name: json["name"],
    weight: json["weight"],
    types: List<Type>.from(json["types"].map((x) => Type.fromMap(x))),
    species: Species.fromMap(json["species"]),
    sprites: Sprites.fromMap(json["sprites"]),
  );
}

class Type {
  Type({
      required this.slot,
      required this.type,
  });

  int slot;
  Species type;

  factory Type.fromJson(String str) => Type.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Type.fromMap(Map<String, dynamic> json) => Type(
    slot: json["slot"],
    type: Species.fromMap(json["type"]),
  );

  Map<String, dynamic> toMap() => {
    "slot": slot,
    "type": type.toMap(),
  };
}

class Species {
  Species({
    required this.name,
    required this.url,
  });

  String name;
  String url;

  factory Species.fromJson(String str) => Species.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Species.fromMap(Map<String, dynamic> json) => Species(
    name: json["name"],
    url: json["url"],
  );

  Map<String, dynamic> toMap() => {
      "name": name,
      "url": url,
  };
}

class Sprites {
  Sprites({
      required this.other,
  });

  Other? other;

  factory Sprites.fromJson(String str) => Sprites.fromMap(json.decode(str));

  factory Sprites.fromMap(Map<String, dynamic> json) => Sprites(
      other: json["other"] == null ? null : Other.fromMap(json["other"]),
  );
}

class Other {
  Other({
      required this.officialArtwork,
  });

  OfficialArtwork officialArtwork;

  factory Other.fromJson(String str) => Other.fromMap(json.decode(str));

  factory Other.fromMap(Map<String, dynamic> json) => Other(
      officialArtwork: OfficialArtwork.fromMap(json["official-artwork"]),
  );
}

class OfficialArtwork {
    OfficialArtwork({
        required this.frontDefault,
    });

    String frontDefault;

    factory OfficialArtwork.fromJson(String str) => OfficialArtwork.fromMap(json.decode(str));

    factory OfficialArtwork.fromMap(Map<String, dynamic> json) => OfficialArtwork(
        frontDefault: json["front_default"],
    );
}