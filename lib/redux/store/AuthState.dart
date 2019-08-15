import 'package:meta/meta.dart';

@immutable
class AuthState {
  final String token;
  final String mobileNumber;

  AuthState({this.token, this.mobileNumber});

  AuthState copyWith({
    String token,
  }) {
    return new AuthState(
        token: token ?? this.token,
        mobileNumber: mobileNumber ?? this.mobileNumber);
  }

  factory AuthState.initial() {
    return new AuthState(token: "token", mobileNumber: "");
  }
}
