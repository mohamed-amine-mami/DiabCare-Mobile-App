# 🚀 Guide de Démarrage Rapide - DiabCare Pharmacy

## Bienvenue !

Cette application est l'interface complète de gestion pour les pharmacies partenaires de DiabCare. Elle permet de gérer les demandes de médicaments pour diabétiques et de suivre les performances.

## 📱 Aperçu Rapide

L'application contient **3 écrans principaux** accessibles via la barre de navigation en bas :

### 🏠 Accueil (Dashboard)
Le tableau de bord principal avec :
- Vue d'ensemble mensuelle (demandes, CA, nouveaux clients)
- Progression du badge et système de points
- Performance vs autres pharmacies
- Activité récente et avis clients
- Projections et opportunités

### 📥 Demandes
Gestion des demandes de médicaments :
- Liste filtrée par statut (En attente, Acceptées, Refusées, Expirées)
- Actions rapides : Accepter, Refuser, Ignorer
- Formulaire d'acceptation avec prix, délai, message
- Notifications pour nouvelles demandes

### 👤 Profil
Profil et paramètres de la pharmacie :
- Informations pharmacie
- Collection de badges
- Statistiques globales
- Tous les avis clients
- Paramètres et configuration

## 🎮 Navigation

### Barre de Navigation Inférieure
```
🏠 Accueil | 📥 Demandes (3) | 👤 Profil
```
- Tap sur une icône pour changer d'écran
- Badge rouge sur "Demandes" indique les nouvelles demandes en attente

### Actions Principales

#### Sur le Dashboard
1. **Voir les demandes en attente** : Tap sur la carte orange "3 Nouvelles Demandes"
2. **Explorer les badges** : Sections extensibles "Avantages actuels" et "Prochain niveau"
3. **Lire les avis** : Scroll vers le bas, tap "Voir tous les avis"

#### Sur l'Écran Demandes
1. **Filtrer par statut** : Tap sur les onglets horizontaux en haut
2. **Voir les urgents** : Tap sur le chip "Urgent"
3. **Accepter une demande** :
   - Tap "✅ Disponible" sur une carte
   - Remplir le formulaire (prix, délai, message)
   - Tap "Confirmer la Disponibilité"
   - Animation de succès avec points gagnés !

4. **Refuser une demande** :
   - Tap "❌ Indisponible"
   - Optionnel : Indiquer la raison
   - Confirmer

#### Sur le Profil
1. **Voir tous les badges** : Scroll pour voir les badges débloqués et verrouillés
2. **Consulter les stats** : Section "Statistiques Globales"
3. **Accéder aux paramètres** : Liste en bas avec icônes

## 🎨 Code de Couleurs

### Statuts des Demandes
- 🟡 **Orange** : En attente → Action requise
- 🟢 **Vert** : Acceptée → En cours
- 🔴 **Rouge** : Refusée → Terminée
- ⚫ **Gris** : Expirée → Opportunité manquée

### Indicateurs Visuels
- **Badge rouge** : Notifications (nouvelles demandes)
- **Badge vert** : Réussite (acceptation, points gagnés)
- **Badge orange** : Urgence (demande urgente, opportunité manquée)
- **Badge or** : Achievements (badges, récompenses)

## 📊 Données de Démonstration

L'application utilise des données statiques pour la démo :

### Statistiques Actuelles
- **24** demandes ce mois
- **18** demandes acceptées (75%)
- **15** nouveaux clients
- **1,800 TND** CA estimé
- **+12%** croissance vs mois dernier

### Badge Actuel
- 🥈 **PARTENAIRE ARGENT**
- **285/300 points** (15 points pour Gold)
- Top 25% des pharmacies actives

### Demandes en Attente (3)
1. **Lantus SoloStar** - Patient #A2847 - 🔥 URGENT
2. **Metformine 850mg** - Patient #B3921
3. **NovoRapid FlexPen** - Patient #C1456 - 🔥 URGENT

## 🎯 Système de Points

### Gagner des Points
- **+10 pts** : Accepter une demande
- **+5 pts** : Patient récupère la commande
- **+2 pts** : Recevoir un avis 5 étoiles

### Perdre des Points
- **-2 pts** : Laisser expirer une demande (>2h sans réponse)

