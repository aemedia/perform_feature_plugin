# PerformFeature
module PerformFeature
  def self.included(base)
    # base.send :class_inheritable_accessor, :feature_options
    case base.name
      when "ActionController::Base"        
        base.send :include, PerformMethods
        base.extend PerformMethods
        
        base.helper_method :perform_feature
        base.helper_method :authorised_feature?
      else
        base.extend PerformMethods
    end
  end
  
  module PerformMethods
    def perform_feature(feature)
      yield if authorised_feature?(feature)
    end
    
    def authorised_feature?(feature)
      I18n.has_feature?(feature)
    rescue I18n::MissingTranslationData => e
      return false
    end
  end
end