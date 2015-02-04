feature "create market" do
  before do
    user = User.create email: "test@mail.com", password: "password"

    login user
    visit markets_path
  end

  scenario "with valid information" do
    click_link "Ny marknad"
    within ".new-market" do
      fill_in :market_name, with: "Cool market"
      fill_in :market_description, with: "Description of cool market"
      click_button "Skapa marknad"
    end

    expect(page).to have_content "Ny marknad skapad"
  end

  scenario "with invalid information" do
    click_link "Ny marknad"
    within ".new-market" do
      fill_in :market_name, with: ""
      fill_in :market_description, with: ""
      click_button "Skapa marknad"
    end

    expect(page).to have_content "Skapa ny marknad misslyckades"
  end
end
