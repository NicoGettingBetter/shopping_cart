class ShoppingCart::CartCommandsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../app/commands', __FILE__)

  def generate_commands
    directory 'commands/', 'app/commands/'
  end
end