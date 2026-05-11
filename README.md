# Holsera Flutter App - Quick Start Guide

## Setup Instructions

### Prerequisites
- Flutter SDK (3.0.0 or higher)
- Dart SDK (3.0.0 or higher)
- Firebase account (create one at https://firebase.google.com/)

### Step 1: Install Flutter Dependencies
```bash
cd /Users/zeyadabdelwahab/Downloads/Holsera_app
flutter pub get
```

### Step 2: Configure Firebase
1. Go to https://console.firebase.google.com
2. Create a new project called "Holsera"
3. Create a Web app and copy the config
4. Add iOS and Android apps if needed
5. Enable Email/Password authentication
6. Enable Google Sign-In authentication

### Step 3: Update firebase_options.dart
Replace the Firebase credentials in `lib/firebase_options.dart`:
- NEXT_PUBLIC_FIREBASE_API_KEY
- NEXT_PUBLIC_FIREBASE_AUTH_DOMAIN
- NEXT_PUBLIC_FIREBASE_PROJECT_ID
- NEXT_PUBLIC_FIREBASE_STORAGE_BUCKET
- NEXT_PUBLIC_FIREBASE_MESSAGING_SENDER_ID
- NEXT_PUBLIC_FIREBASE_APP_ID

### Step 4: Run the App
```bash
# For iOS (macOS)
flutter run -d ios

# For Android
flutter run -d android

# For Web
flutter run -d chrome
```

### Step 5: Test Authentication
1. Navigate to Login screen
2. Try Email/Password signup (password must be 8+ characters)
3. Try Google Sign-In (click the Google button)
4. After login, you'll see the Dashboard with your user info

## Project Structure

```
lib/
├── main.dart                 # App entry point
├── firebase_options.dart     # Firebase configuration
├── screens/
│   ├── home_screen.dart      # Home with all sections
│   ├── login_screen.dart     # Login/Signup with auth
│   └── dashboard_screen.dart # Protected dashboard
├── services/
│   └── auth_service.dart     # Firebase auth logic
├── widgets/
│   ├── navbar_widget.dart    # Navigation bar
│   ├── hero_widget.dart      # Hero section
│   ├── section_title.dart    # Reusable section title
│   ├── problem_card.dart     # Problem cards
│   ├── feature_card.dart     # Feature cards
│   └── use_case_card.dart    # Use case cards
├── models/
│   └── content.dart          # Data models
└── utils/
    ├── colors.dart           # App color scheme
    └── constants.dart        # App strings & constants
```

## Features Included

✅ **All Website Sections:**
- Hero with flow animation
- Problem statement (3 cards)
- Solution overview
- How it works (4 steps)
- Features (4 core features)
- Use cases (4 applications)
- Trust & Security
- Email CTA
- Footer with links

✅ **Authentication:**
- Email/Password signup & login
- Google Sign-In integration
- Protected dashboard
- User session management

✅ **Design:**
- Responsive UI (mobile-first)
- Blue gradient theme (matches website)
- Smooth animations
- Professional typography

## Environment Configuration

Update `lib/firebase_options.dart` with your Firebase credentials:

```dart
static const FirebaseOptions web = FirebaseOptions(
  apiKey: 'YOUR_WEB_API_KEY',
  appId: '1:YOUR_APP_ID:web:YOUR_WEB_APP_ID',
  messagingSenderId: 'YOUR_MESSAGING_SENDER_ID',
  projectId: 'YOUR_PROJECT_ID',
  authDomain: 'YOUR_AUTH_DOMAIN',
  storageBucket: 'YOUR_STORAGE_BUCKET',
);
```

## Deployment

### iOS
1. Open `ios/Runner.xcworkspace` in Xcode
2. Configure signing & capabilities
3. Build: `flutter build ios --release`

### Android
1. Configure keystore in `android/key.properties`
2. Build: `flutter build apk --release`
3. Or build AAB: `flutter build appbundle --release`

### Web
```bash
flutter build web --release
# Deploy to any static hosting (Firebase Hosting, Vercel, etc.)
```

## Support

For issues with:
- **Flutter**: https://flutter.dev/docs
- **Firebase**: https://firebase.google.com/docs
- **Google Sign-In**: https://pub.dev/packages/google_sign_in

## Version

- Version: 1.0.0
- Status: Production Ready
- Build: Flutter 3.0+
