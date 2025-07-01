class TeamMember {
  final String role;
  final String name;
  final String text;
  final String imageUrl;
  final String? linkedinUrl;

  TeamMember({
    required this.role,
    required this.name,
    required this.text,
    required this.imageUrl,
    this.linkedinUrl,
  });
}
