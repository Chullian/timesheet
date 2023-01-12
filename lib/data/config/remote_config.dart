class RemoteConfig {
  Map<String, dynamic> configurations() {
    var configs = <String, dynamic>{
      'timer_start_aproval': true,
      'timer_stop_approval': false
    };
    return Map.of(configs);
  }

  dynamic findConfigByType(String key) {
    return configurations().containsKey(key);
  }
}
