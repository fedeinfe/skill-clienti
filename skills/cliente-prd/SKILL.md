---
name: cliente-prd
description: Scrive il PRD di un progetto cliente a partire dalle sue risposte ai questionari — ogni regola con una sigla da citare nei ticket e la fonte da cui viene, i cambi rispetto alle scelte precedenti, i punti aperti già con una proposta — e prepara la versione da far validare al cliente. Alla fine passa il testimone allo sviluppo (to-tickets e tdd di Matt Pocock). Usala quando sono arrivate le risposte sui requisiti ("scrivi il PRD", "documento dei requisiti", "le risposte sono arrivate", "il cliente ha validato") o quando bisogna aggiornarlo dopo una conferma del cliente.
---

# cliente-prd

Il PRD è il documento da cui nascono i ticket. Se è scritto bene, lo sviluppo parte quasi da solo:
l'agente non deve indovinare nessuna regola, perché ogni regola ha una sigla, una fonte e un caso limite.

## Prima di scrivere

Leggi tutto, nell'ordine: `CONTEXT.md`, la roadmap e il preventivo firmato (il perimetro), ogni
questionario con le sue risposte, l'analisi di quello che esiste, le note dei messaggi con il cliente.
Il questionario sui requisiti ideale per arrivare qui è quello in stile "grill me": ogni funzione già
decisa, chiesta caso per caso, con la tua proposta già pronta (vedi `cliente-questionario`).

Un PRD per rilascio. Se il rilascio è grande, uno per la sua parte centrale e gli altri quando arrivano
le risposte che servono.

## Struttura

`docs/prd/<rilascio>.md`:

1. **Intestazione**: data, stato ("prima stesura dalle risposte del 09/10"), fonti con i link, cosa copre
   e cosa no.
2. **Come leggere le regole**: la tabella delle sigle delle fonti. Esempio:

   | Sigla | Fonte |
   |---|---|
   | `F2`, `H8` | domanda del questionario sui requisiti |
   | `IP n` | ipotesi n, confermata dal cliente |
   | `GD` | "già deciso" nel questionario |
   | `AD §n` | analisi di quello che esiste |
   | `proposta` | non viene da una risposta: è come si costruisce se nessuno dice altro |

3. **In sintesi**: cos'è in tre righe, il fatto che muove tutto (lo stato, l'evento da cui dipende il
   resto), cosa cambia di più rispetto a prima, quanti punti sono aperti.
4. **Perimetro**: cosa c'è (modulo → cosa fa → §), **cosa cambia rispetto alle scelte precedenti** (tema
   · prima · ora · fonte: è la tabella che il cliente legge per prima), cosa è fuori.
5. **Persone e permessi**: chi vede e chi fa cosa, ruolo per ruolo.
6. **Il ciclo** dell'oggetto centrale: ogni passaggio di stato con quando, chi, cosa serve, cosa succede.
7. **Moduli**, ognuno con le sue regole siglate:

   ```markdown
   - **INB-6** Se il brand risponde alla stessa email, l'email si aggiunge alla richiesta; i dati
     cambiano solo se l'account conferma (`G3`).
   ```

   Una regola, un comportamento osservabile, una fonte. I casi limite sono regole anche loro.
8. **Requisiti trasversali**: lingue, storico delle modifiche, permessi lato server, dati di prova.
9. **Migrazione**, se c'è un sistema da sostituire.
10. **Ordine di costruzione**, seguendo le dipendenze, con quello che serve dal cliente dal primo giorno.
11. **Punti aperti**: *da confermare con il cliente* (punto · proposta · da sapere, con un esempio in
    numeri quando serve), *decisi da te* e perché, *per la call*, *scelte tecniche*, *richieste nuove
    fuori dal preventivo*.

## Regole

- **Nessuna regola senza fonte.** Se una regola non viene da una risposta, è una `proposta`: va bene,
  ma si vede. Quelle che toccano il modo di lavorare del cliente finiscono anche nei punti aperti.
- **Le parole del glossario**, sempre. Una parola nuova entra prima in `CONTEXT.md`.
- **Le contraddizioni non si risolvono in silenzio.** Se una risposta nuova smentisce una scelta
  precedente, vince la nuova, e il cambio va nella tabella "cosa cambia".
- **Cambi di perimetro** rispetto al preventivo firmato (una funzione che slitta, una che entra): in
  cima, nella sintesi, con "serve una conferma scritta".
- **Ogni punto aperto ha una proposta**, così il PRD non blocca lo sviluppo: si costruisce con la
  proposta finché il cliente non dice altro.
- Niente scelte tecniche nel corpo: stack e integrazioni vanno nel loro paragrafo, a parte.

## La validazione del cliente

Il cliente non legge un PRD di 40 pagine, e non deve. Mandagli (vedi `cliente-messaggi`):

- la tabella "cosa cambia rispetto alle scelte precedenti";
- i punti da confermare, ognuno con la proposta, numerati, così risponde "ok tutti tranne il 3 e il 7";
- gli eventuali cambi di perimetro, da confermare per iscritto.

Il formato che funziona meglio è una pagina HTML (o un artifact) con i flussi principali disegnati e,
sotto ogni punto da confermare, due pulsanti: «Va bene così» e «Da cambiare» con una nota. Il cliente la
apre dal telefono, e quello che ti rimanda è già un elenco di decisioni.

Se usa la sua AI, puoi dargli il PRD intero con la stessa istruzione del contesto preventivo: la sua AI
glielo spiega e raccoglie le correzioni. Quando torna, aggiorna il PRD: le conferme diventano fonte
(`ok 15/10`), le correzioni cambiano la regola, e lo stato diventa "validato".

## Dal PRD al codice

Il PRD validato è l'input dello sviluppo. Con le skill di Matt Pocock (`mattpocock/skills`):

1. `/setup-matt-pocock-skills` una volta nel repo: tracker e convenzioni.
2. `/to-tickets` sul PRD: lo spezza in ticket verticali, ognuno con i ticket che lo bloccano. Le sigle
   delle regole vanno nei ticket, così ogni ticket dice quali regole soddisfa.
3. `/implement` (o `/implement-spec` per lavorare in parallelo) ticket per ticket, con `/tdd`: i test
   nascono dalle regole e dai casi limite del PRD.
4. Quando una regola si rivela sbagliata durante lo sviluppo, si corregge prima nel PRD, poi nel codice.
