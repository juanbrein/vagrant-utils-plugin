module VagrantPlugins
  module Utils
    class Command < Vagrant.plugin('2', :command)
      def self.synopsis
        "Run rake tasks"
      end

      def execute 
        args = ARGV
        args.shift
        with_target_vms do |machine|
          env = machine.action(:ssh_run,
                               :ssh_run_command => "rake #{args.join(' ')}")
          exit_status = env[:ssh_run_exit_status] || 0
          return exit_status
        end
      end
    end
  end
end
