import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthLoginRequested>((event, emit) {
      final email = event.email;
      final password = event.password;

      final emailRegex = RegExp(r'^[^\s@]+@[^\s@]+\.[^\s@]+$');

      if (!emailRegex.hasMatch(email)) {
        return emit(AuthFailure(error: 'Please enter a valid email.'));
      }

      if (password.length < 6) {
        return emit(
          AuthFailure(error: 'Password cannot be less than 6 characters.'),
        );
      }
    });
  }
}
