# Elio (Nix Flake)

Snappy, batteries-included terminal file manager [elio](https://github.com/elio-fm/elio) with rich previews, inline images, bulk actions, and trash support

## Usage

Ensure you have [Nix](https://nixos.org/) installed with [flakes enabled](https://nixos.wiki/wiki/Flakes#Enable_flakes).

### Run directly

You can run the application directly without installing it:

```bash
nix run github:ArisoN-ext/elio-nix
```

### Build

To build the package locally:

```bash
git clone https://github.com/ArisoN-ext/elio-nix
```

```bash
cd elio-nix
```

```bash
nix build
```

This will create a `result` symlink in the current directory. You can then run the application using:

```bash
./result/bin/elio
```
