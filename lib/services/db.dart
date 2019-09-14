import 'package:beats_me/services/models.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Future<User> getUser(userId) {
    return _db
        .collection('Users')
        .document(userId)
        .get()
        .then((snap) => User(snap));
  }

  Future<List<Song>> getSongsForUser(userId) {
    return _db
        .collection('Users')
        .document(userId)
        .collection('Songs')
        .get()
        .then((snap) => snap.data);
  }

  Future<Song> getSongData(songId, userId) {
    return _db
        .collection('Users')
        .document(userId)
        .collection('Songs')
        .document(songId)
        .get()
        .then((snap) => snap.data);
  }
}

loadData() {
  var user = Document<User>(path: 'Users');
  
  user.getData();
  user.upsert({'hello': 'world'});

  var songs = UserData<Song>(collection: 'Songs');
  songs.getDocument();

  songs.upsert(data);

}

class Document<T> {
  final Firestore _db = Firestore.instance;
  final String path;
  DocumentReference ref;

  Document({ this.path }) {
    ref = _db.document(path);
  }

  Future<T> getData() {
    return ref.get().then((v) => Global.models[T](v.data) as T);
  }
}