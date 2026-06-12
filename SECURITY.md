# Security Policy

## Supported Versions

| Version | Supported          |
| ------- | ------------------ |
| 0.4.x   | :white_check_mark: |
| < 0.4   | :x:                |

## Reporting a Vulnerability

**Please do not report security vulnerabilities through public GitHub issues.**

### Private Disclosure

1. **Email**: Send details to security@8router (or create private security advisory on GitHub)
2. **Include**:
   - Type of vulnerability
   - Steps to reproduce
   - Potential impact
   - Suggested fix (if any)

### Response Timeline

- **Initial Response**: Within 48 hours
- **Status Update**: Within 7 days
- **Fix Release**: Depends on severity
  - Critical: 1-3 days
  - High: 7-14 days
  - Medium: 14-30 days
  - Low: Next release cycle

## Security Best Practices

### For Users

1. **OAuth Credentials**
   - Replace all placeholder credentials with your own
   - Never commit real credentials to version control
   - Rotate API keys regularly

2. **Network Security**
   - Run behind reverse proxy with HTTPS in production
   - Use firewall to restrict port 20127 access
   - Enable rate limiting on reverse proxy

3. **Updates**
   - Keep 8Router updated to latest version
   - Monitor security advisories
   - Subscribe to release notifications

4. **API Keys**
   - Generate unique API keys per user/tool
   - Revoke unused keys promptly
   - Monitor usage logs for anomalies

### For Developers

1. **Input Validation**
   - Validate all user inputs
   - Sanitize data before database operations
   - Use parameterized queries

2. **Authentication**
   - Implement proper session management
   - Use secure password hashing (bcrypt)
   - Enable 2FA where possible

3. **Secrets Management**
   - Use environment variables for secrets
   - Never hardcode credentials
   - Add sensitive files to .gitignore

4. **Dependencies**
   - Regularly run `npm audit`
   - Update dependencies promptly
   - Review dependency licenses

## Known Security Considerations

### 1. OAuth Secrets in Code

**Status**: Mitigated

Original 9router included hardcoded OAuth credentials. 8Router has replaced these with placeholders. Users must supply their own credentials.

**Action Required**: Replace placeholders in:
- `open-sse/config/providers.js`
- `src/lib/oauth/constants/oauth.js`

### 2. Database Encryption

**Status**: User Responsibility

SQLite database (`data/8router.db`) is not encrypted by default.

**Mitigation**:
- Use encrypted filesystem
- Set proper file permissions: `chmod 600 data/8router.db`
- Regular backups to secure location

### 3. API Key Storage

**Status**: Secure

API keys are hashed using bcrypt before database storage.

**Note**: Original plaintext keys are only visible at generation time.

### 4. MITM Attack Surface

**Status**: User Responsibility

HTTP traffic on port 20127 is unencrypted by default.

**Mitigation**:
- Deploy behind HTTPS reverse proxy (nginx/caddy)
- Use local-only binding (127.0.0.1) when possible
- VPN for remote access

### 5. Rate Limiting

**Status**: Partially Implemented

Built-in rate limiting exists but may need tuning.

**Recommendation**:
- Configure reverse proxy rate limits
- Monitor usage metrics
- Set per-user quotas in dashboard

## Security Features

### Implemented

- ✅ Password hashing (bcrypt)
- ✅ API key authentication
- ✅ Request logging
- ✅ Input sanitization
- ✅ CORS configuration
- ✅ Session management

### Planned

- 🔄 2FA support
- 🔄 IP whitelisting
- 🔄 Advanced rate limiting
- 🔄 Audit logging
- 🔄 Database encryption option

## Vulnerability Disclosure Timeline

1. **Day 0**: Vulnerability reported privately
2. **Day 1-2**: Initial assessment and acknowledgment
3. **Day 3-7**: Develop and test fix
4. **Day 7-14**: Release patched version
5. **Day 14**: Public disclosure (if severity warrants)

## Security Hall of Fame

Contributors who responsibly disclose vulnerabilities will be recognized here.

*No reports yet - be the first!*

## Automated Security

### GitHub Security Features

- ✅ Dependabot alerts enabled
- ✅ Secret scanning enabled
- ✅ Code scanning (CodeQL) enabled

### CI/CD Security

```yaml
# .github/workflows/security.yml
name: Security Scan
on: [push, pull_request]
jobs:
  audit:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - run: npm audit
      - run: npm audit --audit-level=moderate
```

## Compliance

8Router aims to be compatible with:
- OWASP Top 10 best practices
- CWE/SANS Top 25
- NIST Cybersecurity Framework

## Contact

- **Security Email**: security@8router (if configured)
- **GitHub Security Advisory**: Use private vulnerability reporting
- **General Issues**: Public GitHub Issues (non-security only)

---

**Last Updated**: 2026-06-12

**Thank you for helping keep 8Router secure!** 🔒
