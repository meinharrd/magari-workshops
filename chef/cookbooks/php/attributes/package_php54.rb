#
# Author:: René Oelke (<rene.oelke@foobugs.com>)
# Cookbook Name:: php
# Attribute:: package_php54
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

# Override default attributes
case node["platform_family"]
when "debian"
  node.override["php"]["conf_dir"] = "/etc/php5"
end

# Composer attributes
default["php"]["composer"]["install_path"] = "/usr/share/php"
default["php"]["composer"]["exec_path"] = "/usr/bin"

# Phing attributes
default["php"]["phing"]["channel"] = "pear.phing.info"

# PHPUnit attributes
default["php"]["phpunit"]["channel"] = "pear.phpunit.de"
