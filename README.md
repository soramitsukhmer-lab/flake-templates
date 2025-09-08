# Nix Flake Templates

A collection of project templates for Nix Flake.

## Usage

> WIP

Showing the available templates:

```bash
nix flake show github:soramitsukhmer-lab/flake-templates
```

Initialize flake:
```bash
# Init using `default` template:
nix flake init -t github:soramitsukhmer-lab/flake-templates

# Init using available templates:
nix flake init -t github:soramitsukhmer-lab/flake-templates#<template>
```

Update the template to the latest version:

```bash
nix flake update --flake github:soramitsukhmer-lab/flake-templates
```
