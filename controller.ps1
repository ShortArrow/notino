param(
    [string]$portName = "COM3",
    [int]$baudRate = 9600,
    [switch]$On,
    [switch]$Off
)

if (!$On -and !$Off) {
    Write-Error "You must specify either -On or -Off."
    exit 1
}

$port = New-Object System.IO.Ports.SerialPort

$port.PortName = $portName
$port.BaudRate = $baudRate
$port.DtrEnable = $true

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
