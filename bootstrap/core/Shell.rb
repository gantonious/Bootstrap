module Shell
    def self.run_silently(command)
        system "#{command} >> /dev/null"
    end

    def self.run(command)
        system command
    end
end