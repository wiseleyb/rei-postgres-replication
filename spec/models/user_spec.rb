# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  # smoke test
  it 'works' do
    u = User.create(name: 'bob')
    expect(User.find(u.id).name).to eq('bob')
  end
end
