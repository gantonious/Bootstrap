require 'bootstrap/core/shell_ui_kit'

module Git
    def self.clone(repo_url, output_dir="")
        Shell.run "cd ~ && git clone #{repo_url} #{output_dir}"
    end
end