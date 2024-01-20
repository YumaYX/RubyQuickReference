t = Time.now
p t.strftime("%F")


require 'date'

p Date::MONTHNAMES
p Date::DAYNAMES
p DOW_JP = %w[日 月 火 水 木 金 土].map(&:freeze).freeze
