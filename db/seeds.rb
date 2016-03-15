Product.destroy_all
Product.create!([
  {name: "ThreeD Printer", price: 2500, image: "http://images2.mcmaster.com/mvA/contents/gfx/small/1473a51p1-a02a-digitals.png?ver=1433230611", description: "Save time going from concept to production when you create your own models and prototypes. These printers convert digital files and lay down thin layers of plastic material to create your part in 3D.", stock_status: "Not In Stock", delivery_time: "2 weeks"},
  {name: "Pipe Fitting", price: 2, image: "http://images1.mcmaster.com/mvA/contents/gfx/small/4464k16p1s.png?ver=1295449896", description: "Use with air, water, oil, natural gas, steam", stock_status: "In stock", delivery_time: "2 days"},
  {name: "Socket Head Cap Screw", price: 4, image: "http://images2.mcmaster.com/mvA/contents/gfx/small/91251ap3-b01s.png?ver=1374574446", description: "The standard among high-strength fasteners, these screws are stronger than Grade 8 steel screws. They have a minimum tensile strength of 170,000 psi. and a minimum Rockwell hardness of C37, unless noted. Length is measured from under the head.", stock_status: "In Stock", delivery_time: "1 day"}
])
