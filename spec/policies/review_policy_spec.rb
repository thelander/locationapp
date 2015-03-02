describe ReviewPolicy do
  permissions :create? do
    it "is permitted for users" do
      user = User.create email: "test@mail.com", password: "password"
      market = Market.create name: "Test market", description: "Description of test market"

      expect(ReviewPolicy).to permit(user, market.reviews.new)
    end

    it "is not permitted for guests" do
      market = Market.create name: "Test market", description: "Description of test market"

      expect(ReviewPolicy).not_to permit(nil, market.reviews.new)
    end
  end

  permissions :destroy? do
    it "is permitted for author" do
      user = User.create email: "test@mail.com", password: "password"
      review = Review.create content: "Review content", user: user

      expect(ReviewPolicy).to permit(user, review)
    end

    it "is not permitted for non-author" do
      user = User.create email: "test@mail.com", password: "password"
      user2 = User.create email: "test2@mail.com", password: "password"
      review = Review.create content: "Review content", user: user

      expect(ReviewPolicy).not_to permit(user2, review)
    end

    it "is not permitted for guests" do
      user = User.create email: "test@mail.com", password: "password"
      review = Review.create content: "Review content", user: user

      expect(ReviewPolicy).not_to permit(nil, review)
    end
  end
end
