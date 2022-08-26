import 'package:uuid/uuid.dart';

class BreadCrumb {
  bool isActive;
  final String name;
  final String uuid;

  BreadCrumb({required this.name, required this.isActive})
      : uuid = const Uuid().v4();

  void activate() {
    isActive = true;
  }

  // Its for checking wether the new text is added or not.
  @override
  bool operator ==(covariant BreadCrumb other) => uuid == other.uuid;

  // THis is for changing the uuid for the new text. if lets say user has not been signed in
  // and driver is in.
  @override
  int get hashCode => uuid.hashCode;

  String get title => name + (isActive ? ">" : '');
}
