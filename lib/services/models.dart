class User {
  String uid;
  String name;
  DateTime lastActive;

  User({this.uid, this.name, this.lastActive});

  factory User.fromMap(Map data) {
    return User(
      uid: data['id'] ?? '',
      name: data['name'] ?? '',
      lastActive: data['lastActive'] ?? DateTime.now()
    ); // User
  }
}

class Song {
  String sid;
  String title;
  String artist;
  String file_type;
  String file_url;
  num max_weight;
  num runtime;
  DateTime upload_time;

  Song({this.sid, this.title, this.artist, this.file_type, this.file_url, this.max_weight, this.runtime, this.upload_time });

  factory Song.fromMap(Map data) {
    return Song(
      uid: data['id'] ?? '',
      title: data['title'] ?? 'untitled',
      artist: data['artist'] ?? 'unknown artist',
      file_type: data['file_type'] ?? '',
      file_url: data['file_url'] ?? '',
      max_weight: data['max_weight'] ?? 0,
      runtime: data['runtime'] ?? 0,
      upload_time: data['upload_time'] ?? DateTime.now()
    );
  }
}
