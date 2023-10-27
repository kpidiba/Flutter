class CurrentCityModel {
  final Coord? coord;
  final List<Weather>? weather;
  final String? base;
  final Main? main;
  final int? visibility;
  final Wind? wind;
  final Rain? rain;
  final Clouds? clouds;
  final int? dt;
  final Sys? sys;
  final int? timezone;
  final int? id;
  final String? name;
  final int? cod;
  const CurrentCityModel(
      {this.coord,
      this.weather,
      this.base,
      this.main,
      this.visibility,
      this.wind,
      this.rain,
      this.clouds,
      this.dt,
      this.sys,
      this.timezone,
      this.id,
      this.name,
      this.cod});
  CurrentCityModel copyWith(
      {Coord? coord,
      List<Weather>? weather,
      String? base,
      Main? main,
      int? visibility,
      Wind? wind,
      Rain? rain,
      Clouds? clouds,
      int? dt,
      Sys? sys,
      int? timezone,
      int? id,
      String? name,
      int? cod}) {
    return CurrentCityModel(
        coord: coord ?? this.coord,
        weather: weather ?? this.weather,
        base: base ?? this.base,
        main: main ?? this.main,
        visibility: visibility ?? this.visibility,
        wind: wind ?? this.wind,
        rain: rain ?? this.rain,
        clouds: clouds ?? this.clouds,
        dt: dt ?? this.dt,
        sys: sys ?? this.sys,
        timezone: timezone ?? this.timezone,
        id: id ?? this.id,
        name: name ?? this.name,
        cod: cod ?? this.cod);
  }

  Map<String, Object?> toJson() {
    return {
      'coord': coord?.toJson(),
      'weather':
          weather?.map<Map<String, dynamic>>((data) => data.toJson()).toList(),
      'base': base,
      'main': main?.toJson(),
      'visibility': visibility,
      'wind': wind?.toJson(),
      'rain': rain?.toJson(),
      'clouds': clouds?.toJson(),
      'dt': dt,
      'sys': sys?.toJson(),
      'timezone': timezone,
      'id': id,
      'name': name,
      'cod': cod
    };
  }

  static CurrentCityModel fromJson(Map<String, Object?> json) {
    return CurrentCityModel(
        coord: json['coord'] == null
            ? null
            : Coord.fromJson(json['coord'] as Map<String, Object?>),
        weather: json['weather'] == null
            ? null
            : (json['weather'] as List)
                .map<Weather>(
                    (data) => Weather.fromJson(data as Map<String, Object?>))
                .toList(),
        base: json['base'] == null ? null : json['base'] as String,
        main: json['main'] == null
            ? null
            : Main.fromJson(json['main'] as Map<String, Object?>),
        visibility:
            json['visibility'] == null ? null : json['visibility'] as int,
        wind: json['wind'] == null
            ? null
            : Wind.fromJson(json['wind'] as Map<String, Object?>),
        rain: json['rain'] == null
            ? null
            : Rain.fromJson(json['rain'] as Map<String, Object?>),
        clouds: json['clouds'] == null
            ? null
            : Clouds.fromJson(json['clouds'] as Map<String, Object?>),
        dt: json['dt'] == null ? null : json['dt'] as int,
        sys: json['sys'] == null
            ? null
            : Sys.fromJson(json['sys'] as Map<String, Object?>),
        timezone: json['timezone'] == null ? null : json['timezone'] as int,
        id: json['id'] == null ? null : json['id'] as int,
        name: json['name'] == null ? null : json['name'] as String,
        cod: json['cod'] == null ? null : json['cod'] as int);
  }

  @override
  String toString() {
    return '''CurrentCityModel(
                coord:${coord.toString()},
weather:${weather.toString()},
base:$base,
main:${main.toString()},
visibility:$visibility,
wind:${wind.toString()},
rain:${rain.toString()},
clouds:${clouds.toString()},
dt:$dt,
sys:${sys.toString()},
timezone:$timezone,
id:$id,
name:$name,
cod:$cod
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is CurrentCityModel &&
        other.runtimeType == runtimeType &&
        other.coord == coord &&
        other.weather == weather &&
        other.base == base &&
        other.main == main &&
        other.visibility == visibility &&
        other.wind == wind &&
        other.rain == rain &&
        other.clouds == clouds &&
        other.dt == dt &&
        other.sys == sys &&
        other.timezone == timezone &&
        other.id == id &&
        other.name == name &&
        other.cod == cod;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, coord, weather, base, main, visibility,
        wind, rain, clouds, dt, sys, timezone, id, name, cod);
  }
}

class Sys {
  final int? type;
  final int? id;
  final String? country;
  final int? sunrise;
  final int? sunset;
  const Sys({this.type, this.id, this.country, this.sunrise, this.sunset});
  Sys copyWith(
      {int? type, int? id, String? country, int? sunrise, int? sunset}) {
    return Sys(
        type: type ?? this.type,
        id: id ?? this.id,
        country: country ?? this.country,
        sunrise: sunrise ?? this.sunrise,
        sunset: sunset ?? this.sunset);
  }

  Map<String, Object?> toJson() {
    return {
      'type': type,
      'id': id,
      'country': country,
      'sunrise': sunrise,
      'sunset': sunset
    };
  }

  static Sys fromJson(Map<String, Object?> json) {
    return Sys(
        type: json['type'] == null ? null : json['type'] as int,
        id: json['id'] == null ? null : json['id'] as int,
        country: json['country'] == null ? null : json['country'] as String,
        sunrise: json['sunrise'] == null ? null : json['sunrise'] as int,
        sunset: json['sunset'] == null ? null : json['sunset'] as int);
  }

  @override
  String toString() {
    return '''Sys(
                type:$type,
id:$id,
country:$country,
sunrise:$sunrise,
sunset:$sunset
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Sys &&
        other.runtimeType == runtimeType &&
        other.type == type &&
        other.id == id &&
        other.country == country &&
        other.sunrise == sunrise &&
        other.sunset == sunset;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, type, id, country, sunrise, sunset);
  }
}

