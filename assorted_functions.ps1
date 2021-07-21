function up ( [int] $n ) {
    for ( $i = 0; $i -le $n; $i++ ) {
        Set-Location ..
    }
}

function ascii ( $char ) {
    [int][char] $char
}
