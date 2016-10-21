# ShoppingCart
This is Rails Engine for shopping cart.

## Installation
#### Add this line to your application's Gemfile:

```ruby
gem 'shopping_cart', github: 'NicoGettingBetter/shopping_cart'
```

#### And then execute:
```bash
$ bundle
```
#### Add to `config/routes.rb`:
```ruby
mount ShoppingCart::Engine => "/shopping_cart"
```

#### Copy migrations:
```ruby
rake shopping_cart:install:migrations
rake db:migrate
```

## Usage

### Set models

#### Add `act_as_item` to your product model
```ruby
class Book < ApplicationRecord
  act_as_item
end
```

#### Add `act_as_user` to your customer model
```ruby
class User < ApplicationRecord
  act_as_user
end
```

### Route usage

#### Add `shopping_cart` prefix before shopping_cart routes
```ruby
shopping_cart.order_path
```

#### Add `main_app` prefix before routes of your applications in shopping_cart files
```ruby
main_app.my_step_order_path
```

### Generators to edit

Commands generator:
```bash
rails g shopping_cart:commands
```

Controllers generator:
```bash
rails g shopping_cart:controllers
```

Decorators generator:
```bash
rails g shopping_cart:decorators
```

Forms generator:
```bash
rails g shopping_cart:forms
```

Helpers generator:
```bash
rails g shopping_cart:helpers
```

Models generator:
```bash
rails g shopping_cart:models
```

Presenters generator:
```bash
rails g shopping_cart:presenters
```

Services generator:
```bash
rails g shopping_cart:services
```

Views generator:
```bash
rails g shopping_cart:views
```

### Cancan integration

To use cancan gem, Ability inherit from ShoppingCart::Ability and call super in initializer
```ruby
class Ability < ShoppingCart::Ability
  include CanCan::Ability

  def initialize(user)
    super user
  end
end
```

### Change view of order item

1. Generate `shopping_cart` views:
  ```bash
    rails g shopping_cart:cart_views
  ```
2. Change file `views/shopping_cart/orders/_item_info.html.haml`. Order item object is `item`.

### Customize step

#### Create model
1. Generate `shopping_cart` models:
  ```bash
    rails g shopping_cart:cart_models
  ```
2. Generate model for your step:
  ```bash
    rails g model ShoppingCart::MyStep
  ```
3. Add reference to order to your step:
  ```bash
    rails g migration AddMyStepReferenceToOrder
  ```
  In migration:
  ```ruby
    def change
      add_reference :shopping_cart_orders, :my_step, index: true
    end
  ```
4. Add reference to order model:
  ```ruby
    belongs_to :my_step, class_name: 'ShoppingCart::MyStep'
  ```

#### Change order presenter
1. Generate 'shopping_cart' presenters:
  ```bash
    rails g shopping_cart:cart_presenters
  ```
2. Add your step to `@states` in `initialize` in `presenters/shopping_cart/order_presenter.rb`
  ```ruby
    @states = [ :address, :delivery, :payment, :my_step, :confirm, :complete]
  ```

#### Create form for your step
1. Generate 'shopping_cart' forms:
  ```bash
    rails g shopping_cart:cart_forms
  ```
2. Create file `my_step_form.rb` in `app/forms/shopping_cart`:
  ```ruby
    module ShoppingCart
      class MyStepForm < Rectify::Form
        # your model validations
      end
    end
  ```
3. Add attribute to `OrderForm`:
  ```ruby
    attribute :my_step, MyStepForm
  ```
4. Change valid? method in `OrderForm`:
  ```ruby
    def valid?
      output = super
      if shipping_address
        shipping_address.valid?
        billing_address.valid? &&
          shipping_address.valid? &&
          errors.empty? && output
      elsif billing_address
        billing_address.valid? &&
          errors.empty? && output
      elsif credit_card
        credit_card.valid? &&
          errors.empty? && output
      elsif delivery
        delivery.valid? &&
          errors.empty? && output
      elsif my_step
        my_step.valid? &&
          errors.empty? && output
      else
        errors.empty? && output
      end
    end
  ```

#### Create command for your step
1. Generate `shopping_cart` commands
  ```ruby
    rails g shopping_cart:cart_commands
  ```
2. Create new method `set_or_update_my_step` in `update_order.rb`:
  ```ruby
    def set_or_update_my_step
      # update reference to step in order
    end
  ```

#### Change order controller
1. Generate `shopping_cart` controllers:
  ```bash
    rails g shopping_cart:cart_controllers
  ```
2. Change previous step (redirect to your state on ok) and create new one. In `edit_my_state` add new route to presenter
  ```ruby
    def order_payment
      @form = OrderForm.new(credit_card: CreditCardForm.new(credit_card_params))
      add_credit_card_to_presenter if @form.invalid?

      UpdateOrder.call(@form, :credit_card) do
        on(:ok) { redirect_to main_app.my_step_order_path }
        on(:invalid) { render 'edit_payment' }
      end
    end

    def edit_my_step
      presenter.add_route(my_step: main_app.edit_my_step_order_path)
    end

    def my_step
      @form = OrderForm.new(my_step: MyStepForm.new(my_step_params))

      UpdateOrder.call(@form, :my_step) do
        on(:ok) { redirect_to edit_confirm_order_path }
        on(:invalid) { render 'edit_my_step' }
      end
    end
  ```

3. Add strong parameters for your step:
  ```ruby
    def my_step_params
      # getting params
    end
  ```

#### Create view for your step
1. Create folder `views/shopping_cart/orders`.
2. Create file `edit_my_step`:
  ```ruby
    .page-header.h3.center
      %small= presenter.header_before :my_step
      My step
      %small= presenter.header_after :my_step
    %h2.page-header My step
    = form_for presenter.order, url: main_app.my_step_order_path, method: :put do |f|
      - # form for your step
      = f.submit t('shopping_cart.save_and_continue')
  ```

#### Change service for checkout links
1. Generate `shopping_cart` services:
  ```bash
    rails g shopping_cart:services
  ```
2. Add to `linkable?` condition for linkable your step and change condition of linkable for next step in `checkout_link.rb`:
  ```ruby
    def linkable? state
      case state
      when :address
        true
      when :delivery
        @order.billing_address && @order.shipping_address
      when :payment
        @order.delivery
      when :my_step
        @order.credit_card
      when :confirm
        @order.my_step
      when :complete
        false
      else
        raise 'No state error'
      end
    end
  ```

## License
The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).