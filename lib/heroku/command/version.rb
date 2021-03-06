require "heroku/command/base"
require "heroku/version"

# display version
#
class Heroku::Command::Version < Heroku::Command::Base

  # version
  #
  # show heroku client version
  #
  #Example:
  #
  # $ heroku version
  # heroku-toolbelt/1.2.3 (x86_64-darwin11.2.0) ruby/1.9.3
  #
  def index
    validate_arguments!

    display(Heroku.user_agent)
    display(Heroku::JSPlugin.version) if Heroku::JSPlugin.setup?

    plugins = Heroku::Plugin.list
    if plugins.length > 0
      styled_header("Installed Plugins")
      styled_array(plugins)
    end
  end
end
