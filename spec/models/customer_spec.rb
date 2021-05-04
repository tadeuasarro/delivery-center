require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:subject) do
    described_class.new(
      externalCode: 'A1B2C3D4',
      name: 'Tadeu Sarro',
      email: 'tadeu@sarro.com',
      contact: '00123456789'
    )
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:externalCode) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.not_to validate_presence_of(:email) }
    it { is_expected.not_to validate_presence_of(:contact) }
  end
end
