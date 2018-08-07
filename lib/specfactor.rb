require "specfactor/version"
require "factory/spec_module"

module Specfactor
  class Generator
    include SpecModule
    @@controller_dir = "spec/controllers"
    @@available_methods = SpecModule.methods(false).to_a

    def opener(file, mode, lines)
      File.open(file, mode) do |handle|
        lines.each {|line| handle.puts line}
      end
    end

    def pull_src(param)
      if !Dir.exists?(@@controller_dir)
        Dir.mkdir(@@controller_dir)
      end
      # Header stuff
      opener(
          "#{@@controller_dir}/#{param.downcase}_controller_spec.rb",
          "w",
          ["require 'rails_helper'","RSpec.describe #{param.capitalize}Controller, type: :controller do"]
      )

    end

    def sanitize(controller, actions)
      rem = "_controller"
      if controller.include? "_controller"
        controller.gsub!(rem, "")
      end
    end

    def start
      puts Dir.pwd
      puts @@available_methods
      puts "Name of Controller:"
      controller = gets.chomp
      puts "Names of actions to generate:"
      actions = gets.chomp
      sanitize(controller, actions)
    end
  end
end


