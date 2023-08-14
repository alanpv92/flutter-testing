import 'package:application/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('when counter is 0 and increment button  is clicked',
      (widgetTester) async {
    await widgetTester.pumpWidget(const MaterialApp(home: CounterScreen()));
    final val = find.text('0');
    expect(val, findsOneWidget);
    final incrementButton = find.byType(FloatingActionButton);
    await widgetTester.tap(incrementButton);
    await widgetTester.pump();
    final valAfterTap = find.text('1');
    expect(valAfterTap, findsOneWidget);
  });
}
