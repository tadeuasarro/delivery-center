# rubocop:disable Lint/DuplicateHashKey
require 'rails_helper'

RSpec.describe Payment, type: :model do
  let(:customer) do
    Customer.create(
      externalCode: 'A1B2C3D4',
      name: 'Tadeu Sarro',
      email: 'tadeu@sarro.com',
      contact: '00123456789'
    )
  end

  let(:subject) do
    Order.create(
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
end

# rubocop:enable Lint/DuplicateHashKey
