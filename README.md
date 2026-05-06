# parity-trade-orderbook-mesh

`parity-trade-orderbook-mesh` explores trading systems with a small Zig codebase and local fixtures. The technical goal is to design a Zig verification harness for orderbook systems, covering protocol validation, framed sample traffic, and failure-oriented tests.

## Reason For The Project

I want this repository to be useful as a quick reading exercise: fixtures first, implementation second, verifier last.

## Parity Trade Orderbook Mesh Review Notes

`stress` and `baseline` are the cases worth reading first. They show the optimistic and cautious ends of the fixture.

## What It Does

- `fixtures/domain_review.csv` adds cases for spread pressure and fill risk.
- `metadata/domain-review.json` records the same cases in structured form.
- `config/review-profile.json` captures the read order and the two review questions.
- `examples/parity-trade-orderbook-walkthrough.md` walks through the case spread.
- The Zig code includes a review path for `fill risk` and `spread pressure`.
- `docs/field-notes.md` explains the strongest and weakest cases.

## How It Is Put Together

The implementation keeps the scoring rule plain: reward signal and confidence, preserve slack, penalize drag, then classify the result into a review lane.

The Zig addition stays small enough to inspect in one sitting.

## Run It

```powershell
powershell -NoProfile -ExecutionPolicy Bypass -File scripts/verify.ps1
```

## Check It

The same command runs the local verification path. The highest-scoring domain case is `stress` at 224, which lands in `ship`. The most cautious case is `baseline` at 148, which lands in `ship`.

## Boundaries

The fixture set is small enough to audit by hand. The next useful expansion is malformed input coverage, not extra surface area.
