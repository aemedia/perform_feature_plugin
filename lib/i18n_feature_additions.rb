module I18n 
  class << self
    def has_feature?(feature)
      #at the moment, only us countries can use these features
      return I18n.country.code == 'us'
      
      result = self.t("features.#{feature}")

      if result === true
        result
      else
        raise MissingTranslationData.new('','','')
      end
    end
  end
end