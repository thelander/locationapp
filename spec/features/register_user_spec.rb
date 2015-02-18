feature "register user" do
  before do
    visit root_path
  end

  scenario "with valid information" do
    click_link "Registrera"
    within ".registration-form" do
      fill_in "user_firstname", with: "Firstname"
      fill_in "user_lastname", with: "Lastname"
      fill_in "user_email", with: "user@test.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Registrera"
    end

    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "with invalid information" do
    click_link "Registrera"
    within ".registration-form" do
      fill_in "user_firstname", with: ""
      fill_in "user_lastname", with: ""
      fill_in "user_email", with: "user"
      fill_in "user_password", with: "pass"
      fill_in "user_password_confirmation", with: "word"
      click_button "Registrera"
    end

    expect(page).to have_content "3 errors prohibited this user from being saved"
  end
end
