# DiabCare Pharmacy Management Interface

Application mobile complète de gestion pour les pharmacies partenaires de DiabCare, une plateforme de gestion des demandes de médicaments pour diabétiques en Tunisie.

## 🎯 Vue d'ensemble

Cette application permet aux pharmacies de :
- Gérer les demandes de médicaments des patients diabétiques
- Suivre leurs performances et statistiques
- Construire leur réputation via un système de badges
- Visualiser leur impact commercial
- Communiquer avec les patients

## 🎨 Design System

### Couleurs (Thème Pastel Moderne)
- **Primary Green** (#9FE2BF) : Vert pastel doux - Actions principales et confiance
- **Secondary Green** (#B8F3D8) : Vert clair lumineux - Accents légers
- **Mint Green** (#D4F1E8) : Menthe très clair - Arrière-plans subtils
- **Dark Green** (#4A9B7F) : Vert profond élégant - En-têtes et emphase
- **Primary Blue** (#A7C7E7) : Bleu pastel principal - Touches d'accent
- **Secondary Blue** (#CCE5FF) : Bleu clair aéré - Arrière-plans doux
- **Accent Blue** (#6FA8DC) : Bleu accent prononcé - Éléments interactifs
- **Light Blue** (#E8F4FF) : Bleu très pâle - Cartes et sections
- **Accent Gold** (#FBD38D) : Or pastel - Badges et réalisations
- **Success Green** (#9AE6B4) : Vert succès pastel - Demandes acceptées
- **Warning Orange** (#FBD38D) : Orange doux - Demandes en attente
- **Error Red** (#FEB2B2) : Rouge pastel - Demandes refusées
- **Background** (#FAFAFA) : Off-white moderne - Fond principal
- **Card Background** (#FFFFFF) : Blanc pur - Cartes et éléments

### Typographie
- **Police** : Inter
- **Headers** : SemiBold (600) - Taille 18-20px
- **Subheaders** : Medium (500) - Taille 16-18px
- **Body** : Regular (400) - Taille 14px
- **Stats/Numbers** : Bold (700) - Taille 28-32px

### Composants Modernes
- Cards avec gradients subtils et ombres douces (0px 5px 15px rgba(0,0,0,0.03-0.06))
- Coins arrondis : 20px (cards principales), 16px (éléments moyens), 12-14px (petits boutons)
- Bordures légères avec opacité (0.2-0.3)
- Espaces généreux et mise en page aérée
- Design mobile-first responsive
- Icônes Material Design arrondies (rounded variants)
- Animations et transitions fluides (300ms)
- Gradients pastel harmonieux
- Bottom navbar moderne avec bordures arrondies (24px)

## 📱 Écrans Principaux

### 1. Dashboard (Accueil)
- **Header** : Avatar pharmacie, nom, badge actuel, notifications
- **Bannière de bienvenue** : Messages motivationnels rotatifs
- **Alertes** : Demandes en attente avec compteur
- **Statistiques mensuelles** : Demandes, acceptations, clients, CA
- **Progression de badge** : Niveau actuel et avantages
- **Comparaison de performance** : vs autres pharmacies de la zone
- **Valeur DiabCare** : Services gratuits fournis
- **Activité récente** : Timeline des derniers événements
- **Avis clients** : Aperçu des derniers commentaires
- **Projection annuelle** : Estimations basées sur les performances
- **Opportunités manquées** : Alertes et conseils

### 2. Demandes de Médicaments
- **Filtres** : Par statut (Toutes, En Attente, Acceptées, Refusées, Expirées)
- **Filtres rapides** : Urgent, Aujourd'hui, Cette semaine
- **Cartes de demande** : Détails médicament, patient, quantité
- **Actions** : Disponible, Indisponible, Ignorer
- **Formulaire d'acceptation** :
  - Prix indicatif (optionnel)
  - Délai de préparation (requis)
  - Message au patient (optionnel)
  - Heure limite de retrait (auto-calculée)
- **Feedback de succès** : Animation et points gagnés

### 3. Profil
- **En-tête** : Avatar, nom, adresse, téléphone
- **Section badge** : Badge actuel et description
- **Collection de badges** : Débloqués et verrouillés
- **Statistiques globales** : Toutes les métriques depuis l'inscription
- **Graphiques** : Évolution sur 6 mois
- **Avis clients** : Liste complète avec filtres
- **Paramètres** :
  - Notifications
  - Localisation
  - Horaires d'ouverture
  - Premium/Boost
  - Sécurité
  - À propos
  - Déconnexion

## 🏗️ Structure du Projet

```
lib/
├── constants/
│   ├── app_colors.dart          # Palette de couleurs
│   └── app_text_styles.dart     # Styles typographiques
├── models/
│   └── pharmacy_models.dart     # Modèles de données
├── data/
│   └── mock_data.dart           # Données de démonstration
├── widgets/
│   ├── dashboard_widgets.dart   # Composants dashboard
│   └── request_widgets.dart     # Composants demandes
├── screens/
│   ├── main_screen.dart         # Navigation principale
│   ├── dashboard_screen.dart    # Tableau de bord
│   ├── requests_screen.dart     # Gestion demandes
│   └── profile_screen.dart      # Profil pharmacie
└── main.dart                    # Point d'entrée
```

## 🚀 Fonctionnalités Clés

### Système de Badges
- **Bronze Partner** (50 pts) : Badge basique
- **Silver Partner** (150 pts) : Priorité modérée
- **Gold Partner** (300 pts) : Position Top 5, boost gratuit
- **Platinum Partner** (500 pts) : Position Top 3
- **Diamond Partner** (1000 pts) : Position #1, tous avantages

### Métriques de Performance
- Temps de réponse moyen
- Taux d'acceptation
- Note moyenne clients
- Comparaison avec secteur

### Système de Points
- +10 points : Accepter une demande
- +5 points : Patient récupère commande
- +2 points : Avis 5 étoiles
- -2 points : Demande expirée

## 💡 Données de Mock

L'application utilise des données statiques pour la démonstration :
- 3 demandes en attente
- 2 demandes acceptées
- 1 demande refusée
- 1 demande expirée
- 24 demandes totales ce mois
- 285 points (badge Silver)
- 4.8/5 étoiles (23 avis)
- 1,800 TND CA estimé

## 🎯 Prochaines Étapes

1. Intégration backend avec API REST
2. Notifications push temps réel
3. Système de paiement Premium/Boost
4. Chat direct avec patients
5. Statistiques avancées et exports
6. Support multi-pharmacies
7. Mode hors-ligne
8. Tests unitaires et d'intégration

## 📋 Prérequis

- Flutter SDK 3.0+
- Dart 3.0+
- Android Studio / VS Code
- Émulateur iOS/Android ou appareil physique

## 🛠️ Installation

```bash
# Cloner le projet
cd pim2

# Installer les dépendances
flutter pub get

# Lancer l'application
flutter run
```

## 🧪 Tests

```bash
# Lancer les tests
flutter test

# Analyser le code
flutter analyze
```

## 📱 Compatibilité

- ✅ Android 5.0+ (API 21+)
- ✅ iOS 11.0+
- ✅ Mode portrait et paysage
- ✅ Tablettes (layouts optimisés)

## 🎨 Philosophie de Design

- **Professionnel et Digne de Confiance** : Couleurs vertes associées à la santé
- **Motivant** : Gamification avec badges et points
- **Transparent** : Métriques claires et comparaisons honnêtes
- **Valorisant** : Mise en avant de la valeur apportée gratuitement
- **Actionnable** : CTAs clairs et parcours utilisateur fluide

## 📄 Licence

Propriété de DiabCare - Tous droits réservés

## 👥 Équipe

Développé pour DiabCare - Plateforme de gestion des médicaments pour diabétiques en Tunisie

---

**Version** : 1.0.0  
**Date** : Février 2026  
**Statut** : En développement actif

