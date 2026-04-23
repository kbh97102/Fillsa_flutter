import 'dart:async';

import 'package:flutter/foundation.dart';

class LoginStatusNotifier extends ChangeNotifier {
  bool _isLoggedIn;
  bool _isGuestMode = false;

  bool get isLoggedIn => _isLoggedIn;
  bool get isGuestMode => _isGuestMode;

  StreamSubscription<bool?>? _subscription;

  LoginStatusNotifier(this._isLoggedIn);

  void setGuestMode() {
    _isGuestMode = true;
    notifyListeners();
  }

  void listenForUpdates(Stream<bool?> stream) {
    _subscription = stream.listen((status) {
      if (status == null) return;
      _isLoggedIn = status;
      if (status == true) _isGuestMode = false;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
