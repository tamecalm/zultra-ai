# Security Policy

## Supported Versions

We actively support the latest version of Zultra AI. Security updates and patches are applied to the current major version.

| Version | Supported          |
| ------- | ------------------ |
| 1.x.x   | :white_check_mark: |
| < 1.0   | :x:                |

## Reporting a Vulnerability

We take security seriously at Zultra Labs. If you discover a security vulnerability, please help us protect our users by reporting it responsibly.

### How to Report

Please do not report security vulnerabilities through public GitHub issues.

Instead, please report security vulnerabilities by emailing:

security@zultra.dev

Include the following information in your report:
- Type of vulnerability
- Full paths of source file(s) related to the vulnerability
- Location of the affected source code (tag/branch/commit or direct URL)
- Step-by-step instructions to reproduce the issue
- Proof-of-concept or exploit code (if possible)
- Impact of the vulnerability and how an attacker might exploit it

### What to Expect

- Acknowledgment: We will acknowledge receipt of your vulnerability report within 48 hours
- Updates: We will provide regular updates on our progress as we investigate and address the issue
- Resolution: We will work to release a fix as quickly as possible, depending on the complexity and severity
- Credit: With your permission, we will publicly credit you for the responsible disclosure

## Security Best Practices

When using Zultra AI, we recommend:

1. API Key Security: Store your Gemini API key securely and never commit it to version control
2. Regular Updates: Keep Zultra updated to the latest version to receive security patches
3. Review Changes: Use --dry-run flag to preview code changes before applying them
4. Backup Files: Use --backup flag when editing critical files
5. Access Control: Restrict access to your ~/.nuvon/config.json file where API keys are stored

## Data Privacy

- Zultra stores your Gemini API key locally in ~/.nuvon/config.json
- No code or personal data is collected by Zultra itself
- All AI processing is done through Google's Gemini API
- Review [Google's Privacy Policy](https://policies.google.com/privacy) for information about how Gemini handles your data

## Third-Party Dependencies

Zultra relies on third-party packages. We regularly monitor and update dependencies to address known vulnerabilities. You can check for outdated or vulnerable dependencies by reviewing our package.json and running security audits.

---

Thank you for helping keep Zultra and our community safe.