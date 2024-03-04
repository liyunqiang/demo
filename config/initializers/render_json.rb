module RenderJson
  %w[200 204 401 403 400 404 422 500].each do |status|
    define_method "render_#{status}" do |data = nil|
      render_oj_json(status.to_i, data)
    end
  end

  def render_oj_json(status, data = {})
    message, content =
      if data.is_a? String
        [data, {}]
      elsif data.is_a?(Hash) && data[:msg].present?
        [data[:msg], data.except(:msg)]
      else
        ['success', data]
      end

    meta = { code: status, message: message, response: content }

    unless [200, 204].include? status
      Rails.logger.info("Non-200 Render JSON: #{meta}")
    end

    render json: Oj.dump(meta, mode: :compat), status: status
  end

  def error_code?(status)
    !success_code?(status)
  end

  def success_code?(status)
    success_code.include?(status)
  end

  def success_code
    [200, 204]
  end
end