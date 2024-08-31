class Stacks<T> {
  final _stacks = <T>[];

  void push(T value) => _stacks.add(value);

  T? pop() => (isEmpty) ? null : _stacks.removeLast();

  T? get last => (isEmpty) ? null : _stacks.last;

  void clear() => _stacks.clear();

  int get length => _stacks.length;

  bool get isEmpty => _stacks.isEmpty;

  bool get isNotEmpty => _stacks.isNotEmpty;

  T elementAt(int index) => _stacks.elementAt(index);

  @override
  String toString() => _stacks.toString();
}
