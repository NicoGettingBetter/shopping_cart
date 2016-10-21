class ShoppingCart::CartDecoratorsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_decorators
    directory 'decorators/', 'app/decorators/'
  end
end
