import 'package:timezone/timezone.dart' as tz;

class AppData {
  static List<String> locations = [
    'America/New_York',
    'Europe/London',
    'Asia/Tokyo',
    'Australia/Sydney',
    'America/Los_Angeles',
    'Europe/Paris',
    'Asia/Dubai',
    'Pacific/Honolulu',
    'Europe/Berlin', // Berlín
    'Asia/Shanghai', // Shanghái
    'America/Chicago', // Chicago
    'Asia/Singapore', // Singapur
    'Asia/Kolkata', // Calcuta
    'Europe/Moscow', // Moscú
    'America/Toronto', // Toronto
    'America/Mexico_City', // Ciudad de México
    'Europe/Madrid', // Madrid
    'Australia/Melbourne', // Melbourne
  ];

  static Future<String> getTime(String location) async {
    final locationData = tz.getLocation(location);
    final now = tz.TZDateTime.now(locationData);
    return '${now.hour}:${now.minute}:${now.second}';
  }

  static String getLocationName(String location) {
    final locationData = tz.getLocation(location);
    return locationData.name;
  }
}
