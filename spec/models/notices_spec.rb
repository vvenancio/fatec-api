require 'rails_helper'

RSpec.describe Notice, type: :model do

  context 'on validations' do
    it { is_expected.to validate_presence_of(:publication_time) }
    it { is_expected.to validate_presence_of(:title) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:reduced_description) }
    it { is_expected.to validate_presence_of(:courses) }
  end

  context 'on associations' do
    it { is_expected.to have_and_belong_to_many(:courses) }
  end

end
