module ShoppingCart
  class Engine < ::Rails::Engine
    isolate_namespace ShoppingCart

    config.generators do |g|
      g.test_framework      :rspec,        fixture: false
      g.fixture_replacement :factory_girl, dir: 'spec/factories'
      g.assets false
      g.helper false
      g.orm             :active_record
      g.template_engine :erb
    end

    # Add a load path for this specific Engine
    config.autoload_paths << File.expand_path("../lib/shopping_cart", __FILE__)

    # To add an initialization step from your Railtie to Rails boot process, you just need to create an initializer block
    initializer "my_engine.add_middleware" do |app|
      # some code
    end
  end
end
