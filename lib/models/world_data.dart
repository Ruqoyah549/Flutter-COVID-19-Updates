import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class WorldData extends ChangeNotifier {
  Map<String, String> headers = {
    'x-rapidapi-host': 'coronavirus-monitor.p.rapidapi.com',
    'x-rapidapi-key': 'd5dc61d7c7msh5025f1f1b1c08f5p13d027jsnda0b7e3bceb5',
  };

  Map<String, dynamic> worldMap;
  Map<String, dynamic> countryMap;

  final worldStatUrl =
      'https://coronavirus-monitor.p.rapidapi.com/coronavirus/worldstat.php';

  final countryUrl =
      'https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=nigeria';

  final searchCountryUrl =
      'https://coronavirus-monitor.p.rapidapi.com/coronavirus/latest_stat_by_country.php?country=';

  final url =
      'https://coronavirus-monitor.p.rapidapi.com/coronavirus/cases_by_country.php';

  List _country = [];
  List get allCountries => _country;

  String _totalCases;
  String _totalRecovered;
  String _totalDeaths;
  String _newCases;
  String _newDeaths;
  String _recordDateTime;

  String _countryTotalCases;
  String _countryTotalRecovered;
  String _countryTotalDeaths;
  String _countryName;
  String _countryNewCases;
  String _countryActiveCases;
  String _countryRecordDate;

  bool _isFetchingWorld = true;
  bool _isFetchingCountry = true;
  bool _isFetchingAllCountry = true;
  bool _isDoneFetching = false;

  bool get fetching {
    if (_isFetchingWorld && _isFetchingCountry && _isFetchingAllCountry) {
      _isDoneFetching = true;
    } else {
      _isDoneFetching = false;
    }
    return _isDoneFetching;
  }

  String get totalCases => _totalCases;

  String get totalRecovered => _totalRecovered;

  String get totalDeaths => _totalDeaths;

  String get newCases => _newCases;

  String get newDeaths => _newDeaths;

  String get recordDateTime => _recordDateTime;

  void _setNewCases(value) {
    _newCases = value;
    notifyListeners();
  }

  void _setNewDeaths(value) {
    _newDeaths = value;
    notifyListeners();
  }

  void _setRecordDateTime(value) {
    _recordDateTime = value;
    notifyListeners();
  }

  void _setTotalCases(value) {
    _totalCases = value;
    notifyListeners();
  }

  void _setTotalRecovered(value) {
    _totalRecovered = value;
    notifyListeners();
  }

  void _setTotalDeaths(value) {
    _totalDeaths = value;
    notifyListeners();
  }

  String get countryTotalCases => _countryTotalCases;

  String get countryTotalRecovered => _countryTotalRecovered;

  String get countryTotalDeaths => _countryTotalDeaths;

  String get countryName => _countryName;

  String get countryNewCases => _countryNewCases;

  String get countryActiveCases => _countryActiveCases;

  String get countryRecordDate => _countryRecordDate;

  String _allCountryRecordDate;

  String get allCountryRecordDate => _allCountryRecordDate;

  void setAllCountryRecordDate(value) {
    _allCountryRecordDate = value;
    notifyListeners();
  }

  void _setCountryTotalCases(value) {
    _countryTotalCases = value;
    notifyListeners();
  }

  void _setCountryName(value) {
    _countryName = value;
    notifyListeners();
  }

  void _setCountryNewCases(value) {
    _countryNewCases = value;
    notifyListeners();
  }

  void _setCountryActiveCases(value) {
    _countryActiveCases = value;
    notifyListeners();
  }

  void _setCountryRecordDate(value) {
    _countryRecordDate = value;
    notifyListeners();
  }

  void _setCountryTotalRecovered(value) {
    _countryTotalRecovered = value;
    notifyListeners();
  }

  void _setCountryTotalDeaths(value) {
    _countryTotalDeaths = value;
    notifyListeners();
  }

  getWorldStat() async {
    try {
      await http.get(worldStatUrl, headers: headers).then((res) {
        worldMap = json.decode(res.body);
        _setTotalCases(worldMap['total_cases']);
        _setTotalDeaths(worldMap['total_deaths']);
        _setTotalRecovered(worldMap['total_recovered']);
        _setNewCases(worldMap['new_cases']);
        _setNewDeaths(worldMap['new_deaths']);
        _setRecordDateTime(worldMap['statistic_taken_at']);
      });
      _isFetchingWorld = false;
      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception('Failed to load from the Internet');
    }
  }

  getNigeriaStat() async {
    try {
      await http.get(countryUrl, headers: headers).then((res) {
        if (res.statusCode == 200) {
          countryMap = json.decode(res.body);
          _setCountryTotalCases(
              countryMap['latest_stat_by_country'][0]['total_cases']);
          _setCountryTotalDeaths(
              countryMap['latest_stat_by_country'][0]['total_deaths']);
          _setCountryTotalRecovered(
              countryMap['latest_stat_by_country'][0]['total_recovered']);
          _setCountryName(
              countryMap['latest_stat_by_country'][0]['country_name']);
          _setCountryNewCases(
              countryMap['latest_stat_by_country'][0]['new_cases']);
          _setCountryActiveCases(
              countryMap['latest_stat_by_country'][0]['active_cases']);
          _setCountryRecordDate(
              countryMap['latest_stat_by_country'][0]['record_date']);
        }
      });
      _isFetchingCountry = false;
      notifyListeners();
    } catch (e) {
      print(e);
      throw Exception('Failed to load from the Internet');
    }
  }

  getAllCountry() async {
    try {
      http.get(url, headers: headers).then((res) {
        if (res.statusCode == 200) {
          Map countryData = json.decode(res.body);
          _country = countryData["countries_stat"];
          _allCountryRecordDate = countryData["statistic_taken_at"];
        }
        _isFetchingAllCountry = false;
        notifyListeners();
      });
    } catch (e) {
      print(e);
      return 'An error occured';
    }
  }
}
