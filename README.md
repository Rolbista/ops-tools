# OPS TOOLS

This is my collection of tools and settings I usually need on my work laptop.  
The catalogs are:  

```
.
├── packages
├── shell
└── terraform-playground
```

## `packages`
This is for installing the usual stuff from [HomeBrew](https://brew.sh/).
Separate list for Casks and formulas.

## `shell`
Terminal prompts, rc file configs and aliases.

## `terraform-playground`
Bare Terraform config for experimenting with variables, their types, outputs and functions.

## `.pre-commit-config.yaml`

This pre-commit config is also a template for other repos, Terraform and Terragrunt formatting, and a `gitleaks` command to scan for secrets you're about to commit