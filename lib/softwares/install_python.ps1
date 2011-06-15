$pythonLogPath = "c:\python.log"

Function Download-Python {
	iex "$scriptDir\tools\curl.exe http://python.org/ftp/python/2.7.1/python-2.7.1.msi -o python.msi"
	Unblock-File $python27InstallKit
}

Function Python-Installed {
	Try { python --version }
	Catch {}
	$?
}

Function Silent-Install-Python {
	iex ".\python.msi /quiet /li $pythonLogPath"
}

Function Python-Installation-Completed {
	 $log = ""
	 get-content $pythonLogPath | % { $log += $_ }
	 $log.Contains("completed successfully.")      
}

Function Delete-Downloaded-Python {
	iex "del .\python.msi"
}