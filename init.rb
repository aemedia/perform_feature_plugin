require 'perform_feature'

ActiveRecord::Base.send(:include, PerformFeature)
ActionController::Base.send(:include, PerformFeature)