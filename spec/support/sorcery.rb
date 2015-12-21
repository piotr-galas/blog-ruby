module Sorcery
  module TestHelpers
    module Rails
      module Controller
        def login_user_post(user, password)
          page.driver.post('author_sessions', username: user, password: password)
        end
      end
    end
  end
end
