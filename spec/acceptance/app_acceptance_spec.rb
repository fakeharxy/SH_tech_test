require File.expand_path '../acceptance_helper.rb', __dir__

feature 'Postcode search ' do
  scenario 'with valid postcode' do
    visit '/'
    fill_in 'postcode', with: 'SW9 0LR'
    click_button 'Check'

    expect(page).to have_content('whitelisted')
  end
end
