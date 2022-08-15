require 'rails_helper'

RSpec.describe 'ensure_correct_user', type: :request do
  id = '9999'
  let(:flash_string) { 'Unauthorized access' }
  let(:user) { User.create(id: id, name: 'Ken the Ninja', email: 'ken@progate.com', password: 'kentheninja') }
  let(:another_user) { User.create(name: 'Master Wooly', email: 'master@progate.com', password: 'masterwooly') }
  before(:each) { Post.create(id: id, content: 'test_content') }
  before(:each) { allow_any_instance_of(ApplicationController).to receive(:session).and_return(user_id: user.id) }

  it '@@@A logged in user should not be redirected when trying to open the edit page for their own account.@@@' do
    get "/users/#{user.id}/edit"
    expect(response).not_to have_http_status(302)
  end

  it '@@@An error occurred when accessing the edit page. Check the Preview tab in the Browser.@@@' do
    get "/users/#{user.id}/edit"
    expect(response).to have_http_status(200)
  end

  it '@@@When a logged-in user opens another user\'s details page, the link to the edit page should not be shown.@@@' do
    get "/users/#{another_user.id}"
    expect(response.body).not_to match(%r{[Ee]dit})
  end

  it '@@@An error occurs when attempting to access URLs like 「localhost:3000/users/1/update」. Check the Preview tab in the Browser.@@@' do
    expect { post "/users/#{user.id}/update" }.not_to raise_error
  end

  it '@@@Access to URLs like 「localhost:3000/users/OTHER_USER_ID/edit」 should be restricted.@@@' do
    get "/users/#{another_user.id}/edit"
    expect(response).to redirect_to(%r{/posts/index[?"]})
  end

  it '@@@A flash message should be displayed when accessing URLs like 「/users/OTHER_USER_ID/edit」.@@@' do
    get "/users/#{another_user.id}/edit"
    expect(flash[:notice]).to be_present
  end

  it '@@@The flash message displayed when accessing URLs like 「/users/OTHER_USER_ID/edit is not correct.@@@' do
    get "/users/#{another_user.id}/edit"
    expect(flash[:notice]).to eq(flash_string)
  end

  it '@@@Access is not restricted for URLs like 「localhost:3000/users/OTHER_USER_ID/update」.@@@' do
    post "/users/#{another_user.id}/update"
    expect(response).to redirect_to(%r{/posts/index[?"]})
  end

  it '@@@When accessing URLs like 「/users/OTHER_USER_ID/update」 a flash message should be displayed.@@@' do
    post "/users/#{another_user.id}/update"
    expect(flash[:notice]).to be_present
  end

  it '@@@The flash message displayed when opening URLs like 「/users/OTHER_USER_ID/update」 is not correct.@@@' do
    post "/users/#{another_user.id}/update"
    expect(flash[:notice]).to eq(flash_string)
  end

  forbid_access_paths = ['/users/:id/edit', '/users/:id/update']

  # ルーティングの一覧を取得する(http://qiita.com/ayasuda/items/a2b0c818e8b5efeb44cf)
  all_routes = Rails.application.routes.routes
  inspector = ActionDispatch::Routing::RoutesInspector.new(all_routes)
  all_paths = inspector.format(ActionDispatch::Routing::ConsoleFormatter.new, ENV['CONTROLLER']).scan(%r{(/.*?)\(}).flatten

  accessible_paths = all_paths - forbid_access_paths

  accessible_paths.each do |path|
    url = 'localhost:3000'
    url += path if path != '/'

    it "@@@Access for the URL 「#{url}」 should not be restricted.@@@" do
      path.gsub!(/:id/, id) if path.match(/:id/)
      if path.match(/create|update|destroy|logout/)
        post path
      else
        get path
      end

      expect(flash[:notice]).not_to eq(flash_string)
    end
  end
end
