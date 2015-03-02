feature "log out user" do
  scenario "when logged in" do
    user = User.create email: "user@test.com", password: "password"

    login user
    click_link I18n.t("navigation.log_out")

    expect(page).to have_content I18n.t("devise.sessions.signed_out")
  end
end
