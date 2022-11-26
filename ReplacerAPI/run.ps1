using namespace System.Net

# Input bindings are passed in via param block.
param($Request, $TriggerMetadata)

# Write to the Azure Functions log stream.
Write-Host "PowerShell HTTP trigger function processed a request."

# Interact with query parameters or the body of the request.
$text = $Request.Query.Name
$keywords = @("Oracle", "Google", "Microsoft", "Amazon", "Deloitte")

foreach($word in $keywords)
{
    if($text -like "*$word*")
    {
        $text = $text -replace ($word, "$word©")
    }
}

if ($text) {
    $body = "Hello, $text. This HTTP triggered function executed successfully."
}

# Associate values to output bindings by calling 'Push-OutputBinding'.
Push-OutputBinding -Name Response -Value ([HttpResponseContext]@{
    StatusCode = [HttpStatusCode]::OK
    Body = $body
})
