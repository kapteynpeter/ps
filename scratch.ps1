$line1 = @("hello", "goodbye", @("red", "Red"))
$line2 = @(@("fart", "Yello"), "goodbye", "tree")
$line3 = @("asdf", "fdsa", @("cummy", "Blue"))
function Write-Lines ($lines) {
    foreach ($line in $lines) {
        foreach ($word in $line) {
            if ($word -is [string]) {
                write-host $word -NoNewline
                write-host " " -NoNewline
            } else {
                #print it at color
                write-host $word[0] -NoNewline -ForegroundColor $word[1]
                write-host " " -NoNewline
            }
        }
        write-host ""
    }
}

write-lines @($line1, $line2, $line3)
