with import <nixpkgs> { };

rustPlatform.buildRustPackage rec {
  name = "artifact-${version}";
  version = "1.0.0";
  src = builtins.filterSource
	  (path: type:
	  type != "directory" || (
		baseNameOf path != ".git"
		&& baseNameOf path != "node_modules"
		&& baseNameOf path != "target"
		)
	  )
	  ./.;
  buildInputs = [ ];
  depsSha256 = "12wjx0hq8bdal2qgszmj9p9ch6np15m18xcdwmv712fabgrsfxc1";
}
