$word_list = @("was", "are", "have", "had", "were", "can", "said", "use", "will", "would", "make", "like", "has", "look", "write", "see", "could", "been", "call", "find", "did", "get", "come", "made", "may", "take", "know", "live", "give", "think", "say", "help", "tell", "follow", "came", "want", "show", "set", "put", "does", "must", "ask", "went", "read", "need", "move", "try", "change", "play", "spell", "found", "study", "learn", "should", "add", "keep", "start", "thought", "saw", "turn", "might", "close", "seem", "open", "begin", "got", "run", "walk", "began", "grow", "took", "carry", "hear", "stop", "miss", "eat", "watch", "let", "cut", "talk", "being", "leave", "word", "time", "number", "way", "people", "water", "day", "part", "sound", "work", "place", "year", "back", "thing", "name", "sentence", "man", "line", "boy", "farm", "end", "men", "land", "home", "hand", "picture", "air", "animal", "house", "page", "letter", "point", "mother", "answer", "America", "world", "food", "country", "plant", "school", "father", "tree", "city", "earth", "eye", "head", "story", "example", "life", "paper", "group", "children", "side", "feet", "car", "mile", "night", "sea", "river", "state", "book", "idea", "face", "Indian", "girl", "mountain", "list", "song", "family", "one", "all", "each", "other", "many", "some", "two", "more", "long", "new", "little", "most", "good", "great", "right", "mean", "old", "any", "same", "three", "small", "another", "large", "big", "even", "such", "different", "kind", "still", "high", "every", "own", "light", "left", "few", "next", "hard", "both", "important", "white", "four", "second", "enough", "above", "young", "not", "when", "there", "how", "out", "then", "first", "now", "only", "very", "just", "where", "much", "before", "too", "also", "around", "well", "here", "why", "again", "off", "away", "near", "below", "last", "never", "always", "together", "often", "once", "later", "far", "really", "almost", "sometimes", "soon", "for", "with", "from", "about", "into", "down", "over", "after", "through", "between", "under", "along", "until", "without", "you", "that", "his", "they", "this", "what", "your", "which", "she", "their", "them", "these", "her", "him", "who", "its", "our", "something", "those", "and", "but", "than", "because", "while" )

# $test_text = "The quick brown fox jumped over the lazy dog"
# write-host $test_text "`r" -NoNewline

# $key = $null
# $c = 0

# $StopWatch = New-Object -TypeName System.Diagnostics.Stopwatch 
# $StopWatch.start()

# while ($c -lt $test_text.Length) 
# {
#     $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
#     write-host -ForegroundColor Black  $key.character -NoNewline
#     $c += 1
# }
# $StopWatch.stop()

# $elapsed = $StopWatch.Elapsed

# $num_words = ([regex]::Matches($test_text, " " )).count
# $num_words
# $cpm = $num_words / $elapsed.TotalMinutes

# "your words per minute was {0} words per minute" -f $cpm


# todo
# needs
# 1. highlight letter red if it does not  match
# make it smart
# wants
#
# 1. get a list of 300 most used words
# 2. do cool graphics so it looks cool in the middle of the screen
# take 40 random words from the word list
# print the out in 4 lines of 10

# # Place the cursor back at the start of the first line
# $host.UI.RawUI.CursorPosition = @{ x = 0; y = 0 }

# # Partially overwrite the original line.
# Write-Host ('y' * 10) -ForegroundColor Yellow

# $rand_words = (Get-Random -InputObject $word_list) + " "
# for($i = 0; $i -lt 39; $i++) {
#     $rand_words += (get-random -InputObject $word_list) + " "
# }
# $rand_words


Clear-Host
# get 80 random words
# print them in 4 lines of 20
# start a timer per user specification
# while the timer is not run out
# get the next incoming letter and do the stuff below
$master_string = "hello moto nice to meet you"
$master_string
$incoming_letter = " "
$PC = 0
function print_at_i{
    # if its the same letter as at the program counter, print it in yellow
    # else print it in red
    $host.UI.RawUI.CursorPosition = @{ x = $PC; y = 0 }
    if ($args -eq $master_string[$PC])
    {
        Write-Host $args -ForegroundColor Yellow
    } else {
        Write-Host $args -ForegroundColor Red
    }
}
while(1) {
    $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    $incoming_letter = $key.character
    
    if (($master_string[$PC] -eq " ") -and ($incoming_letter -ne " ")){
        $host.UI.RawUI.CursorPosition = @{ x = $PC - 1; y = 0 }
        if ($incoming_letter -eq $master_string[$PC])
        {
            Write-Host $incoming_letter -ForegroundColor Yellow
        } else {
            Write-Host $incoming_letter -ForegroundColor Red
        }
    } elseif ($incoming_letter -ne " ") {
        $host.UI.RawUI.CursorPosition = @{ x = $PC; y = 0 }
        if ($incoming_letter -eq $master_string[$PC])
        {
            Write-Host $incoming_letter -ForegroundColor Yellow
        } else {
            Write-Host $incoming_letter -ForegroundColor Red
        }
        $PC++
    } else {
        "jump word"
        $PC++
    }
}

'done'

# once the timer is run out
# calculate wpm and print

