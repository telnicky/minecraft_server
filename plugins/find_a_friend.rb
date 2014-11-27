class FindAFriendPlugin
	include Purugin::Plugin
	description 'Find A Friend', 0.1

	def on_enable
		public_command('faf', 'go to players location', '/faf {user}') do |me, *args|
			world = me.location.world
			name = args[0]
			player = world.players.detect { |player| player.player_list_name == name }
			me.teleport(player)
		end
	end
end
