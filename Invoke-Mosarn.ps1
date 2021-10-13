function Invoke-Mosarn
{
Param($data, $file)
$f = New-Object -TypeName 'IO.FileStream' `
                -ArgumentList $file,`
                              ([IO.FileMode]::Append),`
                              ([Security.AccessControl.FileSystemRights]::AppendData),`
                              ([IO.FileShare]::Read),`
                              4KB,`
                              ([IO.FileOptions]::None)
$f = New-Object -TypeName 'IO.StreamWriter' `
                -ArgumentList $f
$f.WriteLine($data)
$f.Dispose()
}
