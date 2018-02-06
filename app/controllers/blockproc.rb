# However, if the last parameter in a method definition is prefixed with an ampersand, 
# any associated block is converted to a Proc object, and that object is assigned to the parameter.
# This allows you to store the block for use later.

class TaxCalculator
  def initialize(name)
    @name = name
  end
  def get_tax(amount,&block)
    "#@name on #{amount} = #{ block.call(amount) }"
  end
end

puts "====================== get_tax()"
count_tax = -> amt {amt * 5}
tc = TaxCalculator.new("Sales tax")
puts tc.get_tax(100,&count_tax)# => "Sales tax on 100 = 7.5"
puts  tc.get_tax(250,&count_tax)# => "Sales tax on 250 = 18.75"

puts "====================== gen_times()"
def gen_times(factor)
  return lambda {|n| n*factor }
end

times3 = gen_times(3)
puts times5 = gen_times(5)

puts times3.call(12)               #=> 36
times5.call(5)                #=> 25


puts "================= re-evaluate using proc"
def my_while(cond)
  while cond.call
    yield
  end
end
# hasilnya sama seperti diatas, bisa dipanggil lewat yield atau dengan paramater &body
def my_while_sama(cond,&body)
  while cond.call
    body.call
  end
end
a = 0
my_while_sama -> { a < 3 } do
  puts a
  a += 1
end

puts "================= lambda vs -> "

proc1 = lambda do |a, *b, &block|
  puts "a = #{a.inspect}"
  puts "b = #{b.inspect}"
  block.call
end
proc1.call(1, 2, 3, 4) { puts "in block1" }

    proc2 = -> a, *b, &block do
      puts "a = #{a.inspect}"
      puts "b = #{b.inspect}"
      block.call
    end
proc2.call(1, 2, 3, 4) { puts "in block2" }
