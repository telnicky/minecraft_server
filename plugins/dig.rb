class DigPlugin
	include Purugin::Plugin
	description 'Dig', 0.1

  def on_enable
    public_command('dig', 'dig down!', '/dig {distance}') do |player, *args|
      block = player.target_block
      depth = args[0].to_i
      type  = args[1] || :air
      depth.times do |counter|
        block.block_at(:down, counter).change_type(type)
      end
    end
  end
end
