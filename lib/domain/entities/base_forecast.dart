import 'dart:convert';

/// location : {"name":"Caracas","region":"Distrito Federal","country":"Venezuela","lat":10.5,"lon":-66.92,"tz_id":"America/Caracas","localtime_epoch":1698554552,"localtime":"2023-10-29 0:42"}
/// current : {"last_updated_epoch":1698553800,"last_updated":"2023-10-29 00:30","temp_c":26,"temp_f":78.8,"is_day":0,"condition":{"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png","code":1003},"wind_mph":2.2,"wind_kph":3.6,"wind_degree":10,"wind_dir":"N","pressure_mb":1010,"pressure_in":29.83,"precip_mm":0,"precip_in":0,"humidity":84,"cloud":50,"feelslike_c":30.1,"feelslike_f":86.1,"vis_km":10,"vis_miles":6,"uv":1,"gust_mph":0.9,"gust_kph":1.5}
/// forecast : {"forecastday":[{"date":"2023-10-29","date_epoch":1698537600,"day":{"maxtemp_c":24.9,"maxtemp_f":76.9,"mintemp_c":18,"mintemp_f":64.5,"avgtemp_c":20.9,"avgtemp_f":69.6,"maxwind_mph":2.2,"maxwind_kph":3.6,"totalprecip_mm":15.33,"totalprecip_in":0.6,"totalsnow_cm":0,"avgvis_km":9.2,"avgvis_miles":5,"avghumidity":91,"daily_will_it_rain":1,"daily_chance_of_rain":91,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Moderate rain","icon":"//cdn.weatherapi.com/weather/64x64/day/302.png","code":1189},"uv":5},"astro":{"sunrise":"06:18 AM","sunset":"06:05 PM","moonrise":"06:51 PM","moonset":"06:53 AM","moon_phase":"Waning Gibbous","moon_illumination":100,"is_moon_up":1,"is_sun_up":0},"hour":[{"time_epoch":1698606000,"time":"2023-10-29 15:00","temp_c":23.7,"temp_f":74.7,"is_day":1,"condition":{"text":"Patchy rain possible","icon":"//cdn.weatherapi.com/weather/64x64/day/176.png","code":1063},"wind_mph":2.5,"wind_kph":4,"wind_degree":13,"wind_dir":"NNE","pressure_mb":1009,"pressure_in":29.8,"precip_mm":0.49,"precip_in":0.02,"humidity":86,"cloud":84,"feelslike_c":25.9,"feelslike_f":78.5,"windchill_c":23.7,"windchill_f":74.7,"heatindex_c":25.9,"heatindex_f":78.5,"dewpoint_c":21.3,"dewpoint_f":70.4,"will_it_rain":1,"chance_of_rain":84,"will_it_snow":0,"chance_of_snow":0,"vis_km":9,"vis_miles":5,"gust_mph":3.3,"gust_kph":5.3,"uv":5}]}]}

BaseForecast baseForecastFromJson(String str) =>
    BaseForecast.fromJson(json.decode(str));

String baseForecastToJson(BaseForecast data) => json.encode(data.toJson());

class BaseForecast {
  BaseForecast({
    Location? location,
    Current? current,
    Forecast? forecast,
  }) {
    _location = location;
    _current = current;
    _forecast = forecast;
  }

  BaseForecast.fromJson(dynamic json) {
    _location =
        json['location'] != null ? Location.fromJson(json['location']) : null;
    _current =
        json['current'] != null ? Current.fromJson(json['current']) : null;
    _forecast =
        json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }

  Location? _location;
  Current? _current;
  Forecast? _forecast;

  Location? get location => _location;

  Current? get current => _current;

  Forecast? get forecast => _forecast;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_location != null) {
      map['location'] = _location?.toJson();
    }
    if (_current != null) {
      map['current'] = _current?.toJson();
    }
    if (_forecast != null) {
      map['forecast'] = _forecast?.toJson();
    }
    return map;
  }

  factory BaseForecast.empty() {
    return BaseForecast(
      location: Location.empty(),
      current: Current.empty(),
      forecast: Forecast.empty(),
    );
  }

  @override
  String toString() {
    return "{"
        "\"location\":$location,"
        "\"current\":$current,"
        "\"forecast\":$forecast"
        "}";
  }
}

