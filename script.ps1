## Paste paths that need to be narrated
$paths = "E:\Obsidian Vaults\IT\AZ-104"

##Get the child items and content of the docs in the paths
function Get-Notes {
    $dirs = Get-ChildItem $paths -Exclude "images", "Exam Overview.md", "revision topics.txt"
    $getRandomFolder = $dirs | Sort-Object {Get-Random}
    $firstFolder = $getRandomFolder[0]
    
    $notes = Get-ChildItem $firstFolder
    $getRandomNote = $notes | Sort-Object {Get-Random}
    $firstNote = $getRandomNote[0]
    
    $notePath = $firstNote.DirectoryName
    $text = Get-Content $notePath\$firstNote
    $text -replace '#', '' -replace "=", '' -replace '-', '' -replace 'Practice Questions.*', '' -replace 'Knowledge Check.*', '' -replace 'AZ104', '' -replace 'Exercises:.*', ''
}

Get-Notes

# Read them out