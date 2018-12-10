require 'spec_helper'

describe UsersController , :type => :controller do

    it "should get new" do
        get :new #deve matchare l'azione del controllore e non l'url
        expect(response.status).to eq(200)
    end

    it "should redirect index when not logged in" do
        get :index
        assert_redirected_to login_url
    end

end