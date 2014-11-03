class RefreshPlugin
  include Purugin::Plugin
  description 'refresh', 0.1

  def on_enable
    player_command('refresh', 'pull down latest plugins from git', '/refresh') do |me, *|
      me.msg "foobar"
 #     FileUtils.cp_r("../minecraft_plugins", "./plugins")
    end
  end
end
