# Nix Flake Templates

A collection of project templates for Nix Flake.

## Usage

Showing the available templates:

```bash
nix flake show github:soramitsukhmer-lab/flake-templates

# Output:
# github:soramitsukhmer-lab/flake-templates
# └───templates
#     ├───default: template: Default shell template
#     ├───nodejs-shell: template: A Node.js development environment
#     ├───nodejs16-shell: template: A Node.js 16 development environment
#     └───shell: template: Default shell template
```

Initialize flake:
```bash
# Init using `default` template:
nix flake init -t github:soramitsukhmer-lab/flake-templates

# Init using available templates:
nix flake init -t github:soramitsukhmer-lab/flake-templates#<template>

# Inspect the generated flake:
cat flake.nix
```

Update the template to the latest version:

```bash
nix flake update --flake github:soramitsukhmer-lab/flake-templates
```
