## Paste paths that need to be narrated
$paths = "E:\Obsidian Vaults\IT\AZ-104"

##Get the child items and content of the docs in the paths
function Read-Notes {
    $dirs = Get-ChildItem $paths
    foreach($dir in $dirs){
       Get-ChildItem $paths\$dir
    }
}

Read-Notes

# Read them out