class ShoppingCart::CartModelsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_models
    directory 'models/', 'app/models/'
  end
end
