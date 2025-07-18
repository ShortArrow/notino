#!pwsh

param(
    [string]$fqbn = "arduino:renesas_uno:minima"
)

arduino-cli compile `
--build-path build `
--log `
--fqbn $fqbn `
--config-file arduino-cli.yaml