/// forecastday : [{"date":"2023-10-29","date_epoch":1698537600,"day":{"maxtemp_c":24.9,"maxtemp_f":76.9,"mintemp_c":18,"mintemp_f":64.5,"avgtemp_c":20.9,"avgtemp_f":69.6,"maxwind_mph":2.2,"maxwind_kph":3.6,"totalprecip_mm":15.33,"totalprecip_in":0.6,"totalsnow_cm":0,"avgvis_km":9.2,"avgvis_miles":5,"avghumidity":91,"daily_will_it_rain":1,"daily_chance_of_rain":91,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Moderate rain","icon":"//cdn.weatherapi.com/weather/64x64/day/302.png","code":1189},"uv":5},"astro":{"sunrise":"06:18 AM","sunset":"06:05 PM","moonrise":"06:51 PM","moonset":"06:53 AM","moon_phase":"Waning Gibbous","moon_illumination":100,"is_moon_up":1,"is_sun_up":0},"hour":[{"time_epoch":1698606000,"time":"2023-10-29 15:00","temp_c":23.7,"temp_f":74.7,"is_day":1,"condition":{"text":"Patchy rain possible","icon":"//cdn.weatherapi.com/weather/64x64/day/176.png","code":1063},"wind_mph":2.5,"wind_kph":4,"wind_degree":13,"wind_dir":"NNE","pressure_mb":1009,"pressure_in":29.8,"precip_mm":0.49,"precip_in":0.02,"humidity":86,"cloud":84,"feelslike_c":25.9,"feelslike_f":78.5,"windchill_c":23.7,"windchill_f":74.7,"heatindex_c":25.9,"heatindex_f":78.5,"dewpoint_c":21.3,"dewpoint_f":70.4,"will_it_rain":1,"chance_of_rain":84,"will_it_snow":0,"chance_of_snow":0,"vis_km":9,"vis_miles":5,"gust_mph":3.3,"gust_kph":5.3,"uv":5}]}]

Forecast forecastFromJson(String str) => Forecast.fromJson(json.decode(str));

String forecastToJson(Forecast data) => json.encode(data.toJson());

class Forecast {
  Forecast({
    List<ForecastDay>? forecastDay,
  }) {
    _forecastday = forecastDay;
  }

  Forecast.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      _forecastday = [];
      json['forecastday'].forEach((v) {
        _forecastday?.add(ForecastDay.fromJson(v));
      });
    }
  }

  List<ForecastDay>? _forecastday;

  List<ForecastDay>? get forecastday => _forecastday;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_forecastday != null) {
      map['forecastday'] = _forecastday?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  factory Forecast.empty() {
    return Forecast(
      forecastDay: [],
    );
  }

  @override
  String toString() {
    String answer = "{\"forecastday\":[";
    for (ForecastDay forecastDay in _forecastday!) {
      answer += "$forecastDay,";
    }
    if (_forecastday!.isNotEmpty) {
      answer = answer.substring(0, answer.length - 1);
    }
    answer += "]}";
    return answer;
  }
}

/// date : "2023-10-29"
/// date_epoch : 1698537600
/// day : {"maxtemp_c":24.9,"maxtemp_f":76.9,"mintemp_c":18,"mintemp_f":64.5,"avgtemp_c":20.9,"avgtemp_f":69.6,"maxwind_mph":2.2,"maxwind_kph":3.6,"totalprecip_mm":15.33,"totalprecip_in":0.6,"totalsnow_cm":0,"avgvis_km":9.2,"avgvis_miles":5,"avghumidity":91,"daily_will_it_rain":1,"daily_chance_of_rain":91,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Moderate rain","icon":"//cdn.weatherapi.com/weather/64x64/day/302.png","code":1189},"uv":5}
/// astro : {"sunrise":"06:18 AM","sunset":"06:05 PM","moonrise":"06:51 PM","moonset":"06:53 AM","moon_phase":"Waning Gibbous","moon_illumination":100,"is_moon_up":1,"is_sun_up":0}
/// hour : [{"time_epoch":1698606000,"time":"2023-10-29 15:00","temp_c":23.7,"temp_f":74.7,"is_day":1,"condition":{"text":"Patchy rain possible","icon":"//cdn.weatherapi.com/weather/64x64/day/176.png","code":1063},"wind_mph":2.5,"wind_kph":4,"wind_degree":13,"wind_dir":"NNE","pressure_mb":1009,"pressure_in":29.8,"precip_mm":0.49,"precip_in":0.02,"humidity":86,"cloud":84,"feelslike_c":25.9,"feelslike_f":78.5,"windchill_c":23.7,"windchill_f":74.7,"heatindex_c":25.9,"heatindex_f":78.5,"dewpoint_c":21.3,"dewpoint_f":70.4,"will_it_rain":1,"chance_of_rain":84,"will_it_snow":0,"chance_of_snow":0,"vis_km":9,"vis_miles":5,"gust_mph":3.3,"gust_kph":5.3,"uv":5}]

ForecastDay forecastDayFromJson(String str) =>
    ForecastDay.fromJson(json.decode(str));

String forecastDayToJson(ForecastDay data) => json.encode(data.toJson());

class ForecastDay {
  ForecastDay({
    String? date,
    double? dateEpoch,
    Day? day,
    Astro? astro,
    List<Hour>? hour,
  }) {
    _date = date;
    _dateEpoch = dateEpoch;
    _day = day;
    _astro = astro;
    _hour = hour;
  }

