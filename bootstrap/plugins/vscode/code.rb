require_relative '../../core/Shell'

module Code
    module Extensions
        def self.installed?(extension)
            Shell.run_silently "code --list-extensions | grep -w #{extension}"
        end

        def self.install(extension)
            Shell.run "code --install-extension #{extension}"
        end
    end
end