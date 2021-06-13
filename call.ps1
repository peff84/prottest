$errorcounter = 0
$trycounter = 0
#$filescounter = (Get-ChildItem –Path "C:\Users\Peff\OneDrive\Desktop\samples" | Measure-Object).Count.
Get-ChildItem –Path "C:\Users\Peff\OneDrive\Desktop\samples" |

Foreach-Object {
try {
   Start-Process $_.FullName -UseNewEnvironment
   Start-Sleep 1
}
catch {
   write-host "Fehler abgefangen: `r`n $_.Exception.Message"
   $errorcounter = $errorcounter + 1

								}
finally {
    $trycounter = $trycounter + 1
    
}

}

# Output
$successrate = $errorcounter / $trycounter
Write-Host "+++++++ TEST BEENDET +++++++"
write-host "Anzahl Fehler: " $errorcounter
write-host "Anzahl Aufrufe: " $trycounter
write-host "Erfolgsquote :" $successrate