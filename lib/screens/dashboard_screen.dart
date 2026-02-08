import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../data/mock_data.dart';
import '../widgets/dashboard_widgets.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final stats = MockData.getPharmacyStats();
  final currentBadge = MockData.getCurrentBadge();
  final performanceMetrics = MockData.getPerformanceMetrics();
  final recentActivity = MockData.getRecentActivity();
  final reviews = MockData.getReviews();
  final messages = MockData.getMotivationalMessages();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              _buildHeader(),
              Padding(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    WelcomeBanner(messages: messages),
                    SizedBox(height: 16),
                    _buildPendingRequestsAlert(),
                    SizedBox(height: 24),
                    _buildMonthlyStats(),
                    SizedBox(height: 24),
                    _buildBadgeProgression(),
                    SizedBox(height: 24),
                    _buildPerformanceComparison(),
                    SizedBox(height: 24),
                    _buildDiabCareValue(),
                    SizedBox(height: 24),
                    _buildRecentActivity(),
                    SizedBox(height: 24),
                    _buildReviewsPreview(),
                    SizedBox(height: 24),
                    _buildAnnualProjection(),
                    SizedBox(height: 24),
                    _buildMissedOpportunities(),
                    SizedBox(height: 80),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: AppColors.mixedGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: AppColors.shadowMedium,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.white.withOpacity(0.9), Colors.white.withOpacity(0.7)],
              ),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.shadowLight,
                  blurRadius: 10,
                  offset: Offset(0, 4),
                ),
              ],
            ),
            child: Center(
              child: Text('🏥', style: TextStyle(fontSize: 28)),
            ),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pharmacie Centrale',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: -0.3,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.25),
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(
                      color: Colors.white.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(currentBadge.icon, style: TextStyle(fontSize: 16)),
                      SizedBox(width: 6),
                      Text(
                        currentBadge.name,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 0.3,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Stack(
            children: [
              Container(
                margin: EdgeInsets.only(left: 8),
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.25),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: Colors.white.withOpacity(0.3),
                    width: 1,
                  ),
                ),
                child: Icon(
                  Icons.notifications_rounded,
                  color: Colors.white,
                  size: 24,
                ),
              ),
              if (stats.pendingRequests > 0)
                Positioned(
                  right: 0,
                  top: 0,
                  child: Container(
                    padding: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFFFF6B9D), Color(0xFFFFA07A)],
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(color: Colors.white, width: 2),
                    ),
                    constraints: BoxConstraints(minWidth: 20, minHeight: 20),
                    child: Text(
                      stats.pendingRequests > 9 ? '9+' : '${stats.pendingRequests}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w800,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildPendingRequestsAlert() {
    if (stats.pendingRequests == 0) {
      return AlertCard(
        backgroundColor: AppColors.statusSuccessBg,
        icon: '✅',
        title: 'Aucune demande en attente',
        subtitle: 'Vous êtes à jour !',
        showArrow: false,
      );
    }

    return AlertCard(
      backgroundColor: AppColors.statusPendingBg,
      icon: '🔔',
      title: '${stats.pendingRequests} Nouvelles Demandes',
      subtitle: 'Répondez rapidement pour maximiser vos chances',
      onTap: () {
        // Navigate to requests screen
      },
    );
  }

  Widget _buildMonthlyStats() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('💰 Votre Impact ce Mois', style: AppTextStyles.subheader),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: AppColors.mintGreen,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Icon(Icons.trending_up_rounded, color: AppColors.darkGreen, size: 16),
                  SizedBox(width: 4),
                  Text(
                    '+${stats.growthPercentage.toInt()}%',
                    style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: AppColors.darkGreen,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        SizedBox(height: 16),
        // Carte avec graphique en premier (comme l'exemple Dribbble)
        StatCardWithChart(
          title: 'Chiffre d\'Affaires',
          value: '${stats.estimatedRevenue.toInt()} TND',
          subtitle: '+15% cette semaine',
          chartData: [1200, 1400, 1100, 1600, 1450, 1800, 1750], // Données statiques
          primaryColor: Color(0xFFFF9149), // Orange comme l'exemple
          chartColor: Colors.white,
        ),
        SizedBox(height: 14),
        // Grille de 4 cards colorées
        GridView.count(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          mainAxisSpacing: 14,
          crossAxisSpacing: 14,
          childAspectRatio: 1.0,
          children: [
            StatCard(
              icon: '📦',
              number: '${stats.totalRequests}',
              label: 'Demandes Reçues',
              cardColor: AppColors.mintGreen, // Vert menthe
            ),
            StatCard(
              icon: '✅',
              number: '${stats.acceptedRequests}',
              label: 'Demandes Acceptées',
              badge: '${((stats.acceptedRequests / stats.totalRequests) * 100).toInt()}%',
              cardColor: AppColors.secondaryBlue, // Bleu clair
            ),
            StatCard(
              icon: '👥',
              number: '${stats.newClients}',
              label: 'Nouveaux Clients',
              cardColor: AppColors.mintGreen, // Vert menthe
            ),
            StatCard(
              icon: '⚠️',
              number: '${stats.pendingRequests}',
              label: 'En Attente',
              cardColor: Color(0xFFFFE4C9), // Orange pâle pour les alertes
              numberColor: Color(0xFFFF9149),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildBadgeProgression() {
    final nextBadge = MockData.getAllBadges().firstWhere((b) => !b.isUnlocked);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🎖️ Votre Niveau Actuel', style: AppTextStyles.subheader),
        SizedBox(height: 16),
        BadgeDisplay(
          icon: currentBadge.icon,
          name: currentBadge.name,
          currentPoints: currentBadge.currentPoints,
          maxPoints: currentBadge.pointsRequired,
        ),
        SizedBox(height: 12),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Plus que ${currentBadge.pointsRemaining} points pour ${nextBadge.icon} ${nextBadge.name}',
                style: AppTextStyles.body.copyWith(color: AppColors.primaryGreen),
              ),
              SizedBox(height: 16),
              _buildExpandableSection(
                'Avantages actuels débloqués',
                currentBadge.advantages,
                true,
              ),
              SizedBox(height: 12),
              _buildExpandableSection(
                '🔒 Prochain niveau - Avantages',
                nextBadge.advantages,
                false,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildExpandableSection(String title, List<String> items, bool unlocked) {
    return ExpansionTile(
      title: Text(title, style: AppTextStyles.label),
      tilePadding: EdgeInsets.zero,
      childrenPadding: EdgeInsets.only(left: 16, bottom: 8),
      children: items.map((item) => Padding(
        padding: EdgeInsets.symmetric(vertical: 4),
        child: Row(
          children: [
            Icon(
              unlocked ? Icons.check_circle : Icons.lock,
              size: 16,
              color: unlocked ? AppColors.successGreen : AppColors.textMuted,
            ),
            SizedBox(width: 8),
            Expanded(
              child: Text(
                item,
                style: AppTextStyles.bodySecondary.copyWith(
                  color: unlocked ? AppColors.textPrimary : AppColors.textMuted,
                ),
              ),
            ),
          ],
        ),
      )).toList(),
    );
  }

  Widget _buildPerformanceComparison() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '🏆 Vous vs Autres Pharmacies de la Zone',
          style: AppTextStyles.subheader,
        ),
        SizedBox(height: 16),
        ...performanceMetrics.map((metric) => Padding(
          padding: EdgeInsets.only(bottom: 12),
          child: PerformanceCard(
            label: metric.label,
            value: metric.yourValue,
            stars: metric.stars,
            benchmark: metric.benchmark,
            badge: metric.badge,
          ),
        )),
      ],
    );
  }

  Widget _buildDiabCareValue() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryGreen.withOpacity(0.1), AppColors.secondaryGreen.withOpacity(0.1)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.primaryGreen.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('💎 Ce que DiabCare Vous Offre Gratuitement', style: AppTextStyles.subheader),
          SizedBox(height: 16),
          _buildValueRow('📱 Publicité ciblée locale', '~300 TND/mois'),
          _buildValueRow('🗺️ Référencement géographique', '~200 TND/mois'),
          _buildValueRow('📊 Analytics et insights', '~150 TND/mois'),
          Divider(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Valeur totale:', style: AppTextStyles.label),
              Text(
                '~650 TND/mois',
                style: AppTextStyles.label.copyWith(
                  color: AppColors.darkGreen,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 12),
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: AppColors.successGreen,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              '🎁 Vous payez: 0 TND',
              style: AppTextStyles.subheader.copyWith(color: Colors.white),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: 8),
          Text(
            '✨ Économie annuelle estimée: 7,800 TND',
            style: AppTextStyles.bodySecondary.copyWith(color: AppColors.primaryGreen),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildValueRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.body),
          Text(
            value,
            style: AppTextStyles.body.copyWith(
              color: AppColors.darkGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildRecentActivity() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('🔥 Activité Récente', style: AppTextStyles.subheader),
        SizedBox(height: 16),
        Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: AppColors.cardBackground,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.border),
          ),
          child: Column(
            children: [
              ...recentActivity.map((event) => ActivityEventCard(
                icon: event.icon,
                description: event.description,
                timestamp: event.timestamp,
                value: event.value,
              )),
              SizedBox(height: 8),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Voir tout l\'historique →',
                  style: AppTextStyles.label.copyWith(color: AppColors.primaryGreen),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildReviewsPreview() {
    final avgRating = reviews.fold(0.0, (sum, r) => sum + r.rating) / reviews.length;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('⭐ Ce Que Disent Vos Clients', style: AppTextStyles.subheader),
        SizedBox(height: 16),
        Row(
          children: [
            Text(
              '${avgRating.toStringAsFixed(1)}/5',
              style: AppTextStyles.statNumber.copyWith(fontSize: 36),
            ),
            SizedBox(width: 8),
            Text('⭐', style: TextStyle(fontSize: 36)),
            SizedBox(width: 12),
            Text(
              '(${reviews.length} avis)',
              style: AppTextStyles.bodyMuted,
            ),
          ],
        ),
        SizedBox(height: 16),
        ...reviews.take(2).map((review) {
          final now = DateTime.now();
          final diff = now.difference(review.timestamp);
          String timeAgo;
          if (diff.inDays > 0) {
            timeAgo = 'Il y a ${diff.inDays} jour${diff.inDays > 1 ? 's' : ''}';
          } else if (diff.inHours > 0) {
            timeAgo = 'Il y a ${diff.inHours}h';
          } else {
            timeAgo = 'Il y a ${diff.inMinutes}min';
          }

          return ReviewCard(
            patientName: review.patientName,
            rating: review.rating,
            comment: review.comment,
            timestamp: timeAgo,
          );
        }),
        SizedBox(height: 8),
        Center(
          child: TextButton(
            onPressed: () {},
            child: Text(
              'Voir tous les avis →',
              style: AppTextStyles.label.copyWith(color: AppColors.primaryGreen),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildAnnualProjection() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 8,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('🎯 Votre Projection Annuelle', style: AppTextStyles.subheader),
          SizedBox(height: 8),
          Text(
            'Basé sur votre performance actuelle:',
            style: AppTextStyles.bodyMuted,
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: _buildProjectionColumn(
                  'Trajectoire Actuelle',
                  ['👥 ~180 nouveaux clients/an', '💰 ~21,600 TND CA/an', '📈 Croissance: +15%'],
                  false,
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: _buildProjectionColumn(
                  'Avec Boost Premium',
                  ['👥 ~320 nouveaux clients/an', '💰 ~38,400 TND CA/an', '🚀 Croissance: +45%'],
                  true,
                ),
              ),
            ],
          ),
          SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            height: 48,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.primaryGreen,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text('Découvrir Boost Premium →', style: AppTextStyles.button),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProjectionColumn(String title, List<String> items, bool highlighted) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: highlighted ? AppColors.primaryGreen.withOpacity(0.05) : Colors.transparent,
        borderRadius: BorderRadius.circular(8),
        border: Border.all(
          color: highlighted ? AppColors.primaryGreen : AppColors.border,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppTextStyles.label.copyWith(
              color: highlighted ? AppColors.primaryGreen : AppColors.textPrimary,
            ),
          ),
          SizedBox(height: 12),
          ...items.map((item) => Padding(
            padding: EdgeInsets.symmetric(vertical: 4),
            child: Text(item, style: AppTextStyles.bodySecondary),
          )),
        ],
      ),
    );
  }

  Widget _buildMissedOpportunities() {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.warningOrange.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.warningOrange.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text('⚠️', style: TextStyle(fontSize: 24)),
              SizedBox(width: 8),
              Text('Opportunités Manquées ce Mois', style: AppTextStyles.subheader),
            ],
          ),
          SizedBox(height: 12),
          Text('😔 6 demandes sans réponse', style: AppTextStyles.body),
          SizedBox(height: 8),
          Text(
            'CA potentiel perdu: ~600 TND',
            style: AppTextStyles.label.copyWith(
              color: AppColors.errorRed,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Text('💡', style: TextStyle(fontSize: 20)),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    'Conseil: Activez les notifications push pour ne manquer aucune demande !',
                    style: AppTextStyles.bodySecondary,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            height: 44,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warningOrange,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                elevation: 0,
              ),
              child: Text('Activer Notifications 🔔', style: AppTextStyles.button),
            ),
          ),
        ],
      ),
    );
  }
}

