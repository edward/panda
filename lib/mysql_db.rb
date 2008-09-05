require 'rubygems'
require 'activerecord'
class MysqlDB
  
  class Base < ActiveRecord::Base
    attr_accessor :key, :attributes, :new_record

    def self.establish_connection!
      @@connection = ActiveRecord::Base.establish_connection(
                                  :adapter => "mysql",
                                  :host => "localhost",
                                  :username => "root",
                                  :password => "",
#                                  :encoding => "encoding: utf8",
                                  :database => "panda_development",
                                  :socket => "/tmp/mysql.sock")
    end
#    
#    def self.connection; @@connection; end
#    
#    class << self
#      attr_accessor :domain_name
#    end
    
#    def self.domain
#      @@connection.domain(self.domain_name)
#    end
    
#    def initialize(attributes = nil)
#      super
#    end
    
#    def self.set_domain(d)
#      self.domain_name = d
#    end
    
#    def self.properties(*props)
#      props.each do |p|
#        class_eval "def #{p}; self.get('#{p}'); end"
#        class_eval "def #{p}=(v); self.put('#{p}', v); end"
#      end
#    end

#    def self.create(*values)
#      attributes = values.nil? ? Amazon::SDB::Multimap.new : Amazon::SDB::Multimap.new(*values) # TODO: Just pass values onto new
#      self.new(nil, attributes)
#    end

#    def self.create!(*values)
#      r = self.create(*values)
#      r.save
#      r
#    end
    
#    def id
#      self.key
#    end
    
#    def get(key)
#      reload! if self.attributes.size == 0 and @new_record == false
#      self.attributes.coerce(self.attributes.get(key))
#    end
    
#    def get_without_coerce(key)
#      reload! if self.attributes.size == 0 # TOOD: add ` and @new_record == false`
#      self.attributes.get(key)
#    end
    
#    def [](key)
#      self.get(key)
#    end

#    def put(key, value)
#      self.attributes.put(key, value, :replace => true)
#    end
    
#    def []=(key, value)
#      self.put(key, value)
#    end
    
#    def set_attributes(attrs)
#      attrs.each do |k,v|
#        self.send(%(#{k}=),v)
#      end
#    end

#    def save
#      self.updated_at = Time.now
#      self.created_at = Time.now if @new_record == true
#      self.class.domain.put_attributes(self.key, self.attributes, :replace => :all)
#      @new_record = false
#      true
#    end
    
#    def destroy!
#      self.class.domain.delete_attributes(self.key)
#    end
    
#    def reload!
#      item = self.class.domain.get_attributes(self.key)
#      self.attributes = item.attributes
#    end

#    def self.find(*args)
#      super
#    end
    
    # TODO: support next token
#    def self.query(expr="", query_options={})
#      result = []
#      self.domain.query(query_options.merge({:expr => expr})).each do |i|
#        result << self.new(i.key, i.attributes, false)
#      end
#      return result
#    end
  end
  
end