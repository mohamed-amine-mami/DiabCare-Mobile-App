import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../data/mock_data.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentBadge = MockData.getCurrentBadge();
    final allBadges = MockData.getAllBadges();
    final reviews = MockData.getReviews();

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildProfileHeader(),
            SizedBox(height: 16),
            _buildBadgeSection(currentBadge, allBadges),
            SizedBox(height: 16),
            _buildStatistics(),
            SizedBox(height: 16),
            _buildReviewsSection(reviews),
            SizedBox(height: 16),
            _buildSettingsSection(context),
            SizedBox(height: 80),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.primaryGreen, AppColors.secondaryGreen],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Mon Profil',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Icon(Icons.settings_rounded, color: Colors.white, size: 22),
                  ),
                ],
              ),
              SizedBox(height: 24),
              Container(
                width: 90,
                height: 90,
                decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 15,
                      offset: Offset(0, 5),
                    ),
                  ],
                ),
                child: Center(
                  child: Text('🏥', style: TextStyle(fontSize: 45)),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Pharmacie Centrale',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 8),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.location_on_rounded, color: Colors.white, size: 16),
                    SizedBox(width: 6),
                    Text(
                      '12 Rue de la République, Tunis',
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.white.withOpacity(0.9),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 8),
              Text(
                '📞 +216 71 123 456',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.white.withOpacity(0.9),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBadgeSection(currentBadge, List allBadges) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              gradient: AppColors.greenGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              children: [
                Text(
                  currentBadge.icon,
                  style: TextStyle(fontSize: 60),
                ),
                SizedBox(height: 12),
                Text(
                  currentBadge.name,
                  style: AppTextStyles.subheader.copyWith(color: Colors.white),
                ),
                SizedBox(height: 8),
                Text(
                  'Vous êtes dans le top 25% des pharmacies actives',
                  style: AppTextStyles.bodySecondary.copyWith(color: Colors.white70),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 16),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Text(
                    '${currentBadge.currentPoints} points',
                    style: AppTextStyles.subheader.copyWith(color: Colors.white),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Text('🏅 Vos Badges Débloqués', style: AppTextStyles.subheader),
          SizedBox(height: 12),
          GridView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: allBadges.length,
            itemBuilder: (context, index) {
              final badge = allBadges[index];
              return _buildBadgeItem(badge);
            },
          ),
        ],
      ),
    );
  }

  Widget _buildBadgeItem(badge) {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: badge.isUnlocked ? AppColors.primaryGreen : AppColors.border,
        ),
        boxShadow: badge.isUnlocked
            ? [
                BoxShadow(
                  color: AppColors.primaryGreen.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 2),
                )
              ]
            : [],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Text(
                badge.icon,
                style: TextStyle(
                  fontSize: 32,
                  color: badge.isUnlocked ? null : Colors.grey.withOpacity(0.3),
                ),
              ),
              if (!badge.isUnlocked)
                Icon(Icons.lock, color: AppColors.textMuted, size: 20),
            ],
          ),
          SizedBox(height: 8),
          Text(
            badge.name.split(' ')[0],
            style: AppTextStyles.smallLabel.copyWith(
              color: badge.isUnlocked ? AppColors.textPrimary : AppColors.textMuted,
            ),
            textAlign: TextAlign.center,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          SizedBox(height: 4),
          Text(
            badge.isUnlocked ? 'Unlocked ✓' : '🔒 ${badge.pointsRemaining} pts',
            style: TextStyle(
              fontSize: 10,
              color: badge.isUnlocked ? AppColors.successGreen : AppColors.textMuted,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildStatistics() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
            Text('📊 Vos Statistiques Globales', style: AppTextStyles.subheader),
            SizedBox(height: 16),
            _buildStatRow('Total demandes traitées', '156'),
            _buildStatRow('Taux d\'acceptation moyen', '72%'),
            _buildStatRow('Temps de réponse moyen', '22 min'),
            _buildStatRow('Clients servis', '98'),
            _buildStatRow('CA total généré', '12,400 TND'),
            _buildStatRow('Note moyenne', '4.7/5 ⭐'),
            _buildStatRow('Membre depuis', 'Janvier 2026'),
          ],
        ),
      ),
    );
  }

  Widget _buildStatRow(String label, String value) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(label, style: AppTextStyles.body),
          Text(
            value,
            style: AppTextStyles.label.copyWith(color: AppColors.darkGreen),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewsSection(reviews) {
    final avgRating = reviews.fold(0.0, (sum, r) => sum + r.rating) / reviews.length;

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
            Text('⭐ Tous Vos Avis Clients', style: AppTextStyles.subheader),
            SizedBox(height: 16),
            Row(
              children: [
                Text(
                  '${avgRating.toStringAsFixed(1)}/5',
                  style: AppTextStyles.statNumber.copyWith(fontSize: 32),
                ),
                SizedBox(width: 8),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: List.generate(
                        5,
                        (index) => Icon(
                          Icons.star,
                          size: 20,
                          color: index < avgRating ? AppColors.accentGold : AppColors.border,
                        ),
                      ),
                    ),
                    SizedBox(height: 4),
                    Text('${reviews.length} avis', style: AppTextStyles.bodyMuted),
                  ],
                ),
              ],
            ),
            SizedBox(height: 16),
            Row(
              children: [
                _buildFilterButton('Tous'),
                SizedBox(width: 8),
                _buildFilterButton('5⭐'),
                SizedBox(width: 8),
                _buildFilterButton('4⭐'),
                SizedBox(width: 8),
                _buildFilterButton('3⭐'),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterButton(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: AppColors.border),
      ),
      child: Text(label, style: AppTextStyles.smallLabel),
    );
  }

  Widget _buildSettingsSection(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16),
      child: Container(
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
            Padding(
              padding: EdgeInsets.all(20),
              child: Text('⚙️ Paramètres', style: AppTextStyles.subheader),
            ),
            _buildSettingItem(context, '🔔', 'Notifications', () {}),
            _buildSettingItem(context, '📍', 'Localisation', () {}),
            _buildSettingItem(context, '⏰', 'Horaires d\'ouverture', () {}),
            _buildSettingItem(context, '💳', 'Mode Premium / Boost', () {}),
            _buildSettingItem(context, '🔐', 'Sécurité', () {}),
            _buildSettingItem(context, 'ℹ️', 'À propos', () {}),
            Divider(height: 1),
            _buildSettingItem(
              context,
              '🚪',
              'Déconnexion',
              () => _showLogoutDialog(context),
              isDestructive: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingItem(
    BuildContext context,
    String icon,
    String label,
    VoidCallback onTap, {
    bool isDestructive = false,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Row(
          children: [
            Text(icon, style: TextStyle(fontSize: 20)),
            SizedBox(width: 12),
            Expanded(
              child: Text(
                label,
                style: AppTextStyles.body.copyWith(
                  color: isDestructive ? AppColors.errorRed : AppColors.textPrimary,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              color: AppColors.textMuted,
              size: 20,
            ),
          ],
        ),
      ),
    );
  }

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Déconnexion'),
        content: Text('Êtes-vous sûr de vouloir vous déconnecter ?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              // Handle logout
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
            ),
            child: Text('Déconnexion'),
          ),
        ],
      ),
    );
  }
}

