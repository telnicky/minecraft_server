require "fileutils"

class DeletePlugin
  include Purugin::Plugin
  description 'delete', 0.1

  def on_enable
    public_command("delete", "deletes a plugin from the directory", "/delete filename") do |player, *args|
      filename = args[0]
      current_path = File.dirname(__FILE__)
      FileUtils.rm("#{ current_path }/#{ filename }.rb")
      player.msg("deleted")
    end
  end
end
