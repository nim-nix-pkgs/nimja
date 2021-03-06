{
  description = ''typed and compiled template engine inspired by jinja2, twig and onionhammer/nim-templates for Nim'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."nimja-devel".dir   = "devel";
  inputs."nimja-devel".owner = "nim-nix-pkgs";
  inputs."nimja-devel".ref   = "master";
  inputs."nimja-devel".repo  = "nimja";
  inputs."nimja-devel".type  = "github";
  inputs."nimja-devel".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimja-devel".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."nimja-master".dir   = "master";
  inputs."nimja-master".owner = "nim-nix-pkgs";
  inputs."nimja-master".ref   = "master";
  inputs."nimja-master".repo  = "nimja";
  inputs."nimja-master".type  = "github";
  inputs."nimja-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."nimja-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}