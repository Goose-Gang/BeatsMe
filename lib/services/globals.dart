import 'models.dart';

class Global {
  static final String title = 'BeatsMe';

  static final Map models = {
    Song: (data) => Song.fromMap(data),
    User: (data) => User.fromMap(data),
    Bar: (data) => Bar.fromMap(data)
  };
}