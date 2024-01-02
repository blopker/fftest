import 'package:rxdart/rxdart.dart';

import 'custom_auth_manager.dart';

class TotemAuthUser {
  TotemAuthUser({required this.loggedIn, this.uid});

  bool loggedIn;
  String? uid;
}

/// Generates a stream of the authenticated user.
BehaviorSubject<TotemAuthUser> totemAuthUserSubject =
    BehaviorSubject.seeded(TotemAuthUser(loggedIn: false));
Stream<TotemAuthUser> totemAuthUserStream() =>
    totemAuthUserSubject.asBroadcastStream().map((user) => currentUser = user);
