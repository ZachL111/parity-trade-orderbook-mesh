# Parity Trade Orderbook Mesh Walkthrough

I use this file as a small checklist before changing the Zig implementation.

| Case | Focus | Score | Lane |
| --- | --- | ---: | --- |
| baseline | spread pressure | 148 | ship |
| stress | fill risk | 224 | ship |
| edge | portfolio drift | 190 | ship |
| recovery | quote width | 149 | ship |
| stale | spread pressure | 203 | ship |

Start with `stress` and `baseline`. They create the widest contrast in this repository's fixture set, which makes them better review anchors than the middle cases.

The next useful expansion would be a malformed fixture around fill risk and quote width.
