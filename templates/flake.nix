{
  description = "My flake templates";

  inputs = {
    official.url = github:NixOS/templates;
  };

  outputs = { self, official, ... }: {
    templates = {
      rust = {
        path = ./rust;
        description = "Rust environment";
      };
    };
    official.templates;
  };
}
