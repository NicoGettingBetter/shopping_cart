class ShoppingCart::CartCommandsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_commands
    directory 'commands/', 'app/commands/'
  end
end
