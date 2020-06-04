# frozen_string_literal: true

#application enviornment

require 'bundler/setup'
Bundler.require(:default)

require_relative './aoe2_cli/api.rb'
require_relative './aoe2_cli/cli.rb'
require_relative './aoe2_cli/civilization.rb'
require_relative './aoe2_cli/unit.rb'
require_relative './aoe2_cli/structure.rb'
require_relative './aoe2_cli/technology.rb'