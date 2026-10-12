# xⁿ ExponentAce

> # ⚠️ This site has been retired
>
> **AlgebraAce and ExponentAce have graduated into [MathAce](https://math.pnpsolutions.ca/learn-math/)** —
> the comprehensive K–12 platform (256 skills, Grades 1–12) that contains every skill from
> both sites plus far more. All accounts, progress, and homework were migrated to the shared
> database and remain fully intact at **https://math.pnpsolutions.ca/learn-math/**.
>
> The old URLs now 301-redirect there. This repository is preserved as a historical archive
> and is no longer deployed or maintained. Active development continues in
> [`nszhang/learn-math`](https://github.com/nszhang/learn-math).

An interactive, IXL-inspired learning platform for **exponentiation and
logarithms**. Students practice randomly generated problems, climb an IXL-style
**SmartScore (0–100)** per skill, complete daily and teacher-assigned homework,
and earn medals, badges, and stars. Teachers assign exercises and track
per-student progress.

**Stack:** React 18 + Vite · Node.js + Express · PostgreSQL (JWT auth, bcrypt)
Sister project of AlgebraAce (same engine, math content swapped).

## Quick start

```bash
npm run setup        # install server + client deps
npm run db           # start PostgreSQL (docker compose)
npm run dev:server   # API on :3001
npm run dev:client   # React dev server on :5173 (proxies /api → :3001)
```

There is **no public signup** — accounts are created by an admin:

```bash
node server/scripts/create-admin.mjs [username] [password]
```

## Content

### 🎒 Students — 16 skills in 4 topics
| Topic | Skills |
|---|---|
| 🚀 Powers & bases | Evaluate powers, negative bases, zero & negative exponents |
| 🧬 Exponent rules | Product, quotient, power-of-a-power, mixed |
| 📈 Exponential equations | bˣ = v · bˣ⁺ᵏ = v · bᵃˣ = v |
| 🔢 Logarithms | Evaluate logs, log⇔exp conversion, solve log equations, combine logs, ln & e |

### 🎓 Learn section
- **Step-by-step animated solver** for 4 equation families (bˣ=v, bˣ⁺ᵏ=v,
  log_b(x)=m, log_b(x+k)=m) with Play/Pause/Back/Step and speed control
- **Graph playground**: plot `y = a·bˣ` and `y = a·log_b(x)` with sliders +
  steppers for a and b, key points marked ((0,a), (1,a·b), (1,0), (b,a)),
  and scroll-wheel zoom (0.1×–1000×) with adaptive grid

### 🍎 Teachers / ⚙️ Admins
Same engine as AlgebraAce: homework assignment with due dates, per-student
progress dashboards, admin-managed accounts.

## Tests

```bash
npm test    # 13 E2E API tests (pg-mem, no DB needed)
```

Question generators verified over 48,000 generated problems; lesson engine over
20,000 generated lessons; 18 jsdom interaction tests for the animator and graph.

## Deployment

Production: https://math.pnpsolutions.ca/learn-exponent-and-log/ — see
`deploy.sh` (rsync code → build on server → restart systemd service → health
check). Code only; `server/.env` and the database are never touched.

Docker (self-contained): `docker compose up --build app` → http://localhost:3001


---

## 🌐 Site family

This site shares its user database with its sisters — **one login works on all
three** (accounts, passwords, and stars are unified; per-skill progress is
namespaced per site):

| Site | Focus | URL |
|---|---|---|
| **π MathAce** (flagship) | Grades 1–12, 256 skills, Desmos-style grapher | [math.pnpsolutions.ca/learn-math](https://math.pnpsolutions.ca/learn-math/) · [github.com/nszhang/learn-math](https://github.com/nszhang/learn-math) |
| ∑ AlgebraAce | Algebra (17 skills) | [math.pnpsolutions.ca/learning-algebra](https://math.pnpsolutions.ca/learning-algebra/) |
| xⁿ ExponentAce | Exponents & logarithms (16 skills) | [math.pnpsolutions.ca/learn-exponent-and-log](https://math.pnpsolutions.ca/learn-exponent-and-log/) |

The **comprehensive platform documentation** (architecture, API reference,
data model, deployment, content-authoring guide) lives in the flagship repo:
`nszhang/learn-math` (https://github.com/nszhang/learn-math).
