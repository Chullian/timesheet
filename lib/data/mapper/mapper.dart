abstract class Mapper<FROM, TO> {
  TO map(FROM object);
  List<TO>? mapList(List<FROM> objects) {}
}
