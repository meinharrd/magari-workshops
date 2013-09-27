name "nginx"
description "nginx sandbox role."

default_attributes({
  "nginx" => {
    "upstream_repository" => "http://nginx.org/packages/ubuntu"
  },

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
  "recipe[apt]",
  "recipe[default]",
  "recipe[nginx]",
  "recipe[php]",
  "recipe[php::fpm55]",
  "recipe[php::composer]"
)
