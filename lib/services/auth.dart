import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Firestore _db = Firestore.instance;
  
  Future<FirebaseUser> get getUser => _auth.currentUser();

  Stream<FirebaseUser> get user => _auth.onAuthStateChanged;

  Future<FirebaseUser> anonLogin async {
    FirebaseUser user = await _auth.signInAnonymously();
    updateUserData(user);
    return user;
  }

  Future<void> updateUserData(FirebaseUser user) {
    DocumentReference songRef = _db.collection('Users').document(user.id);

    return songRef.setData({
      'id': user.id,
      'lastActive': DateTime.now()
    }, merge: true);
  }

  Future<void> signOut() {
    return _auth.signOut();
  }
}

