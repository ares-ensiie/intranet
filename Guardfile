# A sample Guardfile
# More info at https://github.com/guard/guard#readme

guard 'rspec', all_on_start: false, all_after_pass: false, zeus: true, parallel: true, bundler: false do
  watch(%r{^spec/.+_spec\.rb$})
  watch(%r{^lib/(.+)\.rb$})     { |m| "spec/lib/#{m[1]}_spec.rb" }
  watch('spec/spec_helper.rb')  { "spec" }

  # Rails example
  watch(%r{^spec/support/(.+)\.rb$})                  { "spec" }

  # Api V1
  watch(%r{^app/(.*)\.rb$}) { 'spec/api/v1' }

  # Capybara features specs
  watch(%r{^app/views/(.+)/.*\.(erb|haml)$})          { |m| "spec/features/#{m[1]}_spec.rb" }
end
