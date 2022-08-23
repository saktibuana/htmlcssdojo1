require 'rails_helper'

RSpec.describe 'update user', type: :request do
  let(:user_params) { { name: 'test_name', email: 'test.email@prog-8.com' } }
  let(:another_user_params) { { name_attribute_for_name => 'another_name', name_attribute_for_email => 'another.email@prog-8.com' } }
  let(:invalid_user_params) { { name_attribute_for_name => nil, name_attribute_for_email => nil } }
  let(:registered_email_params) { { name_attribute_for_name => 'another_name', name_attribute_for_email => 'test.email@prog-8.com' } }

  it '@@@The form_tag is not used properly on pages like "localhost:3000/users/1/edit".@@@' do
    user = User.create(user_params)
    get "/users/#{user.id}/edit"
    expect(response.body).to match(/<form/)
  end

  it '@@@The URL of the form is not set to URLs like "/users/1/update" on pages like "localhost:3000/users/1/edit" page.@@@' do
    user = User.create(user_params)
    get "/users/#{user.id}/edit"
    expect(response.body).to match(%r{<form.+action\s*=\s*["']/users/#{user.id}/update})
  end

  it '@@@The "name" attribute for the Name input is not set on pages like "localhost:3000/users/1/edit".@@@' do
    expect(name_attribute_for_name).not_to be_nil
  end

  it '@@@The "name" attribute for the Email input is not set on pages like "localhost:3000/users/1/edit".@@@' do
    expect(name_attribute_for_email).not_to be_nil
  end

  it '@@@The "name" attribute for the Name input and Email input should not be the same on pages like "localhost:3000/users/1/edit".@@@' do
    expect(name_attribute_for_name).not_to eq(name_attribute_for_email)
  end

  it '@@@The "post" route for pages like "localhost:3000/users/1/update" does not exist.@@@' do
    user = User.create(user_params)
    expect { post "/users/#{user.id}/update", params: another_user_params }.not_to raise_error(ActionController::RoutingError)
  end

  it '@@@There is an error in the update process. Please try it in the browser.@@@' do
    user = User.create(user_params)
    expect { post "/users/#{user.id}/update", params: another_user_params }.not_to raise_error
  end

  it '@@@The user\'s name is not updated.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: another_user_params
    user.reload
    expect(user.name).to eq('another_name')
  end

  it '@@@The user\'s email is not updated.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: another_user_params
    user.reload
    expect(user.email).to eq('another.email@prog-8.com')
  end

  it '@@@The "User details" page is not displayed after the edit.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: another_user_params
    expect(response).to redirect_to(%r{/users/#{user.id}})
  end

  it '@@@The flash message "Your account has been updated successfully" is not displayed after the edit.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: another_user_params
    expect(flash[:notice]).to eq('Your account has been updated successfully')
  end

  it '@@@The "Edit account" page is not displayed again when the editing fails.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: invalid_user_params
    expect(response.body).to include('main users-edit')
  end

  it '@@@There is an error when the editing fails. Please try it in the browser.@@@' do
    user = User.create(user_params)
    get "/users/#{user.id}/edit"
    expect(response).to have_http_status(200)
  end

  it '@@@The error message "Name can\'t be blank" is not displayed when the Name input is empty.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: invalid_user_params
    expect(response.body).to include('Name can&#39;t be blank')
  end

  it '@@@The error message "Email can\'t be blank" is not displayed when the Email input is empty.@@@' do
    user = User.create(user_params)
    post "/users/#{user.id}/update", params: invalid_user_params
    expect(response.body).to include('Email can&#39;t be blank')
  end

  it '@@@The error message "Email has already been taken" is not displayed when a user with the email already exists.@@@' do
    User.create(user_params)
    new_user = User.create(name: 'new name', email: 'new email')
    post "/users/#{new_user.id}/update", params: registered_email_params
    expect(response.body).to include('Email has already been taken')
  end

  def name_attribute_for_name
    user = User.create(name: 'name_for_name_attribute', email: 'email_for_name_attribute')
    name_attribute_regexp = /name\s*=\s*["'](.+?)["']/
    get "/users/#{user.id}/edit"
    attribute_match = response.body.match(/Name[\s\S]*#{name_attribute_regexp}[\s\S]*Email/)
    return attribute_match && attribute_match[1]
  end

  def name_attribute_for_email
    user = User.create(name: 'name_for_email_attribute', email: 'email_for_email_attribute')
    name_attribute_regexp = /name\s*=\s*["'](.+?)["']/
    get "/users/#{user.id}/edit"
    attribute_match = response.body.match(/Email[\s\S]*#{name_attribute_regexp}[\s\S]*<input/)
    return attribute_match && attribute_match[1]
  end
end
