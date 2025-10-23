class ScreenDefinition {
  final int id;
  final String routeName;
  final String title;
  final List<ScreenBlock> blocks;

  ScreenDefinition({
    required this.id,
    required this.routeName,
    required this.title,
    required this.blocks,
  });
}

class ScreenBlock {
  final String type;
  final String value;
  final ScreenAction? action;

  ScreenBlock({
    required this.type,
    required this.value,
    this.action,
  });
}

class ScreenAction {
  final String type;
  final String route;

  ScreenAction({
    required this.type,
    required this.route,
  });
}
