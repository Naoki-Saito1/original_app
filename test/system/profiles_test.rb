require 'application_system_test_case'

class ProfilesTest < ApplicationSystemTestCase
  setup do
    @profile = profiles(:one)
  end

  test 'visiting the index' do
    visit profiles_url
    assert_selector 'h1', text: 'Profiles'
  end

  test 'creating a Profile' do
    visit profiles_url
    click_on 'New Profile'

    fill_in 'Address', with: @profile.address
    fill_in 'Birth date', with: @profile.birth_date
    fill_in 'Body', with: @profile.body
    fill_in 'Detail', with: @profile.detail
    fill_in 'Gender', with: @profile.gender
    fill_in 'Github', with: @profile.github
    fill_in 'Image', with: @profile.image
    fill_in 'Name', with: @profile.name
    fill_in 'Qiita', with: @profile.qiita
    fill_in 'Status', with: @profile.status
    fill_in 'Twitter', with: @profile.twitter
    fill_in 'User', with: @profile.user_id
    click_on 'Create Profile'

    assert_text 'Profile was successfully created'
    click_on 'Back'
  end

  test 'updating a Profile' do
    visit profiles_url
    click_on 'Edit', match: :first

    fill_in 'Address', with: @profile.address
    fill_in 'Birth date', with: @profile.birth_date
    fill_in 'Body', with: @profile.body
    fill_in 'Detail', with: @profile.detail
    fill_in 'Gender', with: @profile.gender
    fill_in 'Github', with: @profile.github
    fill_in 'Image', with: @profile.image
    fill_in 'Name', with: @profile.name
    fill_in 'Qiita', with: @profile.qiita
    fill_in 'Status', with: @profile.status
    fill_in 'Twitter', with: @profile.twitter
    fill_in 'User', with: @profile.user_id
    click_on 'Update Profile'

    assert_text 'Profile was successfully updated'
    click_on 'Back'
  end

  test 'destroying a Profile' do
    visit profiles_url
    page.accept_confirm do
      click_on 'Destroy', match: :first
    end

    assert_text 'Profile was successfully destroyed'
  end
end
