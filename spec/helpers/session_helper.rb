module SessionHelper
  def login user
    visit root_path

    click_link "Logga in"
    within ".session-form" do
      fill_in "user_email", with: user.email
      fill_in "user_password", with: user.password
      click_button "Logga in"
    end
  end
end
