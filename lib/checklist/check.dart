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
  final checked;

  SimpleCheck(SimpleCheckBuilder builder) :
      checked = builder.checked,
      super(builder);

   bool isComplete() => checked;
}

abstract class SimpleCheckBuilder extends CheckBuilder {
  late bool checked;

  SimpleCheck build();
}