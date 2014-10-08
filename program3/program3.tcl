if {[catch {
	package require mysqltcl
	set m [mysqlconnect -user root -db students -password coursework]
	
	set w1 10
	set w2 10
	set sep +-[string repeat - $w1]-+-[string repeat - $w2]-+
	puts $sep
	puts [format "| %-*s | %-*s |" $w1 "First Name" $w2 "Last Name"]
	foreach {FirstName LastName} [
		mysqlsel $m {
			select Students.FirstName, Students.LastName from
			Students where
			Students.LastName = 'Smith'} -flatlist] {
		puts $sep
		puts [format "| %*s | %*s |" $w1 $FirstName $w2 $LastName]
	}
	puts $sep
	mysqlclose $m
} res]} {
	puts $res
}
