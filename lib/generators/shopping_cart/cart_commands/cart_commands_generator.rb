class ShoppingCart::CartCommandsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  
  def generate_commands
    directory 'commands/', 'app/commands/'
  end
end
