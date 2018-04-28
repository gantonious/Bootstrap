require 'bootstrap/core/environment'
require 'bootstrap/core/pipeline'
require 'bootstrap/plugins/homebrew/brew_bootstraper'
require 'bootstrap/plugins/gem/gem_bootstraper'
require 'bootstrap/plugins/vscode/code_bootstraper'
require 'bootstrap/plugins/ohmyzsh/ohmyzsh_bootstraper'
require 'bootstrap/plugins/config/config_bootstraper'
require 'bootstrap/plugins/defaults/defaults_bootstraper'

bootstrappers = [
    BrewBootstraper.new,
    GemBootstraper.new,
    CodeBootstraper.new,
    OhMyZshBootstraper.new,
    ConfigBootstraper.new,
    DefaultsBootstraper.new
]

Environment.use_path './environment'
pipeline = BootstrapPipeline.new(bootstrappers)
pipeline.run