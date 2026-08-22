# Journal agent instructions

## Product boundary

This repository is the canonical source for Journal by Significant Hobbies, a
local-first private iPhone and iPad writing app. Preserve the existing bundle
identifier and versioned atlas document. Optional Hub synchronization must not
replace the local store or expose journal text in Hub summaries.

## Commands

```bash
./scripts/check.sh
```

Do not deploy, upload to App Store Connect, migrate local records, or change
signing identities without explicit operator approval.
