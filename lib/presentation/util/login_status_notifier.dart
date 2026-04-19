import 'dart:async';

import 'package:flutter/foundation.dart';

class LoginStatusNotifier extends ChangeNotifier {
  bool _isLoggedIn;

  bool get isLoggedIn => _isLoggedIn;

  StreamSubscription<bool?>? _subscription;

  LoginStatusNotifier(this._isLoggedIn);

  void listenForUpdates(Stream<bool?> stream) {
    _subscription = stream.listen((status) {
      if (status == null) return;
      _isLoggedIn = status;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _subscription?.cancel();
    super.dispose();
  }
}
