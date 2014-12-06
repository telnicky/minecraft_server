class TronPlugin
  include Purugin::Plugin
  description 'Tron', 0.1

  attr_reader :on

  def toggle
    @on = !@on
  end

  def on_enable
    public_command('tron', 'Make every block you step on turn into the block in your hands.', '/tron') do |player, *args|
      toggle
      if on
        player.msg "Tron has been turned on."
      else
        player.msg "Tron has been turned off."
      end
    end

    event(:player_move) do |event|
      change_ground_tile(event) if on
    end
  end

  private

  def change_ground_tile(event)
    block = event.to.block.block_at(:down)
    item = event.player.item_in_hand

    if item.type.solid?
      block.type = item.type
      block.data = item.data.data
    end
  end
end
