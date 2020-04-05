class World {
  String totalCases;
  String totalDeaths;
  String totalRecovered;
  String newCases;
  String newDeaths;
  String dateTime;

  World(
      {this.totalCases,
      this.totalDeaths,
      this.totalRecovered,
      this.newCases,
      this.newDeaths,
      this.dateTime});

  factory World.fromJson(Map<String, dynamic> item) {
    return World(
      totalCases: item['total_cases'],
      totalDeaths: item['total_deaths'],
      totalRecovered: item['total_recovered'],
      newCases: item['new_cases'],
      newDeaths: item['new_deaths'],
      dateTime: item['statistics_taken_at'],
    );
  }
}
