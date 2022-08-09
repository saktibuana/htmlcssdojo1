require 'rails_helper'

RSpec.describe '/posts/:id', type: :request do
  let(:post_params) { { content: 'content1' } }

  it '@@@Error when accessing the following URL: localhost:3000/posts/index@@@' do
    get '/posts/index'
    expect(response).to have_http_status(200)
  end

  it '@@@The route is not correct for URLs like the following: localhost:3000/posts/1@@@' do
    post = Post.create(post_params)
    expect { get "/posts/#{post.id}" }.not_to raise_error(ActionController::RoutingError)
  end

  it '@@@Error when accessing the post details page@@@' do
    post = Post.create(post_params)
    get "/posts/#{post.id}"
    expect(response).to have_http_status(200)
  end

  it '@@@The content of the post details page is not correct@@@' do
    post = Post.create(post_params)
    get "/posts/#{post.id}"
    expect(response.body).to include(post.content)
  end

  it '@@@The time that the post was created is not displayed correctly in the post details page@@@' do
    post = Post.create(post_params)
    get "/posts/#{post.id}"
    expect(response.body).to include(post.created_at.to_s)
  end

  it '@@@The link to the post details page in the page at 「localhost:3000/posts/index」 is not correct@@@' do
    post = Post.create(post_params)
    get '/posts/index'
    expect(response.body).to match(%r{<a\s+href\s*=\s*"/posts/#{post.id}[?"]})
  end
end
