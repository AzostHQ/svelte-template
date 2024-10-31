{ pkgs, lib, config, inputs, ... }:

{
  env.GREET = "Azost DevShell";

  packages = [
    pkgs.git
    pkgs.ripgrep
    pkgs.jq
    pkgs.yq
    pkgs.bat
    pkgs.zsh
  ];

  languages.javascript = {
    enable = true;
    package = pkgs.nodejs_20;
    pnpm.enable = true;
    pnpm.install.enable = true;
  };

  scripts.hello.exec = ''
    echo Welcome to $GREET!!
    echo Please follow the coding standards as mentioned
  '';

  enterShell = ''
    zsh
    hello
    git --version
    echo "node version $(node --version)"
    echo "pnpm version $(pnpm --version)"
  '';

  enterTest = ''
    echo "Running tests"
    git --version | grep --color=auto "${pkgs.git.version}"
  '';

}
