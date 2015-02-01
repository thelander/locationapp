feature "create market" do
  before do
    user = User.create email: "test@mail.com", password: "password"

    login user
    visit markets_path
  end

  scenario "with valid data" do
    click_link "Skapa ny"
    within ".new-market" do
      fill_in :market_name, with: "Cool market"
      fill_in :market_description, with: "Description of cool market"
      click_button "Skapa marknad"
    end

    expect(page).to have_content "Cool market Description of cool market"
  end
end
