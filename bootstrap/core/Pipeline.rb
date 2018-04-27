require_relative 'ShellUiKit.rb'

class BootstrapPipeline
    def initialize(bootstrapers)
        @bootstrapers = bootstrapers
    end

    def run
        for bootstraper in @bootstrapers do
            ShellUiKit.print_header "Bootstraping #{bootstraper.name}..."                
            
            if bootstraper.can_bootstrap?
                bootstraper.bootstrap
            else  
                ShellUiKit.print "Nothing to bootstrap."
            end
        end
    end
end