require 'pry'

### 内省
class Greeting
  def initialize(text)
    @text = text
  end

  def welcome
    @text
  end
end
g = Greeting.new("Hi there!")
# 对象的类
g.class
# 只看类自己的实例方法（即非继承方法）
g.class.instance_methods(false)
# 实例变量
g.instance_variables

# 打开类为其添加方法（系统类也行哦）
class String
  def to_alphanumeric
    gsub /[^\w\s]/, ''
  end
end
# 若是为系统类添加方法，要先看看是否已有同名方法
"".methods.grep(/^to_/)


### 模块和类
# include或当成命令空间时，应使用模块；
# 实例化或继承时，应使用类


### 常量
# 任何大写字母开头的引用，包括模块名和类名，都是常量

## 获得当前常量的路径
module M
  class C
    module M2
      Module.nesting
    end
  end
end

## load()和require()
# load()用于执行代码，最好加上true，例如load(xxx.rb, true)，确保常量不会超出范围
# require()用于导入类库


### 解决命名冲突
# 例如有自己写了个Text类
class Text
  # do sth
end
# 引用的某个类库也有个Text类，那就改成
module Xo
  class Text
    # do sth
  end
end
# 然后将所有用到的地方也改成
Xo::Text


### 查看祖先链
Class.ancestors


### 符号
x = :i_m_a_symbol
# 符号用于表示跟元编程相关的名字，比如方法名
1.send(:+, 2)
# 虽然字符串也行，但一般不这么用
1.send("+", 2)
