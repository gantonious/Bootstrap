require_relative '../../core/Environment'
require_relative '../../core/ShellUiKit'

class ConfigBootstraper
    CONFIG_MAP = {
        "gitconfig" => "~/.gitconfig",
        "zshrc" => "~/.zshrc",
        "bashprofile" => "~/.bash_profile"
    }

    def name
        "User Configuration"
    end

    def can_bootstrap?
        true
    end

    def bootstrap
        ShellUiKit.print_title "Copying configuration files..."

        CONFIG_MAP.each do |config_type, config_destination|
            if Environment.exists? "config/#{config_type}"
                Environment.copy_file("config/#{config_type}", config_destination)
                ShellUiKit.print "Moved #{config_type} to #{config_destination} ✈️"
            end
        end
    end
end