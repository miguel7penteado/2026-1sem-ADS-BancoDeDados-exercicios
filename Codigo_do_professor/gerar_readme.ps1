# gerar_readme.ps1
# Gera README.md com navegacao por turma e lista simples de alunos

$raiz   = Split-Path $PSScriptRoot -Parent
$turmas = @("ADS-DS3P40", "ADS-DS3Q40", "ADS-DS3R40", "ADS-DS2P40")
$sb     = [System.Text.StringBuilder]::new()

# Cabecalho
$sb.AppendLine("# 2026-1sem-ADS-BancoDeDados-exercicios") | Out-Null
$sb.AppendLine("") | Out-Null
$sb.AppendLine("### Professor Migu" + [char]0xE9 + "l Suares") | Out-Null
$sb.AppendLine("") | Out-Null

# Links de navegacao para as turmas
$sb.AppendLine("## Navega" + [char]0xE7 + [char]0xE3 + "o") | Out-Null
$sb.AppendLine("") | Out-Null
foreach ($turma in $turmas) {
    $anchor = $turma.ToLower()
    $sb.AppendLine("- [$turma](#$anchor)") | Out-Null
}

# Secao de cada turma
foreach ($turma in $turmas) {
    $pastaTurma = [System.IO.Path]::Combine($raiz, $turma)
    if (-not [System.IO.Directory]::Exists($pastaTurma)) { continue }

    $sb.AppendLine("") | Out-Null
    $sb.AppendLine("---") | Out-Null
    $sb.AppendLine("") | Out-Null
    $sb.AppendLine("## $turma") | Out-Null
    $sb.AppendLine("") | Out-Null

    $alunos = [System.IO.Directory]::GetDirectories($pastaTurma) | Sort-Object
    foreach ($pastaAluno in $alunos) {
        $nomeAluno = [System.IO.Path]::GetFileName($pastaAluno)
        $sb.AppendLine("- [$nomeAluno]($turma/$nomeAluno/)") | Out-Null
    }
}

$destino = [System.IO.Path]::Combine($raiz, "README.md")
[System.IO.File]::WriteAllText($destino, $sb.ToString(), [System.Text.Encoding]::UTF8)
Write-Host "README.md gerado com sucesso!" -ForegroundColor Green
