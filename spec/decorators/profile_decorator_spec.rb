# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ProfileDecorator do
  let(:profile) { Profile.new.extend ProfileDecorator }
  subject { profile }
  it { should be_a Profile }
end
