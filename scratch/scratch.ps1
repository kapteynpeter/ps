function Get-KeyPress
{
    if ([Console]::KeyAvailable)
    {
        return [Console]::ReadKey($true)
    }
}

Write-Warning 'Press Ctrl+Shift+K to exit monitoring!'

do
{
    # Write-Host '.' -NoNewline
    $pressed = Get-KeyPress
    if ($pressed) {
        write-host $pressed.Key -NoNewline
    }
    # Start-Sleep -Seconds 1
} while ($true)