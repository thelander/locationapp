feature "create market" do
  before do
    user = User.create email: "user@test.com", password: "password"

    login user
    visit markets_path
  end

  scenario "with valid information" do
    click_link "Ny marknad"
    within ".market-form" do
      fill_in :market_name, with: "Market"
      fill_in :market_description, with: "Market description"
      click_button "Skapa marknad"
    end

    expect(page).to have_content "Ny marknad skapad"
  end

  scenario "with invalid information" do
    click_link "Ny marknad"
    within ".market-form" do
      fill_in :market_name, with: ""
      fill_in :market_description, with: ""
      click_button "Skapa marknad"
    end

    expect(page).to have_content "Skapa ny marknad misslyckades"
  end
end
