class Feature {
  final String title;
  final String description;
  final String icon;

  Feature({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class Problem {
  final String title;
  final String description;

  Problem({
    required this.title,
    required this.description,
  });
}

class UseCase {
  final String title;
  final String description;
  final String icon;

  UseCase({
    required this.title,
    required this.description,
    required this.icon,
  });
}

class Step {
  final int number;
  final String title;
  final String description;

  Step({
    required this.number,
    required this.title,
    required this.description,
  });
}

class Trust {
  final String title;
  final String description;
  final String icon;

  Trust({
    required this.title,
    required this.description,
    required this.icon,
  });
}
