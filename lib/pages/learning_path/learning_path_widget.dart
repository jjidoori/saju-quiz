Widget _buildSajuCardBanner(BuildContext context) {
  return StreamBuilder<Map<String, dynamic>>(
    stream: FirebaseFirestore.instance
        .collection('daily_challenge')
        .doc(DateFormat('yyyyMMdd').format(DateTime.now()))
        .snapshots()
        .map((doc) => doc.data() ?? {}),
    builder: (context, snapshot) {
      String ilju = '경신';
      String advice = '오늘 하루도 균형있게 보내세요.';
      
      if (snapshot.hasData && snapshot.data!.isNotEmpty) {
        ilju = snapshot.data!['ilju'] ?? '경신';
        advice = _dailyAdviceByIlju[ilju] ?? '오늘 하루도 균형있게 보내세요.';
      }

      return Center(
        child: InkWell(
          onTap: () => context.pushNamed(SajuCardWidget.routeName),
          child: Container(
            padding: const EdgeInsets.all(18.0),
            constraints: BoxConstraints(maxWidth: 600),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  FlutterFlowTheme.of(context).primary,
                  FlutterFlowTheme.of(context).primary.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.auto_awesome_rounded, color: Colors.white, size: 28.0),
                const SizedBox(height: 12.0),
                Text(
                  '오늘의 일진',
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).bodyLarge.override(
                        font: GoogleFonts.notoSansKr(fontWeight: FontWeight.bold),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                Text(
                  ilju,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).headlineSmall?.override(
                        font: GoogleFonts.notoSansKr(),
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                const SizedBox(height: 12.0),
                Text(
                  advice,
                  textAlign: TextAlign.center,
                  style: FlutterFlowTheme.of(context).labelSmall.override(
                        font: GoogleFonts.notoSansKr(),
                        color: Colors.white.withOpacity(0.9),
                      ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
