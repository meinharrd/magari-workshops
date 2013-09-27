name "apache"
description "apache sandbox role."

default_attributes({
  "php" => {
    "install_method" => "package_php55",
    "directives" => {
      "date.timezone" => "UTC",
      "error_reporting" => "E_ALL",
      "display_errors" => "On",
      "display_startup_errors" => "On"
    }
  }
})

override_attributes({
})

run_list(
  "recipe[default]",
  "recipe[php]",
  "recipe[php::composer]",
  "recipe[default::mod_php]"
)
