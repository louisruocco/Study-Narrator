function Read-Notes {
    $path = "E:\Obsidian Vaults\IT\AZ-104"

    $dirs = Get-ChildItem $path -Exclude "images", "Exam Overview.md", "revision topics.txt"
    $getRandomFolder = $dirs | Sort-Object {Get-Random}
    $firstFolder = $getRandomFolder[0]
    
    $notes = Get-ChildItem $firstFolder
    $getRandomNote = $notes | Sort-Object {Get-Random}
    $firstNote = $getRandomNote[0]
    
    $notePath = $firstNote.DirectoryName
    $text = Get-Content $notePath\$firstNote
    $finalText = $text -replace '#', '' -replace "=", '' -replace '-', '' -replace 'Practice Questions.*', '' -replace 'Knowledge Check.*', '' -replace 'AZ104', '' -replace 'Exercises:.*', '' -replace '\*', ''

    Add-Type -AssemblyName System.speech
    $speak = New-Object System.Speech.Synthesis.SpeechSynthesizer
    $speak.SpeakAsync($finalText)
}

Read-Notes