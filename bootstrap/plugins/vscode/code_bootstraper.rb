require_relative 'code'
require_relative '../../core/Environment'
require_relative '../../core/ShellUiKit'

class CodeBootstraper
    EXTENSIONS_FILE = "code/extensions"

    def name
        "VS Code"
    end

    def can_bootstrap?
        Environment.exists? EXTENSIONS_FILE
    end

    def bootstrap
        ShellUiKit.print_title "Installing extensions"
        satisfy_extensions
    end

    def satisfy_extensions
        extensions = Environment.load_as_list(EXTENSIONS_FILE)
        for extension in extensions do
            if Code::Extensions.installed? extension
                ShellUiKit.print "#{extension} already satisfied ✅"
            else
                ShellUiKit.print "Could not find #{extension} ❌"
                Code::Extensions.install extension
            end
        end
    end
end