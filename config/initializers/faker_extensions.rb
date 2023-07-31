require 'module_utils' 
module FakerExtensions
  def custom_password
    password = ""
    while password.length < 6 || !password.match(/[a-zA-Z]/) || !password.match(/\d/)
      password = Faker::Internet.password(min_length: 6)
    end
    password
  end
  def custom_katakana
    katakana = ""
    while katakana.blank? || katakana.match(/[^ァ-ヶー]/)
      katakana = Faker::Japanese.random_katakana(3)
    end
    katakana
  end
end

module Faker
  module Japanese
    extend ModuleUtils
    extend self

    # 任意の文字数のランダムな日本語文字列を生成します。
    def random_japanese(length = 1)
      raise ArgumentError, 'Length should be greater than 0' if length <= 0

      chars = ('ぁ'..'ん').to_a + ('ァ'..'ン').to_a + ('一'..'龠').to_a
      result = ''
      length.times { result << chars.sample }
      result
    end
  end
end


Faker::Internet.singleton_class.include(FakerExtensions)