class Clouds {
  final int? all;
  const Clouds({this.all});
  Clouds copyWith({int? all}) {
    return Clouds(all: all ?? this.all);
  }

  Map<String, Object?> toJson() {
    return {'all': all};
  }

  static Clouds fromJson(Map<String, Object?> json) {
    return Clouds(all: json['all'] == null ? null : json['all'] as int);
  }

  @override
  String toString() {
    return '''Clouds(
                all:$all
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Clouds &&
        other.runtimeType == runtimeType &&
        other.all == all;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, all);
  }
}

class Rain {
  final double? h;
  const Rain({this.h});
  Rain copyWith({double? h}) {
    return Rain(h: h ?? this.h);
  }

  Map<String, Object?> toJson() {
    return {'1h': h};
  }

  static Rain fromJson(Map<String, Object?> json) {
    return Rain(h: json['1h'] == null ? null : json['1h'] as double);
  }

  @override
  String toString() {
    return '''Rain(
                h:$h
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Rain && other.runtimeType == runtimeType && other.h == h;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, h);
  }
}

class Wind {
  final double? speed;
  final int? deg;
  final double? gust;
  const Wind({this.speed, this.deg, this.gust});
  Wind copyWith({double? speed, int? deg, double? gust}) {
    return Wind(
        speed: speed ?? this.speed,
        deg: deg ?? this.deg,
        gust: gust ?? this.gust);
  }

  Map<String, Object?> toJson() {
    return {'speed': speed, 'deg': deg, 'gust': gust};
  }

  static Wind fromJson(Map<String, Object?> json) {
    return Wind(
        speed: json['speed'] == null ? null : json['speed'] as double,
        deg: json['deg'] == null ? null : json['deg'] as int,
        gust: json['gust'] == null ? null : json['gust'] as double);
  }

