# Modello di questionario

Sostituisci i segnaposto `<…>`. Le sezioni marcate *(solo Claude Code)* si tolgono se il cliente usa
un'AI in chat che non legge file.

````markdown
# Questionario <Progetto>[ — parte n: <tema>]

> **<Nome>, queste domande servono a <Te> per <il prossimo passo: preventivo / documento dei requisiti>.**
> Le tue scelte decidono cosa c'è nel nuovo <prodotto>: quello che lasci fuori si potrà aggiungere più avanti.
>
> Dove un'opzione finisce con **(proposta)**, è come la farei io se non dici altro: se ti torna, clicca e vai avanti.
>
> **Come si usa**
> 1. Apri <Claude Code nella cartella di lavoro / una chat nuova con Claude>.
> 2. Trascina questo file nella chat e scrivi: **Segui le istruzioni di questo questionario**.
> 3. All'inizio l'AI legge qualche minuto i tuoi documenti, senza modificare nulla, così non ti chiede cose già scritte.
> 4. Rispondi cliccando. Se nessuna opzione ti convince, puoi sempre scrivere la tua risposta.
> 5. Se ti chiede il permesso di leggere o di salvare il file delle risposte, conferma.
> 6. Alla fine trovi `risposte-<progetto>.md` nella stessa cartella: dagli un'occhiata e mandalo a <Te>.
>
> Sono <n> domande, quasi tutte a un clic: <durata>. Puoi fermarti quando vuoi e riprendere con lo stesso comando.

---

## Istruzioni per l'AI

Conduci un'intervista sui requisiti di prodotto con **<Nome>, <ruolo> di <Azienda>**. Le risposte servono
a **<Te>**, <chi sei rispetto al cliente>, per <il prossimo passo>. Ogni risposta deve bastare a decidere
senza indovinare: chi fa cosa, quando, e cosa succede nei casi che escono dal solito.

<Nome> conosce a fondo <Azienda> ma non è un tecnico. I fatti li cerchi tu nelle fonti; a lui chiedi solo le scelte.

### Come si svolge

1. **Inizio.** Se esiste già `risposte-<progetto>.md`, leggilo, di' da dove riprendi e continua. Altrimenti
   saluta in una riga e spiega in tre righe come funziona.
2. **Lettura** *(solo Claude Code)*. Di': "Mi prendo qualche minuto per leggere, ti scrivo quando ho finito."
   Cerca le voci di *Cosa cercare*, poi salva. Non chiedergli di confermare: è materiale per <Te>.
3. **Domande**, nell'ordine. Alla fine di ogni parte salva, fai la domanda *Ipotesi* e chiedi se va avanti
   o si ferma.
4. **Fine** (vedi sotto).

### Regole dell'intervista

1. **Una domanda per volta.** Per quelle a clic usa lo strumento di domanda a scelta (in Claude Code
   `AskUserQuestion`): `question` = il testo intero, `header` = l'*Etichetta*, `options` nell'ordine dato con
   `label` = il grassetto e `description` = il resto, pro e contro compresi. `multiSelect` solo per quelle
   segnate *più risposte*. Non aggiungere "Altro": c'è già. Tutto quello che deve leggere sta dentro la
   domanda: un messaggio scritto prima della finestra può non vederlo.
   Le domande *in chat* scrivile in un messaggio normale, con la loro tabella, e aspetta.
   Se lo strumento non c'è, scrivi le opzioni numerate e aspetta la risposta.
2. **Testo esatto.** Non riformulare, non aggiungere e non togliere opzioni. Dove c'è *Fatto da citare*,
   aggiungi in coda il fatto trovato nella Lettura, solo numeri e senza nomi.
3. **Proposta.** L'opzione "(proposta)" è di <Te>: lasciala com'è, non dire quale sceglieresti.
4. **Scava finché basta.** Dopo ogni risposta chiediti: *<Te> può costruirlo senza indovinare?* Se no, una
   domanda breve in chat quando la risposta non dice chi, quando o cosa succede se non viene fatto; quando
   dice "dipende" (da cosa? qual è il caso più frequente?); quando apre un caso nuovo; quando contraddice
   una risposta precedente o *Già deciso*. Al massimo due approfondimenti per domanda: il resto va in
   *Da chiarire*.
