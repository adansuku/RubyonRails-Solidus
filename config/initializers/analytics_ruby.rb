# config/initializers/analytics_ruby.rb
# https://segment.com/docs/sources/server/ruby/

  Analytics = Segment::Analytics.new({
                                         write_key: ENV['SEGMENT_KEY_RUBY'],
                                         on_error: Proc.new { |status, msg| print msg }
                                     })