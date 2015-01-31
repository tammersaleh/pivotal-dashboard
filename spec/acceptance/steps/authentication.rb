step 'I sign in as :name' do |name|
  click_link 'signin'
  mock_oauth_for(name)
  click_link 'Log in with Google Apps'
end

step 'I sign out as :name' do |name|
  click_link "Sign out #{name}@example.com"
end

step 'I should be signed in as :name' do |name|
  page.should have_content("Signed in as #{name}@example.com")
  page.should_not have_selector('#signin')
end

step 'I should not be signed in' do |name|
  page.should_not have_content("Signed in as")
  page.should have_selector('#signin')
end

