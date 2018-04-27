require_relative './brew'
require_relative '../../core/Environment'
require_relative '../../core/ShellUiKit'

class BrewBootstraper
    CASK_FILE = "homebrew/cask"
    BREW_FILE = "homebrew/brew"

    def name
        "Homebrew"
    end
    
    def can_bootstrap?
        Environment.exists? CASK_FILE or Environment.exists? BREW_FILE
    end

    def bootstrap
        if Environment.exists? CASK_FILE
            ShellUiKit.print_title "Installing casks..."
            satisfy_casks
        end

        if Environment.exists? BREW_FILE
            ShellUiKit.print_title "Installing formulas..."
            satisfy_brew
        end
    end

    def satisfy_casks
        casks = Environment.load_as_list(CASK_FILE)
        for cask in casks do
            if Brew::Cask.installed? cask
                ShellUiKit.print "#{cask} already satisfied ✅"
            else
                ShellUiKit.print "Could not find #{cask} ❌"
                Brew::Cask.install cask
            end
        end
    end

    def satisfy_brew
      tools = Environment.load_as_list(BREW_FILE)
      for tool in tools do
        if Brew.installed? tool
            ShellUiKit.print "#{tool} already satisfied ✅"
        else
            ShellUiKit.print "Could not find #{tool} ❌"
          Brew.install tool
        end
      end
    end
end