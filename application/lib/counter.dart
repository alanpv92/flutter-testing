class CounterState {
  int _counterState = 0;
  int get counter => _counterState;
  void increment() {
    _counterState++;
  }

  void decrement() {
    _counterState--;
  }

  void reset() {
    _counterState = 0;
  }
}
