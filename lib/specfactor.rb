require "specfactor/version"
require "factory/spec_module"
require 'pp'

module Specfactor
  class Generator
    include SpecModule
    @@controller_dir = "spec/controllers"
    def pull_src(param)
      puts Dir.pwd
      if !Dir.exists?(@@controller_dir)
        Dir.mkdir(@@controller_dir)
      end
      File.open("#{@@controller_dir}/#{param.downcase}_spec.rb", "w") do |handle|
        handle.puts "require 'rails_helper'"
        handle.puts "RSpec.describe #{param.capitalize}Controller, type: :controller do"
        handle.puts SpecModule.index(param)
        handle.puts "end"

      end
    end

    def start
      puts "Name of Controller:"
      input = gets.chomp
      puts "Generating tests for #{input} Controller"
      pull_src(input)
    end
  end
end


