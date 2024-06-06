enum ContactType { github, linkedin, instagram }

class Contact {
  final String link;
  final ContactType type;

  Contact({
    required this.link,
    required this.type,
  });
}