  ForecastDay.fromJson(dynamic json) {
    _date = json['date'];
    _dateEpoch = json['date_epoch'];
    _day = json['day'] != null ? Day.fromJson(json['day']) : null;
    _astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      _hour = [];
      json['hour'].forEach((v) {
        _hour?.add(Hour.fromJson(v));
      });
    }
  }

  String? _date;
  double? _dateEpoch;
  Day? _day;
  Astro? _astro;
  List<Hour>? _hour;

  String? get date => _date;

  double? get dateEpoch => _dateEpoch;

  Day? get day => _day;

  Astro? get astro => _astro;

  List<Hour>? get hour => _hour;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = _date;
    map['date_epoch'] = _dateEpoch;
    if (_day != null) {
      map['day'] = _day?.toJson();
    }
    if (_astro != null) {
      map['astro'] = _astro?.toJson();
    }
    if (_hour != null) {
      map['hour'] = _hour?.map((v) => v.toJson()).toList();
    }
    return map;
  }

  @override
  String toString() {
    String answer = "{"
        "\"date\":\"$_date\","
        "\"dateEpoch\":$_dateEpoch,"
        "\"day\":$_day,"
        "\"astro\":$_astro,"
        "\"hour\":"
        "[";
    for (Hour hour in _hour!) {
      answer += "$hour,";
    }
    if (_hour!.isNotEmpty) {
      answer = answer.substring(0, answer.length - 1);
    }
    answer += "]}";
    return answer;
  }
}

/// time_epoch : 1698606000
/// time : "2023-10-29 15:00"
/// temp_c : 23.7
/// temp_f : 74.7
/// is_day : 1
/// condition : {"text":"Patchy rain possible","icon":"//cdn.weatherapi.com/weather/64x64/day/176.png","code":1063}
/// wind_mph : 2.5
/// wind_kph : 4
/// wind_degree : 13
/// wind_dir : "NNE"
/// pressure_mb : 1009
/// pressure_in : 29.8
/// precip_mm : 0.49
/// precip_in : 0.02
/// humidity : 86
/// cloud : 84
/// feelslike_c : 25.9
/// feelslike_f : 78.5
/// windchill_c : 23.7
/// windchill_f : 74.7
/// heatindex_c : 25.9
/// heatindex_f : 78.5
/// dewpoint_c : 21.3
/// dewpoint_f : 70.4
/// will_it_rain : 1
/// chance_of_rain : 84
/// will_it_snow : 0
/// chance_of_snow : 0
/// vis_km : 9
/// vis_miles : 5
/// gust_mph : 3.3
/// gust_kph : 5.3
/// uv : 5

Hour hourFromJson(String str) => Hour.fromJson(json.decode(str));

String hourToJson(Hour data) => json.encode(data.toJson());

class Hour {
  Hour({
    double? timeEpoch,
    String? time,
    double? tempC,
    double? tempF,
    double? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    double? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    double? humidity,
    double? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? windchillC,
    double? windchillF,
    double? heatindexC,
    double? heatindexF,
    double? dewpointC,
    double? dewpointF,
    double? willItRain,
    double? chanceOfRain,
    double? willItSnow,
    double? chanceOfSnow,
    double? visKm,
    double? visMiles,
    double? gustMph,
    double? gustKph,
    double? uv,
  }) {
    _timeEpoch = timeEpoch;
    _time = time;
    _tempC = tempC;
    _tempF = tempF;
    _isDay = isDay;
    _condition = condition;
    _windMph = windMph;
    _windKph = windKph;
    _windDegree = windDegree;
    _windDir = windDir;
    _pressureMb = pressureMb;
    _pressureIn = pressureIn;
    _precipMm = precipMm;
    _precipIn = precipIn;
    _humidity = humidity;
    _cloud = cloud;
    _feelslikeC = feelslikeC;
    _feelslikeF = feelslikeF;
    _windchillC = windchillC;
    _windchillF = windchillF;
    _heatindexC = heatindexC;
    _heatindexF = heatindexF;
    _dewpointC = dewpointC;
    _dewpointF = dewpointF;
    _willItRain = willItRain;
    _chanceOfRain = chanceOfRain;
    _willItSnow = willItSnow;
    _chanceOfSnow = chanceOfSnow;
    _visKm = visKm;
    _visMiles = visMiles;
    _gustMph = gustMph;
    _gustKph = gustKph;
    _uv = uv;
  }

