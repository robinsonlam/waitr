User.destroy_all
Item.destroy_all
Order.destroy_all

u1 = User.create( :email => 'rob@robinsonlam.com', :first_name => 'Robinson', :last_name => 'Lam', :image => "https://avatars1.githubusercontent.com/u/7957019?v=3&s=460", :password => 'ravioli', :password_confirmation => 'ravioli', :admin => true )

item1 = Item.create( :name => 'Chicken Schnitzel', :price => 15.95 )
item2 = Item.create( :name => 'Ravioli', :price => 12.95 )

u1.items << item1 << item2

order1 = Order.create( :total => 0 )
order1.items << item1 << item2

u1.orders << order1