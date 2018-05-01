# THIS IS A HACK PLES FIX AND ADD PROPER ARGS SO PPL DONT
# INJECT COMMANDS INTO MY SHELL PLS KTHX
module Shell
    def self.run_silently(command)
        system "#{command} >> /dev/null"
    end

    def self.run(command)
        system command
    end
end