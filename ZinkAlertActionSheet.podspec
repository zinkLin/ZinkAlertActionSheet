Pod::Spec.new do |s|
s.name = 'ZinkAlertActionSheet'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = '弹出Alert 或 ActionSheet 只需要一个函数嘿'
s.homepage = 'https://github.com/zinkLin'
s.authors = { 'Zink' => '418175138@qq.com' }
s.source = { :git => "https://github.com/zinkLin/ZinkAlertActionSheet", :tag => "1.0.1"}
s.requires_arc = true
s.ios.deployment_target = '7.0'
s.source_files = "ZinkAlertActionSheet/*"
end