  Hour.fromJson(dynamic json) {
    _timeEpoch = json['time_epoch'];
    _time = json['time'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _windchillC = json['windchill_c'];
    _windchillF = json['windchill_f'];
    _heatindexC = json['heatindex_c'];
    _heatindexF = json['heatindex_f'];
    _dewpointC = json['dewpoint_c'];
    _dewpointF = json['dewpoint_f'];
    _willItRain = json['will_it_rain'];
    _chanceOfRain = json['chance_of_rain'];
    _willItSnow = json['will_it_snow'];
    _chanceOfSnow = json['chance_of_snow'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
    _uv = json['uv'];
  }

  double? _timeEpoch;
  String? _time;
  double? _tempC;
  double? _tempF;
  double? _isDay;
  Condition? _condition;
  double? _windMph;
  double? _windKph;
  double? _windDegree;
  String? _windDir;
  double? _pressureMb;
  double? _pressureIn;
  double? _precipMm;
  double? _precipIn;
  double? _humidity;
  double? _cloud;
  double? _feelslikeC;
  double? _feelslikeF;
  double? _windchillC;
  double? _windchillF;
  double? _heatindexC;
  double? _heatindexF;
  double? _dewpointC;
  double? _dewpointF;
  double? _willItRain;
  double? _chanceOfRain;
  double? _willItSnow;
  double? _chanceOfSnow;
  double? _visKm;
  double? _visMiles;
  double? _gustMph;
  double? _gustKph;
  double? _uv;

  double? get timeEpoch => _timeEpoch;

  String? get time => _time;

  double? get tempC => _tempC;

  double? get tempF => _tempF;

  double? get isDay => _isDay;

  Condition? get condition => _condition;

  double? get windMph => _windMph;

  double? get windKph => _windKph;

  double? get windDegree => _windDegree;

  String? get windDir => _windDir;

  double? get pressureMb => _pressureMb;

  double? get pressureIn => _pressureIn;

  double? get precipMm => _precipMm;

  double? get precipIn => _precipIn;

  double? get humidity => _humidity;

  double? get cloud => _cloud;

  double? get feelslikeC => _feelslikeC;

  double? get feelslikeF => _feelslikeF;

  double? get windchillC => _windchillC;

  double? get windchillF => _windchillF;

  double? get heatindexC => _heatindexC;

  double? get heatindexF => _heatindexF;

  double? get dewpointC => _dewpointC;

  double? get dewpointF => _dewpointF;

  double? get willItRain => _willItRain;

  double? get chanceOfRain => _chanceOfRain;

  double? get willItSnow => _willItSnow;

  double? get chanceOfSnow => _chanceOfSnow;

  double? get visKm => _visKm;

  double? get visMiles => _visMiles;

  double? get gustMph => _gustMph;

  double? get gustKph => _gustKph;

  double? get uv => _uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['time_epoch'] = _timeEpoch;
    map['time'] = _time;
    map['temp_c'] = _tempC;
    map['temp_f'] = _tempF;
    map['is_day'] = _isDay;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['wind_mph'] = _windMph;
    map['wind_kph'] = _windKph;
    map['wind_degree'] = _windDegree;
    map['wind_dir'] = _windDir;
    map['pressure_mb'] = _pressureMb;
    map['pressure_in'] = _pressureIn;
    map['precip_mm'] = _precipMm;
    map['precip_in'] = _precipIn;
    map['humidity'] = _humidity;
    map['cloud'] = _cloud;
    map['feelslike_c'] = _feelslikeC;
    map['feelslike_f'] = _feelslikeF;
    map['windchill_c'] = _windchillC;
    map['windchill_f'] = _windchillF;
    map['heatindex_c'] = _heatindexC;
    map['heatindex_f'] = _heatindexF;
    map['dewpoint_c'] = _dewpointC;
    map['dewpoint_f'] = _dewpointF;
    map['will_it_rain'] = _willItRain;
    map['chance_of_rain'] = _chanceOfRain;
    map['will_it_snow'] = _willItSnow;
    map['chance_of_snow'] = _chanceOfSnow;
    map['vis_km'] = _visKm;
    map['vis_miles'] = _visMiles;
    map['gust_mph'] = _gustMph;
    map['gust_kph'] = _gustKph;
    map['uv'] = _uv;
    return map;
  }

  @override
  String toString() {
    return "{"
        "\"timeEpoch\":$_timeEpoch,"
        "\"time\":\"$_time\","
        "\"tempC\":$_tempC,"
        "\"tempF\":$_tempF,"
        "\"isDay\":$_isDay,"
        "\"condition\":$_condition,"
        "\"windMph\":$_windMph,"
        "\"windKph\":$_windKph,"
        "\"windDegree\":$_windDegree,"
        "\"windDir\":\"$_windDir\","
        "\"pressureMb\":$_pressureMb,"
        "\"pressureIn\":$_pressureIn,"
        "\"precipMm\":$_precipMm,"
        "\"precipIn\":$_precipIn,"
        "\"humidity\":$_humidity,"
        "\"cloud\":$_cloud,"
        "\"feelslikeC\":$_feelslikeC,"
        "\"feelslikeF\":$_feelslikeF,"
        "\"windchillC\":$_windchillC,"
        "\"windchillF\":$_windchillF,"
        "\"heatindexC\":$_heatindexC,"
        "\"heatindexF\":$_heatindexF,"
        "\"dewpointC\":$_dewpointC,"
        "\"dewpointF\":$_dewpointF,"
        "\"willItRain\":$_willItRain,"
        "\"chanceOfRain\":$_chanceOfRain,"
        "\"willItSnow\":$_willItSnow,"
        "\"chanceOfSnow\":$_chanceOfSnow,"
        "\"visKm\":$_visKm,"
        "\"visMiles\":$_visMiles,"
        "\"gustMph\":$_gustMph,"
        "\"gustKph\":$_gustKph,"
        "\"uv\":$_uv"
        "}";
  }
}

/// text : "Patchy rain possible"
/// icon : "//cdn.weatherapi.com/weather/64x64/day/176.png"
/// code : 1063

Condition conditionFromJson(String str) => Condition.fromJson(json.decode(str));

String conditionToJson(Condition data) => json.encode(data.toJson());

class Condition {
  Condition({
    String? text,
    String? icon,
    double? code,
  }) {
    _text = text;
    _icon = icon;
    _code = code;
  }

