require_relative "core/Environment"
require_relative "core/Pipeline"
require_relative "plugins/homebrew/brew_bootstraper.rb"

Environment.use_path "./environment"

bootstrappers = [
    BrewBootstraper.new
]

pipeline = BootstrapPipeline.new(bootstrappers)
pipeline.run