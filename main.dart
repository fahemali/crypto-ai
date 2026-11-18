import 'package:flutter/material.dart';

void main() => runApp(const CryptoAiApp());

class CryptoAiApp extends StatelessWidget {
  const CryptoAiApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Crypto AI',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF08111F),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF55D6FF),
          brightness: Brightness.dark,
        ),
        useMaterial3: true,
      ),
      home: const DashboardPage(),
    );
  }
}

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  bool arabic = true;
  double profitTarget = 1.0;
  double lossLimit = 2.0;
  bool simulationRunning = false;

  String tr(String ar, String en) => arabic ? ar : en;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: arabic ? TextDirection.rtl : TextDirection.ltr,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('CRYPTO AI'),
          actions: [
            TextButton(
              onPressed: () => setState(() => arabic = !arabic),
              child: Text(arabic ? 'EN' : 'عربي'),
            ),
          ],
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            _heroCard(),
            const SizedBox(height: 16),
            Text(
              tr('نظرة عامة على السوق', 'Market overview'),
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(child: _coinCard('BTC', 'Bitcoin', '\$—', 'بيانات تجريبية')),
                const SizedBox(width: 10),
                Expanded(child: _coinCard('ETH', 'Ethereum', '\$—', 'بيانات تجريبية')),
              ],
            ),
            const SizedBox(height: 18),
            _sectionCard(
              icon: Icons.auto_awesome,
              title: tr('تحليل الذكاء الاصطناعي', 'AI analysis'),
              child: Text(
                tr(
                  'سيظهر هنا ملخص الاتجاهات والأخبار بعد ربط مصادر البيانات. '
                  'حالياً لا توجد توصية تداول أو توقع مباشر.',
                  'Trend and news summaries will appear here after data sources '
                  'are connected. No trading signal or live forecast is provided yet.',
                ),
              ),
            ),
            const SizedBox(height: 12),
            _sectionCard(
              icon: Icons.newspaper,
              title: tr('الأخبار العالمية', 'Global news'),
              child: Text(
                tr(
                  'قائمة الأخبار ستُضاف لاحقاً عبر مصادر مرخّصة. '
                  'سيُعرض المصدر ووقت النشر ورابط الخبر.',
                  'A licensed news feed will be added later, showing source, '
                  'publication time, and article link.',
                ),
              ),
            ),
            const SizedBox(height: 12),
            _simulationCard(),
            const SizedBox(height: 12),
            _sectionCard(
              icon: Icons.verified_outlined,
              title: tr('اختبار الدقة', 'Model evaluation'),
              child: Text(
                tr(
                  'سنقيس أداء النموذج على بيانات لم يتدرّب عليها، '
                  'ونقارن نتائجه بخط أساس بسيط.',
                  'The model will be evaluated on unseen data and compared '
                  'with a simple baseline.',
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'تنبيه: هذا نموذج تعليمي تجريبي ببيانات غير متصلة بالسوق. '
              'لا ينفّذ صفقات ولا يقدّم ضماناً للربح.',
              style: TextStyle(color: Color(0xFFFFC66D), fontSize: 12),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _heroCard() {
    return Container(
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(22),
        gradient: const LinearGradient(
          colors: [Color(0xFF153B58), Color(0xFF25204A)],
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Icon(Icons.bolt, color: Color(0xFF55D6FF), size: 30),
          const SizedBox(height: 8),
          const Text(
            'SMART MARKET ANALYTICS',
            style: TextStyle(
              letterSpacing: 1.2,
              color: Color(0xFFB7EFFF),
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            tr('تحليل السوق والأخبار في مكان واحد', 'Market and news analysis in one place'),
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            tr('نسخة أولية — وضع المحاكاة فقط', 'Prototype — simulation only'),
            style: const TextStyle(color: Colors.white70),
          ),
        ],
      ),
    );
  }

  Widget _coinCard(String symbol, String name, String price, String note) {
    return Container(
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: const Color(0xFF121F31),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFF263A52)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(symbol, style: const TextStyle(color: Color(0xFF55D6FF), fontWeight: FontWeight.bold)),
          Text(name, style: const TextStyle(color: Colors.white70, fontSize: 12)),
          const SizedBox(height: 12),
          Text(price, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
          Text(note, style: const TextStyle(color: Colors.white54, fontSize: 10)),
        ],
      ),
    );
  }

  Widget _sectionCard({
    required IconData icon,
    required String title,
    required Widget child,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF101D2D),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: const Color(0xFF263A52)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(icon, color: const Color(0xFF9B8CFF)),
              const SizedBox(width: 9),
              Expanded(child: Text(title, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16))),
            ],
          ),
          const SizedBox(height: 10),
          child,
        ],
      ),
    );
  }

  Widget _simulationCard() {
    return _sectionCard(
      icon: Icons.repeat,
      title: tr('إعدادات دورة المحاكاة', 'Simulation cycle settings'),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('${tr('هدف الربح الافتراضي', 'Paper profit target')}: \$${profitTarget.toStringAsFixed(2)}'),
          Slider(
            value: profitTarget,
            min: 0.5,
            max: 10,
            divisions: 19,
            onChanged: (v) => setState(() => profitTarget = v),
          ),
          Text('${tr('حد الخسارة الافتراضي', 'Paper loss limit')}: \$${lossLimit.toStringAsFixed(2)}'),
          Slider(
            value: lossLimit,
            min: 0.5,
            max: 10,
            divisions: 19,
            onChanged: (v) => setState(() => lossLimit = v),
          ),
          const SizedBox(height: 8),
          SizedBox(
            width: double.infinity,
            child: FilledButton.icon(
              onPressed: () => setState(() => simulationRunning = !simulationRunning),
              icon: Icon(simulationRunning ? Icons.pause : Icons.play_arrow),
              label: Text(
                simulationRunning
                    ? tr('إيقاف المحاكاة', 'Pause simulation')
                    : tr('بدء المحاكاة التجريبية', 'Start paper simulation'),
              ),
            ),
          ),
          const SizedBox(height: 6),
          Text(
            simulationRunning
                ? tr('المحاكاة مفعّلة محلياً — لا توجد صفقات حقيقية.', 'Local demo state is on — no real trades.')
                : tr('المحاكاة متوقفة.', 'Simulation is paused.'),
            style: const TextStyle(color: Colors.white60, fontSize: 12),
          ),
        ],
      ),
    );
  }
}
