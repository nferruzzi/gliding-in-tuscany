# Istruzioni per Completare il Sito

## 1. Aggiungere le Foto

### Dove mettere le foto
Metti tutte le tue foto nella cartella `src/assets/images/`

Puoi organizzarle in sottocartelle:
```
src/assets/images/
├── struttura/
│   ├── esterno-1.jpg
│   ├── esterno-2.jpg
│   └── panorama.jpg
├── appartamenti/
│   ├── picchio-1.jpg
│   ├── rondone-1.jpg
│   └── falco-1.jpg
└── volo/
    ├── aliante-falco.jpg
    ├── decollo.jpg
    └── volo-panorama.jpg
```

### Come sostituire i placeholder

**Nelle pagine home (index.njk):**

Trova questo codice:
```html
<div class="bg-gray-200 rounded-lg h-[400px] flex items-center justify-center">
  <p class="text-gray-500">[Immagine struttura]</p>
</div>
```

Sostituisci con:
```html
<img
  src="/assets/images/struttura/esterno-1.jpg"
  alt="Podere Sant'Apollonia"
  class="rounded-lg w-full h-[400px] object-cover"
>
```

**Nella galleria (galleria.njk):**

Sostituisci ogni placeholder con le tue immagini seguendo lo stesso schema.

## 2. Configurare il Form di Contatto

### Opzione A: Formspree (CONSIGLIATO)

1. Vai su [formspree.io](https://formspree.io) e crea un account gratuito
2. Crea un nuovo form e copia il "form endpoint" (es: `https://formspree.io/f/xyzabc123`)
3. Apri `src/it/contatti.njk` e `src/en/contact.njk`
4. Trova questa riga:
   ```javascript
   // TODO: Replace with actual form handling service
   ```
5. Sostituisci l'intero blocco `try/catch` con:
   ```javascript
   try {
     const response = await fetch('https://formspree.io/f/TUO_FORM_ID', {
       method: 'POST',
       body: formData,
       headers: {
         'Accept': 'application/json'
       }
     });

     if (response.ok) {
       formMessage.className = 'p-4 rounded-lg bg-green-100 text-green-800';
       formMessage.textContent = 'Messaggio inviato con successo!';
       formMessage.classList.remove('hidden');
       e.target.reset();
     } else {
       throw new Error('Form submission failed');
     }
   } catch (error) {
     formMessage.className = 'p-4 rounded-lg bg-red-100 text-red-800';
     formMessage.textContent = 'Errore nell\'invio. Riprova.';
     formMessage.classList.remove('hidden');
   }
   ```

### Opzione B: Getform.io

Simile a Formspree, segui le istruzioni sul loro sito.

### Opzione C: PHP Mail

Se il tuo hosting supporta PHP, posso aiutarti a creare uno script PHP.

## 3. Aggiungere Google Maps

1. Vai su [Google Maps](https://www.google.com/maps)
2. Cerca "Podere Sant'Apollonia, Arezzo"
3. Clicca su "Condividi" → "Incorpora una mappa"
4. Copia il codice iframe
5. In `src/it/contatti.njk` e `src/en/contact.njk`, sostituisci:
   ```html
   <div class="mt-8 bg-gray-200 rounded-lg h-[300px] flex items-center justify-center">
     <p class="text-gray-500">[Mappa Google Maps]</p>
   </div>
   ```

   Con il tuo iframe di Google Maps (aggiungi le classi per lo styling):
   ```html
   <div class="mt-8 rounded-lg h-[300px] overflow-hidden">
     <iframe
       src="IL_TUO_LINK_GOOGLE_MAPS"
       width="100%"
       height="300"
       style="border:0;"
       allowfullscreen=""
       loading="lazy">
     </iframe>
   </div>
   ```

## 4. Aggiornare Numero di Telefono

Apri questi file e sostituisci `+39 XXX XXX XXXX` con il tuo numero:
- `src/it/contatti.njk`
- `src/en/contact.njk`
- `src/_includes/footer.njk` (opzionale)

## 5. Aggiungere Favicon

1. Crea o converti il tuo logo in formato `.ico` usando un tool online
2. Salvalo come `favicon.ico` in `src/assets/`
3. Se già esiste, sostituiscilo

## 6. Build e Deploy

### Per testare localmente:
```bash
npm start
```
Apri http://localhost:8080

### Per fare il build finale:
```bash
npm run build
```

### Per caricare online:
1. Il contenuto della cartella `_site/` è pronto per l'upload
2. Carica TUTTO il contenuto di `_site/` (non la cartella stessa) via FTP nella root del server
3. Assicurati che la struttura sia:
   ```
   public_html/ (o www/)
   ├── index.html
   ├── it/
   ├── en/
   ├── css/
   └── assets/
   ```

## 7. SEO e Ottimizzazioni (Opzionale)

### Aggiungere Google Analytics
Aggiungi il codice di tracking in `src/_layouts/base.njk` prima del tag `</head>`

### Sitemap
Eleventy può generare automaticamente una sitemap. Chiedi se serve.

### Robots.txt
Crea un file `src/robots.txt` con:
```
User-agent: *
Allow: /
Sitemap: https://www.glidingintuscany.it/sitemap.xml
```

## Domande?

Se hai bisogno di aiuto, fai riferimento al README.md o contatta chi ha creato il sito.
