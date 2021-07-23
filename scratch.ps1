while(1) {
    $key = $Host.UI.RawUI.ReadKey('NoEcho,IncludeKeyDown')
    $incoming_letter = $key.character
    $key
    $incoming_letter
    $incoming_letter.gettype()
    if ($key.VirtualKeyCode -eq 13) {
        'got an enter'
    }
}