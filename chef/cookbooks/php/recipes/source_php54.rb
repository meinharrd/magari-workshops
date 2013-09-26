#
# Author::  René Oelke (<rene.oelke@foobugs.com>)
# Cookbook Name:: php
# Recipe:: source_php54
#
# Copyright 2012, foobugs Oelke & Eichner GbR
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

include_recipe "php::phpbuild"

php_build "#{node["php"]["source_php54"]["prefix"]}" do
  version "#{node["php"]["source_php54"]["version"]}"
  owner {Chef::Config[:user]}
  group {Chef::Config[:group]}

  action  :create
end
