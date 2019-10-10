class MainController < ApplicationController
  # GET /
  def index
    @app_options = AppOption.to_map
    json_response(@app_options.as_json(except: %i[created_at updated_at]))
  end
end
