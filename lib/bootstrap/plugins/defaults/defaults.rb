require 'bootstrap/core/shell'

module Defaults
    def self.exists?(domain)
        Shell.run_silently "defaults domains | grep -w #{domain}"
    end

    def self.import(domain, plist_file)
        Shell.run_silently "defaults import #{domain} #{plist_file}"
    end
end