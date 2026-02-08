import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';
import '../models/pharmacy_models.dart';
import '../data/mock_data.dart';
import '../widgets/request_widgets.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({Key? key}) : super(key: key);

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
  RequestStatus? selectedFilter;
  bool showUrgentOnly = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(),
            _buildFilterTabs(),
            _buildQuickFilters(),
            Expanded(
              child: _buildRequestsList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.all(20),
      color: Colors.white,
      child: Row(
        children: [
          Container(
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.mintGreen,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(Icons.inventory_2_rounded, color: AppColors.darkGreen, size: 24),
          ),
          SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Demandes',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: AppColors.textPrimary,
                  ),
                ),
                Text(
                  '${_getFilterCount(RequestStatus.pending)} en attente',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondary,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.secondaryBackground,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(Icons.filter_list_rounded, color: AppColors.textSecondary, size: 20),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterTabs() {
    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            _buildFilterChip('Toutes', null, _getFilterCount(null)),
            SizedBox(width: 8),
            _buildFilterChip('En Attente', RequestStatus.pending, _getFilterCount(RequestStatus.pending)),
            SizedBox(width: 8),
            _buildFilterChip('Acceptées', RequestStatus.accepted, _getFilterCount(RequestStatus.accepted)),
            SizedBox(width: 8),
            _buildFilterChip('Refusées', RequestStatus.declined, _getFilterCount(RequestStatus.declined)),
            SizedBox(width: 8),
            _buildFilterChip('Expirées', RequestStatus.expired, _getFilterCount(RequestStatus.expired)),
          ],
        ),
      ),
    );
  }

  Widget _buildFilterChip(String label, RequestStatus? status, int count, {Color? chipColor}) {
    final isSelected = selectedFilter == status;

    return GestureDetector(
      onTap: () => setState(() => selectedFilter = status),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen : AppColors.secondaryBackground,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              label,
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
                color: isSelected ? Colors.white : AppColors.textSecondary,
              ),
            ),
            if (count > 0) ...[
              SizedBox(width: 6),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                decoration: BoxDecoration(
                  color: isSelected ? Colors.white.withOpacity(0.3) : AppColors.primaryGreen,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  '$count',
                  style: TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  Widget _buildQuickFilters() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      color: Colors.white,
      child: Row(
        children: [
          _buildQuickFilterChip('⚡ Urgent', showUrgentOnly, () {
            setState(() => showUrgentOnly = !showUrgentOnly);
          }),
          SizedBox(width: 8),
          _buildQuickFilterChip('Aujourd\'hui', false, () {}),
          SizedBox(width: 8),
          _buildQuickFilterChip('Cette semaine', false, () {}),
        ],
      ),
    );
  }

  Widget _buildQuickFilterChip(String label, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.mintGreen : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            color: isSelected ? AppColors.darkGreen : AppColors.textSecondary,
          ),
        ),
      ),
    );
  }

  Widget _buildRequestsList() {
    final requests = _getFilteredRequests();

    if (requests.isEmpty) {
      return _buildEmptyState();
    }

    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: requests.length,
      itemBuilder: (context, index) {
        final request = requests[index];
        return RequestCard(
          request: request,
          onAccept: request.status == RequestStatus.pending
              ? () => _showAcceptDialog(request)
              : null,
          onDecline: request.status == RequestStatus.pending
              ? () => _showDeclineDialog(request)
              : null,
          onIgnore: request.status == RequestStatus.pending
              ? () => _showIgnoreDialog(request)
              : null,
        );
      },
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Padding(
        padding: EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(24),
              decoration: BoxDecoration(
                color: AppColors.mintGreen,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.mintGreen.withOpacity(0.5),
                    blurRadius: 20,
                    offset: Offset(0, 8),
                  ),
                ],
              ),
              child: Text('📭', style: TextStyle(fontSize: 48)),
            ),
            SizedBox(height: 24),
            Text(
              'Aucune demande',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
                color: AppColors.darkGreen,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              'Les nouvelles demandes apparaîtront ici',
              style: TextStyle(
                fontSize: 14,
                color: AppColors.textSecondary,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  List<MedicationRequest> _getFilteredRequests() {
    List<MedicationRequest> requests;

    if (selectedFilter == null) {
      requests = MockData.getAllRequests();
    } else {
      switch (selectedFilter!) {
        case RequestStatus.pending:
          requests = MockData.getPendingRequests();
          break;
        case RequestStatus.accepted:
          requests = MockData.getAcceptedRequests();
          break;
        case RequestStatus.declined:
          requests = MockData.getDeclinedRequests();
          break;
        case RequestStatus.expired:
          requests = MockData.getExpiredRequests();
          break;
      }
    }

    if (showUrgentOnly) {
      requests = requests.where((r) => r.isUrgent).toList();
    }

    return requests;
  }

  int _getFilterCount(RequestStatus? status) {
    if (status == null) return MockData.getAllRequests().length;

    switch (status) {
      case RequestStatus.pending:
        return MockData.getPendingRequests().length;
      case RequestStatus.accepted:
        return MockData.getAcceptedRequests().length;
      case RequestStatus.declined:
        return MockData.getDeclinedRequests().length;
      case RequestStatus.expired:
        return MockData.getExpiredRequests().length;
    }
  }

  void _showFilterDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Filtres avancés'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Fonctionnalité de filtrage avancé à venir...'),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Fermer'),
          ),
        ],
      ),
    );
  }

  void _showAcceptDialog(MedicationRequest request) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AcceptRequestForm(request: request),
    );
  }

  void _showDeclineDialog(MedicationRequest request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Refuser la demande'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Êtes-vous sûr de refuser cette demande ?'),
            SizedBox(height: 16),
            TextField(
              decoration: InputDecoration(
                labelText: 'Raison (optionnel)',
                hintText: 'Ex: Stock épuisé',
                border: OutlineInputBorder(),
              ),
              maxLines: 2,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessFeedback('Demande refusée');
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.errorRed,
            ),
            child: Text('Confirmer le refus'),
          ),
        ],
      ),
    );
  }

  void _showIgnoreDialog(MedicationRequest request) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Ignorer la demande'),
        content: Text('Cette demande sera marquée comme ignorée et vous ne recevrez plus d\'alertes.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text('Annuler'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessFeedback('Demande ignorée');
            },
            child: Text('Ignorer'),
          ),
        ],
      ),
    );
  }

  void _showSuccessFeedback(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: AppColors.successGreen,
        duration: Duration(seconds: 2),
      ),
    );
  }
}

