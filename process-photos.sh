#!/bin/bash

# Script per processare e organizzare le foto del sito
# Converte tutto a JPG ottimizzato e rinomina in modo consistente

SOURCE_DIR="/Volumes/Lexar/src/foto sito"
DEST_DIR="src/assets/images"
VIDEO_DIR="src/assets/videos"

# Crea directory se non esistono
mkdir -p "$DEST_DIR"
mkdir -p "$VIDEO_DIR"

echo "📸 Processamento foto e video..."
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""

# Funzione per processare immagine
process_image() {
    input="$1"
    output_name="$2"
    max_width=1920
    quality=85

    echo "  Processing: $(basename "$input") → $output_name"

    magick "$input" \
        -auto-orient \
        -resize "${max_width}x>" \
        -quality $quality \
        -strip \
        "$DEST_DIR/$output_name"

    size=$(identify -format "%wx%h" "$DEST_DIR/$output_name")
    filesize=$(ls -lh "$DEST_DIR/$output_name" | awk '{print $5}')
    echo "    → Size: $size, File: $filesize"
}

echo "🖼️  FOTO - Conversione e ottimizzazione"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"

# PISTA E CAMPO
echo ""
echo "📍 Pista e Campo:"
process_image "$SOURCE_DIR/pista_23.jpeg" "pista-runway.jpg"
process_image "$SOURCE_DIR/pista_alto.jpeg" "pista-aerial.jpg"
process_image "$SOURCE_DIR/pista_di_lato.jpeg" "pista-side.jpg"

# ATTIVITÀ VOLO
echo ""
echo "✈️  Attività di Volo:"
process_image "$SOURCE_DIR/attivita_volo.jpeg" "volo-activity-01.jpg"
process_image "$SOURCE_DIR/attivita_volo_2.jpeg" "volo-activity-02.jpg"
process_image "$SOURCE_DIR/lanci_verricello_k2.jpg" "volo-winch-launch.jpg"

# ALIANTI E ABITACOLO
echo ""
echo "🛩️  Alianti:"
process_image "$SOURCE_DIR/abitacolo_k2.jpeg" "aliante-cockpit.jpg"
process_image "$SOURCE_DIR/biposto_muge.jpg" "aliante-biposto.jpg"
process_image "$SOURCE_DIR/traino_I-AIMA.JPG" "aliante-iaima-01.jpg"
process_image "$SOURCE_DIR/traino_I-AIMA_2.jpeg" "aliante-iaima-02.jpg"

# HANGAR E STRUTTURE
echo ""
echo "🏠 Hangar e Strutture:"
process_image "$SOURCE_DIR/hangar_laterale.jpeg" "hangar-side.jpg"
process_image "$SOURCE_DIR/hagar_laterale_2.jpeg" "hangar-side-02.jpg"
process_image "$SOURCE_DIR/traino_hangar.jpg" "hangar-glider.jpg"

# PROPRIETARIO
echo ""
echo "👨‍✈️  Proprietario:"
process_image "$SOURCE_DIR/proprietario_aliante.jpeg" "owner-glider.jpg"
process_image "$SOURCE_DIR/traino_proprietario.jpeg" "owner-towing.jpg"

# PANORAMI
echo ""
echo "🏔️  Panorami:"
process_image "$SOURCE_DIR/panoramica_180.jpeg" "panorama-180.jpg"
process_image "$SOURCE_DIR/trasimeno.jpg" "panorama-trasimeno.jpg"

# VIDEO
echo ""
echo "🎥 VIDEO - Copia"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📹 Copiando video (grandi, potrebbero servire minuti)..."

cp "$SOURCE_DIR/decollo_traino_2.mp4" "$VIDEO_DIR/takeoff-towing.mp4"
echo "  ✓ takeoff-towing.mp4 (11M)"

cp "$SOURCE_DIR/lancio_verricello.mov" "$VIDEO_DIR/winch-launch.mov"
echo "  ✓ winch-launch.mov (17M)"

# Video molto grandi - li saltiamo o convertiamo?
echo ""
echo "⚠️  Video molto grandi (190-209MB) - li salto per ora:"
echo "    - lancio_verricello_pista_05.MOV (190M)"
echo "    - proprietario_decollo_traino.MOV (209M)"
echo "    (Puoi copiarli manualmente se servono)"

echo ""
echo "✅ COMPLETATO!"
echo "━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━"
echo ""
echo "📁 Foto salvate in: $DEST_DIR"
echo "🎬 Video salvati in: $VIDEO_DIR"
echo ""
echo "Prossimo step: aggiornare le pagine per usare le nuove foto!"
