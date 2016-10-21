class ShoppingCart::CartPresentersGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_presenters
    directory 'presenters/', 'app/presenters/'
  end
end
