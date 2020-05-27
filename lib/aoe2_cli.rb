# frozen_string_literal: true

#application enviornment

require 'bundler/setup'
Bundler.require(:default)

require_relative './aoe2_cli/api.rb'
require_relative './aoe2_cli/cli.rb'
require_relative './aoe2_cli/empires.rb'


__END__
'require' is used when we have a gem or file saved / dowloaded and want to used it
'require_relative' is used when we have a flie we want to use in our directory 