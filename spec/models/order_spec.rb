# rubocop:disable Lint/DuplicateHashKey
require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:customer) do
    Customer.create(
      externalCode: 'A1B2C3D4',
      name: 'Tadeu Sarro',
      email: 'tadeu@sarro.com',
      contact: '00123456789'
    )
  end

  let(:subject) do
    described_class.new(
      externalCode: 'A1B2C3D4',
      storeId: '9128309128',
      subTotal: 100,
      deliveryFee: 5,
      total_shipping: 5,
      total: 110,
      city: 'Rio de Janeiro',
      district: 'Centro',
      street: 'Avenida Rio Branco',
      complement: 'N/A',
      latitude: '-43.54654',
      longitude: '-43.54654',
      dtOrderCreate: '2020/05/04',
      postalCode: '13482-000',
      number: '51',
      customerId: '24',
      country: 'Brazil',
      state: 'RJ',
      customerId: customer.id
    )
  end

  it 'expects the subject to me valid' do
    expect(subject).to be_valid
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:externalCode) }
    it { is_expected.to validate_presence_of(:storeId) }
    it { is_expected.to validate_presence_of(:subTotal) }
    it { is_expected.to validate_presence_of(:deliveryFee) }
    it { is_expected.to validate_presence_of(:total_shipping) }
    it { is_expected.to validate_presence_of(:total) }
    it { is_expected.to validate_presence_of(:city) }
    it { is_expected.to validate_presence_of(:district) }
    it { is_expected.to validate_presence_of(:street) }
    it { is_expected.to validate_presence_of(:complement) }
    it { is_expected.to validate_presence_of(:latitude) }
    it { is_expected.to validate_presence_of(:longitude) }
    it { is_expected.to validate_presence_of(:dtOrderCreate) }
    it { is_expected.to validate_presence_of(:postalCode) }
    it { is_expected.to validate_presence_of(:country) }
    it { is_expected.to validate_presence_of(:state) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:customer) }
    it { is_expected.to have_many(:item_order_relation) }
    it { is_expected.to have_many(:items) }
  end
end

# rubocop:enable Lint/DuplicateHashKey
