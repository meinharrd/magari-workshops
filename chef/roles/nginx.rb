name "nginx"
description "nginx sandbox role."

default_attributes({
  "nginx" => {
    "upstream_repository" => "http://nginx.org/packages/ubuntu"
  },

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
  "recipe[apt]",
  "recipe[default]",
  "recipe[nginx]",
  "recipe[php]",
  "recipe[php::fpm55]"
)
