RSpec.feature "Sign in" do
  let!(:user) { FactoryGirl.create(:user, password: "testing") }
  context "when using valid credentials" do
    it "signs in user successfully" do
      visit new_user_session_path
      within ('.sign-in') do
        fill_in "user_email", with: user.email
        fill_in "user_password", with: "testing"
        click_button "Sign in"
      end
      expect(page).to have_current_path(feed_path)
      expect(page).to have_selector(".alert", text: "Signed in successfully.")
    end
  end
  context "when using invalid credentials" do
    it "does not sign in user" do
      visit new_user_session_path
      within('.sign-in') do
        fill_in "user_email", with: "bad_email@gmail.com"
        fill_in "user_password", with: "badpassword"
        click_button "Sign in"
      end
      expect(page).to have_selector(".alert", text: "Invalid Email or password.")
    end
  end
end
