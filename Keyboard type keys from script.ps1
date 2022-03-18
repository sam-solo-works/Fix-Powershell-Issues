#$asterisk = [char]U+002A
#$ampersand = [char]U+0026
$P = '{*}{&}t35T{&}{*}'


function Do-SendKeys {
    param (
        $SENDKEYS,
        $WINDOWTITLE
    )
    #$wshell.AppActivate('title of the application window')
    $wshell = New-Object -ComObject wscript.shell;
    IF ($WINDOWTITLE) {$wshell.AppActivate($WINDOWTITLE)}
    Sleep 1
    IF ($SENDKEYS) {$wshell.SendKeys($SENDKEYS)}
}
Sleep 2
Do-SendKeys -WINDOWTITLE Print -SENDKEYS $P

#Do-SendKeys -WINDOWTITLE Print -SENDKEYS '{TAB}{TAB}'
#Do-SendKeys -WINDOWTITLE Print
#Do-SendKeys -SENDKEYS '%{f4}'