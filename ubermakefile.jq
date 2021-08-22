def depbuild_commands:
  .dependencies[env.name].build
  | arrays, strings
  | @sh
  ;

def build_flags(section; $prefix):
  section // {}
  | to_entries
  | .[]
  | "$(eval \($prefix) \(.key)+=\(.value))"
  ;

def build_pkgconfig($args):
  .dependencies // {}
  | to_entries
  | .[]
  | "pkg-config",
    $args,
    if .value.static then
      "--static"
    else
      empty
    end,
    .key,
    ";"
  ;

def build_targets:
  .targets
  | to_entries
  | .[]
  | "bin/\(.key)"
  ;
