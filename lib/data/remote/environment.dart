class Environments {
  static const String PRODUCTION = 'https://tweeet-api.herokuapp.com/api/v1';
  static const String DEV = 'https://tweeet-api.herokuapp.com/api/v1';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'https://tweeet-api.herokuapp.com/',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'https://tweeet-api.herokuapp.com/',
    },
  ];

  static String? getEnvironments() {
    return _availableEnvironments
        .firstWhere(
          (d) => d['env'] == _currentEnvironments,
        )
        .values
        .last
        .toString();
  }
}
