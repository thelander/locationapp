feature "log in user" do
  before do
    User.create email: "user@test.com", password: "password"

    visit root_path
  end

  scenario "with correct credentials" do
    click_link I18n.t("navigation.log_in")
    within ".session-form" do
      fill_in "user_email", with: "user@test.com"
      fill_in "user_password", with: "password"
      click_button I18n.t("sessions.submit")
    end

    expect(page).to have_content I18n.t("devise.sessions.signed_in")
  end

  scenario "with incorrect credentials" do
    click_link I18n.t("navigation.log_in")
    within ".session-form" do
      fill_in "user_email", with: "user@test.com"
      fill_in "user_password", with: "wrong_password"
      click_button I18n.t("sessions.submit")
    end

    expect(page).to have_content I18n.t("devise.failure.invalid", authentication_keys: I18n.t("email"))
  end
end
