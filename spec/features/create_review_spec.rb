feature "create review" do
  before do
    user = User.create(email: "user@test.com", password: "password")
    location = Location.create(name: "Location", description: "Description")

    login user
    visit location_path location
  end

  scenario "with content and high rating" do
    within ".review-form" do
      fill_in :review_content, with: "Content"
      fill_in :review_rating, with: 5
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.sent")
    expect(page).to have_content I18n.t("locations.average_rating", average_rating: 5.0, count: 1)
  end

  scenario "with content and low rating" do
    within ".review-form" do
      fill_in :review_content, with: "Content"
      fill_in :review_rating, with: 1
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.sent")
    expect(page).to have_content I18n.t("locations.average_rating", average_rating: 1.0, count: 1)
  end

  scenario "without content but with rating" do
    within ".review-form" do
      fill_in :review_rating, with: 5
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.sent")
  end

  scenario "with content but without rating" do
    within ".review-form" do
      fill_in :review_content, with: "Content"
      click_button I18n.t("reviews.submit")
    end

    expect(page).to have_content I18n.t("reviews.alert")
  end
end
