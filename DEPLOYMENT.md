# 8Router Deployment Guide

## Quick Deploy Options

### 1. Local Development

```bash
# Clone repository
git clone https://github.com/sickagents/8router.git
cd 8router

# Install dependencies
npm install

# Start development server
PORT=20127 NEXT_PUBLIC_BASE_URL=http://localhost:20127 npm run dev
```

Dashboard available at: `http://localhost:20127`

### 2. Production Build

```bash
# Build for production
npm run build

# Start production server
PORT=20127 HOSTNAME=0.0.0.0 NEXT_PUBLIC_BASE_URL=http://localhost:20127 npm run start
```

### 3. Docker Deployment

```bash
# Build Docker image
docker build -t 8router .

# Run container
docker run -d \
  -p 20127:20127 \
  -v 8router-data:/app/data \
  --name 8router \
  8router
```

### 4. Docker Compose

```yaml
version: '3.8'
services:
  8router:
    image: 8router:latest
    ports:
      - "20127:20127"
    volumes:
      - 8router-data:/app/data
    environment:
      - PORT=20127
      - HOSTNAME=0.0.0.0
      - NEXT_PUBLIC_BASE_URL=http://localhost:20127
    restart: unless-stopped

volumes:
  8router-data:
```

## Environment Variables

| Variable | Default | Description |
|----------|---------|-------------|
| `PORT` | `20127` | Server port |
| `HOSTNAME` | `localhost` | Server hostname |
| `NEXT_PUBLIC_BASE_URL` | `http://localhost:20127` | Public base URL |
| `DATABASE_PATH` | `./data/8router.db` | SQLite database path |

## Cloud Deployment

### Vercel

1. Fork this repository
2. Import to Vercel
3. Set environment variables:
   - `PORT=20127`
   - `NEXT_PUBLIC_BASE_URL=https://your-domain.vercel.app`
4. Deploy

### Railway

1. Create new project from GitHub
2. Add variables:
   - `PORT=20127`
   - `HOSTNAME=0.0.0.0`
3. Deploy

### DigitalOcean App Platform

1. Create new app from GitHub
2. Configure:
   - Port: `20127`
   - Build command: `npm run build`
   - Run command: `npm run start`
3. Deploy

## Post-Deployment

1. Access dashboard at `http://your-domain:20127`
2. Connect AI providers (Kiro AI, OpenCode Free, etc.)
3. Copy API key from dashboard
4. Configure your CLI tools:
   ```
   Endpoint: http://your-domain:20127/v1
   API Key: [from dashboard]
   Model: kr/claude-sonnet-4.5
   ```

## Troubleshooting

### Port already in use
Change port in environment variables or kill existing process:
```bash
lsof -ti:20127 | xargs kill -9
```

### Database locked
Stop all instances and remove lock:
```bash
rm -f data/8router.db-wal data/8router.db-shm
```

### OAuth secrets missing
Update placeholder secrets in:
- `open-sse/config/providers.js`
- `src/lib/oauth/constants/oauth.js`

## Security Notes

- **OAuth Secrets**: Replace placeholder values with your own credentials
- **API Keys**: Rotate regularly via dashboard
- **HTTPS**: Use reverse proxy (nginx/caddy) for production
- **Firewall**: Restrict port 20127 to trusted sources if needed

## Performance Tuning

### Node.js Memory
```bash
NODE_OPTIONS="--max-old-space-size=4096" npm run start
```

### Database Optimization
```bash
# Vacuum database periodically
sqlite3 data/8router.db "VACUUM;"
```

## Monitoring

Access logs at:
- Console: Real-time stdout
- Database: Request history in SQLite
- Dashboard: `/dashboard/usage`

## Backup

```bash
# Backup database
cp data/8router.db data/8router.db.backup

# Restore
cp data/8router.db.backup data/8router.db
```

## Support

- GitHub Issues: https://github.com/sickagents/8router/issues
- Original 9router: https://github.com/decolua/9router
