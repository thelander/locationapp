feature "create review" do
  before do
    user = User.create email: "user@test.com", password: "password"
    location = Location.create name: "Location", description: "Location description"

    login user
    visit location_path location
  end

  scenario "with valid content" do
    within ".review-form" do
      fill_in :review_content, with: "Review content"
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.sent")
  end

  scenario "with invalid content" do
    within ".review-form" do
      fill_in :review_content, with: "R"
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.alert")
  end
end