class _AcceptRequestForm extends StatefulWidget {
  final MedicationRequest request;

  const _AcceptRequestForm({required this.request});

  @override
  State<_AcceptRequestForm> createState() => _AcceptRequestFormState();
}

class _AcceptRequestFormState extends State<_AcceptRequestForm> {
  final _priceController = TextEditingController();
  final _messageController = TextEditingController();
  int _selectedPreparationTime = 0;
  String _characterCount = '0/200';

  @override
  void initState() {
    super.initState();
    _messageController.addListener(() {
      setState(() {
        _characterCount = '${_messageController.text.length}/200';
      });
    });
  }

  @override
  void dispose() {
    _priceController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cardBackground,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.only(
        bottom: MediaQuery.of(context).viewInsets.bottom,
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text('✅ Confirmer la Disponibilité', style: AppTextStyles.header.copyWith(color: AppColors.successGreen)),
                  Spacer(),
                  IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () => Navigator.pop(context),
                  ),
                ],
              ),
              SizedBox(height: 16),
              _buildRequestSummary(),
              SizedBox(height: 24),
              _buildPriceField(),
              SizedBox(height: 20),
              _buildPreparationTimeField(),
              SizedBox(height: 20),
              _buildMessageField(),
              SizedBox(height: 20),
              _buildPickupDeadline(),
              SizedBox(height: 24),
              _buildActions(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRequestSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.background,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Résumé de la demande', style: AppTextStyles.label),
          SizedBox(height: 8),
          Text(widget.request.medicationName, style: AppTextStyles.subheader),
          SizedBox(height: 4),
          Text('Quantité: ${widget.request.quantity}', style: AppTextStyles.bodySecondary),
          Text('Patient: #${widget.request.patientId}', style: AppTextStyles.bodySecondary),
        ],
      ),
    );
  }

  Widget _buildPriceField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('💰 ', style: TextStyle(fontSize: 20)),
            Text('Prix Indicatif (optionnel)', style: AppTextStyles.label),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          controller: _priceController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: 'Ex: 85',
            suffixText: 'TND',
            helperText: 'Aidez le patient à se préparer',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPreparationTimeField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('⏱️ ', style: TextStyle(fontSize: 20)),
            Text('Délai de Préparation *', style: AppTextStyles.label),
          ],
        ),
        SizedBox(height: 12),
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [
            _buildTimeChip('⚡ Immédiat', 0),
            _buildTimeChip('🕐 30 minutes', 30),
            _buildTimeChip('🕑 1 heure', 60),
            _buildTimeChip('🕒 2 heures', 120),
          ],
        ),
      ],
    );
  }

  Widget _buildTimeChip(String label, int minutes) {
    final isSelected = _selectedPreparationTime == minutes;

    return GestureDetector(
      onTap: () => setState(() => _selectedPreparationTime = minutes),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primaryGreen : AppColors.background,
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isSelected ? AppColors.primaryGreen : AppColors.border,
          ),
        ),
        child: Text(
          label,
          style: AppTextStyles.body.copyWith(
            color: isSelected ? Colors.white : AppColors.textPrimary,
          ),
        ),
      ),
    );
  }

  Widget _buildMessageField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text('💬 ', style: TextStyle(fontSize: 20)),
            Text('Message au Patient (optionnel)', style: AppTextStyles.label),
          ],
        ),
        SizedBox(height: 8),
        TextField(
          controller: _messageController,
          maxLength: 200,
          maxLines: 3,
          decoration: InputDecoration(
            hintText: 'Ex: Demandez le pharmacien de garde, nous avons préparé votre commande',
            counterText: _characterCount,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(color: AppColors.primaryGreen, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPickupDeadline() {
    final deadline = DateTime.now().add(Duration(minutes: _selectedPreparationTime + 120));
    final hour = deadline.hour.toString().padLeft(2, '0');
    final minute = deadline.minute.toString().padLeft(2, '0');

    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.statusSuccessBg,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('⏰ Heure Limite de Retrait', style: AppTextStyles.label),
          SizedBox(height: 8),
          Text(
            'Aujourd\'hui à $hour:$minute',
            style: AppTextStyles.subheader.copyWith(color: AppColors.darkGreen),
          ),
          SizedBox(height: 4),
          Text(
            'Le patient doit retirer avant cette heure',
            style: AppTextStyles.bodyMuted,
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
          height: 52,
          child: ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              _showSuccessAnimation();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.successGreen,
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              elevation: 0,
            ),
            child: Text('Confirmer la Disponibilité', style: AppTextStyles.button.copyWith(fontSize: 16)),
          ),
        ),
        SizedBox(height: 12),
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Annuler', style: AppTextStyles.label.copyWith(color: AppColors.textSecondary)),
        ),
      ],
    );
  }

  void _showSuccessAnimation() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => Dialog(
        backgroundColor: Colors.transparent,
        child: Container(
          padding: EdgeInsets.all(32),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  color: AppColors.successGreen,
                  shape: BoxShape.circle,
                ),
                child: Icon(Icons.check, size: 48, color: Colors.white),
              ),
              SizedBox(height: 16),
              Text(
                '✅ Réponse envoyée au patient !',
                style: AppTextStyles.subheader,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 8),
              Text(
                '+10 points 🎉',
                style: AppTextStyles.label.copyWith(color: AppColors.successGreen),
              ),
            ],
          ),
        ),
      ),
    );

    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pop();
    });
  }
}

