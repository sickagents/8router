# Changelog

All notable changes to 8Router will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- Comprehensive documentation (DEPLOYMENT.md, CONTRIBUTING.md, SECURITY.md, COMPARISON.md)
- Docker support with multi-stage build
- Docker Compose configuration with volumes and healthcheck
- GitHub Actions CI/CD workflows (lint, build, test, Docker build)
- GitHub Actions security workflows (npm audit, CodeQL)
- .env.example configuration template
- .dockerignore for optimized Docker builds

### Changed
- Port changed from 20128 (9router) to 20127
- All branding updated from 9router to 8router
- OAuth credentials replaced with placeholders for security
- README updated with documentation links and correct repo references
- Support section points to sickagents/8router repository

### Security
- Removed hardcoded OAuth credentials (now user-supplied)
- Added security policy and best practices documentation

## [0.1.0] - 2026-06-12

### Added
- Initial fork from [9router](https://github.com/decolua/9router)
- Independent deployment capability on port 20127
- Clean credential separation for security

### Changed
- Forked from decolua/9router with minimal modifications
- Sanitized OAuth secrets before initial commit

[Unreleased]: https://github.com/sickagents/8router/compare/v0.1.0...HEAD
[0.1.0]: https://github.com/sickagents/8router/releases/tag/v0.1.0
