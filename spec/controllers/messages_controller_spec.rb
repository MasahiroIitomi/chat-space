require 'rails_helper'

describe MessagesController do
  let(:user) {create(:user)}
  let(:group) {create(:group)}
  let(:par) do
     {group_id: group.id}
  end
  describe 'GET #index' do
    context 'login' do
      before do
        login_user user
        get :index, group_id: group
      end
      it "assigns the requested group to @group" do
        expect(assigns(:group)).to eq group
      end
      it "assigns the requested message to @message" do
        expect(assigns(:message)).to be_a_new(Message)
      end
      it "assigns the requested messages to @messages" do
        messages = create_list(:message, 3)
        expect(assigns(:messages)).to match(messages)
      end
      it "renders the :index template" do
        expect(response).to render_template :index
      end
    end
    context 'logout' do
      it "redirect to the new_user_session_path" do
        get :index, group_id: group
        expect(response).to redirect_to new_user_session_path
      end
    end
  end

  describe 'POST #create' do
    describe 'login' do
      before do
        login_user user
      end
      context 'saved massage successfully' do
        it "saved message" do
          expect do
            post :create, params: {group_id: group, message: attributes_for(:message)}
          end.to change(Message, :count).by(1)
        end
        it "redirect to group_messages_path" do
          post :create, params: {group_id: group, message: attributes_for(:message)}
          expect(response).to redirect_to group_messages_path
        end
      end
      context "failed to save message" do
        it "failed to save message" do
          expect do
            post :create, params: {group_id: group, message: attributes_for(:message, body: nil, image: nil)}
          end.to change(Message, :count).by(0)
        end
        it "redirect to group_messages_path" do
          post :create, params: {group_id: group, message: attributes_for(:message, body: nil, image: nil)}
          expect(response).to redirect_to group_messages_path
        end
      end
    end
    describe 'logout' do
      it "redirect_to the new_user_session_path" do
        post :create, group_id: group
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
