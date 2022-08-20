
class CollectionUtils {
  static List<U> mapToList<T, U>(List<T> items, U Function(T item, int index) mapFunc) {
    return [
      for (int i = 0; i < items.length; i++) mapFunc(items[i], i)
    ];
  }
}