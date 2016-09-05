module TestHelper
  def sign_in user
    login_as user, scope: :user, run_callbacks: false
    visit root_path
    expect(page).to have_content('Sign out')
  end
end

class ActiveRecord::Base
  mattr_accessor :shared_connection
  @@shared_connection = nil

  def self.connection
    @@shared_connection || retrieve_connection
  end
end
ActiveRecord::Base.shared_connection = ActiveRecord::Base.connection
