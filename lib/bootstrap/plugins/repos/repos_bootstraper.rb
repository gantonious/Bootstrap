require 'json'
require 'bootstrap/plugins/repos/git'
require 'bootstrap/core/environment'
require 'bootstrap/core/shell_ui_kit'

class ReposBootstraper
    REPOS_FILE = "repos/repos.json"

    def name
        "User repositories"
    end

    def can_bootstrap?
        Environment.exists? REPOS_FILE
    end

    def bootstrap
        repos = Environment.load_as_json REPOS_FILE
        base_clone_dir = repos['cloneReposTo']
        projects = repos['repos']

        projects.each do |project|
            ensure_project_exisits base_clone_dir, project
        end
    end

    def ensure_project_exisits(base_clone_dir, project)
        git_url = project['cloneFrom']
        project_dir = project['cloneTo']
        destination_dir = base_clone_dir + project_dir
        # THIS IS A HACK PLES FIX PATH JOINING OMG
        if File.directory?("#{Dir.home}/#{destination_dir}")
            ShellUiKit.print "#{project_dir} already cloned 🦄"
        else
            ShellUiKit.print_title "Cloning #{git_url}"
            Git.clone git_url, destination_dir
            ShellUiKit.print "Cloned #{project_dir} to #{destination_dir} 👍🏻"
        end
    end
end