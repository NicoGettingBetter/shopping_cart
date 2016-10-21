class ShoppingCart::CartControllersGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_controllers
    directory 'controllers/', 'app/controllers/'
  end
end
