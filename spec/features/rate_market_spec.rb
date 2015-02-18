feature "rate market" do
  before do
    user = User.create email: "user@test.com", password: "password"
    market = Market.create name: "Market", description: "Market description"

    login user
    visit market_path market
  end

  scenario "with a poor score", js: true do
    find("#rating > img:nth-child(1)").click
    reload

    expect(page).to have_selector "#rating img[title='bad']"
  end

  scenario "with a great score", js: true do
    find("#rating > img:nth-child(5)").click
    reload

    expect(page).to have_selector "#rating img[title='gorgeous']"
  end
end
