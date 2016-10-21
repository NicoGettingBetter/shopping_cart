class ShoppingCart::CartHelpersGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_helpers
    directory 'helpers/', 'app/helpers/'
  end
end
