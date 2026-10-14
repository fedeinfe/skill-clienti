# Skill per gestire un cliente con l'AI

Il metodo con cui ho portato un cliente vero dal primo meeting al codice in produzione, con Claude in
ogni passo: dalla trascrizione del meeting al contratto firmato, dal PRD validato allo sviluppo.

| Passo | Skill | Cosa fa |
|---|---|---|
| 1 | `cliente-kickoff` | Dalla trascrizione del meeting al progetto: glossario, analisi di quello che esiste, cosa manca |
| 2 | `cliente-questionario` | Un questionario che il cliente compila parlando con la sua AI, una domanda a un clic per volta |
| 3 | `cliente-messaggi` | Ogni mail e messaggio scritto con tutto il contesto del progetto, e i documenti aggiornati dopo |
| 4 | `cliente-preventivo` | Rilasci a prezzo fisso, preventivo in PDF e un file con cui l'AI del cliente lo controlla |
| 5 | `cliente-prd` | Il PRD dalle risposte: ogni regola con la sua fonte, i punti aperti con una proposta |

Dal PRD in poi lo sviluppo segue le skill di [Matt Pocock](https://github.com/mattpocock/skills):
`/to-tickets` per spezzarlo in ticket, `/implement` con `/tdd` per costruirli.

## Installazione

```bash
npx skills add fedeinfe/skill-clienti
```

Oppure copia le cartelle di `skills/` in `~/.claude/skills/` (per tutti i progetti) o in
`.claude/skills/` del progetto del cliente.

## Come si usa

Una cartella per cliente, aperta in Claude Code. Poi, nell'ordine:

1. Registra il primo meeting (Wispr Flow, Granola, il telefono) e incolla la trascrizione:
   *"Nuovo cliente, ecco la trascrizione del meeting."*
2. *"Prepara il questionario per il cliente."* Lo mandi, lui lo trascina nella sua AI, ti torna un file
   di risposte. Si ripete finché serve: di solito un giro per il preventivo e uno per i requisiti.
3. Ogni messaggio del cliente lo incolli lì: *"Mi ha scritto questo, rispondigli."*
4. *"Fammi il preventivo."* Insieme al PDF mandi il file di contesto per la sua AI.
5. *"Le risposte sui requisiti sono arrivate: scrivi il PRD."* Lo validi con il cliente, poi
   `/to-tickets`.

Il cliente non deve saper usare Claude Code: basta che sappia trascinare un file in una chat.
