require File.expand_path '../acceptance_helper.rb', __dir__
WebMock.allow_net_connect!

feature 'Postcode search ' do
  scenario 'with valid postcode' do
    visit '/'
    fill_in 'postcode', with: 'SW9 0LR'
    click_button 'Check Postcode'

    expect(page).to have_content('Accepted')
  end

  scenario 'with invalid postcode' do
    visit '/'
    fill_in 'postcode', with: 'HP14 4XW'
    click_button 'Check Postcode'

    expect(page).to have_content('Rejected')
  end

  scenario 'postcode' do
    visit '/'
    fill_in 'postcode', with: 'HHH222333'
    click_button 'Check Postcode'

    expect(page).to have_content('Error')
  end
end
