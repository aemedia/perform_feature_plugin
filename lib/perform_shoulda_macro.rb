module PerformShouldaMacro
  def self.included(base)
    base.send :class_inheritable_accessor, :stubbed_features

    base.send :include, InstanceMethods
  end

  module InstanceMethods
    def stub_to_perform_features(*features)
      self.stubbed_features ||= Set.new
      self.stubbed_features += features
      
      features.each do | feature |
        # I18n.stubs(:has_feature?).with(feature).returns(true)
      end
    end

    def should_perform_feature(feature)
      Logger.warn %Q{Feature "#{feature}" has not been stubbed} unless self.stubbed_features.include?(feature.to_sym)
      yield
    end
  end
end