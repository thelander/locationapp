feature "user" do
  before do
    visit root_path
  end

  scenario "register with valid data" do
    click_link "Registrera"
    within ".session" do
      fill_in "user_email", with: "test@mail.com"
      fill_in "user_password", with: "password"
      fill_in "user_password_confirmation", with: "password"
      click_button "Registrera"
    end

    expect(page).to have_content "Welcome! You have signed up successfully"
  end

  scenario "register with invalid data" do
    click_link "Registrera"
    within ".session" do
      fill_in "user_email", with: "test@mail.com"
      fill_in "user_password", with: "pass"
      fill_in "user_password_confirmation", with: "word"
      click_button "Registrera"
    end

    expect(page).to have_content "2 errors prohibited this user from being saved"
  end
end
