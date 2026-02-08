import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class StatCard extends StatelessWidget {
  final String icon;
  final String number;
  final String label;
  final String? badge;
  final Color? numberColor;
  final Color? cardColor; // Nouvelle couleur de fond

  const StatCard({
    Key? key,
    required this.icon,
    required this.number,
    required this.label,
    this.badge,
    this.numberColor,
    this.cardColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Couleur de fond par défaut ou personnalisée
    final bgColor = cardColor ?? AppColors.mintGreen;

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: bgColor.withOpacity(0.4),
            blurRadius: 12,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.85),
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Text(icon, style: TextStyle(fontSize: 24)),
              ),
              if (badge != null)
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.85),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    badge!,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ),
            ],
          ),
          Spacer(),
          Text(
            number,
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.w800,
              color: numberColor ?? AppColors.darkGreen,
              letterSpacing: -0.5,
              height: 1.0,
            ),
          ),
          SizedBox(height: 6),
          Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w500,
              color: AppColors.textPrimary.withOpacity(0.7),
              height: 1.2,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    );
  }
}

// Nouveau widget pour les cards avec graphique/courbe
class StatCardWithChart extends StatelessWidget {
  final String title;
  final String value;
  final String subtitle;
  final List<double> chartData;
  final Color primaryColor;
  final Color chartColor;

