require 'bootstrap/core/shell'

module OhMyZsh
    def self.installed?
        Shell.run_silently "ls -a ~ | grep -w .oh-my-zsh"
    end

    def self.install
        Shell.run 'sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"'
    end
end