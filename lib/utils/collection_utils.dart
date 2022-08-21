
class CollectionUtils {
  static List<U> mapToList<T, U>(List<T> items, U Function(T item, int index) mapFunc) {
    List<U> results = <U>[];
    for (int i = 0; i < items.length; i++) {
      results.add(mapFunc(items[i], i));
    }
    return results;
  }
}