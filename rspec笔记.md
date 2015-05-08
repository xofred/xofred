### 控制器测试的关键知识点

- 和控制器动作交互的基本DSL句法:每个HTTP请求方法都对应于一个方法(本例中 的方法是 get),其后跟着动作的 Symbol 形式(:show),然后是传入的请求参数(id: contact)。
- 控制器动作实例化的变量可以通过assigns(:variable_name)方法获取。
- 控制器动作的返回结果可以通过response获取
