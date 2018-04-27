class String
    # Monkey patching String to add methods to colorize
    # a string. From: https://stackoverflow.com/a/11482430.
    def colorize(color_code)
        "\e[#{color_code}m#{self}\e[0m"
    end
    
    def red
        colorize(31)
    end
    
    def green
        colorize(32)
    end
    
    def yellow
        colorize(33)
    end
    
    def blue
        colorize(34)
    end
    
    def pink
        colorize(35)
    end
    
    def light_blue
        colorize(36)
    end
end

module ShellUiKit
    def self.print_header(title)
        puts ('=' * title.length).yellow
        puts title.yellow
        puts ('=' * title.length).yellow
    end
    
    def self.print_title(title)
        puts '-' * title.length
        puts title
        puts '-' * title.length
    end
    
    def self.print(text)
        puts text
    end
end