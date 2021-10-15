Function Invoke-Mosarn
{
Param(
  $data,
  $file,
  [ValidateSet("WriteData","AppendData")]
  $type
)

if ($type -eq "WriteData"){
$filecontent = get-content $file -raw
$data2 = "$data" + "`n" + $filecontent
$f = New-Object -TypeName 'IO.FileStream' `
                -ArgumentList $file,`
                              ([IO.FileMode]::OpenOrCreate),`
                              ([Security.AccessControl.FileSystemRights]::WriteData),`
                              ([IO.FileShare]::Read),`
                              4KB,`
                              ([IO.FileOptions]::None)
#$f = New-Object -TypeName 'IO.StreamWriter' -ArgumentList $f
$f = New-Object System.IO.StreamWriter($f)
$f.WriteLine($data2)
$f.Dispose()
}

if ($type -eq "AppendData"){
$f = New-Object -TypeName 'IO.FileStream' `
                -ArgumentList $file,`
                              ([IO.FileMode]::Append),`
                              ([Security.AccessControl.FileSystemRights]::AppendData),`
                              ([IO.FileShare]::Read),`
                              4KB,`
                              ([IO.FileOptions]::None)
$f = New-Object -TypeName 'IO.StreamWriter' `
                -ArgumentList $f
$data = "`n" + $data
$f.WriteLine($data)
$f.Dispose()
}
}
