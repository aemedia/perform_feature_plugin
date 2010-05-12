module I18n 
  class << self

    def has_feature?(feature)
      result = self.t("features.#{feature}")

      if result === true
        result
      else
        raise MissingTranslationData.new('','','')
      end
    end
  end
end