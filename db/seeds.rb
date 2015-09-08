User.destroy_all
Item.destroy_all
Order.destroy_all

u1 = User.create( :email => 'rob@robinsonlam.com', :first_name => 'Robinson', :last_name => 'Lam', :image => "https://avatars1.githubusercontent.com/u/7957019?v=3&s=460", :password => 'ravioli', :password_confirmation => 'ravioli', :admin => true )

item1 = Item.create( :name => 'Chicken Schnitzel', :price => 15.95 )
item2 = Item.create( :name => 'Ravioli', :price => 12.95 )
item3 = Item.create( :name => 'Tonkotsu Ramen', :price => 13.95)
item4 = Item.create( :name => 'Soba Noodles', :price => 11.95)
item5 = Item.create( :name => 'Roast Duck with Rice', :price => 21.95)

order1 = Order.create
order2 = Order.create
order1.items << item1 << item2 << item4
order2.items << item3 << item5 << item1

u1.orders << order1 << order2