require 'test_helper'

class PerformFeature::FeaturesController < ActionController::Base
  def index
    render :text => 'index'
  end

  def show
    perform_feature('showtheshow') do
      render :text => 'showtime'
      return
    end
    redirect_to :action => :index
  end
end

class PerformFeature::FeaturesControllerTest < ActionController::TestCase
  tests PerformFeature::FeaturesController
  context "A Controller" do  
    context "without authorising the feature" do
      setup do
        PerformFeature::FeaturesController.any_instance.expects(:authorised_feature?).returns(false)
      end

      should "redirect for action" do
        get :show
        assert_response :redirect 
      end
    end

    context "when authorising the feature" do
      setup do
        PerformFeature::FeaturesController.any_instance.expects(:authorised_feature?).returns(true)
      end

      should "redirect for action" do
        get :show
        assert_response :success 
      end
    end
  end
end
