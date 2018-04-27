require_relative 'gem'
require_relative '../../core/ShellUiKit'

class GemBootstraper
    GEM_FILE = "gem/gems"

    def name
        "Ruby Gems"
    end

    def can_bootstrap?
        Environment.exists? GEM_FILE
    end

    def bootstrap
        ShellUiKit.print_title "Installing gems..."
        satisfy_gems
    end

    def satisfy_gems
        gems = Environment.load_as_list(GEM_FILE)
        for gem in gems do
            if Gem.installed? gem
                ShellUiKit.print "#{gem} already satisfied ✅"
            else
                ShellUiKit.print "Could not find #{gem} ❌"
                Gem.install gem
            end
        end
    end
end