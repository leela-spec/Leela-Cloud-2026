# scripts/verify_nowa_generated.ps1
# PowerShell version of the pre-commit check. Returns non-zero exit on deletion of @NowaGenerated
Param ()

$staged = git diff --name-only --cached
if (-not $staged) {
    Write-Host "No staged files to check."
    exit 0
}

$fail = $false
foreach ($f in $staged -split "\n") {
    if (-not $f) { continue }
    try {
        $diff = git diff --cached -U0 -- "$f" 2>$null
    } catch {
        $diff = ""
    }
    if ($diff) {
        if ($diff -match "^\-.*@NowaGenerated\(") {
            Write-Error "ERROR: Staged change removes @NowaGenerated annotation in file: $f"
            $fail = $true
        }
        if ($diff -match "^\-.*@NowaGenerated\b") {
            Write-Error "ERROR: Staged change removes @NowaGenerated token in file: $f"
            $fail = $true
        }
    }
}

if ($fail) { exit 2 } else { exit 0 }

