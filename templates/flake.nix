{
  description = "My development environment templates";

  outputs = { self }: {
    templates = {
      node = {
        description = "NodeJS environment";
        path = ./node;
      };
      rust = {
        description = "Rust environment";
        path = ./rust;
      };
    };
    defaultTemplate = self.templates.rust;
  };
}
