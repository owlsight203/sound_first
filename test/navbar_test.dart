import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:sound_first/main.dart';
import 'package:sound_first/library/library_page.dart';
import 'package:sound_first/stats/stats_screen.dart';
import 'package:sound_first/profile/profile_screen.dart';
import 'package:sound_first/navbar/global_navbar.dart';
import 'package:sound_first/navbar/page_header.dart';

void main() {
  group('Global Navbar and Page Header Tests across all screens', () {
    testWidgets('Home screen has GlobalNavbar and standard PageHeader',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: SimpleAudioScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GlobalNavbar), findsOneWidget);
      expect(find.byType(PageHeader), findsOneWidget);
      expect(find.text('Nocturn Sleep'), findsOneWidget);
      expect(find.text('SLEEP'), findsOneWidget);
      expect(find.text('7'), findsOneWidget);
      expect(find.text('240'), findsOneWidget);
      expect(find.text('FULL'), findsOneWidget);
      expect(find.text('Khám Phá Không Gian'), findsOneWidget);
    });

    testWidgets('Library screen has GlobalNavbar and standard PageHeader',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: LibraryPage()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GlobalNavbar), findsOneWidget);
      expect(find.byType(PageHeader), findsOneWidget);
      expect(find.text('Tất Cả Bản Phối'), findsOneWidget);
      expect(find.text('Khám phá toàn bộ danh sách âm thanh thư giãn của bạn'),
          findsOneWidget);
    });

    testWidgets('Stats screen has GlobalNavbar and standard PageHeader with action',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: StatsScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GlobalNavbar), findsOneWidget);
      expect(find.byType(PageHeader), findsOneWidget);
      expect(find.text('Thống Kê Lượt Nghe'), findsOneWidget);
      expect(find.text('CẬP NHẬT'), findsOneWidget);
    });

    testWidgets('Profile screen has GlobalNavbar and standard PageHeader',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const ProviderScope(
          child: MaterialApp(home: ProfileScreen()),
        ),
      );
      await tester.pumpAndSettle();

      expect(find.byType(GlobalNavbar), findsOneWidget);
      expect(find.byType(PageHeader), findsOneWidget);
      expect(find.text('Hồ Sơ Cá Nhân'), findsOneWidget);
      expect(find.text('Thần Cú Say Ngủ'), findsOneWidget);
    });
  });
}
