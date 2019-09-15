class User {
  String uid;
  String name;
  DateTime lastActive;

  User({this.uid, this.name, this.lastActive});

  factory User.fromMap(Map data) {
    return User(
        uid: data['id'] ?? '',
        name: data['name'] ?? '',
        lastActive: data['lastActive'] ?? DateTime.now()); // User
  }
}

class Song {
  String sid;
  String title;
  String author;
  String file_url;
  String img_url;

  Song({this.sid, this.title, this.author, this.file_url, this.img_url});

  factory Song.fromMap(Map data) {
    return Song(
      sid: data['uid'] ?? '',
      title: data['name'] ?? 'untitled',
      author: data['author'] ?? 'unknown artist',
      file_url: data['url'] ?? '',
      img_url: data['img_url'] ?? ''
    );
  }
}

class Bar {
  num timestamp;
  num weight;

  Bar({this.timestamp, this.weight});

  factory Bar.fromMap(Map data) {
    return Bar(timestamp: data['timestamp'], weight: data['weight']);
  }
}
