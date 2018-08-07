
      before(:each) do
        @team = create(:team, user: @current_user)
        @guest_user = create(:user)
        @team.users << @guest_user
      end

      it "returns http success" do
        delete :destroy, params: { id: @guest_user.id, team_id: @team.id }
        expect(response).to have_http_status(:success)
      end
    end

    context "Team not owner" do
      before(:each) do
        @team = create(:team)
        @guest_user = create(:user)
        @team.users << @guest_user
      end

      it "returns http forbidden" do
        delete :destroy, params: { id: @guest_user.id, team_id: @team.id }
        expect(response).to have_http_status(:forbidden)
      end
    end
  end

end