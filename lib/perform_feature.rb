# PerformFeature
module PerformFeature
  def self.included(base)
    base.send :class_inheritable_accessor, :feature_options
    
    case base.to_s
      when "ActionController::Base"        
        base.send :include, PerformMethods
        base.extend PerformMethods
        
        base.helper_method :perform_feature
      else
        base.extend PerformMethods
    end
  end
  
  module PerformMethods
    def perform_feature(feature_name)
      self.feature_options = feature_name
      yield if authorised_feature?
    end
    
    private
    
    def authorised_feature?
      self.feature_options == 'test'
    end
  end
end