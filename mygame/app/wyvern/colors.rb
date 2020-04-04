# frozen_string_literal: true

# Colors Class
class Colors

  @colors = {
    red: 'f44336',
    pink: 'E91E63',
    purple: '9C27B0',
    deep_purple: '673AB7',
    indigo: '3F51B5',
    blue: '2196F3',
    light_blue: '03A9F4',
    cyan: '00BCD4',
    teal: '009688',
    green: '4CAF50',
    light_green: '8BC34A',
    lime: 'CDDC39',
    yellow: 'FFEB3B',
    amber: 'FFC107',
    orange: 'FF9800',
    deep_orange: 'FF5722',
    brown: '795548',
    grey: '9E9E9E',
    blue_grey: '607D8B',
    white: 'FFFFFF',
    black: '000000'
  }

  def self.get_rgb(color)
    color = @colors.fetch(color.to_sym)
    # p color.scan(/../)    ### ===> No Regexp support yet
    color = color.chars.each_slice(2).map(&:join) # => Workaround for the lack of regexp
    color.each_with_index { |x, index| color[index] = x.to_i(16) }

  end
end