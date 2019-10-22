require File.expand_path '../acceptance_helper.rb', __dir__
WebMock.allow_net_connect!

feature 'Postcode search' do
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

feature 'The Whitelist' do
  scenario 'add postcode to whitelist' do
    visit '/custom_whitelist'
    fill_in 'whitelist_postcode', with: 'RANDOM'
    click_button 'Add to Whitelist'

    expect(page).to have_content('random')
  end

  scenario 'remove postcode from whitelist' do
    visit '/custom_whitelist'
    fill_in 'whitelist_postcode', with: 'RANDOM'
    click_button 'Add to Whitelist'
    click_link 'remove'

    expect(page).to_not have_content('random')
  end

  scenario 'duplicate can not be added' do
    visit '/custom_whitelist'
    fill_in 'whitelist_postcode', with: 'TEST'
    click_button 'Add to Whitelist'

    expect(page).to_not have_content('test').twice
  end
end
