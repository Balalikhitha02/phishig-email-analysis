# Phishing Analysis Report — Sample Email

**Sample ID**: sample_email.eml
**Date analyzed**: 15 Sep 2025 (exercise sample)

## Summary 
The email is a phishing attempt: sender domains and authentication fail, the link text is misleading and points to a non-Amazon domain, language uses urgency and threat of suspension.

## Phishing indicators found 
1. **Mismatched sender domains**: Display name claims "Amazon Support" but the `Return-Path` and `Reply-To` domains are `amaz0n-security.com` / `amaz0n.com` — not official `amazon.com`.
2. **SPF fail / DKIM missing / DMARC fail**: `Authentication-Results` shows `spf=fail`, `dkim=none`, `dmarc=fail` — technical authentication failures consistent with spoofing.
3. **Suspicious Received path / origin IP**: Message originated from `198.51.100.24` (hosting provider), not Amazon infrastructure.
4. **Mismatched link**: Link text displays `https://amazon.com/verify` but actual href points to `http://secure-amazon.verify-123.com/login` — target domain is unrelated and likely malicious.
5. **Urgent / threatening language**: "temporarily suspended", "verify within 24 hours", threatens permanent suspension — classic social engineering urgency.
6. **Generic greeting**: Uses "Dear Customer" rather than account-specific name.
7. **Poor indicators of legitimacy**: No personalized info, no account-specific details, suspicious reply-to address.
8. **Delivery and formatting red flags**: Non-standard sender address and no DKIM signature.

## Recommended actions
- Do NOT click any links or open attachments.
- Do not reply to the message; do not forward to others except as evidence for security team.
- Submit the full headers and raw message to your SOC/IR (if in an organization) or to your email provider's phishing-report flow.
- Block sender addresses and the sending IP(s) at perimeter (if you control the mail gateway).
- Inform affected users and reset any potentially compromised credentials.

## Evidence files attached to repo 
- `sample_email.eml` 
- `headers.txt` 
- `analysis_report.md` 

