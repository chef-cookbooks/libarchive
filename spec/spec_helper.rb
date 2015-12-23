require 'chefspec'
require 'chefspec/berkshelf'
ChefSpec::Coverage.start!

RSpec.configure do |config|
  config.color = true
  config.formatter = 'doc'
end
