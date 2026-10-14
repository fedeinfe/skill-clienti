---
name: cliente-kickoff
description: Trasforma la trascrizione del primo meeting con un cliente (Wispr Flow, Granola, note vocali, appunti sparsi) nel progetto impostato — cartella, README con lo stato, glossario del dominio, analisi del materiale che il cliente ha già, elenco di cosa manca per fare il preventivo. Usala quando arriva un cliente nuovo o un progetto nuovo ("ho fatto il meeting", "ecco la trascrizione", "impostiamo il progetto", "nuovo cliente").
---

# cliente-kickoff

Il primo meeting è l'unico momento in cui il cliente racconta tutto senza filtri: come lavora, cosa non
funziona, cosa sogna. Se lo registri (Wispr Flow, Granola, il registratore del telefono) e passi la
trascrizione a Claude, niente si perde e il progetto parte con le sue parole, non con le tue.

## Input

- La trascrizione del meeting, anche grezza e con errori di dettatura. Se è in più pezzi, leggili tutti.
- Quello che il cliente ha già: un vecchio gestionale, un file Excel, un sito, documenti di procedura,
  una demo fatta da qualcun altro. Chiedi dove sono.
- Chi è il cliente e chi era al meeting, se la trascrizione non lo dice.

## Passi

1. **Leggi la trascrizione per intero** prima di scrivere. La dettatura storpia nomi propri e termini
   tecnici: correggili dal contesto, e se un nome resta incerto chiedilo invece di indovinarlo.
2. **Crea il progetto**: una cartella (o un repo) con `README.md`, `CONTEXT.md` e `docs/`. Salva la
   trascrizione in `docs/discovery/meeting-<data>.md` così com'è: è la fonte, tutto il resto la cita.
3. **Glossario (`CONTEXT.md`).** I termini del cliente, una riga di definizione ciascuno, con le parole
   da evitare. Esempio:

   ```markdown
   **Commessa**:
   Ogni lavoro per un brand con un codice commessa.
   _Avoid_: attività, progetto, deal
   ```

   È la cosa più utile che esce dal kickoff: da qui in poi questionari, preventivo, PRD e codice usano
   le stesse parole, e il cliente si riconosce in ogni documento che gli mandi.
4. **Analisi di quello che esiste** (`docs/discovery/analisi-<cosa>.md`), se il cliente ha già uno
   strumento: cosa fa davvero, cosa promette e non fa, le regole di lavoro che contiene (sono il valore,
   anche quando il codice non lo è), i rischi urgenti. Solo lettura: niente si esegue e niente si tocca.
   Se il materiale è grande (un intero gestionale), dividi la lettura per aree e falla fare a più agenti
   in parallelo, uno per area, poi unisci i risultati in un documento solo.
   Se trovi un problema serio (sicurezza, dati), mettilo in cima: va detto al cliente subito, a
   prescindere dal preventivo.
5. **Cosa sai e cosa no.** Nel README, sotto lo stato del progetto, tre elenchi brevi:
   - *deciso nel meeting*: cosa il cliente ha detto chiaramente;
   - *da chiedere al cliente*: scelte di prodotto che solo lui può fare → diventano il questionario
     (`cliente-questionario`);
   - *da decidere io*: tecnologia, design, organizzazione → non si chiedono, si scrivono in "già deciso".
6. **README** con: cos'è il progetto in due righe, lo stato ("discovery: aspetto le risposte al
   questionario"), l'indice dei documenti con una riga ciascuno. Aggiornalo a ogni passo: è il punto da
   cui riparte qualsiasi sessione futura.

## Regole

- Le parole del cliente valgono più delle tue: se lui dice "attività", il glossario dice "attività" o
  spiega perché si usa un altro termine.
- Niente prezzi e niente tempi nel kickoff. Si stimano dopo le risposte, nel preventivo.
- Quello che il cliente ha detto a voce resta citato tra virgolette con la data del meeting: quando
  cambierà idea (succede), saprai da dove partivi.
- Se lavori con un tracker o con le skill di Matt Pocock, il glossario è già nel formato che si aspettano
  (`domain-modeling`).

Alla fine mostra in chat: il glossario (solo i termini), i tre elenchi e il percorso del progetto.
Il passo successivo è quasi sempre il questionario.