  @override
  String toString() {
    return '''Wind(
                speed:$speed,
deg:$deg,
gust:$gust
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Wind &&
        other.runtimeType == runtimeType &&
        other.speed == speed &&
        other.deg == deg &&
        other.gust == gust;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, speed, deg, gust);
  }
}

class Main {
  final double? temp;
  final double? feelsLike;
  final double? tempMin;
  final double? tempMax;
  final int? pressure;
  final int? humidity;
  final int? seaLevel;
  final int? grndLevel;
  const Main(
      {this.temp,
      this.feelsLike,
      this.tempMin,
      this.tempMax,
      this.pressure,
      this.humidity,
      this.seaLevel,
      this.grndLevel});
  Main copyWith(
      {double? temp,
      double? feelsLike,
      double? tempMin,
      double? tempMax,
      int? pressure,
      int? humidity,
      int? seaLevel,
      int? grndLevel}) {
    return Main(
        temp: temp ?? this.temp,
        feelsLike: feelsLike ?? this.feelsLike,
        tempMin: tempMin ?? this.tempMin,
        tempMax: tempMax ?? this.tempMax,
        pressure: pressure ?? this.pressure,
        humidity: humidity ?? this.humidity,
        seaLevel: seaLevel ?? this.seaLevel,
        grndLevel: grndLevel ?? this.grndLevel);
  }

  Map<String, Object?> toJson() {
    return {
      'temp': temp,
      'feels_like': feelsLike,
      'temp_min': tempMin,
      'temp_max': tempMax,
      'pressure': pressure,
      'humidity': humidity,
      'sea_level': seaLevel,
      'grnd_level': grndLevel
    };
  }

  static Main fromJson(Map<String, Object?> json) {
    return Main(
        temp: json['temp'] == null ? null : json['temp'] as double,
        feelsLike:
            json['feels_like'] == null ? null : json['feels_like'] as double,
        tempMin: json['temp_min'] == null ? null : json['temp_min'] as double,
        tempMax: json['temp_max'] == null ? null : json['temp_max'] as double,
        pressure: json['pressure'] == null ? null : json['pressure'] as int,
        humidity: json['humidity'] == null ? null : json['humidity'] as int,
        seaLevel: json['sea_level'] == null ? null : json['sea_level'] as int,
        grndLevel:
            json['grnd_level'] == null ? null : json['grnd_level'] as int);
  }

  @override
  String toString() {
    return '''Main(
                temp:$temp,
feelsLike:$feelsLike,
tempMin:$tempMin,
tempMax:$tempMax,
pressure:$pressure,
humidity:$humidity,
seaLevel:$seaLevel,
grndLevel:$grndLevel
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Main &&
        other.runtimeType == runtimeType &&
        other.temp == temp &&
        other.feelsLike == feelsLike &&
        other.tempMin == tempMin &&
        other.tempMax == tempMax &&
        other.pressure == pressure &&
        other.humidity == humidity &&
        other.seaLevel == seaLevel &&
        other.grndLevel == grndLevel;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, temp, feelsLike, tempMin, tempMax, pressure,
        humidity, seaLevel, grndLevel);
  }
}

class Weather {
  final int? id;
  final String? main;
  final String? description;
  final String? icon;
  const Weather({this.id, this.main, this.description, this.icon});
  Weather copyWith({int? id, String? main, String? description, String? icon}) {
    return Weather(
        id: id ?? this.id,
        main: main ?? this.main,
        description: description ?? this.description,
        icon: icon ?? this.icon);
  }

  Map<String, Object?> toJson() {
    return {'id': id, 'main': main, 'description': description, 'icon': icon};
  }

  static Weather fromJson(Map<String, Object?> json) {
    return Weather(
        id: json['id'] == null ? null : json['id'] as int,
        main: json['main'] == null ? null : json['main'] as String,
        description:
            json['description'] == null ? null : json['description'] as String,
        icon: json['icon'] == null ? null : json['icon'] as String);
  }

  @override
  String toString() {
    return '''Weather(
                id:$id,
main:$main,
description:$description,
icon:$icon
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Weather &&
        other.runtimeType == runtimeType &&
        other.id == id &&
        other.main == main &&
        other.description == description &&
        other.icon == icon;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, id, main, description, icon);
  }
}

class Coord {
  final double? lon;
  final double? lat;
  const Coord({this.lon, this.lat});
  Coord copyWith({double? lon, double? lat}) {
    return Coord(lon: lon ?? this.lon, lat: lat ?? this.lat);
  }

  Map<String, Object?> toJson() {
    return {'lon': lon, 'lat': lat};
  }

  static Coord fromJson(Map<String, Object?> json) {
    return Coord(
        lon: json['lon'] == null ? null : json['lon'] as double,
        lat: json['lat'] == null ? null : json['lat'] as double);
  }

  @override
  String toString() {
    return '''Coord(
                lon:$lon,
lat:$lat
    ) ''';
  }

  @override
  bool operator ==(Object other) {
    return other is Coord &&
        other.runtimeType == runtimeType &&
        other.lon == lon &&
        other.lat == lat;
  }

  @override
  int get hashCode {
    return Object.hash(runtimeType, lon, lat);
  }
}
