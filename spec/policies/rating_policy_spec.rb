describe RatingPolicy do
  permissions :update? do
    it "is permitted for users" do
      user = User.create email: "test@mail.com", password: "password"
      market = Market.create name: "Test market", description: "Description of test market"
      rating = market.ratings.new user: user, score: 1

      expect(RatingPolicy).to permit(user, rating.update(score: 5))
    end

    it "is not permitted for guests" do
      market = Market.create name: "Test market", description: "Description of test market"
      rating = market.ratings.new score: 1

      expect(RatingPolicy).to_not permit(nil, rating.update(score: 5))
    end
  end
end
