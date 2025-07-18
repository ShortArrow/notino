#!pwsh

param(
    [string]$fqbn = "arduino:renesas_uno:minima",
    [string]$port = "COM5"
)
arduino-cli upload `
  --port $port `
  --fqbn $fqbn `
  --input-dir build `
  --config-file arduino-cli.yaml
