#!/usr/bin/ruby

clearing :on

#$ while bundle exec guard; do echo "Restarting Guard..."; done

guard :bundler do
  watch("Gemfile")
end

guard 'livereload' do
  watch(%r{app/views/.+\.(erb|haml|slim)$})
  watch(%r{app/helpers/.+\.rb})
  watch(%r{public/.+\.(css|js|html)})
  watch(%r{config/locales/.+\.yml})
  # Rails Assets Pipeline
  watch(%r{(app|vendor)(/assets/\w+/(.+\.(css|js|html|png|jpg))).*}) { |m| "/assets/#{m[3]}" }
end

# Note: The cmd option is now required due to the increasing number of ways
#       rspec may be run, below are examples of the most common uses.
#  * bundler: 'bundle exec rspec'
#  * bundler binstubs: 'bin/rspec'
#  * spring: 'bin/rspec' (This will use spring if running and you have
#                          installed the spring binstubs per the docs)
#  * zeus: 'zeus rspec' (requires the server to be started separately)
#  * 'just' rspec: 'rspec'

guard :rspec, cmd: "bin/rspec", all_on_start: true do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^spec/acceptance/(.+)\.feature$})

  watch(%r{^lib/.*})                   { "spec" }
  watch(%r{^app/.*})                   { "spec" }
  watch(%r{^spec/acceptance/steps/.*}) { "spec" }
  watch('spec/turnip_helper.rb')       { "spec" }
  watch(%r{^config/.*})                { "spec" }
  watch("Gemfile.lock")                { "spec" }
  watch('spec/spec_helper.rb')         { "spec" }
  watch(%r{^spec/support/.*})          { "spec" }
end
