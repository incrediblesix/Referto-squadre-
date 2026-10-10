# Referto Squadra: guida per metterlo online

Il progetto è un sito che gira nel browser e salva i dati su Supabase. Chi ha l'indirizzo del sito vede le statistiche, solo tu (con email e password) puoi modificarle.

I nomi dei menu di Supabase e Netlify possono cambiare un po' nel tempo: se non trovi una voce, cerca quella più simile.

## Cosa c'è nella cartella

- `index.html`: il sito vero e proprio. Non serve modificarlo.
- `config.js`: qui incolli i due dati del tuo progetto Supabase.
- `schema.sql`: crea le tabelle e le regole di accesso.
- `manifest.webmanifest`, `icon-192.png`, `icon-512.png`: servono per aggiungere il sito alla schermata Home.

## Parte 1: creare il database su Supabase

1. Vai su supabase.com e crea un account gratuito.
2. Crea un nuovo progetto (**New project**). Scegli un nome, una regione europea e una password per il database. Conserva la password. Attendi qualche minuto che il progetto sia pronto.
3. Apri **SQL Editor**, crea una nuova query, incolla tutto il contenuto di `schema.sql` e premi **Run**. Deve comparire un messaggio di successo.
4. Apri **Authentication → Users** e scegli **Add user → Create new user**. Inserisci la tua email e una password, e spunta **Auto Confirm User**. Questo sarà il tuo accesso per modificare i dati.
5. Sempre in Authentication, nelle impostazioni del provider Email (**Sign In / Providers → Email**), disattiva **Allow new users to sign up**. Questo passaggio è importante: così nessun altro può creare un account e modificare i dati.
6. Apri **Project Settings → API** (a volte chiamato **Data API** o **API Keys**). Copia due cose:
   - **Project URL** (inizia con `https://` e finisce con `.supabase.co`);
   - la chiave pubblica, chiamata **anon public** oppure **publishable**.
7. In questa versione `config.js` è già compilato con i dati del tuo progetto, quindi non devi fare nulla. Se in futuro cambi progetto, apri `config.js` con un editor di testo e sostituisci i due valori, lasciando gli apici ai lati.

La chiave pubblica è fatta per stare dentro il sito: non è un segreto. La protezione dei dati sono le regole create da `schema.sql`. Non copiare mai la chiave chiamata **service_role** o **secret**.

## Parte 2: mettere il sito online

Esempio con Netlify (ci sono alternative come GitHub Pages):

1. Decomprimi lo zip, così ottieni la cartella con i file.
2. Vai su app.netlify.com/drop (puoi creare un account gratuito).
3. Trascina l'intera cartella nella pagina. Dopo pochi secondi ottieni un indirizzo web.
4. Se vuoi, puoi cambiare il nome dell'indirizzo dalle impostazioni del sito.

Se cambi qualcosa (per esempio `config.js`), ricarica la cartella con lo stesso procedimento.

## Parte 3: primo utilizzo

1. Apri l'indirizzo dal telefono.
2. Tocca **Accedi per modificare** e inserisci email e password creati al punto 4.
3. Nella sezione Squadra tocca **Crea 12 giocatori**, poi **Modifica nomi e numeri** per inserire i nomi veri. Da lì puoi anche caricare il logo.
4. Crea una partita da **Partite** e registrala da **Registra**.

Per aggiungere il sito alla schermata Home:
- iPhone (Safari): tocca Condividi, poi **Aggiungi alla schermata Home**.
- Android (Chrome): menu a tre puntini, poi **Aggiungi a schermata Home** oppure **Installa app**.

I giocatori aprono lo stesso indirizzo e vedono le statistiche senza accedere. Chi ha l'indirizzo può leggere tutti i dati, quindi non condividerlo con chi non deve vederli. Per dare l'accesso in modifica a un'altra persona, creala tra gli utenti come al punto 4.

## Cose da sapere

- Il sito legge i dati all'apertura e poi ogni 30 secondi circa. Dopo che modifichi qualcosa, gli altri lo vedono entro mezzo minuto.
- Il sito funziona solo con la connessione internet.
- Nel piano gratuito di Supabase i progetti inattivi vengono messi in pausa dopo circa una settimana. Se il sito non carica i dati dopo molto tempo, apri il pannello di Supabase e riattiva il progetto. Controlla le condizioni aggiornate sul sito di Supabase.
- Il piano gratuito non include backup automatici. Ogni tanto puoi esportare le tabelle in CSV dal **Table Editor**.
- I dati della pagina di prova dentro Claude non si trasferiscono: qui si parte da zero.

## Se qualcosa non funziona

- **"Manca la configurazione"**: `config.js` non è stato compilato o non è stato ricaricato online.
- **"Non riesco a leggere i dati"**: controlla di aver eseguito `schema.sql` e che indirizzo e chiave siano giusti, senza spazi in più.
- **"Email o password non corretti"**: controlla l'utente creato al punto 4 e che sia stato confermato (**Auto Confirm User**).
- **Non riesci a salvare**: probabilmente non hai fatto l'accesso, oppure la sessione è scaduta. Esci e rientra.
