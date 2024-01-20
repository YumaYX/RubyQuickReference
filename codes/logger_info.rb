# https://docs.ruby-lang.org/ja/latest/library/logger.html

require 'logger'

logger = Logger.new(STDOUT)

puts "Level INFO"
logger.level = Logger::INFO # <= change level

logger.warn("Nothing to do!") # output
logger.info("Program started") # output
logger.debug("Created logger") # none