  Condition.fromJson(dynamic json) {
    _text = json['text'];
    _icon = json['icon'];
    _code = json['code'];
  }

  String? _text;
  String? _icon;
  double? _code;

  String? get text => _text;

  String? get icon => _icon;

  double? get code => _code;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = _text;
    map['icon'] = _icon;
    map['code'] = _code;
    return map;
  }

  @override
  String toString() {
    return "{"
        "\"text\":\"$_text\","
        "\"icon\":\"$_icon\","
        "\"code\":$_code"
        "}";
  }
}

/// sunrise : "06:18 AM"
/// sunset : "06:05 PM"
/// moonrise : "06:51 PM"
/// moonset : "06:53 AM"
/// moon_phase : "Waning Gibbous"
/// moon_illumination : 100
/// is_moon_up : 1
/// is_sun_up : 0

Astro astroFromJson(String str) => Astro.fromJson(json.decode(str));

String astroToJson(Astro data) => json.encode(data.toJson());

class Astro {
  Astro({
    String? sunrise,
    String? sunset,
    String? moonrise,
    String? moonset,
    String? moonPhase,
    double? moonIllumination,
    double? isMoonUp,
    double? isSunUp,
  }) {
    _sunrise = sunrise;
    _sunset = sunset;
    _moonrise = moonrise;
    _moonset = moonset;
    _moonPhase = moonPhase;
    _moonIllumination = moonIllumination;
    _isMoonUp = isMoonUp;
    _isSunUp = isSunUp;
  }

  Astro.fromJson(dynamic json) {
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
    _moonrise = json['moonrise'];
    _moonset = json['moonset'];
    _moonPhase = json['moon_phase'];
    _moonIllumination = json['moon_illumination'];
    _isMoonUp = json['is_moon_up'];
    _isSunUp = json['is_sun_up'];
  }

  String? _sunrise;
  String? _sunset;
  String? _moonrise;
  String? _moonset;
  String? _moonPhase;
  double? _moonIllumination;
  double? _isMoonUp;
  double? _isSunUp;

  String? get sunrise => _sunrise;

  String? get sunset => _sunset;

  String? get moonrise => _moonrise;

  String? get moonset => _moonset;

  String? get moonPhase => _moonPhase;

  double? get moonIllumination => _moonIllumination;

  double? get isMoonUp => _isMoonUp;

  double? get isSunUp => _isSunUp;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    map['moonrise'] = _moonrise;
    map['moonset'] = _moonset;
    map['moon_phase'] = _moonPhase;
    map['moon_illumination'] = _moonIllumination;
    map['is_moon_up'] = _isMoonUp;
    map['is_sun_up'] = _isSunUp;
    return map;
  }

  @override
  String toString() {
    return "{"
        "\"sunrise\":\"$_sunrise\","
        "\"sunset\":\"$_sunset\","
        "\"moonrise\":\"$_moonrise\","
        "\"moonset\":\"$_moonset\","
        "\"moonPhase\":\"$_moonPhase\","
        "\"moonIllumination\":$_moonIllumination,"
        "\"isMoonUp\":$_isMoonUp,"
        "\"isSunUp\":$_isSunUp"
        "}";
  }
}

/// maxtemp_c : 24.9
/// maxtemp_f : 76.9
/// mintemp_c : 18
/// mintemp_f : 64.5
/// avgtemp_c : 20.9
/// avgtemp_f : 69.6
/// maxwind_mph : 2.2
/// maxwind_kph : 3.6
/// totalprecip_mm : 15.33
/// totalprecip_in : 0.6
/// totalsnow_cm : 0
/// avgvis_km : 9.2
/// avgvis_miles : 5
/// avghumidity : 91
/// daily_will_it_rain : 1
/// daily_chance_of_rain : 91
/// daily_will_it_snow : 0
/// daily_chance_of_snow : 0
/// condition : {"text":"Moderate rain","icon":"//cdn.weatherapi.com/weather/64x64/day/302.png","code":1189}
/// uv : 5

Day dayFromJson(String str) => Day.fromJson(json.decode(str));

String dayToJson(Day data) => json.encode(data.toJson());

