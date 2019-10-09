module Response
  def json_response(object, code = 200, status = :Success)
    render json: { code: code, msg: status, data: object }, status: :ok
  end
end