### Niveaux de Badges
- 🥉 **Bronze** : 50 points
- 🥈 **Silver** : 150 points ← *Vous êtes ici*
- 🥇 **Gold** : 300 points (15 pts restants)
- 🏆 **Platinum** : 500 points
- ⭐ **Diamond** : 1000 points

## 💡 Astuces Pro

### Pour Maximiser Votre Score
1. **Répondez vite** : Les demandes expirent après 2h
2. **Acceptez plus** : Meilleur taux d'acceptation = meilleur classement
3. **Soyez disponible** : Activez les notifications push
4. **Communiquez** : Ajoutez un message personnalisé aux patients

### Fonctionnalités Cachées
- **Messages rotatifs** : Le bandeau vert en haut change de message (fermez-le avec X)
- **Sections extensibles** : Tap sur "Avantages actuels ▼" pour voir les détails
- **Filtres multiples** : Combinez "En Attente" + "Urgent" pour focus maximal

## 🔧 Structure du Code

```
lib/
├── constants/        # Couleurs et styles
├── models/           # Modèles de données
├── data/            # Données de démonstration
├── widgets/         # Composants réutilisables
├── screens/         # Écrans de l'app
└── main.dart        # Point d'entrée
```

### Fichiers Clés
- `app_colors.dart` : Toutes les couleurs du design system
- `mock_data.dart` : Toutes les données de démo
- `dashboard_screen.dart` : Écran d'accueil complet
- `requests_screen.dart` : Gestion des demandes
- `profile_screen.dart` : Profil et paramètres

## 🐛 Résolution de Problèmes

### L'app ne compile pas ?
```bash
flutter clean
flutter pub get
flutter run
```

### Des avertissements sur withOpacity ?
C'est normal, ce sont juste des deprecation warnings de Flutter. Le code fonctionne parfaitement.

### Les données ne changent pas ?
Normal ! C'est une démo avec données statiques. Pour la version production, intégrez une API backend.

## 📱 Test de l'Application

### Scénario de Test Complet

1. **Démarrage**
   - L'app s'ouvre sur le Dashboard
   - Vous voyez le bandeau vert avec un message motivationnel
   - La carte orange montre "3 Nouvelles Demandes"

2. **Consulter une Demande**
   - Tap sur la carte orange OU sur l'onglet "📥 Demandes"
   - Vous arrivez sur la liste des demandes
   - Les demandes "En Attente" sont affichées par défaut

3. **Accepter une Demande**
   - Tap sur "✅ Disponible" pour la première demande (Lantus)
   - Un modal s'ouvre avec le formulaire
   - Remplissez :
     * Prix : 85
     * Délai : Immédiat
     * Message : "Disponible maintenant"
   - Tap "Confirmer la Disponibilité"
   - Animation de succès : ✅ +10 points !

4. **Voir le Profil**
   - Tap sur "👤 Profil" dans la barre du bas
   - Scrollez pour voir tous les badges
   - Consultez les statistiques globales

5. **Retour au Dashboard**
   - Tap sur "🏠 Accueil"
   - Explorez les différentes sections
   - Essayez de fermer le bandeau vert

## 🎓 Apprentissage

### Pour les Développeurs

Ce projet est un excellent exemple de :
- ✅ Architecture Flutter propre et modulaire
- ✅ Design system cohérent
- ✅ Composants réutilisables
- ✅ Navigation multi-écrans
- ✅ Forms et validation
- ✅ Animations et feedback utilisateur
- ✅ Mock data pour prototypage rapide

### Concepts Flutter Utilisés
- StatefulWidget vs StatelessWidget
- Navigation avec BottomNavigationBar
- ModalBottomSheet et Dialogs
- ListView.builder pour listes dynamiques
- GridView pour layouts en grille
- ExpansionTile pour sections pliables
- Custom widgets et composition
- Theming et styles cohérents

## 📞 Support

### Besoin d'Aide ?

**Documentation** :
- `DOCUMENTATION.md` : Documentation complète du projet
- `FEATURES.md` : Liste détaillée de toutes les fonctionnalités

**Code** :
- Tous les fichiers sont commentés
- Structure claire et organisée
- Nommage explicite

---

## 🎉 Amusez-vous !

Cette application est un prototype complet et fonctionnel. Explorez, testez, et n'hésitez pas à personnaliser selon vos besoins !

**Bonne navigation ! 🚀**

---

*DiabCare - Simplifier l'accès aux médicaments pour diabétiques en Tunisie*

