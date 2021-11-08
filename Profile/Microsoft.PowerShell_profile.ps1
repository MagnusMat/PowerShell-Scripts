Import-Module PSReadLine
Import-Module posh-git
Import-Module oh-my-posh
Import-Module Terminal-Icons
Set-PoshPrompt -Theme M365Princess

function antlr {
    java org.antlr.v4.Tool
}

Set-Alias antlr4 antlr