class Day {
  Day({
    double? maxtempC,
    double? maxtempF,
    double? mintempC,
    double? mintempF,
    double? avgtempC,
    double? avgtempF,
    double? maxwindMph,
    double? maxwindKph,
    double? totalprecipMm,
    double? totalprecipIn,
    double? totalsnowCm,
    double? avgvisKm,
    double? avgvisMiles,
    double? avghumidity,
    double? dailyWillItRain,
    double? dailyChanceOfRain,
    double? dailyWillItSnow,
    double? dailyChanceOfSnow,
    Condition? condition,
    double? uv,
  }) {
    _maxtempC = maxtempC;
    _maxtempF = maxtempF;
    _mintempC = mintempC;
    _mintempF = mintempF;
    _avgtempC = avgtempC;
    _avgtempF = avgtempF;
    _maxwindMph = maxwindMph;
    _maxwindKph = maxwindKph;
    _totalprecipMm = totalprecipMm;
    _totalprecipIn = totalprecipIn;
    _totalsnowCm = totalsnowCm;
    _avgvisKm = avgvisKm;
    _avgvisMiles = avgvisMiles;
    _avghumidity = avghumidity;
    _dailyWillItRain = dailyWillItRain;
    _dailyChanceOfRain = dailyChanceOfRain;
    _dailyWillItSnow = dailyWillItSnow;
    _dailyChanceOfSnow = dailyChanceOfSnow;
    _condition = condition;
    _uv = uv;
  }

  Day.fromJson(dynamic json) {
    _maxtempC = json['maxtemp_c'];
    _maxtempF = json['maxtemp_f'];
    _mintempC = json['mintemp_c'];
    _mintempF = json['mintemp_f'];
    _avgtempC = json['avgtemp_c'];
    _avgtempF = json['avgtemp_f'];
    _maxwindMph = json['maxwind_mph'];
    _maxwindKph = json['maxwind_kph'];
    _totalprecipMm = json['totalprecip_mm'];
    _totalprecipIn = json['totalprecip_in'];
    _totalsnowCm = json['totalsnow_cm'];
    _avgvisKm = json['avgvis_km'];
    _avgvisMiles = json['avgvis_miles'];
    _avghumidity = json['avghumidity'];
    _dailyWillItRain = json['daily_will_it_rain'];
    _dailyChanceOfRain = json['daily_chance_of_rain'];
    _dailyWillItSnow = json['daily_will_it_snow'];
    _dailyChanceOfSnow = json['daily_chance_of_snow'];
    _condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    _uv = json['uv'];
  }

  double? _maxtempC;
  double? _maxtempF;
  double? _mintempC;
  double? _mintempF;
  double? _avgtempC;
  double? _avgtempF;
  double? _maxwindMph;
  double? _maxwindKph;
  double? _totalprecipMm;
  double? _totalprecipIn;
  double? _totalsnowCm;
  double? _avgvisKm;
  double? _avgvisMiles;
  double? _avghumidity;
  double? _dailyWillItRain;
  double? _dailyChanceOfRain;
  double? _dailyWillItSnow;
  double? _dailyChanceOfSnow;
  Condition? _condition;
  double? _uv;

  double? get maxtempC => _maxtempC;

  double? get maxtempF => _maxtempF;

  double? get mintempC => _mintempC;

  double? get mintempF => _mintempF;

  double? get avgtempC => _avgtempC;

  double? get avgtempF => _avgtempF;

  double? get maxwindMph => _maxwindMph;

  double? get maxwindKph => _maxwindKph;

  double? get totalprecipMm => _totalprecipMm;

  double? get totalprecipIn => _totalprecipIn;

  double? get totalsnowCm => _totalsnowCm;

  double? get avgvisKm => _avgvisKm;

  double? get avgvisMiles => _avgvisMiles;

  double? get avghumidity => _avghumidity;

  double? get dailyWillItRain => _dailyWillItRain;

  double? get dailyChanceOfRain => _dailyChanceOfRain;

  double? get dailyWillItSnow => _dailyWillItSnow;

  double? get dailyChanceOfSnow => _dailyChanceOfSnow;

  Condition? get condition => _condition;

  double? get uv => _uv;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = _maxtempC;
    map['maxtemp_f'] = _maxtempF;
    map['mintemp_c'] = _mintempC;
    map['mintemp_f'] = _mintempF;
    map['avgtemp_c'] = _avgtempC;
    map['avgtemp_f'] = _avgtempF;
    map['maxwind_mph'] = _maxwindMph;
    map['maxwind_kph'] = _maxwindKph;
    map['totalprecip_mm'] = _totalprecipMm;
    map['totalprecip_in'] = _totalprecipIn;
    map['totalsnow_cm'] = _totalsnowCm;
    map['avgvis_km'] = _avgvisKm;
    map['avgvis_miles'] = _avgvisMiles;
    map['avghumidity'] = _avghumidity;
    map['daily_will_it_rain'] = _dailyWillItRain;
    map['daily_chance_of_rain'] = _dailyChanceOfRain;
    map['daily_will_it_snow'] = _dailyWillItSnow;
    map['daily_chance_of_snow'] = _dailyChanceOfSnow;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['uv'] = _uv;
    return map;
  }

  @override
  String toString() {
    return "{"
        "\"maxtempC\":$_maxtempC,"
        "\"maxtempF\":$_maxtempF,"
        "\"mintempC\":$_mintempC,"
        "\"mintempF\":$_mintempF,"
        "\"avgtempC\":$_avgtempC,"
        "\"avgtempF\":$_avgtempF,"
        "\"maxwindMph\":$_maxwindMph,"
        "\"maxwindKph\":$_maxwindKph,"
        "\"totalprecipMm\":$_totalprecipMm,"
        "\"totalprecipIn\":$_totalprecipIn,"
        "\"totalsnowCm\":$_totalsnowCm,"
        "\"avgvisKm\":$_avgvisKm,"
        "\"avgvisMiles\":$_avgvisMiles,"
        "\"avghumidity\":$_avghumidity,"
        "\"dailyWillItRain\":$_dailyWillItRain,"
        "\"dailyChanceOfRain\":$_dailyChanceOfRain,"
        "\"dailyWillItSnow\":$_dailyWillItSnow,"
        "\"dailyChanceOfSnow\":$_dailyChanceOfSnow,"
        "\"condition\":$_condition,"
        "\"uv\":$_uv"
        "}";
  }
}

