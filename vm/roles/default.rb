name "default"
description "php sandbox role."

default_attributes({
  "apt" => {
   },
   "build-essential" => {
   },
  "mysql" => {
    "server_debian_password" => "",
    "server_root_password" => "",
    "server_repl_password" => "",
    "bind_address" => "0.0.0.0",
    "allow_remote_root" => true,
    "server" => {
      #"packages" => %w{percona-server-server}
    },
    "client" => {
      "packages" => %w{mysql-client build-essential libmysqlclient-dev}
    }
  },

  "ntp" => {
    "servers" => [
      "ptbtime1.ptb.de",
      "ptbtime2.ptb.de"
    ]
  },

  "nginx" => {
    "gzip_http_version" => "1.1",
    "gzip_vary" => "on",
    "gzip_comp_level" => "6",
    "gzip_buffers" => "16 8k",

    "upstream_repository" => "http://nginx.org/packages/ubuntu",
    "worker_connections" => 256,
    "multi_accept" => "on",
    "event" => "epoll"
  },

  "php" => {
    "install_method"=> "package_php55",
    "directives"=>
    {
      "date.timezone"=> "UTC",
      "opcache.revalidate_freq"=> 2
    }
  }
})

override_attributes({
})

run_list(
  "recipe[apt]",
  "recipe[build-essential]",
  "recipe[ntp]",
  "recipe[git]",
  # optionally use percona (requires server packages config on ubuntu)
  #"recipe[mysql::percona_repo]",
  "recipe[mysql::server]",
  # database::mysql recipe may break provisioning
  #"recipe[mysql::ruby]",
  #"recipe[database]",
  #"recipe[database::mysql]",
  "recipe[nginx]",
  #"recipe[couchdb]",
  "recipe[php::fpm]",
  "recipe[php]",
  "recipe[php::composer]",
  "recipe[php::module_curl]",
  "recipe[default]",
  "recipe[default::php]",
  "recipe[default::php_redis]",
  "recipe[default::phpmyadmin]",
  "recipe[default::nginx]"
)
