feature "log in user" do
  before do
    User.create email: "test@mail.com", password: "password"

    visit root_path
  end

  scenario "with correct credentials" do
    click_link "Logga in"
    within ".session" do
      fill_in "user_email", with: "test@mail.com"
      fill_in "user_password", with: "password"
      click_button "Logga in"
    end

    expect(page).to have_content "Signed in successfully"
  end

  scenario "with incorrect credentials" do
    click_link "Logga in"
    within ".session" do
      fill_in "user_email", with: "test@mail.com"
      fill_in "user_password", with: "wordpass"
      click_button "Logga in"
    end

    expect(page).to have_content "Invalid email or password"
  end
end
