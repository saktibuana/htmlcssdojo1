require 'rails_helper'

RSpec.describe '/posts/:id/destroy', type: :request do
  let(:content_string) { 'test_content' }
  let(:post_instance) { Post.create(content: content_string) }

  it '@@@Error when accesssing the post details page@@@' do
    get "/posts/#{post_instance.id}"
    expect(response).to have_http_status(200)
  end

  it '@@@On the post details page, the link to delete a post is missing or incorrect@@@' do
    get "/posts/#{post_instance.id}"
    expect(response.body).to include('Delete')
  end

  it '@@@On the post details page, the URL for the delete link is not set properly@@@' do
    get "/posts/#{post_instance.id}"
    expect(response.body).to match(%r{<a.*?href\s*=\s*"/posts/#{post_instance.id}/destroy[?"]})
  end

  it '@@@On the post details page, the method for the delete link should be set to post@@@' do
    get "/posts/#{post_instance.id}"
    expect(response.body).to match(%r{<a.*?method\s*=\s*"post".*?href\s*=\s*"/posts/#{post_instance.id}/destroy[?"]})
  end

  it '@@@No route found for the following URL pattern: localhost:3000/posts/1/destroy@@@' do
    expect { post "/posts/#{post_instance.id}/destroy" }.not_to raise_error(ActionController::RoutingError)
  end

  it '@@@An error occurs when attempting to delete a psot. Please check the Preview tab@@@' do
    expect { post "/posts/#{post_instance.id}/destroy" }.not_to raise_error
  end

  it '@@@Failed to remove the data for a deleted post@@@' do
    post_instance
    expect { post "/posts/#{post_instance.id}/destroy" }.to change(Post, :count).by(-1)
  end

  it '@@@After a post is successfully deleted, the posts (index) page should be displayed@@@' do
    post "/posts/#{post_instance.id}/destroy"
    expect(response).to redirect_to(%r{/posts/index[?"]})
  end

  it '@@@The flash message displayed after successfully deleting a post is not correct@@@' do
    post "/posts/#{post_instance.id}/destroy"
    expect(flash[:notice]).to be_present
  end

  it '@@@The flash message displayed after successfully deleting a post is not correct@@@' do
    post "/posts/#{post_instance.id}/destroy"
    expect(flash[:notice]).to eq('Post successfully deleted')
  end

  it '@@@A flash message should be displayed on the posts (index) page after a post is successfully deleted@@@' do
    allow_any_instance_of(ApplicationController).to receive(:flash).and_return(notice: 'Post successfully deleted')
    get '/posts/index'
    expect(response.body).to include('Post successfully deleted')
  end
end
