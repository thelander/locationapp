feature "create comment" do
  before do
    user = User.create email: "user@test.com", password: "password"
    market = Market.create name: "Market", description: "Market description"

    login user
    visit market_path market
  end

  scenario "with valid content" do
    within ".comment-form" do
      fill_in :comment_content, with: "Comment content"
      click_button I18n.t("comments.submit")
    end

    expect(page).to have_content I18n.t("comments.sent")
  end

  scenario "with invalid content" do
    within ".comment-form" do
      fill_in :comment_content, with: "C"
      click_button I18n.t("comments.submit")
    end

    expect(page).to have_content I18n.t("comments.alert")
  end
end
