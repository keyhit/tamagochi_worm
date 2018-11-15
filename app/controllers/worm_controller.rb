class Worm
  attr_accessor :req
  def self.layout(req, resp)
    case req.path
    when '/'
      template = index
    when '/worm'
      template = worm
    when '/trample_worm'
      template = worm
    else
      template = error
    end

    head_layout(req, resp, template)
  end

  def self.index
    template_index
  end

  def self.worm
    template_worm
  end

  def self.error
    template_error
  end
end
