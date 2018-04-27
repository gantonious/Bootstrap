require_relative 'ohmyzsh'
require_relative '../../core/ShellUiKit'

class OhMyZshBootstraper
    def name
        "oh my zsh"
    end

    def can_bootstrap?
        true
    end

    def bootstrap
        if OhMyZsh.installed?
            ShellUiKit.print "Oh my zsh is already installed 👍🏻"
        else
            ShellUiKit.print_title "Installing oh my zsh..."
            OhMyZsh.install
        end
    end
end