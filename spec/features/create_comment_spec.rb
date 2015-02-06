feature "create comment" do
  before do
    user = User.create email: "test@mail.com", password: "password"
    market = Market.create name: "Test market", description: "Description of test market"

    login user
    visit market_path market
  end

  scenario "with valid content" do
    within ".comment-form" do
      fill_in :comment_content, with: "Cool comment"
      click_button "Skicka"
    end

    expect(page).to have_content "Din kommentar har skickats"
  end

  scenario "with invalid content" do
    within ".comment-form" do
      fill_in :comment_content, with: "A"
      click_button "Skicka"
    end

    expect(page).to have_content "Din kommentar är ogiltig"
  end
end
