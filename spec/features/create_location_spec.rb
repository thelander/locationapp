feature "create location" do
  before do
    user = User.create(email: "user@test.com", password: "password")

    login user
    visit locations_path
  end

  scenario "with valid information" do
    click_link I18n.t("navigation.new_location")
    within ".location-form" do
      fill_in :location_name, with: "Location"
      fill_in :location_description, with: "Description"
      click_button I18n.t("locations.submit")
    end

    expect(page).to have_content I18n.t("locations.created")
  end

  scenario "with invalid information" do
    click_link I18n.t("navigation.new_location")
    within ".location-form" do
      fill_in :location_name, with: ""
      fill_in :location_description, with: ""
      click_button I18n.t("locations.submit")
    end

    expect(page).to have_content I18n.t("locations.alert")
  end
end
