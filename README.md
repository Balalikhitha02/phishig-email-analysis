Phishing Email Analysis 

**Goal**
Analyze a phishing email sample and produce a short report listing the phishing indicators you found.

**Files in this repo**
- sample_email.eml — sample phishing email (for analysis/training only)
- headers.txt — extracted mail headers from the sample email
- header_analysis.md — header-by-header walkthrough and recommended checks
- analysis_report.md — final report listing observed phishing traits (submit this)
- upload_to_github.md — instructions to upload this repo to GitHub from Windows

**How I completed the task (short)**
1. Obtained a phishing sample for training (saved as `sample_email.eml`).
2. Extracted headers into `headers.txt` (PowerShell script included if needed).
3. Pasted headers into an online header analyzer and interpreted results (see `header_analysis.md`).
4. Analyzed email body and links to identify suspicious artifacts.
5. Compiled a short, clear `analysis_report.md` describing the phishing indicators.

