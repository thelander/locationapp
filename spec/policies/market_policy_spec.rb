describe MarketPolicy do
  permissions :new?, :create? do
    it "is permitted for users" do
      user = User.create email: "test@mail.com", password: "password"

      expect(MarketPolicy).to permit(user, Market.new)
    end

    it "is not permitted for guests" do
      expect(MarketPolicy).not_to permit(nil, Market.new)
    end
  end
end
