# Setup del Form di Contatto

Il form di contatto utilizza **Web3Forms** (servizio gratuito e senza limiti).

## Configurazione

### 1. Ottieni la tua Access Key

1. Vai su https://web3forms.com
2. Inserisci l'email dove vuoi ricevere i messaggi: **info@glidingintuscany.it**
3. Clicca "Create Access Key"
4. Copia l'Access Key che ti viene fornita

### 2. Inserisci l'Access Key nel sito

Apri entrambi i file di contatto e sostituisci `YOUR_ACCESS_KEY_HERE` con la tua access key:

**File da modificare:**
- `src/it/contatti.njk` (linea 107)
- `src/en/contact.njk` (linea 107)

```html
<input type="hidden" name="access_key" value="LA_TUA_ACCESS_KEY">
```

### 3. Rebuild del sito

Dopo aver inserito l'access key, ribuildi il sito:

```bash
npm run build
```

## Come Funziona

- Quando un visitatore compila il form e invia, i dati vengono inviati a Web3Forms
- Web3Forms inoltra automaticamente il messaggio all'email configurata
- Il visitatore vede un messaggio di conferma
- Riceverai l'email con tutti i dettagli del form:
  - Nome
  - Email
  - Telefono
  - Oggetto selezionato
  - Messaggio

## Link WhatsApp

Il link WhatsApp è già configurato e funziona immediatamente:
- Numero: +39 347 834 7843
- Cliccando si apre direttamente la chat WhatsApp con Antonello

## Alternative a Web3Forms

Se preferisci altre soluzioni:

### Formspree (gratuito fino a 50 form/mese)
1. Vai su https://formspree.io
2. Crea account gratuito
3. Sostituisci `action="https://api.web3forms.com/submit"` con `action="https://formspree.io/f/YOUR_FORM_ID"`

### Netlify Forms (se hostiamo su Netlify)
1. Aggiungi `netlify` al tag form
2. Nessun servizio esterno necessario
