class User < ORM
  # Uncomment if your using SimpleDB 
  # set_domain Panda::Config[:sdb_users_domain]
  # properties :password, :email, :salt, :crypted_password, :api_key, :updated_at, :created_at
  
  # Uncomment if your using MySQL  
  set_table_name 'users'
  
  attr_accessor :password, :password_confirmation
  
  case Panda::Config[:database]
    when :simpledb
      include SimpleDBUser::InstanceMethods
      class << self; include SimpleDBUser::ClassMethods; end
    when :mysql
      include MySqlUser::InstanceMethods
      class << self; include MySqlUser::ClassMethods; end
  end

end