/// last_updated_epoch : 1698553800
/// last_updated : "2023-10-29 00:30"
/// temp_c : 26
/// temp_f : 78.8
/// is_day : 0
/// condition : {"text":"Partly cloudy","icon":"//cdn.weatherapi.com/weather/64x64/night/116.png","code":1003}
/// wind_mph : 2.2
/// wind_kph : 3.6
/// wind_degree : 10
/// wind_dir : "N"
/// pressure_mb : 1010
/// pressure_in : 29.83
/// precip_mm : 0
/// precip_in : 0
/// humidity : 84
/// cloud : 50
/// feelslike_c : 30.1
/// feelslike_f : 86.1
/// vis_km : 10
/// vis_miles : 6
/// uv : 1
/// gust_mph : 0.9
/// gust_kph : 1.5

Current currentFromJson(String str) => Current.fromJson(json.decode(str));

String currentToJson(Current data) => json.encode(data.toJson());

class Current {
  Current({
    double? lastUpdatedEpoch,
    String? lastUpdated,
    double? tempC,
    double? tempF,
    double? isDay,
    Condition? condition,
    double? windMph,
    double? windKph,
    double? windDegree,
    String? windDir,
    double? pressureMb,
    double? pressureIn,
    double? precipMm,
    double? precipIn,
    double? humidity,
    double? cloud,
    double? feelslikeC,
    double? feelslikeF,
    double? visKm,
    double? visMiles,
    double? uv,
    double? gustMph,
    double? gustKph,
  }) {
    _lastUpdatedEpoch = lastUpdatedEpoch;
    _lastUpdated = lastUpdated;
    _tempC = tempC;
    _tempF = tempF;
    _isDay = isDay;
    _condition = condition;
    _windMph = windMph;
    _windKph = windKph;
    _windDegree = windDegree;
    _windDir = windDir;
    _pressureMb = pressureMb;
    _pressureIn = pressureIn;
    _precipMm = precipMm;
    _precipIn = precipIn;
    _humidity = humidity;
    _cloud = cloud;
    _feelslikeC = feelslikeC;
    _feelslikeF = feelslikeF;
    _visKm = visKm;
    _visMiles = visMiles;
    _uv = uv;
    _gustMph = gustMph;
    _gustKph = gustKph;
  }

  Current.fromJson(dynamic json) {
    _lastUpdatedEpoch = json['last_updated_epoch'];
    _lastUpdated = json['last_updated'];
    _tempC = json['temp_c'];
    _tempF = json['temp_f'];
    _isDay = json['is_day'];
    _condition = json['condition'] != null
        ? Condition.fromJson(json['condition'])
        : null;
    _windMph = json['wind_mph'];
    _windKph = json['wind_kph'];
    _windDegree = json['wind_degree'];
    _windDir = json['wind_dir'];
    _pressureMb = json['pressure_mb'];
    _pressureIn = json['pressure_in'];
    _precipMm = json['precip_mm'];
    _precipIn = json['precip_in'];
    _humidity = json['humidity'];
    _cloud = json['cloud'];
    _feelslikeC = json['feelslike_c'];
    _feelslikeF = json['feelslike_f'];
    _visKm = json['vis_km'];
    _visMiles = json['vis_miles'];
    _uv = json['uv'];
    _gustMph = json['gust_mph'];
    _gustKph = json['gust_kph'];
  }

  double? _lastUpdatedEpoch;
  String? _lastUpdated;
  double? _tempC;
  double? _tempF;
  double? _isDay;
  Condition? _condition;
  double? _windMph;
  double? _windKph;
  double? _windDegree;
  String? _windDir;
  double? _pressureMb;
  double? _pressureIn;
  double? _precipMm;
  double? _precipIn;
  double? _humidity;
  double? _cloud;
  double? _feelslikeC;
  double? _feelslikeF;
  double? _visKm;
  double? _visMiles;
  double? _uv;
  double? _gustMph;
  double? _gustKph;

  double? get lastUpdatedEpoch => _lastUpdatedEpoch;

  String? get lastUpdated => _lastUpdated;

  double? get tempC => _tempC;

  double? get tempF => _tempF;

  double? get isDay => _isDay;

  Condition? get condition => _condition;

  double? get windMph => _windMph;

  double? get windKph => _windKph;

  double? get windDegree => _windDegree;

  String? get windDir => _windDir;

