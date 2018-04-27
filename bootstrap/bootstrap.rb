require_relative "core/Environment"
require_relative "core/Pipeline"
require_relative "plugins/homebrew/brew_bootstraper.rb"
require_relative "plugins/vscode/code_bootstraper.rb"


Environment.use_path "./environment"

bootstrappers = [
    BrewBootstraper.new,
    CodeBootstraper.new
]

pipeline = BootstrapPipeline.new(bootstrappers)
pipeline.run