class DeliveryPayment < ActiveHash::Base
  self.data = [
    { id: 1, data: '着払い(購入者負担)' },
    { id: 2, data: '送料込(出品者負担)' }
  ]
end
