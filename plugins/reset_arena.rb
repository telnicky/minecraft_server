class ResetArenaPlugin
  include Purugin::Plugin
  description 'Reset Arena', 0.1

  def on_enable
    public_command('reset_arena', "Reset the capture the flag arena") do |player, *args|
      player.msg("Reseting Arena...")
      server.dispatch_command(player, "/pos1 -608,102,663")
      server.dispatch_command(player, "/pos2 -692,71,607")
      server.dispatch_command(player, "/restore")
    end
  end
end
