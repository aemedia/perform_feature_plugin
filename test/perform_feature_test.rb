require 'test_helper'
class PerformFeatureTest < ActiveSupport::TestCase
  load_schema

  class MyModel < ::ActiveRecord::Base; 
    def always_available;end
  end

  context "an ActiveRecord class" do
    context "with an unauthorised feature" do
      setup do
        MyModel.expects(:authorised_feature?).returns(false)
        
        class MyModel
          perform_feature 'unauthorised_feature' do
            def unauthorised_feature; end
          end
        end
    
        @model = MyModel.new
      end
    
      should "not respond to featured method" do
        assert @model.respond_to?('always_available')
        assert_equal false, @model.respond_to?('unauthorised_feature')
      end
    end

    context "with an authorised feature" do
      setup do
        MyModel.expects(:authorised_feature?).at_least_once.returns(true)

        class MyModel
          perform_feature 'authorised_feature' do
            def this_authorised_feature; end
          end
        end

        @model = MyModel.new
      end

      should "respond to featured method" do
        assert @model.respond_to?('always_available')
        assert_equal true, @model.respond_to?('this_authorised_feature')
      end
    end
  end
end
