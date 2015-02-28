module SessionHelper
  def login user
    visit root_path

    click_link I18n.t("navigation.log_in")
    within ".session-form" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button I18n.t("sessions.submit")
    end
  end
end
