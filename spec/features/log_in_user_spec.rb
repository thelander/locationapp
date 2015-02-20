feature "log in user" do
  before do
    User.create email: "user@test.com", password: "password"

    visit root_path
  end

  scenario "with correct credentials" do
    click_link "Logga in"
    within ".session-form" do
      fill_in "user_email", with: "user@test.com"
      fill_in "user_password", with: "password"
      click_button "Logga in"
    end

    expect(page).to have_content "Loggade in"
  end

  scenario "with incorrect credentials" do
    click_link "Logga in"
    within ".session-form" do
      fill_in "user_email", with: "user@test.com"
      fill_in "user_password", with: "wrong_password"
      click_button "Logga in"
    end

    expect(page).to have_content "Ogiltig epost eller lösenord"
  end
end
