class Queue<T> {
  final List<T> _items = [];
  int _head = 0;

  bool get isEmpty => _head == _items.length;

  bool get isNotEmpty => !isEmpty;

  int get length => _items.length - _head;

  List<T> toList() => List<T>.unmodifiable(_items.skip(_head));

  void enqueue(T value) {
    _items.add(value);
  }

  T dequeue() {
    if (isEmpty) {
      throw StateError('Queue kosong');
    }

    final value = _items[_head++];

    if (_head >= 64 && _head * 2 >= _items.length) {
      _items.removeRange(0, _head);
      _head = 0;
    }

    return value;
  }

  T peek() {
    if (isEmpty) {
      throw StateError('Queue kosong');
    }

    return _items[_head];
  }

  void clear() {
    _items.clear();
    _head = 0;
  }
}

void main() {
  final queue = Queue<String>();

  queue.enqueue('Andi');
  queue.enqueue('Budi');
  queue.enqueue('Citra');

  print('Antrean (${queue.length} orang, depan -> belakang): ${queue.toList().join(' -> ')}');
  print('Berikutnya: ${queue.peek()}');
  print('Dilayani: ${queue.dequeue()}');
  print('Sisa antrean: ${queue.toList().join(' -> ')}');
  print('Berikutnya: ${queue.peek()}');
}