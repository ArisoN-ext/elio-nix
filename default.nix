{
  lib,
  rustPlatform,
  fetchFromGitHub,
  pkg-config,
  oniguruma,
  sqlite,
  nix-update-script,
}:

rustPlatform.buildRustPackage (finalAttrs: {
  pname = "elio";
  version = "1.11.2";
  __structuredAttrs = true;
  doCheck = false;

  src = fetchFromGitHub {
    owner = "elio-fm";
    repo = "elio";
    tag = "v${finalAttrs.version}";
    hash = "sha256-k+88cWiHi1a+f6oulb5MTCnWrJU4vKPEAHBwq5H9bkQ=";
  };

  cargoHash = "sha256-JxdWxkpyYbNxe7B1WNKRDyj2xH1W2kQn2rYj/NdPkY4=";

  nativeBuildInputs = [
    pkg-config
  ];

  buildInputs = [
    oniguruma
    sqlite
  ];

  env = {
    LIBSQLITE3_SYS_USE_PKG_CONFIG = true;
    RUSTONIG_SYSTEM_LIBONIG = true;
  };

  passthru.updateScript = nix-update-script { };

  meta = {
    description = "Snappy, batteries-included terminal file manager with rich previews, inline images, bulk actions, and trash support";
    homepage = "https://github.com/elio-fm/elio";
    changelog = "https://github.com/elio-fm/elio/blob/${finalAttrs.src.rev}/CHANGELOG.md";
    license = lib.licenses.mit;
    maintainers = with lib.maintainers; [ ];
    mainProgram = "elio";
  };
})
