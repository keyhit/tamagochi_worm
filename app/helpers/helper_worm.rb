def head_layout(req, template)
  file = File.read('./app/views/layout.html.erb')

  cookies = req.env['HTTP_COOKIE']


    unless req.params.nil?
      unless req.params['name'].nil?
        cookies['name'] = req.params['name'].to_s
      end
      unless req.params['trample'].nil?
        cookies['trample'] = req.params['name'].to_s
      end
    end

  binding.pry

  [200, { 'Content-Type' => 'text/html'}, [ERB.new(file).result(binding)]]
# caller
end

def template_index
  file = File.read('./app/views/index.html.erb')
  ERB.new(file).result(binding)
end

# def template_worm(his_name)
def template_worm
  file = File.read('./app/views/worm.html.erb')
  ERB.new(file).result(binding)
end