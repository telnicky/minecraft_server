class ExpolsiveArrowPlugin
  include Purugin::Plugin
  description 'explosive_arrow', 0.1

  def on_enable
    event(:projectile_hit) do |e|
        shooter = e.entity.shooter
        location = e.entity.location
        distance = shooter.location.distance(location)
        max_force = 50
        force = max_force * (1 - (::Math::E ** -(distance/max_force)))

        location.world.create_explosion(location, force)
    end
  end
end
