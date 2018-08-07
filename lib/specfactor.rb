require "specfactor/version"
require "factory/spec_module"

module Specfactor
  class Generator
    include SpecModule
    @@controller_dir = "spec/controllers"
    @@available_methods = SpecModule.methods(false).to_a.map {|item| item.to_s}
    @@working_file = nil
    def opener(mode, lines)
      filer = lambda {|type, output| File.open(@@working_file, type) { |handle| handle.puts output}}
      if mode == "header"
        filer.call("w", nil)
        lines.each do |line|
          File.open(@@working_file, "a") do |handle|
            handle.puts line
          end
        end
      else
        File.open(@@working_file, "a") do |handle|
          handle.puts lines
        end
      end


    end

    def pull_src(controller, actions)
      if !Dir.exists?(@@controller_dir)
        Dir.mkdir(@@controller_dir)
      end
      @@working_file = "#{@@controller_dir}/#{controller.downcase}_controller_spec.rb"
      # Header stuff

      opener(
          "header",
          ["require 'rails_helper'","RSpec.describe #{controller.capitalize}Controller, type: :controller do"]
      )
      p actions
      actions != nil ? actions.each {|action| opener("body", SpecModule.public_send(action.to_sym, controller))} : nil

    end

    def sanitize(controller, actions)
      rem = "_controller"
      if controller.include? "_controller"
        controller.gsub!(rem, "")
        # puts controller
      end
      matched_actions = []
      actions = actions.split(" ")
      actions.each {|action| matched_actions << action if @@available_methods.include?(action)}
      # p matched_actions
      pull_src(controller, matched_actions)
    end

    def start
      puts Dir.pwd
      p @@available_methods
      puts "Name of Controller:"
      controller = gets.chomp
      puts "Names of actions to generate:"
      actions = gets.chomp
      sanitize(controller, actions)
    end
  end
end


