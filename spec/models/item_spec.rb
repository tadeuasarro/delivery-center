require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:subject) do
    described_class.new(
      externalCode: 'H31N3K3N',
      name: 'Heineken 350 ml',
      price: 5,
      quantity: 12,
      total: 60
    )
  end

  it 'expects the subject to me valid' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:externalCode) }
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:price) }
    it { is_expected.to validate_presence_of(:quantity) }
    it { is_expected.to validate_presence_of(:total) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:item_order_relation) }
    it { is_expected.to have_many(:orders) }
  end
end
