ActiveRecord::Schema.define(version: 2021_04_26_160654) do

  enable_extension "plpgsql"

  create_table "customers", force: :cascade do |t|
    t.string "externalCode"
    t.string "name"
    t.string "email"
    t.string "contact"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "items", force: :cascade do |t|
    t.string "externalCode"
    t.string "name"
    t.float "price"
    t.integer "quantity"
    t.float "total"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "orders", force: :cascade do |t|
    t.string "externalCode"
    t.integer "storeId"
    t.string "subTotal"
    t.string "deliveryFee"
    t.float "total_shipping"
    t.string "total"
    t.string "countrystate"
    t.string "city"
    t.string "district"
    t.string "street"
    t.string "complement"
    t.float "latitude"
    t.float "longitute"
    t.string "dtOrderCreated"
    t.string "postalCode"
    t.string "number"
    t.integer "customerId"
    t.integer "paymentId"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "payments", force: :cascade do |t|
    t.string "type"
    t.float "value"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
