# Gliding in Tuscany Website

Sito web statico per Aeroagriturismo e Scuola di Volo a Vela in Toscana.

## Tecnologie

- **Eleventy (11ty)** - Static Site Generator
- **Tailwind CSS** - Framework CSS
- **Nunjucks** - Template engine
- **Multilingua** - Italiano e Inglese

## Installazione

```bash
# Installa le dipendenze
npm install

# Avvia il server di sviluppo
npm start

# Compila per la produzione
npm run build
```

## Struttura del Progetto

```
.
├── src/                    # Sorgenti del sito
│   ├── _data/             # Dati globali (navigazione, traduzioni, etc.)
│   ├── _includes/         # Componenti riutilizzabili (header, footer)
│   ├── _layouts/          # Layout delle pagine
│   ├── assets/            # Risorse statiche
│   │   ├── images/        # Immagini
│   │   └── videos/        # Video
│   ├── css/               # Fogli di stile
│   ├── it/                # Pagine in italiano
│   └── en/                # Pagine in inglese
├── _site/                 # Sito generato (da uploadare via FTP)
└── package.json           # Dipendenze
```

## Pagine Disponibili

### Italiano
- `/it/` - Homepage
- `/it/scuola-volo/` - Scuola di Volo
- `/it/agriturismo/` - Agriturismo
- `/it/galleria/` - Galleria Foto
- `/it/contatti/` - Contatti

### Inglese
- `/en/` - Homepage
- `/en/flight-school/` - Flight School
- `/en/farm-stay/` - Farm Stay
- `/en/gallery/` - Photo Gallery
- `/en/contact/` - Contact

## Personalizzazione

### Aggiungere Immagini

1. Posiziona le tue immagini in `src/assets/images/`
2. Sostituisci i placeholder nelle pagine con i percorsi corretti:
   ```html
   <img src="/assets/images/tua-foto.jpg" alt="Descrizione">
   ```

### Modificare i Contenuti

I contenuti delle pagine si trovano in:
- `src/it/` per le pagine in italiano
- `src/en/` per le pagine in inglese

### Configurare il Form di Contatto

Il form attualmente simula l'invio. Per un form funzionante:

1. **Opzione A - Formspree** (consigliato, gratuito fino a 50 form/mese):
   ```html
   <form action="https://formspree.io/f/YOUR_FORM_ID" method="POST">
   ```

2. **Opzione B - Getform.io** (alternativa gratuita)

3. **Opzione C - Backend personalizzato**

### Modificare Colori e Stili

Edita `tailwind.config.js` per cambiare i colori del tema:
```javascript
colors: {
  primary: {
    600: '#0284c7',  // Colore principale
  }
}
```

## Deploy

### Via FTP/SFTP

1. Compila il sito:
   ```bash
   npm run build
   ```

2. Il contenuto della cartella `_site/` è pronto per l'upload

3. Carica tutto il contenuto di `_site/` nella root del tuo server web

### Via Netlify/Vercel (opzionale)

Puoi anche hostare gratuitamente su:
- **Netlify**: Collega il repository GitHub e deploy automatico
- **Vercel**: Stessa cosa, con ottimizzazioni automatiche

## Note

- **TODO**: Aggiorna il numero di telefono in `src/it/contatti.njk` e `src/en/contact.njk`
- **TODO**: Aggiungi foto reali sostituendo i placeholder grigi
- **TODO**: Configura il form di contatto con un servizio reale
- **TODO**: Aggiungi Google Maps embed nelle pagine contatti

## Supporto

Per domande o problemi, contatta il proprietario del sito.
