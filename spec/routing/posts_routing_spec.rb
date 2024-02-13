require "rails_helper"

RSpec.describe V1::PostsController, type: :routing do
    context "Routes" do
        it { is_expected.to route(:get, '/v1/posts').to(action: :index) }
        it { is_expected.to route(:get, '/v1/posts/1').to(action: :show, id: 1) }
        it { is_expected.to route(:post, '/v1/posts').to(action: :create) }
        it { is_expected.to route(:put, '/v1/posts/1').to(action: :update, id: 1) }
        it { is_expected.to route(:patch, '/v1/posts/1').to(action: :update, id: 1) }
        it { is_expected.to route(:delete, '/v1/posts/1').to(action: :destroy, id: 1) }
    end
end