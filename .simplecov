# frozen_string_literal: true

DEFAULT_COVERAGE_DIR = 'coverage'

require 'simplecov'

SimpleCov.coverage_dir(ENV['COVERAGE_DIR'] || DEFAULT_COVERAGE_DIR)

SimpleCov.start
