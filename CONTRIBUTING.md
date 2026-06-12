# Contributing to 8Router

Thank you for considering contributing to 8Router! This document provides guidelines and instructions for contributing.

## Getting Started

1. **Fork the repository**
   ```bash
   git clone https://github.com/YOUR_USERNAME/8router.git
   cd 8router
   ```

2. **Install dependencies**
   ```bash
   npm install
   ```

3. **Create a branch**
   ```bash
   git checkout -b feature/your-feature-name
   ```

## Development Workflow

### Running Locally

```bash
# Development mode with hot reload
PORT=20127 npm run dev

# Production build test
npm run build
PORT=20127 npm run start
```

### Code Structure

```
8router/
├── cli/                 # CLI tool code
├── open-sse/           # Core routing engine
│   ├── config/         # Provider configurations
│   ├── executors/      # Provider-specific executors
│   ├── handlers/       # Request handlers
│   ├── rtk/            # RTK token compression
│   └── translator/     # Format translation
├── src/
│   ├── app/            # Next.js app routes
│   ├── lib/            # Shared libraries
│   ├── shared/         # UI components
│   └── sse/            # SSE streaming
└── tests/              # Test suites
```

## What to Contribute

### High Priority
- **New AI Provider Support**: Add executors for new providers
- **Bug Fixes**: Fix issues reported in GitHub Issues
- **Documentation**: Improve setup guides and API docs
- **Performance**: Optimize RTK compression or routing logic

### Medium Priority
- **UI/UX Improvements**: Enhance dashboard design
- **Testing**: Add unit/integration tests
- **i18n**: Add translations for new languages

### Low Priority
- **Examples**: Add example configurations
- **Tooling**: Improve build/deploy scripts

## Adding a New Provider

1. Create executor in `open-sse/executors/your-provider.js`:
```javascript
export default async function yourProviderExecutor(requestBody, authInfo, options) {
  // Implementation
  return {
    stream: responseStream,
    headers: responseHeaders
  };
}
```

2. Register in `open-sse/executors/index.js`:
```javascript
import yourProvider from './your-provider.js';
export const executors = {
  // ...
  'your-provider': yourProvider
};
```

3. Add provider config in `open-sse/config/providers.js`:
```javascript
{
  id: 'your-provider',
  name: 'Your Provider',
  type: 'api',
  baseUrl: 'https://api.yourprovider.com',
  // ...
}
```

4. Add tests in `tests/unit/your-provider.test.js`

## Testing

```bash
# Run all tests
npm test

# Run specific test
npm test -- tests/unit/your-test.test.js

# Watch mode
npm test -- --watch
```

## Code Style

- **JavaScript**: Follow existing ESLint config
- **Commits**: Use conventional commits format
  ```
  feat: add new provider support
  fix: resolve token refresh issue
  docs: update deployment guide
  ```
- **Formatting**: Run prettier before commit
  ```bash
  npm run format
  ```

## Pull Request Process

1. **Update documentation** if needed
2. **Add tests** for new features
3. **Ensure all tests pass**
4. **Update CHANGELOG.md** with your changes
5. **Submit PR** with clear description:
   ```markdown
   ## Description
   Brief description of changes
   
   ## Type of Change
   - [ ] Bug fix
   - [ ] New feature
   - [ ] Breaking change
   - [ ] Documentation update
   
   ## Testing
   How to test the changes
   
   ## Checklist
   - [ ] Tests pass
   - [ ] Documentation updated
   - [ ] CHANGELOG.md updated
   ```

## Provider Credentials

**IMPORTANT**: Never commit real OAuth credentials or API keys.

- Use placeholders: `YOUR_CLIENT_ID`, `YOUR_CLIENT_SECRET`
- Add credentials to `.env.example` with dummy values
- Document required credentials in provider docs

## Issue Reporting

When reporting bugs, include:
- **Environment**: OS, Node version, 8Router version
- **Steps to reproduce**: Clear, numbered steps
- **Expected behavior**: What should happen
- **Actual behavior**: What actually happens
- **Logs**: Relevant error messages or console output

## Feature Requests

For new features, explain:
- **Use case**: Why is this needed?
- **Proposed solution**: How should it work?
- **Alternatives**: What other approaches exist?
- **Impact**: Who benefits from this?

## Code of Conduct

- Be respectful and inclusive
- Focus on constructive feedback
- Help others learn and grow
- Keep discussions on-topic

## Recognition

Contributors will be:
- Listed in CONTRIBUTORS.md
- Mentioned in release notes
- Credited in relevant documentation

## Questions?

- Open a Discussion on GitHub
- Check existing Issues and PRs
- Review original 9router docs: https://github.com/decolua/9router

## License

By contributing, you agree that your contributions will be licensed under the same license as the project (see LICENSE file).

---

**Thank you for contributing to 8Router!** 🚀
