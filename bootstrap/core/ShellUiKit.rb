module ShellUiKit
  def self.print_header(title)
    puts '=' * title.length
    puts title
    puts '=' * title.length
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