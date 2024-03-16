class ApiEndPoints {
  static final String baseUrl = "localhost:4000";
  static _AuthEndPoints authEndpoints = _AuthEndPoints();
}

class _AuthEndPoints {
  final String signin = "/api/auth/signin";
  final String signup = "/api/auth/signup";
}
