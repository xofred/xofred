#encoding: utf-8
require 'pry'
require 'time'
=begin
def psqrt
  print("10000的平方根：", sqrt(10000).to_i, "\n")
end
psqrt

hash1 = {k1:"猪", k2:"猪头", k3:"领导", k4:"领导是猪头"} #注意Hash没有顺序
hash1.each{|key, value| 
  #if value =~ /猪头/ # hash1的值
  if /猪头/ =~ value # hash1的值
    print "key: #{key} => value:#{value} \n" 
  end
}

# 三种条件判断
# if 
a = 250
p "用if判断"
if a < 250
  p "a不到250"
elsif a == 250
  p "a就是个250"
else a > 250
  p "a不止250"
end
# unless
p "用unless判断"
unless a > 250 || a < 250
  p "a一直是个250"
end
# case
p "用case判断"
case a
when (0...250) 
  p "a不到250"
when 250
  p "a就是个250"
else
  p "a不止250"
end

# 循环
# times
5.times{ |i|
  print "第", i + 1, "次循环\n"
}

# 从键盘输入获取两个数，并存入数组
i = 0
a=[]
while (line = gets) && (i < 2)
    a << line
    i= i+1
end
p a
p "用times"
sum = 0
101.times do |i| #因为数组从0开始
	sum+=i
end
print "1加到100的结果是：", sum, "\n"

p "用for"
from = 1
to = 100
sum = 0
for i in from..to
  sum += i
end
print "1加到100的结果是：", sum, "\n"

a = []
for i in 0..4 # 包含边界
  a[i] = i 
end
p a

a = []
for i in 0...4 # 不包含边界
  a[i] = i
end
p a

# 用times写
a = []
4.times{ |i|
  a << i
}

def dice
  d = rand(6) + 1
  print "结果是：", d, "\n"
  return d
end

dice
def prime?(name)
  count=0
  2.upto(name-1) do |i|
    if name % i == 0
      count=1
      break
    end
  end
  print name,(count==0?"是":"不是"),"质数\n"
end

print "输入数字："
num = gets.to_i
prime?(num)

sa = %w(assasin hitman godfather)
sa.each_with_index{|e, i| # 先元素，后索引
  print "第", i+1, "个元素是", e, "\n"
}

def init_array(a = [])
  100.times{ |i|
    i += 1
    a << i
  }
end
a = []
init_array(a)
p a

p "所有元素乘以100"
a.collect!{|i| 
  i *= 100
}
p a

p "留下3的倍数"
a.reject!{|i|
  i % 3 != 0
}
p a

p "用reverse逆序"
p a.reverse

p "用sort_by逆序"
p a.sort_by{|i| -i}

p "用each求和"
sum = 0
a.each{|i|
  sum += i
}
p sum

p "打乱数组顺序"
init_array(a)
a.each_with_index{|e, i|
  new_index = rand(100)
  a[i] = a[new_index]
}
p a

p "1-100分为10个数组组成的新数组"
ary = []
init_array(ary)
result = Array.new
10.times{|i|
  result << ary[i * 10, 10]
}
p result

def sum_array(ary1, ary2)
  sum = []
  ary1.length.times{ |i|
    sum << (ary1[i] + ary2[i])
  }
  return sum
end
p "元素值相加：", sum_array([1, 2, 3], [4, 6, 8])

# 初始字符串
str = "Ruby is an object oriented programming language"
# 每个单词存入数组
p ary = str.split(/ /)
# 排序
#p ary.sort
# 忽略大小写排序
#p ary = str.downcase.split(/ /).sort
# 首字大写
str2 = ""
ary.each{ |i| 
  str2 << i.capitalize + " "
}
p str2.strip # 去除最后的空格

def num2star
  star = ""
  print "输入整数（人有多大胆，地有多大产）："
  str = gets
  str.chomp!
  begin
    num = Integer(str)
    num.times{ |i| 
      star << "*"
    }
    print "卫星数量如下：\n", star, "\n"
  rescue
    num = 0
    print "刚输入的不是整数，无法计算\n"
  end
end
num2star

# 计算每个单词的出现次数
count = Hash.new(0) # 将默认值设为0

while line = gets
  words = line.split #以空格分拆字符串，传入数组words
  words.each{|word| #这里的word是数组元素，不是下标！
    count[word] += 1 #以word为count的键，并且更新count的值（开始都是0，每遇到相同的键+1）
  }
end

count.each{|key, value|
  print "#{key}: #{value}\n"
}


wday = {"sunday" => "星期日", "monday" => "星期一", "saturday" => "星期六"}
p wday["sunday"]
p wday["monday"]
p wday["saturday"]

print "此Hash共有", wday.length, "对键值\n"

wday.each{ |day_eng, day_chs|
  print "\"#{day_eng}\"是#{day_chs}。\n"
}

def str2hash(str)
  color_hash = Hash.new
  color_ary = str.split(/\s/)
  color_ary.each_with_index{ |color,i|
	color_hash[color] = color_ary[i+1] if color =~ /[a-z]+/
  }
  return color_hash
end
p str2hash("blue 蓝 white 白\nred 红")


reg_mail = Regexp.new(/([\w_]+)(?:@)([\w]+?\.(com)|(cn))/)
reg_mail =~ "xofred@21cn.com"
p $1, $2

str = "so bad, so fucking bad"
new_str = str.gsub(/bad/,"good") 
p new_str

def word_cap(str)
  new_str = str.gsub(/\w+/) do |matched|
    matched.capitalize
  end
  p new_str
end
word_cap("i-love-pcc")

open("test") do |io|
  word_num = 0
  char_num = 0
  while line = io.gets
    printf("第%d行 %s", io.lineno, line)
  end
  p "共#{io.lineno}行!" if io.eof?
  io.rewind
  while ch = io.getc
    word_num += 1
    char_num += 1 if io.getc =~ /\w+/
  end
  p "共#{word_num}个字，#{char_num}个字符" if io.eof?
  io.close if !io.closed?            
  p "文件顺利关闭！"
end

def tail(tail_num, file_name)
  open(file_name) do |io|
    while line = io.gets
    end  
    p "共#{io.lineno}行!" if io.eof? 
    line_num = io.lineno - tail_num
    p "下面显示从第#{line_num}行开始的内容"
    io.rewind
    while line = io.gets
      printf("  第%d行 %s", io.lineno, line) if io.lineno >= line_num
     # line_num += 1
    end
    p '读取完毕！' if io.eof?
    io.close if !io.closed?            
    p "文件顺利关闭！"
  end
end
tail(10, "xo.rb")


require 'find'

def print_ruby_lib(top)
  Find.find(top) do |path|
	binding.pry
 #   if FileTest.directory?(path)
  #    dir, base = File.split(path) 
   #   p base if dir =~ [/ruby/, /RUBY/]
   # else
      p path if path =~ /rb/
   # end
  end
end
print_ruby_lib(ARGV[0])

=end
def days_ary
  d_first = Date.new(2012, 8, 1)
  d_last = Date.new(2012, 8, -1)
  p "#{d_first.year} #{d_first.strftime("%B")}"
  p '周日 周一 周二 周三 周四 周五 周六'
  fday = d_first.mday
  lday = d_last.mday
  i = 0
  unless i > lday
    ary = []
    ary << d_first + i
    i += 1
  end
  return ary
end
p days_ary
#主目录
