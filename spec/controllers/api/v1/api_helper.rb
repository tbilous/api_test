# def api_normalize(params)
#   ApiConventionsHelper::HashTransformer.new.camelize_keys(params)
# end

def do_request(url, http_method, options)
  send(http_method, url, params: {}.merge(options))
end
