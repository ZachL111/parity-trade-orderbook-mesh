# Field Notes

The fixture is small on purpose, which makes each domain case carry real weight.

The domain cases cover `spread pressure`, `fill risk`, `portfolio drift`, and `quote width`. They sit beside the smaller starter fixture so the project has both a compact scoring check and a domain-flavored review check.

The widest spread is between `fill risk` and `spread pressure`, so those are the first two cases I would preserve during a refactor.

The language-specific addition keeps the review model in native test blocks.
