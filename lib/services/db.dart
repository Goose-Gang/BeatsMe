import 'package:beats_me/services/models.dart';

class DatabaseService {
  final Firestore _db = Firestore.instance;

  Future<Song> getSong(songId) {
    return _db
        .collection('Music')
        .document(songId)
        .get()
        .then((snap) => snap.data);
  }

  Future<Set<Bar>> getSongData(songId) {
    return _db.collection('Music')
        .document(songId)
        .collection('Bars')
        .get()
        .then((snap) => snap.data);
  }
}

loadData() async {
  var songId = 'cV03UE9fPMMI0V4NlwqS';
  var songMetaData = await DatabaseService().getSong(songId);
  // var songData = await DatabaseService().getSong(songId);

  return songMetaData.file_url;
}