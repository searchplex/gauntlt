require 'cucumber'
require 'cucumber/cli/main'

module Gauntlt
  class Attack
    attr_accessor :name, :opts

    def initialize(name, opts={})
      self.name = name
      self.opts = opts
    end

    def attack_file
      File.join(cuke_dir, "#{self.name}.attack")
    end

    def base_dir
      File.expand_path( File.dirname(__FILE__) )
    end

    def cuke_dir
      File.join(base_dir, "cucumber")
    end

    def run
      Cucumber::Cli::Main.execute([self.attack_file, '--require', self.cuke_dir])
    end
  end
end