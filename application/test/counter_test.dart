import 'package:application/counter.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  late CounterState counterState;
  group('counter state', () {
    // pretest
    setUp(() {
      counterState = CounterState();
    }); //called before every test
    setUpAll(() => null); //called before the first test
    //testing

    test('inital value of counter is 0', () {
      final testVal = _ounterState.counter;
      expect(testVal, 0); //comapre the actual and expected value
    });

    test('when the increment function is called', () {
      counterState.increment();
      final testVal = counterState.counter;
      expect(testVal, 1);
    });

    test('when decrement function is called', () {
      counterState.decrement();
      final testVal = counterState.counter;
      expect(testVal, -1);
    });
    test('when reset is called', () {
       counterState.increment();
      final testVal = counterState.counter;
      expect(testVal, 1);
    });
  });

  //post test
  tearDown(() => null); //called before every test
  tearDownAll(() => null); //called before the first test
}
