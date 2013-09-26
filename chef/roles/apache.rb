name "apache"
description "apache sandbox role."

default_attributes({
  "php" => {
    "install_method" => "package_php55",
    "directives" => {
      "date.timezone" => "UTC"
    }
  }
})

override_attributes({
})

run_list(
  "recipe[default]",
  "recipe[php]",
  "recipe[default::mod_php]"
)
