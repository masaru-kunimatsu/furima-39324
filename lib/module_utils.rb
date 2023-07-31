module ModuleUtils
  def custom_katakana(length = 1)
    raise ArgumentError, 'Length should be greater than 0' if length <= 0

    chars = ('ァ'..'ヶ').to_a + ['ー']
    result = ''
    length.times { result << chars.sample }
    result
  end
end