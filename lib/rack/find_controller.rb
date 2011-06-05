module Rack

  class FindController

    def initialize(app)
      @app = app
    end

    def call(env)
      request = Rack::Request.new(env)
      database = request.params['database']

      if database
        env['PATH_INFO'] = database.sub('cowi', '') + env['PATH_INFO']
        env['REQUEST_URI'] = env['PATH_INFO']
      end

      @app.call(env)
    end

  end

end
