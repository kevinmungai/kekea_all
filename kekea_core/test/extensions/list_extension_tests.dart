import 'package:flutter_test/flutter_test.dart';
import '../../lib/extensions/list_extensions.dart';

void main() {
  test("removeNonEmpty() list of one", () {
    expect([1].removeNonEmpty(), equals([1]));
  });

  test("removeNonEmpty() list of two", () {
    expect([1, 2].removeNonEmpty(), equals([1]));
  });

  test("removeNonEmpty() list of five", () {
    expect([1, 2, 3, 4, 5].removeNonEmpty(), equals([1, 2, 3, 4]));
  });

  test("removeNonEmpty() empty list", () {
    expect([].removeNonEmpty(), equals([]));
  });

  test("removeNonEmpty() null", () {
    expect(null.removeNonEmpty(), equals([]));
  });

  test("getLastSafe()", () {
    expect([1].getLastSafe(), equals(1));
  });

  test("getLastSafe() null", () {
    expect(null.getLastSafe(), equals(null));
  });

  test("getLastSafe() [1, 2, 3]", () {
    expect([1, 2, 3].getLastSafe(), equals(3));
  });

  test("getLastSafe() []", () {
    expect([].getLastSafe(), equals(null));
  });
}
