class User {
  final String imagePath;
  final String name;
  final String email;
  final String about;
  final List<String> workExperience;
  final List<String> education;
  final List<String> qualifications;

  const User({
    required this.imagePath,
    required this.name,
    required this.email,
    required this.about,
    required this.workExperience,
    required this.education,
    required this.qualifications
  });


}