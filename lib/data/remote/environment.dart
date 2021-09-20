class Environments {
  static const String PRODUCTION = 'http://192.168.1.5:3000/api/v1';
  static const String DEV = 'http://192.168.1.5:3000/api/v1';
}

class ConfigEnvironments {
  static const String _currentEnvironments = Environments.DEV;
  static const List<Map<String, String>> _availableEnvironments = [
    {
      'env': Environments.DEV,
      'url': 'http://192.168.1.5:3000',
    },
    {
      'env': Environments.PRODUCTION,
      'url': 'http://192.168.1.5:3000',
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
