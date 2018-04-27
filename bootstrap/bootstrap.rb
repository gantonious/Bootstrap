require_relative 'core/Environment'
require_relative 'core/Pipeline'
require_relative 'plugins/homebrew/brew_bootstraper'
require_relative 'plugins/vscode/code_bootstraper'
require_relative 'plugins/ohmyzsh/ohmyzsh_bootstraper'
require_relative 'plugins/config/config_bootstraper'

bootstrappers = [
    BrewBootstraper.new,
    CodeBootstraper.new,
    OhMyZshBootstraper.new,
    ConfigBootstraper.new
]

Environment.use_path './environment'
pipeline = BootstrapPipeline.new(bootstrappers)
pipeline.run