require 'bootstrap/core/environment'
require 'bootstrap/core/shell_ui_kit'

class ConfigBootstraper
    CONFIG_MAP = {
        "gitconfig" => "~/.gitconfig",
        "zshrc" => "~/.zshrc",
        "bashprofile" => "~/.bash_profile",
        "vscode" => "~/Library/Application\\ Support/Code/User/settings.json"
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