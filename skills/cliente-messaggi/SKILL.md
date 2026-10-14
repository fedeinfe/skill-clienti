---
name: cliente-messaggi
description: Scrive ogni mail e messaggio al cliente (WhatsApp, email, risposte in trattativa) con tutto il contesto del progetto, e tiene aggiornati i documenti dopo ogni scambio — cosa ha chiesto, cosa si è deciso, cosa cambia nel preventivo. Usala ogni volta che arriva o parte un messaggio del cliente ("mi ha scritto…", "rispondigli", "scrivi una mail a…", "mandagli il questionario", "come gli dico che…", un messaggio incollato), dal primo contatto alla firma e oltre.
---

# cliente-messaggi

Il cliente scrive a ogni ora, su canali diversi, e ogni messaggio sposta un pezzo del progetto. Se ogni
risposta passa da Claude dentro la cartella del progetto, non rispondi mai a memoria: la risposta tiene
conto di tutto quello che è stato detto, deciso e scritto, e il progetto si aggiorna mentre parli.

## Quando arriva un messaggio

Federico incolla il messaggio (o la mail, o la nota vocale trascritta). Prima di scrivere:

1. **Rileggi lo stato**: README, roadmap, preventivo, ultime risposte, `docs/messaggi.md`.
2. **Separa cosa chiede**: domande, obiezioni, richieste nuove, informazioni che ti dà. Spesso in un
   messaggio ce ne sono tre mescolate.
3. **Per ogni richiesta, dove sta**: è già nel perimetro? è fuori (sviluppo successivo)? cambia il prezzo
   o i tempi? contraddice una sua risposta precedente? Citala: "nella parte 2 avevi scelto…".
4. **Le decisioni non le prendi tu**: se il messaggio chiede di scegliere un prezzo, uno sconto, una
   clausola o una data, mostra a Federico le opzioni con le conseguenze, una per volta, e aspetta.

## Come si scrive

- **La lingua del cliente**: le parole del suo glossario, del tu o del lei come fa lui, niente gergo
  tecnico. Se deve capire una scelta tecnica, scrivi la conseguenza pratica, non la tecnologia.
- **Breve, nell'ordine in cui serve a lui**: prima la risposta, poi il perché, poi cosa deve fare
  (o niente). Una mail di trattativa sta in una schermata del telefono.
- **Una richiesta di azione per messaggio**, chiara e in fondo: "mi mandi il file entro venerdì?".
- **I numeri come nel preventivo**, mai arrotondati a voce: se cambiano, cambia prima il preventivo.
- **Un "no" ha sempre un'alternativa**: "questo non sta nel budget di R1; lo metto negli sviluppi
  successivi con un suo preventivo, oppure lo scambiamo con…".
- **Niente promesse nuove** che non siano già nei documenti. Se nel messaggio ne serve una, prima la
  aggiungi al documento giusto, poi la scrivi.
- WhatsApp: due o tre righe, niente elenchi lunghi. Email: oggetto che dice di cosa si tratta.

Proponi la bozza in chat, pronta da copiare. Se Federico la cambia, chiediti perché: un tono, una
parola, un'informazione che non sapevi. Se è una regola, scrivila in `docs/messaggi.md` sotto
*Come scrivere a <cliente>*.

## Dopo ogni scambio

Aggiorna `docs/messaggi.md` (una voce per scambio: data, canale, cosa ha chiesto, cosa si è risposto,
cosa si è deciso) e poi i documenti che lo scambio tocca:

- un accordo su prezzo o condizioni → roadmap e preventivo, con la nuova versione e la data;
- una richiesta nuova → sviluppi successivi nella roadmap, o *Richieste nuove* nel PRD;
- una risposta che cambia una scelta → la riga "cosa cambia" del PRD;
- un termine nuovo → `CONTEXT.md`.

Così quando il cliente scrive "come avevamo detto…", la frase giusta è già scritta da qualche parte, con
la data.

## In trattativa

Quando il cliente fa una controproposta, prima della bozza dai a Federico un parere netto ("così com'è
non lo accetterei, perché…") e due o tre controproposte. Le migliori spesso non toccano il prezzo:
garanzia con un perimetro chiaro, tariffa oraria dopo, pagamenti legati ai rilasci, un diritto di
preferenza sugli sviluppi futuri, chi intesta gli account. La scelta resta sua.

## Messaggi che si ripetono

- **Mandare un questionario**: cosa serve e perché adesso, quanto ci mette, il comando da scrivere alla
  sua AI, quando ti aspetti il file. Tre righe più il file.
- **Mandare il preventivo**: il riassunto in tre righe (cosa, quanto, quando), il PDF, il file di
  contesto per la sua AI con il comando (vedi `cliente-preventivo`), la scadenza dell'offerta.
- **Rispondere a "costa troppo"**: non si toglie prezzo, si toglie perimetro. Proponi cosa spostare in
  un rilascio successivo, con il prezzo che ne risulta.
- **Chiedere una conferma scritta** (cambio di perimetro, punto aperto del PRD): elenco numerato con la
  proposta per ognuno, così risponde "ok tutti tranne il 2".
