---
name: cliente-questionario
description: Scrive un questionario che il cliente compila parlando con la sua AI (Claude Code, Claude, ChatGPT) invece che su un modulo. Il file contiene le istruzioni per l'AI del cliente — leggere prima i suoi documenti, fare una domanda per volta a un clic, scavare quando la risposta non basta, salvare un file di risposte da rimandarti. Usala quando devi raccogliere requisiti, scelte o fatti da un cliente ("prepara le domande per il cliente", "questionario", "cosa devo chiedergli", "mandagli le domande"), anche per un secondo o terzo giro.
---

# cliente-questionario

Il cliente non compila un modulo: trascina un file nella sua AI e scrive **"Segui le istruzioni di questo
questionario"**. La sua AI lo intervista, una domanda per volta, e alla fine salva un file di risposte che
lui ti manda. Funziona perché:

- l'AI del cliente può leggere i **suoi** documenti (procedure, gestionale, fogli di calcolo) e non gli
  chiede quello che è già scritto: a lui restano solo le scelte;
- una domanda a un clic si risponde in tre secondi, un modulo da 40 campi si abbandona;
- quando la risposta è vaga, l'AI chiede "chi lo fa? quando? e se non succede?" al posto tuo;
- torni a casa con un file strutturato, con le parole esatte del cliente, pronto per il PRD.

## Prima di scrivere

Ti serve il materiale del progetto: trascrizione del meeting, `CONTEXT.md`, note, risposte precedenti
(vedi `cliente-kickoff`). Poi chiarisci con chi la usa, una cosa per volta:

1. **Cosa ti serve per andare avanti.** Il prossimo passo è un preventivo? Allora chiedi solo cosa c'è
   dentro e cosa resta fuori. È un PRD? Allora chiedi come si comporta ogni funzione già decisa.
   Domande che non servono al prossimo passo vanno in un giro successivo.
2. **Che AI usa il cliente.** Claude Code o Cowork leggono file e cartelle: il questionario può
   chiedere una fase di *Lettura*. Claude.ai o ChatGPT in chat no: niente lettura, solo domande,
   e le opzioni numerate al posto dei clic. Se non lo sai, scrivi per Claude Code e metti il ripiego.
3. **Cosa puoi decidere tu.** Ogni domanda a cui sai rispondere da solo (tecnologia, design, cose già
   dette nel meeting) non va chiesta: va in *Già deciso*, così il cliente la vede e può contestarla.

## Le domande

- **Solo scelte di prodotto, nel linguaggio del cliente.** Niente domande tecniche, niente prezzi,
  niente tempi: quelli li decidi tu nel preventivo. Usa i termini del suo glossario.
- **Una scelta per domanda**, 2–4 opzioni, la più probabile per prima. Ogni opzione: un'etichetta
  corta in grassetto e una frase che dice cosa succede in pratica.
- **La tua proposta** finisce con "(proposta)": se gli torna, clicca e va avanti. Dal secondo giro in
  poi quasi ogni domanda ne ha una: è il modo in cui un'intervista da 80 domande dura mezz'ora.
- **Pro e contro solo dove c'è un vero rovescio della medaglia**: una riga *Pro* e una *Contro* sotto
  ogni opzione. Mai il prezzo dell'opzione (è tuo); solo i costi che il cliente pagherebbe a servizi
  esterni.
- **Perché lo chiediamo**: una riga per l'AI, da usare solo se il cliente chiede spiegazioni.
- **Fatto da citare**: quando un numero dalle sue fonti rende la scelta concreta ("40 righe su 121 non
  seguono la regola"), chiedi all'AI di aggiungerlo in coda alla domanda.
- **Codici stabili** (`F2`, `H8`): il PRD e i ticket li citeranno. Se togli una domanda, non rinumerare.
- **Ipotesi** a fine parte: le cose che dai per buone senza chiederle, in un elenco che il cliente
  conferma o corregge in un colpo solo.
- Domande con una tabella o una proposta lunga (chi vede cosa, per ruolo) si fanno **in chat**, non a
  clic: il cliente risponde "ok" o corregge riga per riga.

Oltre le 30 domande dividi in parti da mezz'ora al massimo, ognuna con un punto in cui fermarsi.

## Struttura del file

Scrivi in `docs/discovery/questionario-<progetto>[-parte-n].md`, seguendo `references/modello.md`:

1. **Intestazione per il cliente** (in un riquadro, tre righe di perché e sei passi di "come si usa").
   È l'unica parte che legge lui.
2. **Istruzioni per l'AI**: come si svolge, regole dell'intervista, regole per le fonti, cosa cercare,
   cosa non scrivere nel file delle risposte, salvataggio, fine.
3. **Contesto**: chi è il cliente, cosa è già deciso, cosa è fuori, glossario.
4. **Domande**, divise in parti e sezioni.
5. **Modello del file risposte**.

Le regole che non si negoziano, perché senza l'intervista si rompe:

- **Testo esatto.** L'AI usa domande e opzioni come sono scritte, non aggiunge le sue, non dice quale
  sceglierebbe. Altrimenti stai facendo decidere la sua AI, non lui.
- **Solo lettura.** Le fonti si leggono e basta: niente modifiche, niente script, niente `.env`, niente
  email o chat personali. Il cliente sta dando accesso al suo lavoro: va scritto chiaro.
- **Riservatezza.** Il file delle risposte esce dall'azienda del cliente: niente nomi di clienti suoi,
  importi di singoli lavori, dati personali, contenuti di email o contratti. L'AI rilegge e pulisce
  prima di salvare.
- **Fuori perimetro.** Se il cliente chiede una funzione nuova, l'AI la annota con le sue parole in
  *Richieste nuove* e torna alla domanda. Non dice se si può fare né quanto costa.
- **Ripresa.** Salva dopo ogni sezione; se il file esiste già riparte da *Stato*.

## Prima di mandarlo

Fallo girare tu, in una sessione pulita, rispondendo come risponderebbe il cliente. Guarda: domande che
la sua AI riformula o salta, opzioni che non coprono il caso più comune, punti dove ti saresti fermato
a chiedere "e quindi?". Correggi, poi mandalo con un messaggio di tre righe (vedi `cliente-messaggi`).

Quando torna il file delle risposte, leggilo per intero prima di qualsiasi altra cosa e aggiorna il
glossario. Le contraddizioni con i giri precedenti diventano le prime domande del giro dopo, o i punti
aperti del PRD (vedi `cliente-prd`).
