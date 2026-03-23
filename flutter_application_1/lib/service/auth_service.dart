class AuthResult {
  final bool success;
  final String message;

  const AuthResult({required this.success, required this.message});
}

class AuthService {
  AuthService._();

  static final AuthService instance = AuthService._();

  String _name = 'Demo User';
  String _email = 'demo@upangexpress.com';
  String _phone = '09123456789';
  String _password = 'password123';

  String get registeredEmail => _email;

  AuthResult signUp({
    required String name,
    required String email,
    required String phone,
    required String password,
    required String confirmPassword,
  }) {
    final String normalizedName = name.trim();
    final String normalizedEmail = email.trim().toLowerCase();
    final String normalizedPhone = phone.trim();

    if (normalizedName.isEmpty ||
        normalizedEmail.isEmpty ||
        normalizedPhone.isEmpty ||
        password.isEmpty ||
        confirmPassword.isEmpty) {
      return const AuthResult(
        success: false,
        message: 'Please complete all fields.',
      );
    }

    if (!normalizedEmail.contains('@') || !normalizedEmail.contains('.')) {
      return const AuthResult(
        success: false,
        message: 'Please enter a valid email address.',
      );
    }

    if (password.length < 8) {
      return const AuthResult(
        success: false,
        message: 'Password must be at least 8 characters.',
      );
    }

    if (password != confirmPassword) {
      return const AuthResult(
        success: false,
        message: 'Passwords do not match.',
      );
    }

    _name = normalizedName;
    _email = normalizedEmail;
    _phone = normalizedPhone;
    _password = password;

    return AuthResult(success: true, message: 'Account created for $_name.');
  }

  AuthResult login({required String email, required String password}) {
    final String normalizedEmail = email.trim().toLowerCase();

    if (normalizedEmail.isEmpty || password.isEmpty) {
      return const AuthResult(
        success: false,
        message: 'Enter your email and password.',
      );
    }

    if (normalizedEmail != _email || password != _password) {
      return AuthResult(
        success: false,
        message:
            'Incorrect login details. Sign up first or use $registeredEmail / password123.',
      );
    }

    return AuthResult(success: true, message: 'Welcome back, $_name!');
  }
}
