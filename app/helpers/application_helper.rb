module ApplicationHelper
  def show_cart(attributes = {}, &block)
    attributes['style'] = 'display: block'
    content_tag('div', attributes, &block)
  end
  def hidden_div_if(condition, attributes = {}, &block)
    attributes['style'] = 'display: none'
    if condition
      content_tag('div', attributes, &block)
    end
  end

end
