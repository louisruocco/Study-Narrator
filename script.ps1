## Paste paths that need to be narrated
$paths = "E:\Obsidian Vaults\IT\AZ-104"

##Get the child items and content of the docs in the paths
function Read-Notes {
    $dirs = Get-ChildItem $paths
    $test = foreach($dir in $dirs){
       $notes = Get-ChildItem $paths\$dir -Exclude "images"
       $text = Get-Content $notes
       $text -replace '==', '' -replace '##', '' -replace "#", '' -replace '-', ''
    }

    $test
}

Read-Notes

# Read them out