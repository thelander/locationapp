describe LocationPolicy do
  permissions :new?, :create? do
    it "is permitted for users" do
      user = User.create email: "test@mail.com", password: "password"

      expect(LocationPolicy).to permit(user, Location.new)
    end

    it "is not permitted for guests" do
      expect(LocationPolicy).not_to permit(nil, Location.new)
    end
  end
end
