module VagrantPlugins
  module Utils
    class Plugin < Vagrant.plugin("2")
      name "Utils plugin"

      description <<-DESC
        This plugin run vagrant utils
      DESC

      command :rake do
        require_relative "command_rake"
        Command
      end

      command :logs do
        require_relative "command_logs"
        Command
      end
    end
  end
end
