param(
    [string]$PortName = "COM3",
    [int]$BaudRate = 9600,
    [int]$DelaySecond = 0,
    [switch]$On,
    [switch]$Off
)

if (!$On -and !$Off) {
    Write-Error "You must specify either -On or -Off."
    exit 1
}

$port = New-Object System.IO.Ports.SerialPort

$port.PortName = $PortName
$port.BaudRate = $BaudRate
$port.DtrEnable = $true

Start-Sleep -Seconds $DelaySecond

try {
    $port.Open()
    if ($On) {
      $port.Write("H")
    }
    if ($Off){
      $port.Write("L")
    }

} catch {
    Write-Error "Error: $_"
} finally {
    if ($port.IsOpen) {
        $port.Close()
    }
}
