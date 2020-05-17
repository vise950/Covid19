abstract class BaseDao<T> {
  Future insert(T t);

  Future insertAll(List<T> t);

  Future update(T t);

  Future delete(T t);

  Future deleteAll();

  Future<T> query();

  Future<List<T>> queryAll();
}