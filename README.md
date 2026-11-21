# Crypto AI — Educational Crypto Market & Paper Simulator (Flutter Android)

An offline-first, bilingual (**Arabic RTL** & **English LTR**) futuristic dark educational cryptocurrency market dashboard and virtual paper trading simulator built with Flutter and Material 3.

> **Educational Disclaimer:** All prices, sparklines, RSI readings, and portfolio balances ($100,000 virtual balance) are simulated mock data. This application performs **no real trading**, **no exchange integrations**, and **no external financial API calls**.

## Project Structure

- `lib/` — Bilingual Flutter application source (`market_dashboard_screen.dart`, `paper_simulator_screen.dart`, `academy_screen.dart`, `settings_screen.dart`)
- `android/` — Complete Android Gradle Kotlin DSL host (`com.cryptoai.app`), adaptive icons, mipmap PNGs, dark launch splash, and RTL manifest support
- `test/` — Widget and simulation controller unit tests
- `codemagic.yaml` — Ready-to-run Codemagic CI pipeline (`android-release-apk`)

## Local Setup & Run

```bash
flutter pub get
flutter analyze
flutter test
flutter run
```

## Release APK Build (Local or Codemagic)

1. Optional release signing: create `android/key.properties` with `storeFile`, `storePassword`, `keyAlias`, `keyPassword`. If omitted, Gradle automatically falls back to debug signing so `flutter build apk --release` succeeds immediately on CI (e.g., Codemagic).
2. Build APK:

```bash
flutter build apk --release
```

Output artifact: `build/app/outputs/flutter-apk/app-release.apk`.
