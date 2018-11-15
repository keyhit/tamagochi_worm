class Worm
  # def self.layout(req, resp)
  #   case req.path
  #   when '/'
  #     template = index
  #   when '/worm'
  #     template = worm
  #   when '/trample_worm'
  #     template = worm
  #   else
  #     template = error
  #   end

  #   head_layout(req, resp, template)
  # end

  # def self.index
  #   template_index
  # end

  # def self.worm
  #   template_worm
  # end

  # def self.error
  #   template_error
  # end
  def self.layout(req, resp)
    resp.set_header('Content-Type', 'text/html')

    if req.params['name']
      resp.set_cookie('name', req.params['name'])
      resp.set_cookie('helth', 10)
    end

    cookies = req.env['HTTP_COOKIE']
    if cookies
      cookies_to_array = cookies.gsub(/[=;]/, ' ').split(' ')
      cookies_arr_to_hash = Hash[*cookies_to_array]
    else
      cookies_arr_to_hash = 'No cookies'
    end

    cookies_arr_to_hash['name'] ? worm_name = cookies_arr_to_hash['name'] : worm_name = 'Input worm name in index page!!!!'
    cookies_arr_to_hash['helth'] ? helth = cookies_arr_to_hash['helth'] : helth = 0

    if req.params['eat']
      resp.set_cookie('eat', req.params['eat'])
      resp.set_cookie('helth', helth.to_i + req.params['eat'].to_i)
    elsif req.params['sleep']
      resp.set_cookie('sleep', req.params['sleep'])
      resp.set_cookie('helth', helth.to_i + req.params['sleep'].to_i)
    elsif req.params['crawl']
      resp.set_cookie('crawl', req.params['crawl'])
      resp.set_cookie('helth', helth.to_i - req.params['crawl'].to_i)
    elsif req.params['trample']
      resp.set_cookie('trample', req.params['trample'])
      resp.set_cookie('helth', req.params['trample'].to_i)
    elsif req.params['on_hook']
      resp.set_cookie('on_hook', req.params['on_hook'])
      resp.set_cookie('helth', helth.to_i + req.params['on_hook'].to_i)
    elsif req.params['off_hook']
      resp.set_cookie('off_hook', req.params['off_hook'])
    end

    if helth.to_i <= 3 && helth.to_i > 0
      message = "WARNING !!! Let him sleep or eat othervise or  it might die !!!!"
    elsif helth.to_i <= 0 && worm_name != 'Input worm name in index page!!!!'
      message = "I`m so sorry but warm is DIE!!!"
    elsif helth.to_i >= 4 && worm_name != 'Input worm name in index page!!!!'
      message = "Its ok"
    end
# p
# p
# p
# p "==============req=============="
# p req
# p "============resp================="
# p resp
# p "==============end==============="
# p "------------------------------------------------------"

    file = File.read('./app/views/layout.html.erb')
    return [200, resp.header, [ERB.new(file).result(binding)]]
  end

end
