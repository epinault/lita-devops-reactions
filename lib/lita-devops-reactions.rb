require "lita"
require 'curl'
require 'nokogiri'

Lita.load_locales Dir[File.expand_path(
  File.join("..", "..", "locales", "*.yml"), __FILE__
)]

require "lita/handlers/devops_reactions"

Lita::Handlers::DevopsReactions.template_root File.expand_path(
  File.join("..", "..", "templates"),
 __FILE__
)
