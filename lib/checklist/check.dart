abstract class Check {
  final String id;
  final String label;

  Check(CheckBuilder builder) :
      id = builder.id,
      label = builder.label;

  bool isComplete();
}

abstract class CheckBuilder {
  late String id;
  late String label;

  Check build();
}

class SimpleCheck extends Check {
  final bool checked;

  SimpleCheck(SimpleCheckBuilder super.builder) :
      checked = builder.checked;

   @override
  bool isComplete() => checked;
}

abstract class SimpleCheckBuilder extends CheckBuilder {
  late bool checked;

  @override
  SimpleCheck build();
}