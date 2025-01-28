# Naviguer vers le répertoire racine
Set-Location -Path C:\

# Création des dossiers et des fichiers
New-Item -ItemType Directory -Path C:\ -Name FolderTest1
New-Item -ItemType Directory -Path C:\FolderTest2
New-Item -ItemType File -Path C:\FolderTest1 -Name File1
New-Item -ItemType File -Path C:\FolderTest1 -Name File2
New-Item -ItemType File -Path C:\FolderTest1 -Name File3
New-Item -ItemType File -Path C:\FolderTest1 -Name File4
New-Item -ItemType File -Path C:\FolderTest1 -Name File5

for ($Count = 6; $Count -le 10; $Count++) {
    New-Item -ItemType File -Path C:\FolderTest2 -Name "File$Count"
}

# Création des dossiers EvenFolder et OddFolder
New-Item -ItemType Directory -Path C:\ -Name EvenFolder
New-Item -ItemType Directory -Path C:\ -Name OddFolder

# Déplacement des fichiers pairs vers EvenFolder et des fichiers impairs vers OddFolder
$allFiles = Get-ChildItem -Path C:\FolderTest1, C:\FolderTest2

foreach ($file in $allFiles) {
    $fileNumber = [int]($file.Name -replace '[^\d]')
    if ($fileNumber % 2 -eq 0) {
        Move-Item -Path $file.FullName -Destination C:\EvenFolder -Force
    } else {
        Move-Item -Path $file.FullName -Destination C:\OddFolder -Force
    }
}
