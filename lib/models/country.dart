class Country {
  final String countryName;
  final String totalCases;
  final String newCases;
  final String activeCases;
  final String totalDeaths;
  final String totalRecovered;
  final String recordDate;

  Country(
      {this.countryName,
      this.totalCases,
      this.newCases,
      this.activeCases,
      this.totalDeaths,
      this.totalRecovered,
      this.recordDate});

  factory Country.fromJson(Map<String, dynamic> json) {
    return Country(
        countryName: json["country_name"],
        totalCases: json["total_cases"],
        newCases: json["new_cases"],
        activeCases: json["active_cases"],
        totalDeaths: json["total_deaths"],
        totalRecovered: json["total_recovered"],
        recordDate: json["record_date"]);
  }
}
