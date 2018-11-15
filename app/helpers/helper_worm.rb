def head_layout(req, resp, template)


  resp.set_header('Content-Type', 'text/html')

  helth_value = 10
  if req.params['name']
    resp.set_cookie('name', req.params['name'])
  elsif req.params['eat']
    resp.set_cookie('eat', req.params['eat'])
  elsif req.params['sleep']
    resp.set_cookie('sleep', req.params['sleep'])
  elsif req.params['crawl']
    resp.set_cookie('crawl', req.params['crawl'])
  elsif req.params['trample']
    resp.set_cookie('trample', req.params['trample'])
  elsif req.params['on_hook']
    resp.set_cookie('on_hook', req.params['on_hook'])
  elsif req.params['off_hook']
    resp.set_cookie('off_hook', req.params['off_hook'])
  else
    # resp.set_cookie_header = "helth=#{helth_value.to_s}"
  end

# # binding.pry
cookies = 1

  file = File.read('./app/views/layout.html.erb')
  [200, resp.header, [ERB.new(file).result(binding)]]
end

def template_index
  file = File.read('./app/views/index.html.erb')
  ERB.new(file).result(binding)
end

def template_worm
  file = File.read('./app/views/worm.html.erb')
  ERB.new(file).result(binding)
end

def template_error
  file = File.read('./app/views/error.html.erb')
  ERB.new(file).result(binding)
end
