module I18n 
  class << self
    def has_feature?(feature)
      result = self.t("features.#{feature}")

      result === true
    end
  end
end
