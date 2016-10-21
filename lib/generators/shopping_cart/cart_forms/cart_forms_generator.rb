class ShoppingCart::CartFormsGenerator < Rails::Generators::Base
  source_root File.expand_path('../../../../../app/', __FILE__)

  def copy_forms
    directory 'forms/', 'app/forms/'
  end
end
