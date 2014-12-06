class ItemInHandPlugin
  include Purugin::Plugin
  description 'ItemInHand', 0.1

  def on_enable
    public_command('item_in_hand', 'print out item in hand', '/item_in_hand') do |player, *args|
      item = player.item_in_hand
      player.msg "item: #{ item } type: #{ item.type } data: #{ item.data } isSolid: #{ item.type.solid? }"
    end
  end
end
