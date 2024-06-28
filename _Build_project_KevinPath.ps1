# Définir les variables
$projectPath = Join-Path -Path (Get-Location) -ChildPath "epic_game_jam_2024.uproject"
$outputpath = Join-Path -Path (Get-Location) -ChildPath "Build"
$dateTime = Get-Date -Format "yyyy-MM-dd_HH-mm-ss"
$outputDir = $outputpath + $dateTime
$buildConfig = "Shipping"
$platform = "Win64"

# Construire le projet
& "I:\epic\UE_5.4\Engine\Build\BatchFiles\RunUAT.bat" BuildCookRun `
    -project="$projectPath" `
    -noP4 `
    -platform="$platform" `
    -clientconfig="$buildConfig" `
    -serverconfig="$buildConfig" `
    -cook `
    -allmaps `
    -build `
    -stage `
    -pak `
    -archive `
    -archivedirectory="$outputDir"

# Vérifier si le dossier de build existe
if (-Not (Test-Path -Path "$outputDir")) {
    Write-Error "Le chemin de build `$outputDir` est introuvable."
    exit 1
}

Write-Output "Deployment completed successfully!"
