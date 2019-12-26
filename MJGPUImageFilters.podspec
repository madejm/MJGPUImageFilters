Pod::Spec.new do |s|
	s.name			= 'MJGPUImageFilters'
	s.version		= "1.0"
	s.summary		= "GPUImage custom filters"
	s.authors		= "Mateusz Madej"
	s.license		= ""
	s.homepage		= "https://github.com/madejm"
	s.source		= { :git => '' }

	s.platform		= :ios, '10.3'
	s.requires_arc	= true

	s.source_files	= 'MJGPUImageFilters/*.{swift,h,m}'

	s.dependency 'GPUImage'
end