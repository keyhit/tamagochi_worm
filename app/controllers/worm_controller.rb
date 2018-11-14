class Worm
  attr_accessor :req
  def self.layout(req)
    # binding.pry
    case req.path
    when '/'
      template = index
    when '/worm' || '/trample_worm'
      template = worm
    when '/trample_worm'
      template = worm
    end
    head_layout(req, template)
  end

  def self.index
    template_index
  end

  def self.worm
    template_worm
  end
end
