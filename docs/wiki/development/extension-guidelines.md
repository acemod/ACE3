---
layout: wiki
title: Extension Guidelines
description: 
group: development
parent: wiki
order: 9
---

## 1. Setup

### 1.1 Requirements

- [Rust](https://rustup.rs/)
- [cargo-make](https://crates.io/crates/cargo-make)  
`cargo install --no-default-features --force cargo-make`

### 1.2 Recomendations

- [VSCode](https://code.visualstudio.com/)
- [Rust Analyzer](https://marketplace.visualstudio.com/items?itemName=rust-lang.rust-analyzer)
- [CodeLLDB](https://marketplace.visualstudio.com/items?itemName=vadimcn.vscode-lldb)

### 1.3 Rust Resources

- [Learn Rust](https://www.rust-lang.org/learn)

---

## 2 Development

### 2.1 Code Standards

1. [Rust API Guidelines for naming](https://rust-lang.github.io/api-guidelines/naming.html) should be followed
2. All code should be formatted with `cargo fmt`
3. All code should be free from errors and warnings
4. Tests should be written where applicable

### 2.2 Local Development

Running `cargo make debug` will compile the project for x32 and x64 and move the built libraries to `ace.dll` and `ace_x64.dll`.

The library can be debugged with the following `.vscode/launch.json` file. Replace all sections in `{}` with the appropriate path.

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "type": "lldb",
            "request": "launch",
            "name": "Debug",
            "program": "{Path to Arma}\\arma3_x64.exe",
            "args": ["-mod=\"{Path to CBA};{Path to ACE development folder}\""],
            "cwd": "{Path to Arma}"
        }
    ]
}
```

Use the `Run and Debug` tab in VSCode to launch Arma, or Press `F5`.

### 2.3 Release

Release versions can be built using `cargo make release`.
