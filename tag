#!/usr/bin/env bash
set -euo pipefail

usage() {
  cat <<'EOF'
Usage: tag [-ar ARTIST] [-al ALBUM] [-t TITLE] <file.mp3> [file2.mp3 ...]

Set MP3 metadata using ffmpeg. All flags apply to every file given.
If -t is omitted, existing title metadata is preserved.
EOF
  exit 1
}

ARTIST=""
ALBUM=""
TITLE=""
HAS_TITLE=false

while [[ $# -gt 0 ]]; do
  case "$1" in
    -ar) ARTIST="$2"; shift 2 ;;
    -al) ALBUM="$2"; shift 2 ;;
    -t)  TITLE="$2"; HAS_TITLE=true; shift 2 ;;
    -h|--help) usage ;;
    --) shift; break ;;
    -*) echo "Unknown option: $1" >&2; usage ;;
    *)  break ;;
  esac
done

[[ $# -eq 0 ]] && echo "No files given." >&2 && usage

FILES=("$@")
TMPDIR=$(mktemp -d)
trap 'rm -rf "$TMPDIR"' EXIT

for f in "${FILES[@]}"; do
  [[ ! -f "$f" ]] && echo "Skipping (not a file): $f" >&2 && continue

  out="$TMPDIR/$(basename "$f")"
  cmd=(ffmpeg -y -i "$f")

  [[ -n "$ARTIST" ]] && cmd+=(-metadata artist="$ARTIST")
  [[ -n "$ALBUM" ]]  && cmd+=(-metadata album="$ALBUM")
  [[ "$HAS_TITLE" == true ]] && cmd+=(-metadata title="$TITLE")

  cmd+=(-codec copy "$out")

  "${cmd[@]}" </dev/null || { echo "Failed: $f" >&2; continue; }
  mv "$out" "$f"
done
