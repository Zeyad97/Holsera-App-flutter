import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class MockUser {
  final String email;
  final String? displayName;

  MockUser({required this.email, this.displayName});
}

class AuthService extends ChangeNotifier {
  MockUser? _user;
  bool _isLoading = false;
  late final FirebaseAuth _firebaseAuth;
  late final GoogleSignIn _googleSignIn;

  MockUser? get user => _user;
  bool get isLoading => _isLoading;
  bool get isLoggedIn => _user != null;
  String? get userEmail => _user?.email;
  String? get displayName => _user?.displayName ?? _user?.email?.split('@').first;

  AuthService() {
    _firebaseAuth = FirebaseAuth.instance;
    _googleSignIn = GoogleSignIn();
  }

  Future<void> signInWithGoogle() async {
    try {
      _isLoading = true;
      notifyListeners();

      final GoogleSignInAccount? googleSignInAccount = await _googleSignIn.signIn();
      if (googleSignInAccount == null) {
        throw Exception('Google Sign-In cancelled');
      }

      late GoogleSignInAuthentication googleSignInAuthentication;
      try {
        googleSignInAuthentication = await googleSignInAccount.authentication;
      } catch (authError) {
        debugPrint('Authentication error: $authError');
        await _googleSignIn.disconnect();
        throw Exception('Failed to authenticate with Google: $authError');
      }

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleSignInAuthentication.accessToken,
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await _firebaseAuth.signInWithCredential(credential);
      final User? firebaseUser = userCredential.user;
      
      if (firebaseUser != null) {
        _user = MockUser(
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName,
        );
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Google Sign-In error: $e');
      rethrow;
    }
  }

  Future<void> signUpWithEmail(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (password.length < 8) {
        throw Exception('Password must be at least 8 characters');
      }

      final UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        _user = MockUser(
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName,
        );
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Sign-up error: $e');
      rethrow;
    }
  }

  Future<void> signInWithEmail(String email, String password) async {
    try {
      _isLoading = true;
      notifyListeners();

      if (password.isEmpty || email.isEmpty) {
        throw Exception('Email and password required');
      }

      final UserCredential userCredential =
          await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      final User? firebaseUser = userCredential.user;
      if (firebaseUser != null) {
        _user = MockUser(
          email: firebaseUser.email ?? '',
          displayName: firebaseUser.displayName,
        );
      }

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Sign-in error: $e');
      rethrow;
    }
  }

  Future<void> logout() async {
    try {
      _isLoading = true;
      notifyListeners();

      await Future.delayed(const Duration(seconds: 1));
      await _firebaseAuth.signOut();
      await _googleSignIn.signOut();
      _user = null;

      _isLoading = false;
      notifyListeners();
    } catch (e) {
      _isLoading = false;
      notifyListeners();
      debugPrint('Logout error: $e');
      rethrow;
    }
  }
}