  const StatCardWithChart({
    Key? key,
    required this.title,
    required this.value,
    required this.subtitle,
    required this.chartData,
    required this.primaryColor,
    required this.chartColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [primaryColor, primaryColor.withOpacity(0.8)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(24),
        boxShadow: [
          BoxShadow(
            color: primaryColor.withOpacity(0.4),
            blurRadius: 15,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            value,
            style: TextStyle(
              fontSize: 36,
              fontWeight: FontWeight.w800,
              color: Colors.white,
              letterSpacing: -1,
            ),
          ),
          SizedBox(height: 16),
          // Mini graphique
          SizedBox(
            height: 60,
            child: CustomPaint(
              size: Size(double.infinity, 60),
              painter: ChartPainter(
                data: chartData,
                lineColor: chartColor,
                fillColor: chartColor.withOpacity(0.3),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Painter pour dessiner la courbe
class ChartPainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;
  final Color fillColor;

  ChartPainter({
    required this.data,
    required this.lineColor,
    required this.fillColor,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (data.isEmpty) return;

    final maxValue = data.reduce((a, b) => a > b ? a : b);
    final minValue = data.reduce((a, b) => a < b ? a : b);
    final range = maxValue - minValue;

    final path = Path();
    final fillPath = Path();

    final stepX = size.width / (data.length - 1);

    for (int i = 0; i < data.length; i++) {
      final x = i * stepX;
      final normalizedValue = range == 0 ? 0.5 : (data[i] - minValue) / range;
      final y = size.height - (normalizedValue * size.height * 0.8) - size.height * 0.1;

      if (i == 0) {
        path.moveTo(x, y);
        fillPath.moveTo(x, size.height);
        fillPath.lineTo(x, y);
      } else {
        // Courbe lisse avec bezier
        final prevX = (i - 1) * stepX;
        final prevY = size.height - ((range == 0 ? 0.5 : (data[i - 1] - minValue) / range) * size.height * 0.8) - size.height * 0.1;
        final controlX1 = prevX + stepX / 2;
        final controlX2 = x - stepX / 2;

        path.cubicTo(controlX1, prevY, controlX2, y, x, y);
        fillPath.cubicTo(controlX1, prevY, controlX2, y, x, y);
      }
    }

    fillPath.lineTo(size.width, size.height);
    fillPath.close();

    // Dessiner le remplissage
    final fillPaint = Paint()
      ..color = fillColor
      ..style = PaintingStyle.fill;
    canvas.drawPath(fillPath, fillPaint);

    // Dessiner la ligne
    final linePaint = Paint()
      ..color = lineColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..strokeCap = StrokeCap.round;
    canvas.drawPath(path, linePaint);

    // Point sur la dernière valeur
    final lastX = (data.length - 1) * stepX;
    final lastNormalizedValue = range == 0 ? 0.5 : (data.last - minValue) / range;
    final lastY = size.height - (lastNormalizedValue * size.height * 0.8) - size.height * 0.1;

    canvas.drawCircle(
      Offset(lastX, lastY),
      6,
      Paint()..color = Colors.white,
    );
    canvas.drawCircle(
      Offset(lastX, lastY),
      4,
      Paint()..color = lineColor,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class WelcomeBanner extends StatefulWidget {
  final List<String> messages;

  const WelcomeBanner({Key? key, required this.messages}) : super(key: key);

  @override
  State<WelcomeBanner> createState() => _WelcomeBannerState();
}

class _WelcomeBannerState extends State<WelcomeBanner> {
  int currentIndex = 0;
  bool dismissed = false;

  @override
  Widget build(BuildContext context) {
    if (dismissed || widget.messages.isEmpty) return SizedBox.shrink();

    return Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.mixedGradient,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryGreen.withOpacity(0.25),
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.3),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              _getIcon(),
              style: TextStyle(fontSize: 28),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Text(
              widget.messages[currentIndex],
              style: AppTextStyles.body.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.w500,
                fontSize: 14,
              ),
            ),
          ),
          IconButton(
            icon: Icon(Icons.close_rounded, color: Colors.white, size: 22),
            onPressed: () => setState(() => dismissed = true),
            padding: EdgeInsets.zero,
            constraints: BoxConstraints(),
          ),
        ],
      ),
    );
  }

  String _getIcon() {
    final message = widget.messages[currentIndex];
    if (message.startsWith('🎉')) return '🎉';
    if (message.startsWith('💰')) return '💰';
    if (message.startsWith('🏆')) return '🏆';
    if (message.startsWith('⚠️')) return '⚠️';
    if (message.startsWith('🥇')) return '🥇';
    if (message.startsWith('⭐')) return '⭐';
    return '✨';
  }
}

class AlertCard extends StatelessWidget {
  final Color backgroundColor;
  final String icon;
  final String title;
  final String subtitle;
  final VoidCallback? onTap;
  final bool showArrow;

  const AlertCard({
    Key? key,
    required this.backgroundColor,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
    this.showArrow = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(18),
          border: Border.all(
            color: AppColors.primaryBlue.withOpacity(0.2),
            width: 1.5,
          ),
          boxShadow: [
            BoxShadow(
              color: AppColors.shadowLight,
              blurRadius: 12,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(icon, style: TextStyle(fontSize: 24)),
            ),
            SizedBox(width: 14),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: AppTextStyles.subheader.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: AppTextStyles.bodySecondary.copyWith(fontSize: 13),
                  ),
                ],
              ),
            ),
            if (showArrow)
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.5),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Icon(
                  Icons.arrow_forward_ios_rounded,
                  size: 16,
                  color: AppColors.textSecondary,
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class BadgeDisplay extends StatelessWidget {
  final String icon;
  final String name;
  final int currentPoints;
  final int maxPoints;

  const BadgeDisplay({
    Key? key,
    required this.icon,
    required this.name,
    required this.currentPoints,
    required this.maxPoints,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final progress = currentPoints / maxPoints;

    return Container(
      padding: EdgeInsets.all(24),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cardBackground, AppColors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.2), width: 1.5),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 20,
            offset: Offset(0, 8),
          ),
        ],
      ),
      child: Column(
        children: [
          Container(
            width: 90,
            height: 90,
            decoration: BoxDecoration(
              gradient: AppColors.premiumGradient,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.accentGold.withOpacity(0.3),
                  blurRadius: 15,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Center(
              child: Text(icon, style: TextStyle(fontSize: 44)),
            ),
          ),
          SizedBox(height: 16),
          Text(
            name,
            style: AppTextStyles.badgeName.copyWith(
              color: AppColors.darkGreen,
              fontSize: 18,
              fontWeight: FontWeight.w700,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: AppColors.primaryGreen.withOpacity(0.2),
                  blurRadius: 8,
                  offset: Offset(0, 3),
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: LinearProgressIndicator(
                value: progress,
                backgroundColor: AppColors.border.withOpacity(0.3),
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
                minHeight: 10,
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            '$currentPoints/$maxPoints pts',
            style: AppTextStyles.label.copyWith(
              color: AppColors.darkGreen,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}

class PerformanceCard extends StatelessWidget {
  final String label;
  final String value;
  final int stars;
  final String benchmark;
  final String badge;

  const PerformanceCard({
    Key? key,
    required this.label,
    required this.value,
    required this.stars,
    required this.benchmark,
    required this.badge,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cardBackground, AppColors.mintGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primaryGreen.withOpacity(0.2), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 15,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: AppTextStyles.label.copyWith(
              color: AppColors.textSecondary,
              fontSize: 13,
            ),
          ),
          SizedBox(height: 14),
          Text(
            value,
            style: AppTextStyles.statNumber.copyWith(
              fontSize: 32,
              color: AppColors.darkGreen,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 12),
          Row(
            children: List.generate(
              5,
              (index) => Padding(
                padding: EdgeInsets.only(right: 4),
                child: Icon(
                  index < stars ? Icons.star_rounded : Icons.star_outline_rounded,
                  size: 20,
                  color: index < stars ? AppColors.accentGold : AppColors.border,
                ),
              ),
            ),
          ),
          SizedBox(height: 12),
          Text(
            benchmark,
            style: AppTextStyles.bodyMuted.copyWith(fontSize: 12),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: AppColors.blueGradient,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              badge,
              style: AppTextStyles.smallLabel.copyWith(
                color: AppColors.cardBackground,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActivityEventCard extends StatelessWidget {
  final String icon;
  final String description;
  final String timestamp;
  final String? value;

  const ActivityEventCard({
    Key? key,
    required this.icon,
    required this.description,
    required this.timestamp,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 12),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: AppColors.border.withOpacity(0.5), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 10,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              gradient: AppColors.mixedGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(icon, style: TextStyle(fontSize: 20)),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  description,
                  style: AppTextStyles.body.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  timestamp,
                  style: AppTextStyles.bodySecondary.copyWith(fontSize: 12),
                ),
                if (value != null) ...[
                  SizedBox(height: 6),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: AppColors.blueGradient,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      value!,
                      style: TextStyle(
                        color: AppColors.cardBackground,
                        fontWeight: FontWeight.w600,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String patientName;
  final int rating;
  final String comment;
  final String timestamp;

  const ReviewCard({
    Key? key,
    required this.patientName,
    required this.rating,
    required this.comment,
    required this.timestamp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      padding: EdgeInsets.all(18),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.cardBackground, AppColors.lightBlue],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(18),
        border: Border.all(color: AppColors.primaryBlue.withOpacity(0.15), width: 1),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowLight,
            blurRadius: 12,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                    width: 42,
                    height: 42,
                    decoration: BoxDecoration(
                      gradient: AppColors.mixedGradient,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.primaryGreen.withOpacity(0.3),
                          blurRadius: 8,
                          offset: Offset(0, 3),
                        ),
                      ],
                    ),
                    child: Center(
                      child: Text(
                        patientName[0].toUpperCase(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        patientName,
                        style: AppTextStyles.subheader.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        timestamp,
                        style: AppTextStyles.bodyMuted.copyWith(fontSize: 11),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  gradient: AppColors.premiumGradient,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Icon(Icons.star_rounded, size: 16, color: Colors.white),
                    SizedBox(width: 4),
                    Text(
                      '$rating.0',
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Text(
            comment,
            style: AppTextStyles.body.copyWith(
              color: AppColors.textSecondary,
              height: 1.5,
            ),
          ),
        ],
      ),
    );
  }
}

