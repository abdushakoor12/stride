import 'dart:math';

String generateId({
  int length = 10,
}) {
  const chars = '1234567890abcdefghijklmnopqrstuvwxyz';
  final rnd = Random.secure();
  return String.fromCharCodes(Iterable.generate(
    length,
    (index) => chars.codeUnitAt(rnd.nextInt(chars.length)),
  ));
}
