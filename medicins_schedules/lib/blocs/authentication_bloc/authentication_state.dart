part of 'authentication_bloc.dart';

enum AuthenticationStatus { authenticated, unauthenticated, unkown }

class AuthenticationState extends Equatable {
  const AuthenticationState._({
    this.status = AuthenticationStatus.unkown,
    this.user,
  });

  final AuthenticationStatus status;
  final MyUser? user;

  const AuthenticationState.unkown() : this._();

  const AuthenticationState.authentiacted(MyUser myUser)
    : this._(status: AuthenticationStatus.authenticated, user: myUser);

  const AuthenticationState.unauthenticated()
    : this._(status: AuthenticationStatus.unauthenticated);

  @override
  List<Object?> get props => [status, user];
}
