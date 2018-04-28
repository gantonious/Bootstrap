require 'fileutils'
require 'bootstrap/core/shell'

module Environment
    def self.use_path(environment_path)
        @@environment_path = environment_path
    end

    def self.resolve_path_for(file)
        "#{@@environment_path}/#{file}"
    end

    def self.files_in(folder_path)
        Dir.entries(resolve_path_for(folder_path))
           .select {|f| !File.directory? f}
    end

    def self.exists?(file)
        File.exist? resolve_path_for(file)
    end

    def self.load_as_list(file)
        File.read(resolve_path_for(file))
            .split("\n")
    end

    def self.copy_file(from, to)
        Shell.run "cp #{resolve_path_for(from)} #{to}"
    end
end