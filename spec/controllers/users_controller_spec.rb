require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let!(:user) { create(:user, amount: 123) }
  before do
    stub_request(:any, 'http://bank-examlpe.com')
  end
  describe "POST withdraw_money" do
    context 'with valid input params' do
      it "should change data" do
        post :withdraw_money, params: { id: user.id, user: { amount: 10 } }
        expect(assigns(:result)).to eq(:success)
      end
    end
    context 'with invalid input params' do
      # ... some examlpes
    end
  end
end
