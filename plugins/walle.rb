class WallePlugin
  include Purugin::Plugin
  description 'Walle', 0.1

  def on_enable
    walle = {}

    public_command('walle', 'Make every block you place repeat to the given height.', '/walle {height}') do |player, *args|
      walle[player.name] = args.first.to_i || 1
      player.msg "#{player.name}'s building height has been set at #{walle[player.name]}"
    end

    event(:block_place) do |event|
      height = walle[event.player.name]
      place(event.block, height)
    end

    event(:block_break) do |event|
      height = walle[event.player.name]
      place(event.block, height, :air, 0)
    end
  end

  def place(block, height, type = block.type, data = block.data)
    height = height.to_i
    direction = height > 0 ? :up : :down
    height.abs.times do |counter|
      new_block = block.block_at(direction, counter)
      new_block.change_type(type)
      new_block.data = data
    end
  end
end
