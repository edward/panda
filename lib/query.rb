class Query
  
  case Panda::Config[:database]
    when :simpledb
      require 'simple_db'
    when :mysql
      require 'activerecord'
  end
  
end