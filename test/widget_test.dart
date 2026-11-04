import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sound_first/main.dart';
import 'package:sound_first/navbar/global_navbar.dart';
import 'package:sound_first/navbar/page_header.dart';

void main() {
  testWidgets('App renders GlobalNavbar and PageHeader properly',
      (WidgetTester tester) async {
    // Build app within Riverpod ProviderScope
    await tester.pumpWidget(
      const ProviderScope(
        child: MyApp(),
      ),
    );
    await tester.pumpAndSettle();

    // 1. Verify GlobalNavbar presence
    expect(find.byType(GlobalNavbar), findsOneWidget);
    expect(find.text('Nocturn Sleep'), findsOneWidget);
    expect(find.text('SLEEP'), findsOneWidget);
    expect(find.text('7'), findsOneWidget);
    expect(find.text('240'), findsOneWidget);
    expect(find.text('FULL'), findsOneWidget);

    // 2. Verify PageHeader on Home page
    expect(find.byType(PageHeader), findsOneWidget);
    expect(find.text('Khám Phá Không Gian'), findsOneWidget);
    expect(find.text('Chọn âm thanh yêu thích để bắt đầu thư giãn'),
        findsOneWidget);
  });
}
