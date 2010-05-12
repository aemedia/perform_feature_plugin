require 'perform_feature'
require 'perform_shoulda_macro'

require 'i18n_feature_additions'

ActiveRecord::Base.send(:include, PerformFeature)
ActionController::Base.send(:include, PerformFeature)

Test::Unit::TestCase.send(:include, PerformShouldaMacro)
