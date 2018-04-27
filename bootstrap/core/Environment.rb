module Environment
    def self.use_path(environment_path)
        @@environment_path = environment_path
    end

    def self.resolve_path_for(file)
        "#{@@environment_path}/#{file}"
    end

    def self.exists?(file)
        File.exist? resolve_path_for(file)
    end

    def self.load_as_list(file)
        File.read(resolve_path_for(file))
            .split("\n")
    end
end