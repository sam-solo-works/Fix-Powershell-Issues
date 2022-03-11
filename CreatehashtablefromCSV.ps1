# create a scriptblock using the string
$scriptBlock = [scriptblock]::Create('@{"R"="red";"B"="Blue"')
# execute it to create the hashtable
$tags = (& $scriptBlock)

$vmtags = '@{"R"="red";"B"="Blue"}', '@{"G"="green";"A"="Alpha"}'

# first loop creates the hashtables from the individual strings
$arr = $vmtags | ForEach-Object {
    $scriptBlock = [scriptblock]::Create($_)
    & $scriptBlock
}

# the second loop merges all Hashtables in the array into one
$tags = @{}
$arr | ForEach-Object {
    foreach ($key in $_.Keys) {
        $tags[$key] = $_.$key
    }
}