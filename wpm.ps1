

# list of 300 commonly used words
$word_list = @("was", "are", "have", "had", "were", "can", "said", "use", "will", "would", "make", "like", "has", "look", "write", "see", "could", 
               "been", "call", "find", "did", "get", "come", "made", "may", "take", "know", "live", "give", "think", "say", "help", "tell", "follow", 
               "came", "want", "show", "set", "put", "does", "must", "ask", "went", "read", "need", "move", "try", "change", "play", "spell", "found", 
               "study", "learn", "should", "add", "keep", "start", "thought", "saw", "turn", "might", "close", "seem", "open", "begin", "got", "run", 
               "walk", "began", "grow", "took", "carry", "hear", "stop", "miss", "eat", "watch", "let", "cut", "talk", "being", "leave", "word", "time", 
               "number", "way", "people", "water", "day", "part", "sound", "work", "place", "year", "back", "thing", "name", "sentence", "man", "line", 
               "boy", "farm", "end", "men", "land", "home", "hand", "picture", "air", "animal", "house", "page", "letter", "point", "mother", "answer", 
               "america", "world", "food", "country", "plant", "school", "father", "tree", "city", "earth", "eye", "head", "story", "example", "life", 
               "paper", "group", "children", "side", "feet", "car", "mile", "night", "sea", "river", "state", "book", "idea", "face", "indian", "girl", 
               "mountain", "list", "song", "family", "one", "all", "each", "other", "many", "some", "two", "more", "long", "new", "little", "most", 
               "good", "great", "right", "mean", "old", "any", "same", "three", "small", "another", "large", "big", "even", "such", "different", "kind", 
               "still", "high", "every", "own", "light", "left", "few", "next", "hard", "both", "important", "white", "four", "second", "enough", "above", 
               "young", "not", "when", "there", "how", "out", "then", "first", "now", "only", "very", "just", "where", "much", "before", "too", "also", 
               "around", "well", "here", "why", "again", "off", "away", "near", "below", "last", "never", "always", "together", "often", "once", "later", 
               "far", "really", "almost", "sometimes", "soon", "for", "with", "from", "about", "into", "down", "over", "after", "through", "between", 
               "under", "along", "until", "without", "you", "that", "his", "they", "this", "what", "your", "which", "she", "their", "them", "these", 
               "her", "him", "who", "its", "our", "something", "those", "and", "but", "than", "because", "while" )
               
function Get-RandWords ($list, $num) {
    $rand_words = @()
    for($i = 0; $i -lt $num; $i++) {
        $rand_words += (get-random -InputObject $list)
    }
    return $rand_words
}
function Write-Lines ($lines) {
    foreach ($line in $lines) {
        foreach ($word in $line) {
            if ($word -is [string]) {
                write-host $word -NoNewline
                write-host " " -NoNewline
            } else {
                write-host $word[0] -NoNewline -ForegroundColor $word[1]
                write-host " " -NoNewline
            }
        }
        write-host ""
    }
}1
function Write-Char ($x, $y, $letter, $master_string, $color) {
    $host.UI.RawUI.CursorPosition = @{ x = $x; y = $y }
    if ($color) {
        Write-Host $letter -ForegroundColor $color -NoNewline
    } elseif ($letter -eq $master_string[$PC]) {
        Write-Host $letter -ForegroundColor Yellow -NoNewline
    } else {
        Write-Host $letter -ForegroundColor Red -NoNewline
    }
}

$first_newline = $false
$words_per_line = 5
$PC = 0
$Y = 0

Clear-Host

$line1 = Get-RandWords $word_list $words_per_line
$line2 = Get-RandWords $word_list $words_per_line
$line3 = Get-RandWords $word_list $words_per_line

$master_string = ($line1 -join " ") + "`n"

Write-Lines @($line1, $line2, $line3)

$StopWatch = New-Object -TypeName System.Diagnostics.Stopwatch 
$StopWatch.start()
$timeout = New-TimeSpan -Seconds 100

while($StopWatch.Elapsed -lt $timeout) {
    $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    $incoming_letter = $key.character

    if ($master_string[$PC] -eq "`n") {
        if ($incoming_letter -ne " ") {
            Write-Char ($PC - 1) $Y $incoming_letter $master_string
        } else {
            if (-not $first_newline) {
                $PC = 0
                $Y++
                $first_newline = $true
                $master_string = ($line2 -join " ") + "`n"
            } else {
                clear-host
                $PC = 0
                $master_string = ($line3 -join " ") + "`n"
                $line1 = $line2
                $line2 = $line3
                $line3 = Get-RandWords $word_list $words_per_line
                Write-Lines @($line1, $line2, $line3)
                #keep the coloring of line1 correct
            }
        }
    } elseif ($master_string[$PC] -eq " ") {
        if ($incoming_letter -ne " ") {
            Write-Char ($PC - 1) $Y $incoming_letter $master_string
        } else {
            $PC++
        }
    } elseif ($master_string[$PC] -ne " ") {
        if ($incoming_letter -eq " ") {
            while (1) {
                if ($master_string[$PC] -eq " ") {
                    $PC++
                    break
                } elseif ($master_string[$PC] -eq "`n") {
                    if (-not $first_newline) {
                        $PC = 0
                        $Y++
                        $first_newline = $true
                        $master_string = ($line2 -join " ") + "`n"
                        break
                    } else {
                        clear-host
                        $PC = 0
                        $master_string = ($line3 -join " ") + "`n"
                        $line1 = $line2
                        $line2 = $line3
                        $line3 = Get-RandWords $word_list $words_per_line
                        Write-Lines @($line1, $line2, $line3)
                        break
                        #keep the coloring of line1 correct
                    }
                } else {
                    Write-Char $PC $Y $master_string[$PC] $master_string "Red"
                    $PC++
                }
            }
        } else {
            Write-Char $PC $Y $incoming_letter $master_string
            $PC++
        }
    }
}

<# 
    TODO:
    1. make the cursor be at the right spot
    2. support back spaces
    3. calculate and display WPM at the end
#>