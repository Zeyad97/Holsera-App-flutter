#!/bin/bash

# Holsera Flutter App - Setup Script

echo "🚀 Holsera Flutter App - Setup Script"
echo "======================================"
echo ""

# Check if Flutter is installed
if ! command -v flutter &> /dev/null; then
    echo "❌ Flutter is not installed. Please install Flutter from https://flutter.dev/docs/get-started/install"
    exit 1
fi

echo "✅ Flutter found: $(flutter --version | head -1)"
echo ""

# Navigate to app directory
cd "$(dirname "$0")"

echo "📦 Getting Flutter dependencies..."
flutter pub get

if [ $? -eq 0 ]; then
    echo "✅ Dependencies installed successfully"
    echo ""
    echo "🔧 Next steps:"
    echo "1. Update lib/firebase_options.dart with your Firebase credentials"
    echo "2. Run: flutter run"
    echo ""
    echo "📝 For more details, see README.md"
else
    echo "❌ Failed to install dependencies"
    exit 1
fi
