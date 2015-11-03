default["user"] = ""
default["group"] = ""
default['rvm']['user_installs'] = [
  { 'user'          => '',
    'default_ruby'  => '2.2.1',
    'rubies'        => []
  }
]
default['rvm']['user_global_gems'] = [
  { 'user' => 'bundler'},
  { 'user' => 'capistrano'},
  { 'user' => 'capistrano-ec2_tagged'},
  { 'user' => 'capistrano-symfony'},
  { 'user' => 'chef'},
  { 'user' => 'knife-ec2'}
]
