class BlockTypePlugin
  include Purugin::Plugin
  description 'BlockType', 0.1

  def on_enable
    on = false
    public_command('block_type', 'print out block type on place event', '/block_type') { on = !on }
    event(:block_place) do |event|
      player = event.player
      if on
        player.msg "block type: #{ event.block.type } data: #{ event.block.data }"
      end
    end
  end
end
