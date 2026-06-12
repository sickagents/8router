# Docker

Run 8Router in a container. Published image: [`decolua/8router`](https://hub.docker.com/r/decolua/8router) — multi-platform `linux/amd64` + `linux/arm64`.

---

# 👤 For Users

## Quick start

```bash
docker run -d \
  -p 20127:20127 \
  -v "$HOME/.8router:/app/data" \
  -e DATA_DIR=/app/data \
  --name 8router \
  decolua/8router:latest
```

App listens on port `20127`. Open: http://localhost:20127

## Manage container

```bash
docker logs -f 8router        # view logs
docker stop 8router           # stop
docker start 8router          # start again
docker rm -f 8router          # remove
```

## Data persistence

```bash
-v "$HOME/.8router:/app/data" \
-e DATA_DIR=/app/data
```

Without `DATA_DIR`, the app falls back to `~/.8router/` (macOS/Linux) or `%APPDATA%\8router\` (Windows). In the container, `DATA_DIR=/app/data` makes the bind mount work.

Data layout under `$DATA_DIR/`:

```text
$DATA_DIR/
├── db/
│   ├── data.sqlite       # main SQLite database
│   └── backups/          # auto backups
└── ...                   # certs, logs, runtime configs
```

Host path: `$HOME/.8router/db/data.sqlite`
Container path: `/app/data/db/data.sqlite`

## Optional env vars

```bash
docker run -d \
  -p 20127:20127 \
  -v "$HOME/.8router:/app/data" \
  -e DATA_DIR=/app/data \
  -e PORT=20127 \
  -e HOSTNAME=0.0.0.0 \
  -e DEBUG=true \
  --name 8router \
  decolua/8router:latest
```

## Update to latest

```bash
docker pull decolua/8router:latest
docker rm -f 8router
# re-run the quick start command
```

---

# 🛠 For Developers

## Build image locally (test)

```bash
cd app && docker build -t 8router .

docker run --rm -p 20127:20127 \
  -v "$HOME/.8router:/app/data" \
  -e DATA_DIR=/app/data \
  8router
```

## Publish (automatic via CI)

Push a git tag `v*` → GitHub Actions builds multi-platform (amd64+arm64) and pushes to:
- `ghcr.io/decolua/8router:v{version}` + `:latest`
- `decolua/8router:v{version}` + `:latest`

```bash
# Use scripts/release.js (recommended)
node scripts/release.js "Release title" "Notes"

# Or manually
git tag v0.4.x && git push origin v0.4.x
```

Workflow: `app/.github/workflows/docker-publish.yml`
