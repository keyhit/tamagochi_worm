# def head_layout(req, resp, template)
#   resp.set_header('Content-Type', 'text/html')

#   if req.params['name']
#     resp.set_cookie('name', req.params['name'])
#     resp.set_cookie('helth', 10)
#   elsif req.params['eat']
#     resp.set_cookie('eat', req.params['eat'])
#     # resp.set_cookie('helth', req.params['eat'].to_i)
#   elsif req.params['sleep']
#     resp.set_cookie('sleep', req.params['sleep'])
#   elsif req.params['crawl']
#     resp.set_cookie('crawl', req.params['crawl'])
#   elsif req.params['trample']
#     resp.set_cookie('trample', req.params['trample'])
#   elsif req.params['on_hook']
#     resp.set_cookie('on_hook', req.params['on_hook'])
#     resp.set_cookie('helth', 10 - req.params['on_hook'].to_i)
#   elsif req.params['off_hook']
#     resp.set_cookie('off_hook', req.params['off_hook'])
#   end

#   cookies = req.env['HTTP_COOKIE']
#   if cookies
#     cookies_to_array = cookies.gsub(/[=;]/, ' ').split(' ')
#     cookies_arr_to_hash = Hash[*cookies_to_array]
#   else
#     cookies_arr_to_hash = 'No cookies'
#   end

#   cookies_arr_to_hash['name'] ? worm_name = cookies_arr_to_hash['name'] : worm_name = 'Input worm name in index page!!!!'
#   cookies_arr_to_hash['helth'] ? helth = cookies_arr_to_hash['helth'] : helth = 'no Helth'


#   file = File.read('./app/views/layout.html.erb')
#   [200, resp.header, [ERB.new(file).result(binding)]]
# end

# # def template_index
# #   file = File.read('./app/views/index.html.erb')
# #   ERB.new(file).result(binding)
# # end

# # def template_worm
# #   file = File.read('./app/views/worm.html.erb')
# #   ERB.new(file).result(binding)
# # end

# # def template_error
# #   file = File.read('./app/views/error.html.erb')
# #   ERB.new(file).result(binding)
# # end
