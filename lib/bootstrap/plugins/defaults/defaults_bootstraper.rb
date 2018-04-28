require 'bootstrap/plugins/defaults/defaults'
require 'bootstrap/core/environment'
require 'bootstrap/core/shell_ui_kit'

class DefaultsBootstraper
    def name
        "User defaults"
    end

    def can_bootstrap?
        true
    end

    def bootstrap
        domains = Environment.files_in "defaults"

        for domain in domains do
            Defaults.import(domain, Environment.resolve_path_for("defaults/#{domain}"))
            ShellUiKit.print "Imported defaults for #{domain} 🚀"
        end
    end
end