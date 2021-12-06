![Banner](assets/banner.png)

![release](https://img.shields.io/github/v/release/DarthBenro008/goimports-check-action)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](https://github.com/DarthBenro008/goimports-check-action/issues/new/choose)
# GoImports Check Action

A ready to use GitHub Action that checks for GoImport Errors, it can also exclude specific files and folder path.


## Usage

Simply add this to your `.github/workflows/goimports.yaml` file, and this action will trigger on every push.

```yaml
on: [push]

jobs:
  goimports_job:
    runs-on: ubuntu-latest
    name: GoImports Check
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: Goimports Check
        uses: DarthBenro008/goimports-check-action@v0.1.0
        with:
          root-path: './' # The relative root path to run goimports
          excludes: "./some-directory/, ./protos/, ./main.go" # Comma seperated folder/files to exclude from GoImport scans
```

## Input Parameters

| Input     | Description                                                                                             | Default Value | Is Mandatory |
|-----------|---------------------------------------------------------------------------------------------------------|---------------|--------------|
| root-path | The relative path at which you want to run `goimports`                                                  | `./`          | Yes          |
| excludes  | A string that contains comma-separated values of files and folders you want to exclude from `goimports` | ""            | No           |

## Sample Outputs

```bash
The following paths have been excluded
./api/

The following has imports not properly ordered
./protos/main.go
./main.go
```


## 🤝 Contributions

- Feel Free to Open a PR/Issue for any feature or bug(s).
- Make sure you follow the [community guidelines](https://docs.github.com/en/github/site-policy/github-community-guidelines).
- Feel free to open an issue to ask a question/discuss anything about this GitHub Action.
- Have a feature request? Open an Issue!

## ⚖ License

Copyright 2021 Hemanth Krishna

Licensed under MIT License : https://opensource.org/licenses/MIT

<p align="center">Made with ❤ and a single cup of coffee</p>

