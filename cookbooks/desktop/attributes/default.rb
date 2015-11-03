default["user"] = ""
default["group"] = ""
default["rvm"]["user_installs"] = [
  { "user" => "",
    "default_ruby" => "2.2.1",
    "rubies" => []
  }
]
default["rvm"]["user_global_gems"] = [
  { "name" => "bundler"},
  { "name" => "capistrano"},
  { "name" => "capistrano-ec2_tagged"},
  { "name" => "capistrano-symfony"},
  { "name" => "chef"},
  { "name" => "knife-ec2"}
]
