import 'package:firebase_auth/firebase_auth.dart';

class googleAPI{
  static final user = FirebaseAuth.instance.currentUser;
  static final name = user.displayName;
  static final email = user.email;
  static final id = email.substring(0,5);
}