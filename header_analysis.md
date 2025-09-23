# Header Analysis (walkthrough)

**How to reproduce**
1. Save the `.eml` to disk (already included here as `sample_email.eml`).
2. Open the file with a text editor and copy the full header (everything above the first blank line).
3. Paste the headers into a trusted online header analyzer (examples: MXToolbox "Email Header Analyzer", Google "Show Original" for Gmail). Do NOT paste sensitive live headers into unknown sites for real user emails.

**Observed header artifacts (sample)**
- `Return-Path` shows: support@amaz0n-security.com — domain is `amaz0n-security.com`, not `amazon.com`. Slight spelling substitution (letter `o` vs `0` or extra token) is a red flag.
- `From:` shows `"Amazon Support" <support@amaz0n.com>` — display name claims brand but the mailfrom domain and return-path domains do not align.
- `Authentication-Results:` indicates `spf=fail` and `dkim=none` and `dmarc=fail` — these three results together are strong indicators of spoofing.
- `Received:` header shows origin IP `198.51.100.24` coming from `smtp5.hostingprovider` — this IP is not a known Amazon mail server (for a real investigation you would look up the IP owner with `whois`/`arpa` and check ASN/geolocation).

**What these mean (plain language)**
- SPF fail: the sending server is not authorized by the domain's SPF record — likely a forged sender.
- DKIM none: the message lacks a DKIM signature from the sending domain — legitimate large providers usually sign messages.
- DMARC fail: DMARC policy (which builds on SPF/DKIM) did not pass — important for brand protection; fail is suspicious.
- Mismatched display name vs envelope: attackers often impersonate a trusted name while using a different return-path address.

**Suggested next checks (manual)**
- Look up the IP: `nslookup 198.51.100.24` or `whois 198.51.100.24`.
- Copy the clickable link (right-click -> Copy link address) and inspect the domain portion (do not click).
- Use an online URL scanner (VirusTotal) or visit a sandbox environment if you must execute.
- If this were a real employee’s email, escalate to SOC/IR and block the indicated sending IP and sender address.

**Conclusion**
Headers show multiple technical failures (SPF/DKIM/DMARC) and mismatched domains — treat as phishing.
