#!/bin/sh
# Serve the web-app at /cat/ to match production path.
# Usage: ./dev.sh [port]   (default port: 8080)

PORT=${1:-8080}
TMPDIR=$(mktemp -d)
ln -s "$(cd "$(dirname "$0")" && pwd)" "$TMPDIR/cat"

echo "Dev server: http://localhost:$PORT/cat/"
echo "Serving via $TMPDIR (Ctrl-C to stop)"

cd "$TMPDIR" && python3 -m http.server "$PORT"
rm -rf "$TMPDIR"
