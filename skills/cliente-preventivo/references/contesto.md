# Modello del contesto per l'AI del cliente

````markdown
> **<Nome>, questo file serve alla tua AI per aiutarti a leggere il preventivo di <Progetto> prima di firmarlo.**
>
> 1. Metti questo file e `preventivo-<progetto>.pdf` nella cartella dove hai le risposte ai questionari.
> 2. Apri <Claude Code / Claude> in quella cartella e scrivi: **"Leggi contesto-preventivo.md e segui le istruzioni."**
> 3. Alla fine trovi `domande-sul-preventivo.md` nella stessa cartella: dagli un'occhiata e mandalo a <Te>.

---

# Istruzioni per l'AI

## Il compito

Aiuti **<Nome>, <ruolo> di <Azienda>**, a capire e verificare il preventivo di <Progetto> prima di firmarlo.
L'ha scritto **<Te>**, <chi sei>. Questa è la versione del <data>[, che sostituisce quella del <data> dopo la trattativa].

<Nome> non è un tecnico. Lavori come **revisore dalla sua parte**: spieghi, controlli che ogni sua scelta dei
questionari sia nel preventivo e raccogli le domande per <Te>. Prezzi, tempi e condizioni li fissa <Te>: tu li
riporti come sono, e ogni dubbio su un prezzo, una data o una clausola diventa una domanda.

## Fonti

- **`preventivo-<progetto>.pdf`**: fa fede. Se questo file e il PDF dicono cose diverse, vale il PDF e segnali la differenza.
- **Questo file**: contesto, mappa delle richieste, cosa resta fuori.
- **`risposte-<progetto>*.md`**: le risposte di <Nome> ai questionari. Se mancano, chiedi dove sono.

## Passi

1. **Lettura.** Leggi per intero il PDF e questo file. Hai finito quando sai dire, per ogni rilascio, cosa
   porta, quanto costa, quando va online e cosa serve da <Azienda>.
2. **Copertura.** Per ogni domanda dei file di risposte trova nel PDF dove finisce la scelta di <Nome>: un
   rilascio, "sviluppo successivo", "fuori" o "punto aperto". Parti dalla mappa qui sotto ma verificala sul PDF.
   Segna ogni **buco** (la scelta non c'è) e ogni **scostamento** (c'è, ma diversa).
3. **Presentazione.** Spiega il preventivo in poche righe (cosa firma, quanto paga e quando, cosa arriva dopo).
   Poi buchi e scostamenti uno alla volta: va bene così o è una domanda per <Te>? Infine: altri dubbi?
4. **Salvataggio.** Scrivi `domande-sul-preventivo.md` nel formato qui sotto e di': **"Dagli un'occhiata e mandalo a <Te>."**

## Regole

- **Prezzo per rilascio.** Le voci di un rilascio ne descrivono il perimetro e non hanno un prezzo proprio.
- **Accordi già presi** per email o a voce: controlla che il PDF li riporti come li ricorda <Nome>.
- **Numeri come sono.** Se chiede se un prezzo è giusto o se si può scendere: è una domanda per <Te>, mettila nel file.
- **Esclusioni.** Quello che è fuori l'ha deciso <Nome>: ricordaglielo citando la sua risposta. Se ha cambiato idea, è una domanda.
- **Tono.** Italiano, del tu, frasi brevi, niente gergo. Usa il glossario.
- **Riservatezza.** Nel file solo domande sul preventivo: niente dati personali di terzi, niente contenuti di email.

## Formato di `domande-sul-preventivo.md`

# Domande sul preventivo <Progetto>
- Da: <Nome>, con <AI> · Data: AAAA-MM-GG
## Buchi
- **[codice domanda]** Cosa aveva scelto → cosa manca → la domanda
## Scostamenti
- **[codice domanda]** Cosa aveva scelto → cosa dice il preventivo → la domanda
## Altre domande
## Va bene così

---

# Contesto

## Il preventivo in breve
<tabella: rilascio · cosa porta · prezzo · online; poi pagamenti, tempi, condizioni principali>

## Mappa delle richieste
| Domande | Scelta di <Nome> | Nel preventivo |
|---|---|---|
| A1 | <scelta> | <rilascio / sviluppo successivo / fuori> |

## Fuori dal preventivo
<sviluppi successivi ed esclusioni, ciascuno con la risposta del cliente che lo ha deciso>

## Glossario
````
