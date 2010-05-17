require 'perform_feature'
require 'i18n_feature_additions'

ActiveRecord::Base.send(:include, PerformFeature)
ActionController::Base.send(:include, PerformFeature)