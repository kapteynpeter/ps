# Write a line at the top of the screen (first line)
Clear-Host
Write-Host ('x' * 20) -ForegroundColor Gray

# Place the cursor back at the start of the first line
$host.UI.RawUI.CursorPosition = @{ x = 0; y = 0 }

# Partially overwrite the original line.
Write-Host ('y' * 10) -ForegroundColor Yellow