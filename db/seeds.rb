products_data = [
  {
    name: "Gettin' Sloppy",
    kiss_count: 20,
    price: 3500,
  },
  {
    name: "Barely Any",
    kiss_count: 10,
    price: 2000,
  },
  {
    name: "Whole Lotta Lickin'",
    kiss_count: 50,
    price: 7000,
  },
  {
    name: "I'm Drowning",
    kiss_count: 100,
    price: 12000,
  },
]

products_data.each do |product_data|
  Product.create(product_data)
end
