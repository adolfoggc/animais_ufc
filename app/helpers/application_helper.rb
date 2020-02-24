module ApplicationHelper
	
	def get_sys_config
		conf = SysConfiguration.first
	rescue
		conf = SysConfiguration.new(name: 'System Name', initials: 'SN')
	ensure
		return conf
	end

end
