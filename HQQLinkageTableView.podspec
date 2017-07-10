
Pod::Spec.new do |s|
  s.name             = 'HQQLinkageTableView'
  s.version          = '1.0.0'
  s.summary          = 'A short description of HQQLinkageTableView.'

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/huangqiangqiang/HQQLinkageTableView'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'huangqiangqiang' => '285086598@163.com' }
  s.source           = { :git => 'https://github.com/huangqiangqiang/HQQLinkageTableView.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'

  s.source_files = 'HQQLinkageTableView/Classes/**/*'

end
