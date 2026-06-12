#!/usr/bin/env node

// Postinstall: warm-up SQLite deps into ~/.8router/runtime so the first
// `8router` start doesn't need network. Failure here is non-fatal —
// cli.js will retry at runtime if anything is missing.
const { ensureSqliteRuntime } = require("./sqliteRuntime");
const { ensureTrayRuntime } = require("./trayRuntime");

try {
  ensureSqliteRuntime({ silent: false });
  console.log("[8router] runtime SQLite deps ready");
} catch (e) {
  console.warn(`[8router] runtime warm-up skipped: ${e.message}`);
}

try {
  ensureTrayRuntime({ silent: false });
} catch (e) {
  console.warn(`[8router] tray runtime skipped: ${e.message}`);
}

process.exit(0);
