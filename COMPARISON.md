# 8Router vs 9Router - What's Different?

8Router is a friendly fork of [9router](https://github.com/decolua/9router) with minor adjustments for independent deployment.

## Key Changes

### 1. Port Change
- **9router**: `20128`
- **8router**: `20127`

Why: Avoid port conflicts when running both versions simultaneously for testing or migration.

### 2. Branding
- All `9router` references → `8router`
- Logo renamed: `images/8router.png`
- Package name: `8router-app`

### 3. OAuth Credentials
- **9router**: Included working OAuth credentials for some providers
- **8router**: Replaced with placeholders (`YOUR_CLIENT_ID`, `YOUR_CLIENT_SECRET`)

Why: Security best practice - users should supply their own credentials.

### 4. Default Configuration
- Same routing logic
- Same RTK token compression
- Same provider support (40+ providers, 100+ models)
- Same dashboard UI

## Feature Parity

| Feature | 9router | 8router |
|---------|---------|---------|
| RTK Token Saver | ✅ | ✅ |
| Multi-Provider Support | ✅ | ✅ |
| Auto Fallback | ✅ | ✅ |
| Quota Tracking | ✅ | ✅ |
| Dashboard UI | ✅ | ✅ |
| CLI Tools Integration | ✅ | ✅ |
| MITM Support | ✅ | ✅ |
| Docker Support | ✅ | ✅ |
| Port | 20128 | 20127 |
| OAuth Credentials | Included | User-supplied |

## Why Fork?

1. **Independent Deployment**: Run alongside 9router without conflicts
2. **Security**: Clean credential separation
3. **Customization**: Easier to maintain custom modifications
4. **Learning**: Educational fork for understanding router architecture

## Migration from 9router

### Quick Switch

```bash
# Stop 9router
# (if running on same machine)

# Clone 8router
git clone https://github.com/sickagents/8router.git
cd 8router

# Copy database (optional)
cp ~/.9router/data/9router.db ./data/8router.db

# Install and run
npm install
PORT=20127 npm run dev
```

### Update CLI Tools

Change endpoint in your tools:
```diff
- Endpoint: http://localhost:20128/v1
+ Endpoint: http://localhost:20127/v1
```

### Database Migration

8router uses same SQLite schema. You can:

1. **Copy database**:
   ```bash
   cp ~/.9router/data/9router.db ~/.8router/data/8router.db
   ```

2. **Export/Import providers**:
   ```bash
   # From 9router dashboard
   Settings → Export Configuration
   
   # To 8router dashboard
   Settings → Import Configuration
   ```

## Compatibility

### API Compatibility
- ✅ Same OpenAI-compatible `/v1/chat/completions` endpoint
- ✅ Same Claude-compatible `/v1/messages` endpoint
- ✅ Same model naming convention
- ✅ Same authentication mechanism

### Configuration Compatibility
- ✅ Provider configs are compatible
- ✅ Model aliases are compatible
- ✅ Combo routing is compatible

### Breaking Changes
- ❌ Port number (easily changed)
- ❌ Database path (migration supported)
- ❌ Branding strings (cosmetic only)

## When to Use 8Router vs 9Router?

### Use 9Router if:
- You want official releases and updates
- You need community support and documentation
- You prefer the original project name and branding
- You want included OAuth credentials for quick testing

### Use 8Router if:
- You want to run alongside 9router
- You prefer security-first approach (no hardcoded credentials)
- You need independent customization
- You want to learn router internals through fork

## Contributing

- **8Router changes**: Submit PR to [sickagents/8router](https://github.com/sickagents/8router)
- **Core features**: Consider contributing to upstream [decolua/9router](https://github.com/decolua/9router)

We aim to stay compatible with 9router's core architecture while allowing independent evolution.

## Upstream Sync

8Router periodically syncs with 9router to incorporate:
- Bug fixes
- New provider support
- Performance improvements
- Security patches

Major version bumps are reviewed individually.

## Support

- **8Router Issues**: [GitHub Issues](https://github.com/sickagents/8router/issues)
- **9Router Docs**: [Original Documentation](https://github.com/decolua/9router)
- **General Questions**: Check both repositories' discussions

## License

Both 8Router and 9Router share the same license. See LICENSE file.

## Credits

8Router is built upon the excellent work of the 9router project and its contributors. We maintain this fork with respect to the original vision while serving specific deployment needs.

**Original Project**: [decolua/9router](https://github.com/decolua/9router)

---

**Last Updated**: 2026-06-12
