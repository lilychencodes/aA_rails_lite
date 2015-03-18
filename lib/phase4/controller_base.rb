require_relative '../phase3/controller_base'
require_relative './session'

module Phase4
  class ControllerBase < Phase3::ControllerBase
    def redirect_to(url)
      super(url)
      self.session.store_session(res)
      # storing session to response, adding cookie to response with session data
    end

    def render_content(content, content_type)
      super(content, content_type)
      self.session.store_session(res)
    end

    # method exposing a `Session` object
    def session
      @session ||= Session.new(req)
      # constructs a cookie hash
    end
  end
end
