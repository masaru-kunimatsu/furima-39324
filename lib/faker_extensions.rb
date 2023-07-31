module FakerExtensions
  def custom_password
    password = ""
    while password.length < 6 || !password.match(/[a-zA-Z]/) || !password.match(/\d/)
      password = Faker::Internet.password(min_length: 6)
    end
    password
  end

  def custom_katakana(length = 3)
    raise ArgumentError, 'Length should be greater than 0' if length <= 0

    chars = ('ァ'..'ヶ').to_a + ['ー']
    result = ''
    length.times { result << chars.sample }
    result
  end
end

module Faker
  module Japanese
    class << self
      prepend FakerExtensions
    end
  end
end