Pod::Spec.new do |s|
s.name = 'ZinkAlertActionSheet'
s.version = '1.0.1'
s.license = 'MIT'
s.summary = 'Alert 或 ActionSheet 调用一个函数，就弹出啦~'
s.homepage = 'https://github.com/zinkLin'
s.authors = { 'Zink' => '418175138@qq.com' }
s.source = { :git => "https://github.com/zinkLin/ZinkAlertActionSheet", :tag => "1.0.1"}
s.requires_arc = true
s.ios.deployment_target = '6.0'
s.source_files = "ZinkAlertActionSheet/*"
end