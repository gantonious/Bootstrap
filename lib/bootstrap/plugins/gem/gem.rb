require 'bootstrap/core/shell'

module Gem
    def self.installed?(name)
        Shell.run_silently "gem list | grep -w #{name}"
    end

    def self.install(name)
        Shell.run "sudo gem install #{name}"
    end
end