  double? get pressureMb => _pressureMb;

  double? get pressureIn => _pressureIn;

  double? get precipMm => _precipMm;

  double? get precipIn => _precipIn;

  double? get humidity => _humidity;

  double? get cloud => _cloud;

  double? get feelslikeC => _feelslikeC;

  double? get feelslikeF => _feelslikeF;

  double? get visKm => _visKm;

  double? get visMiles => _visMiles;

  double? get uv => _uv;

  double? get gustMph => _gustMph;

  double? get gustKph => _gustKph;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = _lastUpdatedEpoch;
    map['last_updated'] = _lastUpdated;
    map['temp_c'] = _tempC;
    map['temp_f'] = _tempF;
    map['is_day'] = _isDay;
    if (_condition != null) {
      map['condition'] = _condition?.toJson();
    }
    map['wind_mph'] = _windMph;
    map['wind_kph'] = _windKph;
    map['wind_degree'] = _windDegree;
    map['wind_dir'] = _windDir;
    map['pressure_mb'] = _pressureMb;
    map['pressure_in'] = _pressureIn;
    map['precip_mm'] = _precipMm;
    map['precip_in'] = _precipIn;
    map['humidity'] = _humidity;
    map['cloud'] = _cloud;
    map['feelslike_c'] = _feelslikeC;
    map['feelslike_f'] = _feelslikeF;
    map['vis_km'] = _visKm;
    map['vis_miles'] = _visMiles;
    map['uv'] = _uv;
    map['gust_mph'] = _gustMph;
    map['gust_kph'] = _gustKph;
    return map;
  }

  factory Current.empty() {
    return Current();
  }

  @override
  String toString() {
    return "{"
        "\"lastUpdatedEpoch\":$_lastUpdatedEpoch,"
        "\"lastUpdated\":\"$_lastUpdated\","
        "\"tempC\":$_tempC,"
        "\"tempF\":$_tempF,"
        "\"isDay\":$_isDay,"
        "\"condition\":$_condition,"
        "\"windMph\":$_windMph,"
        "\"windKph\":$_windKph,"
        "\"windDegree\":$_windDegree,"
        "\"windDir\":\"$_windDir\","
        "\"pressureMb\":$_pressureMb,"
        "\"pressureIn\":$_pressureIn,"
        "\"precipMm\":$_precipMm,"
        "\"precipIn\":$_precipIn,"
        "\"humidity\":$_humidity,"
        "\"cloud\":$_cloud,"
        "\"feelslikeC\":$_feelslikeC,"
        "\"feelslikeF\":$_feelslikeF,"
        "\"visKm\":$_visKm,"
        "\"visMiles\":$_visMiles,"
        "\"uv\":$_uv,"
        "\"gustMph\":$_gustMph,"
        "\"gustKph\":$_gustKph"
        "}";
  }
}

/// name : "Caracas"
/// region : "Distrito Federal"
/// country : "Venezuela"
/// lat : 10.5
/// lon : -66.92
/// tz_id : "America/Caracas"
/// localtime_epoch : 1698554552
/// localtime : "2023-10-29 0:42"

Location locationFromJson(String str) => Location.fromJson(json.decode(str));

String locationToJson(Location data) => json.encode(data.toJson());

class Location {
  Location({
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
    String? tzId,
    double? localtimeEpoch,
    String? localtime,
  }) {
    _name = name;
    _region = region;
    _country = country;
    _lat = lat;
    _lon = lon;
    _tzId = tzId;
    _localtimeEpoch = localtimeEpoch;
    _localtime = localtime;
  }

  Location.fromJson(dynamic json) {
    _name = json['name'];
    _region = json['region'];
    _country = json['country'];
    _lat = json['lat'];
    _lon = json['lon'];
    _tzId = json['tz_id'];
    _localtimeEpoch = json['localtime_epoch'];
    _localtime = json['localtime'];
  }

  String? _name;
  String? _region;
  String? _country;
  double? _lat;
  double? _lon;
  String? _tzId;
  double? _localtimeEpoch;
  String? _localtime;

  String? get name => _name;

  String? get region => _region;

  String? get country => _country;

  double? get lat => _lat;

  double? get lon => _lon;

  String? get tzId => _tzId;

  double? get localtimeEpoch => _localtimeEpoch;

  String? get localtime => _localtime;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['region'] = _region;
    map['country'] = _country;
    map['lat'] = _lat;
    map['lon'] = _lon;
    map['tz_id'] = _tzId;
    map['localtime_epoch'] = _localtimeEpoch;
    map['localtime'] = _localtime;
    return map;
  }

  factory Location.empty() {
    return Location();
  }

  @override
  String toString() {
    return "{"
        "\"name\":\"$_name\","
        "\"region\":\"$_region\","
        "\"country\":\"$_country\","
        "\"lat\":$_lat,"
        "\"lon\":$_lon,"
        "\"tzId\":\"$_tzId\","
        "\"localtimeEpoch\":$_localtimeEpoch,"
        "\"localtime\":\"$_localtime\""
        "}";
  }
}
