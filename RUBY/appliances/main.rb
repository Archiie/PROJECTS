require './lib/microwave'
require './lib/dishwasher'

data1 = {door: :closed, timer: :on, power: :on}
data2 = {door: :open, timer: :on, power: :on}
data3 = {door: :closed, timer: :off, power: :on}
data4 = {door: :closed, timer: :on, power: :on}
data5 = {door: :closed, timer: :on, power: :off}


# instance1 = Microwave.new(data1)
# instance2 = Microwave.new(data2)
# instance3 = Microwave.new(data3)
# instance4 = Microwave.new(data4)
# instance5 = Microwave.new(data5)


#p instance1.door_closed?
#p instance2.start


# p Microwave.create

instance1 = Microwave.create(data1)
instance2 = Microwave.create(data2)
# instance3 = Microwave.create(data3)
# instance4 = Microwave.create(data4)
# instance5 = Microwave.create(data5)

p "---------------------------------------------------"
p instance1.start
p instance2.start
# p instance3.start
# p instance4.start
# p instance5.start


instance6 = Dishwasher.create(door: :closed, power: :off)
instance7 = Dishwasher.create(door: :closed, power: :on)

p "---------------------------------------------------"

p instance6.start
p instance7.start

p "---------------------------------------------------"
