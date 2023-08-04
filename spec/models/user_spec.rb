# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User do
  # stupid smoke test
  it 'works' do
    u = User.create(name: 'bob')
    u.save
    expect(User.find(u.id).name).to eq('bob')
  end
end
