class ShoppingCart::CartServicesGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_services
    directory 'services/', 'app/services/'
  end
end
