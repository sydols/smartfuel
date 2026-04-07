import 'dart:io';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:integration_test/integration_test.dart';
import 'package:smart_fuel/flutter_flow/flutter_flow_drop_down.dart';
import 'package:smart_fuel/flutter_flow/flutter_flow_icon_button.dart';
import 'package:smart_fuel/flutter_flow/flutter_flow_widgets.dart';
import 'package:smart_fuel/flutter_flow/flutter_flow_theme.dart';
import 'package:smart_fuel/index.dart';
import 'package:smart_fuel/main.dart';
import 'package:smart_fuel/flutter_flow/flutter_flow_util.dart';

import 'package:smart_fuel/backend/firebase/firebase_config.dart';
import 'package:smart_fuel/auth/firebase_auth/auth_util.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  setUpAll(() async {
    await initFirebase();
  });

  setUp(() async {
    await authManager.signOut();
  });

  group('US1 - Account Creation', () {
    testWidgets('Successful Account Creation', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: SignUpWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterEmail_xvom')));
      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_xvom')), 'newuser@uri.edu');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterPass_alr8')));
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_alr8')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('reEnterPass_fjr1')));
      await tester.enterText(
          find.byKey(const ValueKey('reEnterPass_fjr1')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('Button_6rc8')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(
        tester
            .widget<FFButtonWidget>(find.byKey(const ValueKey('Button_mzyk')))
            .onPressed,
        isNotNull,
      );
    });

    testWidgets('Account Already Exists', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: SignUpWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterEmail_xvom')));
      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_xvom')), 'rhodyram@uri.edu');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterPass_alr8')));
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_alr8')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('reEnterPass_fjr1')));
      await tester.enterText(
          find.byKey(const ValueKey('reEnterPass_fjr1')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('Button_6rc8')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(
        tester
            .widget<FFButtonWidget>(find.byKey(const ValueKey('Button_6rc8')))
            .onPressed,
        isNotNull,
      );
    });

    testWidgets('Email Address Invalid', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: SignUpWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterEmail_xvom')));
      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_xvom')), 'rhodyram');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('enterPass_alr8')));
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_alr8')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('reEnterPass_fjr1')));
      await tester.enterText(
          find.byKey(const ValueKey('reEnterPass_fjr1')), 'Str0ngP@ssw0rd!');
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('Button_6rc8')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(
        tester
            .widget<FFButtonWidget>(find.byKey(const ValueKey('Button_6rc8')))
            .onPressed,
        isNotNull,
      );
    });
  });

  group('US3: Profile Creation', () {
    testWidgets('Successful Profile Creation', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: SignUpWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_xvom')), 'newuser2@uri.edu');
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_alr8')), 'Password');
      await tester.enterText(
          find.byKey(const ValueKey('reEnterPass_fjr1')), 'Password');
      await tester.tap(find.byKey(const ValueKey('Button_6rc8')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(const ValueKey('enterName_7scu')), 'Jane');
      await tester.tap(find.byKey(const ValueKey('vehicleDropDown_9dne')));
      await tester.tap(find.text('Gas'));
      await tester.tap(find.byKey(const ValueKey('fuelDropDown_m0eg')));
      await tester.tap(find.text('Regular'));
      await tester.enterText(find.byKey(const ValueKey('enterMpg_06cl')), '20');
      await tester.tap(find.byKey(const ValueKey('Button_mzyk')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(find.byKey(const ValueKey('Text_pokw')), findsWidgets);
    });

    testWidgets('Edit Profile Information', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: LoginWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_stjz')), 'user@example.com');
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_j4d8')), 'Password');
      await tester.tap(find.byKey(const ValueKey('Button_ozln')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.tap(find.byKey(const ValueKey('fuelDropDown_vgd7')));
      await tester.tap(find.text('Premium'));
      await tester.tap(find.byKey(const ValueKey('Button_ppzg')));
      await tester.pumpAndSettle(const Duration(milliseconds: 1000));
    });

    testWidgets('Missing Required Fields', (WidgetTester tester) async {
      _overrideOnError();

      await tester.pumpWidget(MyApp(
        entryPage: SignUpWidget(),
      ));
      await GoogleFonts.pendingFonts();

      await tester.enterText(
          find.byKey(const ValueKey('enterEmail_xvom')), 'newuser3@uri.edu');
      await tester.enterText(
          find.byKey(const ValueKey('enterPass_alr8')), 'Password');
      await tester.enterText(
          find.byKey(const ValueKey('reEnterPass_fjr1')), 'Password');
      await tester.tap(find.byKey(const ValueKey('Button_6rc8')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      await tester.enterText(
          find.byKey(const ValueKey('enterName_7scu')), 'Jane');
      await tester.enterText(find.byKey(const ValueKey('enterMpg_06cl')), '25');
      await tester.tap(find.byKey(const ValueKey('Button_mzyk')));
      await tester.pumpAndSettle(const Duration(milliseconds: 3000));
      expect(find.text('Please complete all required fields'), findsWidgets);
    });
  });
}

// There are certain types of errors that can happen during tests but
// should not break the test.
void _overrideOnError() {
  final originalOnError = FlutterError.onError!;
  FlutterError.onError = (errorDetails) {
    if (_shouldIgnoreError(errorDetails.toString())) {
      return;
    }
    originalOnError(errorDetails);
  };
}

bool _shouldIgnoreError(String error) {
  // It can fail to decode some SVGs - this should not break the test.
  if (error.contains('ImageCodecException')) {
    return true;
  }
  // Overflows happen all over the place,
  // but they should not break tests.
  if (error.contains('overflowed by')) {
    return true;
  }
  // Sometimes some images fail to load, it generally does not break the test.
  if (error.contains('No host specified in URI') ||
      error.contains('EXCEPTION CAUGHT BY IMAGE RESOURCE SERVICE')) {
    return true;
  }
  // These errors should be avoided, but they should not break the test.
  if (error.contains('setState() called after dispose()')) {
    return true;
  }
  // Web-specific error when interacting with TextInputType.emailAddress
  if (error.contains('setSelectionRange') &&
      error.contains('HTMLInputElement')) {
    return true;
  }

  return false;
}
