import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../models/pharmacy_models.dart';

class RequestCard extends StatelessWidget {
  final MedicationRequest request;
  final VoidCallback? onAccept;
  final VoidCallback? onDecline;
  final VoidCallback? onIgnore;

  const RequestCard({
    Key? key,
    required this.request,
    this.onAccept,
    this.onDecline,
    this.onIgnore,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(),
          Padding(
            padding: EdgeInsets.all(18),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildBody(),
                if (request.patientNote != null) ...[
                  SizedBox(height: 14),
                  _buildPatientNote(),
                ],
                if (request.status == RequestStatus.pending) ...[
                  SizedBox(height: 16),
                  _buildActions(),
                ],
                if (request.status == RequestStatus.accepted) ...[
                  SizedBox(height: 14),
                  _buildAcceptedInfo(),
                ],
                if (request.status == RequestStatus.declined) ...[
                  SizedBox(height: 14),
                  _buildDeclinedInfo(),
                ],
                if (request.status == RequestStatus.expired) ...[
                  SizedBox(height: 14),
                  _buildExpiredInfo(),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Color _getCardBgColor() {
    return Colors.white;
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Row(
        children: [
          _buildStatusBadge(),
          if (request.isUrgent) ...[
            SizedBox(width: 8),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: BoxDecoration(
                color: AppColors.darkGreen,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '⚡ URGENT',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                ),
              ),
            ),
          ],
          Spacer(),
          Text(
            _getTimeAgo(),
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w500,
              color: AppColors.textMuted,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStatusBadge() {
    String text;
    IconData icon;
    Color bgColor;
    Color textColor;

    switch (request.status) {
      case RequestStatus.pending:
        text = 'En Attente';
        icon = Icons.access_time_rounded;
        bgColor = AppColors.mintGreen;
        textColor = AppColors.darkGreen;
        break;
      case RequestStatus.accepted:
        text = 'Accepté';
        icon = Icons.check_circle_rounded;
        bgColor = AppColors.primaryGreen;
        textColor = Colors.white;
        break;
      case RequestStatus.declined:
        text = 'Refusé';
        icon = Icons.cancel_rounded;
        bgColor = AppColors.textMuted;
        textColor = Colors.white;
        break;
      case RequestStatus.expired:
        text = 'Expiré';
        icon = Icons.schedule_rounded;
        bgColor = AppColors.secondaryBlue;
        textColor = AppColors.textPrimary;
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 14, color: textColor),
          SizedBox(width: 5),
          Text(
            text,
            style: TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
              color: textColor,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildBody() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: AppColors.secondaryBlue,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(
                Icons.person_rounded,
                size: 18,
                color: AppColors.darkGreen,
              ),
            ),
            SizedBox(width: 10),
            Text(
              'Patient #${request.patientId}',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
        SizedBox(height: 12),
        Text(
          request.medicationName,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Icon(Icons.medication_rounded, size: 16, color: AppColors.primaryGreen),
            SizedBox(width: 6),
            Text(
              'Qté: ${request.quantity}',
              style: TextStyle(
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
            SizedBox(width: 16),
            Icon(Icons.schedule_rounded, size: 16, color: AppColors.primaryBlue),
            SizedBox(width: 6),
            Expanded(
              child: Text(
                request.dosage,
                style: TextStyle(
                  fontSize: 13,
                  color: AppColors.textSecondary,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildPatientNote() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.secondaryBackground,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(Icons.chat_bubble_outline_rounded, size: 16, color: AppColors.primaryBlue),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              '"${request.patientNote}"',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontSize: 13,
                color: AppColors.textSecondary,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActions() {
    return Column(
      children: [
        SizedBox(
          width: double.infinity,
          height: 48,
          child: ElevatedButton(
            onPressed: onAccept,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primaryGreen,
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.check_rounded, size: 20),
                SizedBox(width: 8),
                Text(
                  'Disponible',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Expanded(
              child: SizedBox(
                height: 44,
                child: OutlinedButton(
                  onPressed: onDecline,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Non disponible',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: SizedBox(
                height: 44,
                child: OutlinedButton(
                  onPressed: onIgnore,
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textMuted,
                    side: BorderSide(color: AppColors.border),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Ignorer',
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildAcceptedInfo() {
    return Container(
      padding: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.mintGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (request.price != null)
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.payments_rounded,
                    size: 18,
                    color: AppColors.darkGreen,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'Prix communiqué: ${request.price!.toStringAsFixed(2)} TND',
                  style: AppTextStyles.label.copyWith(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          if (request.pickupDeadline != null) ...[
            SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.schedule_rounded,
                    size: 18,
                    color: AppColors.accentBlue,
                  ),
                ),
                SizedBox(width: 10),
                Text(
                  'À retirer avant: ${_formatDeadline()}',
                  style: AppTextStyles.bodySecondary.copyWith(
                    color: AppColors.darkGreen,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ],
          SizedBox(height: 12),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              gradient: request.isPickedUp
                  ? AppColors.mixedGradient
                  : AppColors.blueGradient,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  request.isPickedUp
                      ? Icons.check_circle_rounded
                      : Icons.pending_actions_rounded,
                  size: 18,
                  color: Colors.white,
                ),
                SizedBox(width: 8),
                Text(
                  request.isPickedUp
                      ? '✓ Récupéré'
                      : 'En attente de retrait patient',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildDeclinedInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.statusErrorBg, AppColors.cardBackground],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.errorRed.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (request.declineReason != null) ...[
            Row(
              children: [
                Container(
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.cardBackground,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    Icons.info_rounded,
                    size: 18,
                    color: AppColors.errorRed,
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    'Raison: ${request.declineReason}',
                    style: AppTextStyles.bodySecondary.copyWith(
                      color: AppColors.errorRed,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
          ],
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.errorRed.withOpacity(0.2),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(Icons.block_rounded, size: 16, color: AppColors.errorRed),
                SizedBox(width: 8),
                Text(
                  'Demande clôturée',
                  style: TextStyle(
                    color: AppColors.errorRed,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildExpiredInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [AppColors.statusPendingBg, AppColors.cardBackground],
        ),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.warningOrange.withOpacity(0.3),
          width: 1.5,
        ),
      ),
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.cardBackground,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(
              Icons.hourglass_empty_rounded,
              size: 22,
              color: AppColors.warningOrange,
            ),
          ),
          SizedBox(width: 12),
          Expanded(
            child: Text(
              'Aucune réponse donnée dans les 2h',
              style: AppTextStyles.bodySecondary.copyWith(
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFF6B9D), Color(0xFFFFA07A)],
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              '⚠️ -2 pts',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Color _getStatusBgColor() {
    switch (request.status) {
      case RequestStatus.pending:
        return AppColors.statusPendingBg;
      case RequestStatus.accepted:
        return AppColors.statusSuccessBg;
      case RequestStatus.declined:
        return AppColors.statusErrorBg;
      case RequestStatus.expired:
        return AppColors.secondaryBackground;
    }
  }

  Color _getStatusColor() {
    switch (request.status) {
      case RequestStatus.pending:
        return AppColors.warningOrange;
      case RequestStatus.accepted:
        return AppColors.successGreen;
      case RequestStatus.declined:
        return AppColors.errorRed;
      case RequestStatus.expired:
        return AppColors.textMuted;
    }
  }

  String _getTimeAgo() {
    final now = DateTime.now();
    final difference = now.difference(request.timestamp);

    if (difference.inMinutes < 60) {
      return 'Il y a ${difference.inMinutes} min';
    } else if (difference.inHours < 24) {
      return 'Il y a ${difference.inHours}h';
    } else {
      return 'Il y a ${difference.inDays}j';
    }
  }

  String _formatDeadline() {
    if (request.pickupDeadline == null) return '';

    final now = DateTime.now();
    final deadline = request.pickupDeadline!;
    final hour = deadline.hour.toString().padLeft(2, '0');
    final minute = deadline.minute.toString().padLeft(2, '0');

    if (deadline.day == now.day) {
      return 'Aujourd\'hui à $hour:$minute';
    } else if (deadline.day == now.day + 1) {
      return 'Demain à $hour:$minute';
    } else {
      return '${deadline.day}/${deadline.month} à $hour:$minute';
    }
  }
}

