# Crypto AI — Starter Prototype

This is a first Flutter UI scaffold for an educational crypto-market analysis app.

## Included
- Arabic / English interface toggle
- Dark futuristic dashboard
- Placeholder market cards
- News and AI-analysis sections
- Paper-simulation settings for a configurable hypothetical profit target and loss limit

## Important limitations
- No live market feed is connected.
- No news provider is connected.
- No AI model is connected.
- The simulation switch is only a UI state; it does not run a trading strategy.
- No exchange keys, deposits, real orders, or automated real-money trading are supported.

## Run
1. Install Flutter SDK and Android Studio.
2. Extract this folder.
3. In this folder run:
   - `flutter pub get`
   - `flutter run`

To build an Android debug APK:
- `flutter build apk --debug`

## Next development steps
1. Add a licensed public market-data source with rate-limit handling.
2. Add a news feed with source attribution, timestamps, and deduplication.
3. Build a Python research pipeline for historical backtesting.
4. Evaluate models on time-separated unseen data and compare against baselines.
5. Add notifications only after the data pipeline is reliable.
