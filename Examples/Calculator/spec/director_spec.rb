$:.unshift File.join(File.dirname(__FILE__), "..", "lib")
require 'rubygems'
require 'bundler'
require 'researcher'
Bundler.setup

class SomeTaskOrRole
end

class Director

  def initialize researcher=Researcher.new
    @researcher = researcher
  end

  def how_do_i_perform this_thing
    @researcher.get_directives_for( this_thing ).new
  end
  alias :how_do_i_answer :how_do_i_perform
end


describe Director do
  
  it "tells you how to perform something like a task or a role" do
    researcher = double("researcher")
    something = "description of the task or role"
    directives = SomeTaskOrRole
    director = Director.new researcher
    researcher.should_receive( :get_directives_for ).with( something ).and_return( directives )

    director.how_do_i_perform( something ).should be_instance_of directives
  end

  it "tells you how to get the answer to a question" do
    researcher = double("researcher")
    something = "description of the task or role"
    directives = SomeTaskOrRole
    director = Director.new researcher
    researcher.should_receive( :get_directives_for ).with( something ).and_return( directives )

    director.how_do_i_answer( something ).should be_instance_of directives
  end
end
