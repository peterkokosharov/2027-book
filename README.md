# The Smith's Peace

*An Epic of the Compute Age, 2022–2027*  
*Peter Kokosharov*

© 2026 Peter Kokosharov. Licensed under CC BY-NC-SA 4.0.

**Read online:** [English](https://peterkokosharov.github.io/2027-book/) · [Български](https://peterkokosharov.github.io/2027-book/index.bg.html)

## Read it

The book is in the `source/` folder, split by acts:

**English (original):**
- `00-title.md` — title page
- `00a-note.md` — author's note
- `01-act-i-the-fire.md` — Act I: The Fire (Apr 2022 – Mar 2023)
- `02-act-ii-the-five-days.md` — Act II: The Five Days (Mar 2023 – May 2024)
- `03-act-iii-the-arming-of-nations.md` — Act III: The Arming of Nations (May 2024 – Nov 2024)
- `04-act-iv-the-tower.md` — Act IV: The Tower (Nov 2024 – Feb 2025)
- `05-act-v-the-meter.md` — Act V: The Meter (Feb 2025 – late 2026)

**Bulgarian (author's translation):**
- `00-bg-front.md` — front matter
- `01-bg-act-1.md` through `05-bg-act-5.md` — Acts I–V (Действие I–V)
- `90-glossary.md` — glossary of terms, names, conventions

## Review it

The `review-kit/` folder holds a fixed prompt and a script so any language model can review the book the same way; see `review-kit/README.md`. From this folder:

```bash
python review-kit/review_llm.py --dry-run
```

This finds the book (concatenated from `source/` in name order, without any "Reviews" chapter), checks the size, and sends nothing. You can also name the file:
```bash
python review-kit/review_llm.py path/to/book.html
```

Post the review in this repository's Discussions, name the model, and say whether the run was clean (a fresh session, nothing before the book) or had prior context.

## License

Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International (CC BY-NC-SA 4.0). You may read and share this work freely. You may translate and adapt it, with attribution and under the same licence. You may not sell it or use it commercially without the author's written permission.

(c) Peter Kokosharov