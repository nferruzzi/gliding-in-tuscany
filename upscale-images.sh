#!/bin/bash

# Script per upscalare le immagini degli interni
# Usa ImageMagick con filtro Lanczos per upscaling di alta qualità

INPUT_DIR="src/assets/images"
OUTPUT_DIR="src/assets/images/upscaled"
SCALE_FACTOR=3  # Ingrandisce 3x (da ~100px a ~300px)

# Crea directory output se non esiste
mkdir -p "$OUTPUT_DIR"

echo "🖼️  Upscaling immagini con ImageMagick (Lanczos)..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# Upscala ogni immagine
for img in "$INPUT_DIR"/t-*.jpg; do
    filename=$(basename "$img")
    echo "📸 Processing: $filename"

    # Upscale con filtro Lanczos (migliore qualità)
    magick "$img" \
        -filter Lanczos \
        -resize ${SCALE_FACTOR}00% \
        -unsharp 0x1 \
        -quality 92 \
        "$OUTPUT_DIR/$filename"

    # Mostra dimensioni
    original_size=$(identify -format "%wx%h" "$img")
    new_size=$(identify -format "%wx%h" "$OUTPUT_DIR/$filename")
    echo "   Original: $original_size → Upscaled: $new_size"
done

echo ""
echo "✅ Fatto! Immagini upscalate salvate in: $OUTPUT_DIR"
echo ""
echo "Per usarle nel sito:"
echo "  1. Controlla la qualità delle immagini in $OUTPUT_DIR"
echo "  2. Se ok, esegui: mv $OUTPUT_DIR/*.jpg $INPUT_DIR/"
echo "  3. Rimuovi la cartella temporanea: rm -rf $OUTPUT_DIR"
