User.destroy_all
Item.destroy_all
Order.destroy_all
Category.destroy_all

u1 = User.create( :email => 'shop@waitr.com', :first_name => 'Shop', :last_name => 'Owner', :image => "https://avatars1.githubusercontent.com/u/7957019?v=3&s=460", :password => 'shop', :password_confirmation => 'shop', :admin => true )
u2 = User.create( :email => 'customer@waitr.com', :first_name => 'Nerd', :last_name => 'Sanchez', :image => "https://avatars1.githubusercontent.com/u/7957019?v=3&s=460", :password => 'customer', :password_confirmation => 'customer', :admin => false )


item1 = Item.create( :name => 'Chicken Schnitzel', :price => 15.95 )
item2 = Item.create( :name => 'Ravioli', :price => 12.95 )
item3 = Item.create( :name => 'Tonkotsu Ramen', :price => 13.95)
item4 = Item.create( :name => 'Soba Noodles', :price => 11.95)
item5 = Item.create( :name => 'Roast Duck with Rice', :price => 21.95)

cat1 = Category.create( :id => 1, :name => 'Noodles' )
cat2 = Category.create( :id => 2, :name => 'Rice' )
cat3 = Category.create( :id => 3, :name => 'Pasta' )
cat4 = Category.create( :id => 4, :name => 'Mains' )

cat1.items << item3 << item4
cat2.items << item5
cat3.items << item2
cat4.items << item1

order1 = Order.create
order2 = Order.create
order1.items << item1 << item2 << item4
order2.items << item3 << item5 << item1

u1.orders << order1
u2.orders << order2