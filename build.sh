#!/bin/bash

# Ensure the output directory exists
mkdir -p .vercel/output/static

# Copy all files to the output directory
cp -R ./* .vercel/output/static/

# Replace placeholders in the main HTML file
# Ensure 'index.html' is the correct path to your main game file
sed -i "s|__VERCEL_FIREBASE_API_KEY__|$VITE_FIREBASE_API_KEY|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_AUTH_DOMAIN__|$VITE_FIREBASE_AUTH_DOMAIN|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_PROJECT_ID__|$VITE_FIREBASE_PROJECT_ID|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_STORAGE_BUCKET__|$VITE_FIREBASE_STORAGE_BUCKET|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_MESSAGING_SENDER_ID__|$VITE_FIREBASE_MESSAGING_SENDER_ID|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_APP_ID__|$VITE_FIREBASE_APP_ID|g" .vercel/output/static/index.html
sed -i "s|__VERCEL_FIREBASE_MEASUREMENT_ID__|$VITE_FIREBASE_MEASUREMENT_ID|g" .vercel/output/static/index.html

# If you have other JS files where you need replacements, add more sed commands:
# sed -i "s|__YOUR_PLACEHOLDER__|$YOUR_ENV_VAR|g" .vercel/output/static/js/main.js

echo "Build completed successfully!"