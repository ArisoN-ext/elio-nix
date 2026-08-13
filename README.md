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

## Binary Cache

To avoid building from source, you can use the pre-built binaries from [Cachix](https://app.cachix.org/cache/elio-nix).

Add the following to your `nix.conf` (usually located at `~/.config/nix/nix.conf` or `/etc/nix/nix.conf`):
```text
substituters = https://cache.nixos.org https://elio-nix.cachix.org
trusted-public-keys = cache.nixos.org-1:6NCHdD59X431o0gWypbMrAURkbJ16ZPMQFGspcDShjY= elio-nix.cachix.org-1:H3azbaB/MaaR2ORZ3+F9jDjvzxLNuRa0FIg002dFDCM=
```

For **NixOS**, add this to your `configuration.nix`:
```nix
nix.settings = {
  substituters = [ "https://elio-nix.cachix.org" ];
  trusted-public-keys = [ "elio-nix.cachix.org-1:H3azbaB/MaaR2ORZ3+F9jDjvzxLNuRa0FIg002dFDCM=" ];
};
