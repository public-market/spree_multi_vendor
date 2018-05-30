FactoryBot.modify do
  factory :line_item do
    transient do
      vendor nil
    end
    variant { create(:variant, is_master: false, product: product, vendor: vendor || create(:vendor)) }
  end
end
