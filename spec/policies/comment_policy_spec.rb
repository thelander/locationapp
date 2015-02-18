describe CommentPolicy do
  permissions :create? do
    it "is permitted for users" do
      user = User.create email: "test@mail.com", password: "password"
      market = Market.create name: "Test market", description: "Description of test market"

      expect(CommentPolicy).to permit(user, market.comments.new)
    end

    it "is not permitted for guests" do
      market = Market.create name: "Test market", description: "Description of test market"

      expect(CommentPolicy).not_to permit(nil, market.comments.new)
    end
  end

  permissions :destroy? do
    it "is permitted for author" do
      user = User.create email: "test@mail.com", password: "password"
      comment = Comment.create content: "Comment content", user: user

      expect(CommentPolicy).to permit(user, comment)
    end

    it "is not permitted for non-author" do
      user = User.create email: "test@mail.com", password: "password"
      user2 = User.create email: "test2@mail.com", password: "password"
      comment = Comment.create content: "Comment content", user: user

      expect(CommentPolicy).not_to permit(user2, comment)
    end

    it "is not permitted for guests" do
      user = User.create email: "test@mail.com", password: "password"
      comment = Comment.create content: "Comment content", user: user

      expect(CommentPolicy).not_to permit(nil, comment)
    end
  end
end
