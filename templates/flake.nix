{
  description = "My development environment templates";

  outputs = { self, ... }: {
    templates = {
      rust = {
        description = "Rust environment";
        path = ./rust;
      };
    };
  };
}
