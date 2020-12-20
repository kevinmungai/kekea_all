extension SafeRemoveLast<T> on List<T> {
  List<T> safeRemoveLast() {
    if (this.isNotEmpty) {
      final List<T> growableList = List<T>.from(this, growable: true);
      return growableList..removeLast();
    } else {
      return List<T>.from([], growable: true);
    }
  }
}

extension RemoveNonEmpty<T> on List<T> {
  List<T> removeNonEmpty() {
    if (this != null) {
      if (this.length > 1) {
        final List<T> growableList = List<T>.from(this);
        return growableList..removeLast();
      } else {
        return this;
      }
    } else {
      return List<T>.from([]);
    }
  }
}

extension GetLastSafe<T> on List<T> {
  T getLastSafe() {
    if (this != null) {
      if (this.isNotEmpty) {
        final T lastItem = this[length - 1];
        return lastItem;
      }
    }
    return null;
  }
}
