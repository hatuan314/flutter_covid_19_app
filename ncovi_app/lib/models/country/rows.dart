class Row {
  String country;
  String countryAbbreviation;
  String totalCases;
  String newCases;
  String totalDeaths;
  String newDeaths;
  String totalRecovered;
  String activeCases;
  String seriousCritical;
  String casesPerMillPop;
  String flag;

  Row(
      {this.country,
        this.countryAbbreviation,
        this.totalCases,
        this.newCases,
        this.totalDeaths,
        this.newDeaths,
        this.totalRecovered,
        this.activeCases,
        this.seriousCritical,
        this.casesPerMillPop,
        this.flag});

  Row.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    countryAbbreviation = json['country_abbreviation'];
    totalCases = json['total_cases'];
    newCases = json['new_cases'];
    totalDeaths = json['total_deaths'];
    newDeaths = json['new_deaths'];
    totalRecovered = json['total_recovered'];
    activeCases = json['active_cases'];
    seriousCritical = json['serious_critical'];
    casesPerMillPop = json['cases_per_mill_pop'];
    flag = json['flag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['country_abbreviation'] = this.countryAbbreviation;
    data['total_cases'] = this.totalCases;
    data['new_cases'] = this.newCases;
    data['total_deaths'] = this.totalDeaths;
    data['new_deaths'] = this.newDeaths;
    data['total_recovered'] = this.totalRecovered;
    data['active_cases'] = this.activeCases;
    data['serious_critical'] = this.seriousCritical;
    data['cases_per_mill_pop'] = this.casesPerMillPop;
    data['flag'] = this.flag;
    return data;
  }
}