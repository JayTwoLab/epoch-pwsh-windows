param (
    [Parameter(Mandatory=$true, Position=0)]
    [long]$EpochTime
)

try {
    # Convert Epoch Time (Unix Timestamp in seconds) to DateTimeOffset object
    $dto = [DateTimeOffset]::FromUnixTimeSeconds($EpochTime)
    
    # Format UTC Time (yyyy-MM-dd HH:mm:ss)
    $utcTime = $dto.UtcDateTime.ToString("yyyy-MM-dd HH:mm:ss")
    
    # Format Local Time (yyyy-MM-dd HH:mm:ss)
    $localTime = $dto.LocalDateTime.ToString("yyyy-MM-dd HH:mm:ss")
    
    # Display results
    Write-Host "--------------------------------"
    Write-Host "Epoch Time : $EpochTime"
    Write-Host "UTC Time   : $utcTime"
    Write-Host "Local Time : $localTime"
    Write-Host "--------------------------------"
} catch {
    Write-Error "An error occurred while converting Epoch Time. Please check if it is a valid 10-digit integer."
}