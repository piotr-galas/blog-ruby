module Sorcery
  module TestHelpers
    module Rails
      module Controller
        def login_user_post(email, password)
          page.driver.post('author_sessions', email: email, password: password)
        end
      end
    end
  end
end
