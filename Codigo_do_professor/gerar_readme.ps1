# gerar_readme.ps1
# Gera um novo README.md baseado na estrutura real de pastas:
# TURMA > ALUNO > AULA > EXERCICIOS

$raiz     = Split-Path $PSScriptRoot -Parent
$turmas   = @("ADS-DS3P40", "ADS-DS3Q40", "ADS-DS3R40", "ADS-DS2P40")
$sb       = [System.Text.StringBuilder]::new()

$sb.AppendLine("# 2026-1sem-ADS-BancoDeDados-exercicios") | Out-Null
$sb.AppendLine("") | Out-Null
$sb.AppendLine("### Professor Migu" + [char]0xE9 + "l Suares") | Out-Null
$sb.AppendLine("") | Out-Null
$sb.AppendLine("### Turmas: DS3P40, DS3Q40, DS3R40, DS2P40") | Out-Null

foreach ($turma in $turmas) {
    $pastaTurma = [System.IO.Path]::Combine($raiz, $turma)
    if (-not [System.IO.Directory]::Exists($pastaTurma)) { continue }

    $sb.AppendLine("") | Out-Null
    $sb.AppendLine("============================================================") | Out-Null
    $sb.AppendLine("## $turma") | Out-Null
    $sb.AppendLine("============================================================") | Out-Null
    $sb.AppendLine("") | Out-Null

    $alunos = [System.IO.Directory]::GetDirectories($pastaTurma) | Sort-Object
    foreach ($pastaAluno in $alunos) {
        $nomeAluno = [System.IO.Path]::GetFileName($pastaAluno)
        $sb.AppendLine("### [$nomeAluno]($turma/$nomeAluno/)") | Out-Null

        $aulas = [System.IO.Directory]::GetDirectories($pastaAluno) | Sort-Object
        foreach ($pastaAula in $aulas) {
            $nomeAula = [System.IO.Path]::GetFileName($pastaAula)
            $sb.AppendLine("- [$nomeAula]($turma/$nomeAluno/$nomeAula/)") | Out-Null
        }
        $sb.AppendLine("") | Out-Null
    }
}

$destino = [System.IO.Path]::Combine($raiz, "README.md")
[System.IO.File]::WriteAllText($destino, $sb.ToString(), [System.Text.Encoding]::UTF8)
Write-Host "README.md gerado com sucesso!" -ForegroundColor Green
