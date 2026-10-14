---
name: cliente-preventivo
description: Dalle risposte del cliente al preventivo da firmare — roadmap divisa in rilasci a prezzo fisso, preventivo impaginato in HTML e stampato in PDF, e un file di contesto con cui l'AI del cliente lo controlla dalla sua parte e ti rimanda le domande prima della firma. Usala quando è ora di fare il prezzo ("fammi il preventivo", "quanto gli chiedo", "dividiamo in fasi", "rifai il preventivo con lo sconto") e a ogni nuova versione dopo una trattativa.
---

# cliente-preventivo

Tre file, in quest'ordine: la **roadmap** (interna, per te), il **preventivo** (quello che il cliente
firma), il **contesto per l'AI del cliente** (quello che la sua AI legge per controllarlo).

## 1. Roadmap a rilasci

`docs/roadmap.md`, interna. Parte da tutte le risposte dei questionari e divide il prodotto in
**rilasci**: pezzi che vanno in produzione e vengono usati, ognuno con il suo prezzo e la sua data.

- Il primo rilascio è quello che risolve il problema più urgente del cliente, anche se non è il più
  grande. Deve poter vivere da solo: se il progetto si ferma lì, il cliente ha comunque qualcosa che usa.
- **Prezzo per rilascio, fisso.** Le voci dentro un rilascio ne descrivono il perimetro e non hanno un
  prezzo proprio: se lo hanno, la trattativa diventa una lista della spesa voce per voce.
- Quello che non entra nel budget va in **sviluppi successivi**, con una forchetta interna: non sparisce,
  ha un posto e un prezzo futuro.
- Per ogni rilascio: cosa porta, cosa **serve dal cliente** (accessi, account, testi legali, file) e
  quando. I ritardi del cliente spostano le date: scrivilo.
- Timeline in settimane da una data di avvio, con una settimana di prova del cliente dopo ogni rilascio.
- Tieni nella roadmap la storia del prezzo (prima proposta, controproposte, accordo): ti serve alla
  prossima trattativa, non va nel preventivo.

Mostra la roadmap in chat come tabella (rilascio, cosa porta, prezzo, data) e falla validare prima di
scrivere il preventivo. Le decisioni sul prezzo prendile una per volta con chi la usa, in stile "grill me"
(una domanda per volta, con l'opzione consigliata): con le skill di Matt Pocock, `/grill-with-docs`.

I conti tuoi (ore stimate, quanto ti resta, il prezzo minimo sotto cui non scendi) stanno in un file
privato a parte, mai nella roadmap che potresti girare al cliente.

## 2. Il preventivo

`docs/preventivo/preventivo-<progetto>.html`, stampato in PDF con Chrome headless (`references/build.sh`).
L'HTML si corregge in un attimo a ogni giro di trattativa; i dati anagrafici stanno in un blocco in cima.

Contenuto, nel linguaggio del cliente (usa il glossario):

1. In una pagina: cosa compra, quanto paga e quando, quando lo usa.
2. I rilasci, ognuno con le voci in parole sue, il prezzo e la data.
3. Fuori dal preventivo: gli sviluppi successivi, nominati, senza prezzo.
4. Cosa serve dal cliente.
5. Condizioni: pagamenti legati ai rilasci, garanzia (durata e cosa copre: bug sì, richieste nuove no),
   manutenzione dopo, proprietà del codice e degli account, dati personali (se tratti dati suoi sei
   responsabile del trattamento, art. 28 GDPR: accordo da firmare insieme), validità dell'offerta.
6. Per accettazione: firma.

Le clausole legali falle rileggere a un professionista: la skill le imposta, non le garantisce.

## 3. Il contesto per l'AI del cliente

`docs/preventivo/contesto-preventivo.md`. È il passo che cambia la trattativa: il cliente mette il PDF e
questo file nella cartella dove ha le risposte ai questionari, apre la sua AI e scrive **"Leggi
contesto-preventivo.md e segui le istruzioni"**. La sua AI lavora come **revisore dalla sua parte**:

1. legge il PDF per intero;
2. per ogni risposta dei questionari trova dove è finita nel preventivo: in un rilascio, negli sviluppi
   successivi, fuori, o tra i punti aperti;
3. gli mostra uno per uno i **buchi** (una sua scelta che manca) e gli **scostamenti** (c'è, ma diversa);
4. salva `domande-sul-preventivo.md`, che il cliente ti manda.

Così il cliente firma sapendo cosa firma, e tu ricevi domande precise al posto di un "mi sembra caro".
Struttura in `references/contesto.md`. Regole da scrivere nel file:

- **Il PDF fa fede.** Se il contesto e il PDF divergono, è una domanda per te.
- **Numeri come sono.** Prezzi, date e clausole li riporta, non li commenta. "È giusto questo prezzo?"
  "Si può scendere?" diventano domande per te: la sua AI non tratta al posto tuo, e non deve farlo
  nemmeno contro di te.
- **Mappa delle richieste**: una tabella domanda → scelta del cliente → dove sta nel preventivo. La sua
  AI la verifica sul PDF invece di copiarla: se hai sbagliato tu, lo trova.
- **Riservatezza**: nel file di domande niente dati di terzi e niente contenuti di email.

A ogni nuova versione del preventivo aggiorna data, prezzi e mappa nel contesto, e rimandali insieme.
