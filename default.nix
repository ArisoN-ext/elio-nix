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
  version = "1.8.0";
  __structuredAttrs = true;
  doCheck = false;

  src = fetchFromGitHub {
    owner = "elio-fm";
    repo = "elio";
    tag = "v${finalAttrs.version}";
    hash = "sha256-r7/LT0wGs8G9UN7H89WBBYGdKhCU6FXJx+UXNWfIZDc=";
  };

  cargoHash = "sha256-x9qeMsNLELZu+23pQZNwNgOxlx7c+aHCIpzagHO/Hbg=";

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
