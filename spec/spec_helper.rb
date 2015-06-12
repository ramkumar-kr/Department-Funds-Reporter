require 'simplecov'
require "factory_girl"
SimpleCov.start
require_relative '../lib/organization'
require_relative 'factories/managerial_department'
require_relative 'factories/procurement_department'
require_relative 'factories/inventory_by_colour'
require_relative 'factories/average_inventory_by_colour'
