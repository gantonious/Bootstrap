require 'bootstrap/core/shell'

module Brew
    def self.installed?
        Shell.run_silently "brew -v"
    end

    def self.not_installed?
        !self.installed?
    end

    def self.install
        Shell.run '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
    end

    module Formulas
        def self.installed?(name)
            Shell.run_silently "brew list | grep -w #{name}"
        end

        def self.not_installed?(name)
            !self.installed?(name)
        end

        def self.install(name)
            Shell.run "brew install #{name}"
        end

        def self.uninstall(name)
            Shell.run "brew uninstall #{name}"
        end
    end

    module Cask
        def self.installed?(cask_name)
            Shell.run_silently "brew cask list | grep -w #{cask_name}"
        end

        def self.not_installed?(cask_name)
            !self.installed?(cask_name)
        end

        def self.install(cask_name)
            Shell.run "brew cask install #{cask_name}"
        end

        def self.uninstall(cask_name)
            Shell.run "brew cask uninstall #{cask_name}"
        end
    end
end