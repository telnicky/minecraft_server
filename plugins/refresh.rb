require "fileutils"

class RefreshPlugin
  include Purugin::Plugin
  description 'refresh', 0.1

  def on_enable
    public_command('refresh', 'pull down latest plugins from git', '/refresh') do |me, *|
      current_path = File.dirname(__FILE__)
      path = File.join(current_path, "../../minecraft_plugins")

      me.msg "refresh started"

      `cd #{ path } && git pull`

      Dir[path + "/*"].each do |file_path|
        FileUtils.cp_r(file_path, current_path)
      end

      me.msg "refresh completed"
    end
  end
end
