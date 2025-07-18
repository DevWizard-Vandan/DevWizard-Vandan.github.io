#!/bin/bash

# Define the source file (your main HTML file)
SOURCE_FILE="index.html"
# Define the output directory for Vercel static builds
OUTPUT_DIR=".vercel/output/static"

# Create the output directory if it doesn't exist
mkdir -p "$OUTPUT_DIR"

# Copy all project files to the output directory
# This ensures the script operates on a copy, not the original source
cp -R ./* "$OUTPUT_DIR"/

# --- Replace Placeholders with Environment Variables ---
# The 'sed -i' command modifies the file in place.
# We use '|' as the delimiter for 'sed' to avoid issues if paths contain '/'
# Ensure the environment variable names (e.g., $VITE_FIREBASE_API_KEY)
# exactly match what you set in Vercel's Environment Variables.

echo "Injecting Firebase environment variables into $SOURCE_FILE..."

sed -i "s|__VERCEL_FIREBASE_API_KEY__|$VITE_FIREBASE_API_KEY|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_AUTH_DOMAIN__|$VITE_FIREBASE_AUTH_DOMAIN|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_PROJECT_ID__|$VITE_FIREBASE_PROJECT_ID|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_STORAGE_BUCKET__|$VITE_FIREBASE_STORAGE_BUCKET|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_MESSAGING_SENDER_ID__|$VITE_FIREBASE_MESSAGING_SENDER_ID|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_APP_ID__|$VITE_FIREBASE_APP_ID|g" "$OUTPUT_DIR/$SOURCE_FILE"
sed -i "s|__VERCEL_FIREBASE_MEASUREMENT_ID__|$VITE_FIREBASE_MEASUREMENT_ID|g" "$OUTPUT_DIR/$SOURCE_FILE"

echo "Environment variables injected successfully."
echo "Build process finished."

# Exit with success status
exit 0