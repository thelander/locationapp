feature "create market" do
  before do
    user = User.create email: "user@test.com", password: "password"

    login user
    visit markets_path
  end

  scenario "with valid information" do
    click_link I18n.t("navigation.new_market")
    within ".market-form" do
      fill_in :market_name, with: "Market"
      fill_in :market_description, with: "Market description"
      click_button I18n.t("markets.submit")
    end

    expect(page).to have_content I18n.t("markets.created")
  end

  scenario "with invalid information" do
    click_link I18n.t("navigation.new_market")
    within ".market-form" do
      fill_in :market_name, with: ""
      fill_in :market_description, with: ""
      click_button I18n.t("markets.submit")
    end

    expect(page).to have_content I18n.t("markets.alert")
  end
end