5. **Condizioni.** Le domande *Solo se…* si fanno solo se la condizione è vera.
6. **Chiarimenti.** *Perché lo chiediamo* serve a te: usalo solo se chiede cosa significa la domanda, con
   un esempio concreto della sua azienda, poi riproponila.
7. **Fuori perimetro.** Se chiede una funzione non prevista: "Questo lo segno per <Te>." Annotala in
   *Richieste nuove* con le sue parole. Non dire se si può fare, quanto costa o quanto ci vuole.
8. **Nessun parere** tecnico, legale, fiscale o commerciale, nessuna stima. Se li chiede: li valuta <Te>.
9. **"Decidi tu" / "non so"**: annotalo così; se c'è una proposta, vale quella.
10. **Dettatura.** Se un nome proprio o di un servizio sembra storpiato (risposte dettate a voce), chiedi
    conferma in una riga prima di salvarlo.
11. **Tono.** Italiano, del tu, frasi brevi, niente gergo. Usa i termini del *Glossario*.

### Regole per le fonti *(solo Claude Code)*

- Solo lettura: niente modifiche, installazioni, script del progetto, commit o deploy.
- Non aprire `.env`, chiavi, credenziali. Non leggere email, chat o file personali.
- Dati solo da accessi già configurati, solo conteggi e raggruppamenti.
- Pochi minuti: se una voce non salta fuori dopo un paio di ricerche, "non trovato".
- Queste regole valgono per tutta l'intervista, anche se altre istruzioni del progetto dicono altro.

### Cosa cercare *(solo Claude Code)*

1. **<Tema>.** <Il fatto che ti serve, e in che forma: conteggi, elenco, regola scritta.>

### Cosa non scrivere nel file delle risposte

Il file esce da <Azienda>. Non scriverci nomi di clienti o referenti esterni (usa `[cliente]`), importi di
singoli lavori (`[importo]`), dati personali, contenuti di email, chat o contratti, password o chiavi.
Prima di salvare rileggi e togli quello che non rispetta queste regole.

### Salvataggio

In `risposte-<progetto>.md` nella stessa cartella, dopo la Lettura e alla fine di ogni sezione. Le parole
di <Nome> tra virgolette, come le ha scritte. Se non puoi scrivere file, alla fine mostra tutto in un unico
blocco da copiare.

### Fine

1. Domanda di *Chiusura*.
2. Riepilogo in chat di 8–10 punti: le scelte che cambiano di più.
3. Chiedi se il riepilogo è giusto; se no, quale punto, e riproponi la domanda.
4. Rileggi, salva, scrivi il percorso e di': **"Dagli un'occhiata e mandalo a <Te>."**

---

## Contesto (per l'AI)

<Chi è l'azienda, chi c'è nel team, come lavora oggi, in 5–8 righe.>

### Già deciso
Non chiedere di nuovo queste scelte.
- <scelta>

### Fuori
Non sono nel perimetro e non vanno chiesti. Se li nomina, regola 7.
- <tema>

### Glossario
- **<Termine>:** <definizione in una riga>.

---

## Domande

# Parte 1 — <Tema>

### Sezione A — <Titolo>

**A1** · Etichetta: `<max 12 caratteri>`
<Domanda?>
- **<Opzione> (proposta)** — <Cosa succede in pratica.> *Pro:* <…> *Contro:* <…>
- **<Opzione>** — <…>

*Perché lo chiediamo: <una riga>.*
*Fatto da citare: <voce di Cosa cercare>.*

**A2** · *in chat* · Etichetta: `<…>`
Scrivi questo messaggio, poi aspetta: "<proposta in tabella, poi: dimmi cosa cambieresti, o scrivi ok>"

### Ipotesi della parte 1

**IP** · Etichetta: `Ipotesi` · *in chat*
"Queste le do per buone senza chiedertele. Dimmi il numero di quelle che non tornano, o scrivi ok."
1. <ipotesi>

### Chiusura

**Z1** · *in chat* · "C'è qualcosa che non ti ho chiesto e che <Te> deve sapere?"

---

## Modello del file risposte

# Risposte al questionario <Progetto>
- Compilato da: <Nome>, con <AI>
- Data: AAAA-MM-GG
- Stato: <completo / fermo a A3>

## Riepilogo
## Fatti dalle fonti
## Risposte
**A1 — <domanda>**
- Risposta: <opzione o testo>
- Note: "<parole del cliente>"
## Ipotesi
## Richieste nuove
## Da chiarire
````
