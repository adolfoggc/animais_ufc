module ApplicationHelper
	
	def get_sys_config
		conf = SysConfiguration.first
		if(conf.nil?)
			conf = SysConfiguration.new(name: 'System Name', initials: 'SN')
		end
		return conf
	end

end
