require "rails_helper"

RSpec.describe 'routing', :type => :routing do
  context 'Users' do
      it { expect(get 'users').to route_to(controller: 'users', action: 'index') }
      it { expect(get 'users/1').to route_to(controller: 'users', action: 'show', id: '1') }
      it { expect(get 'users/list').to route_to(controller: 'users', action: 'list') }
      it { expect(post 'users').to route_to(controller: 'users', action: 'create') }
  end
end
