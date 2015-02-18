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
      click_button "Skicka"
    end

    expect(page).to have_content "Din kommentar har skickats"
  end

  scenario "with invalid content" do
    within ".comment-form" do
      fill_in :comment_content, with: "C"
      click_button "Skicka"
    end

    expect(page).to have_content "Din kommentar är ogiltig"
  end
end
