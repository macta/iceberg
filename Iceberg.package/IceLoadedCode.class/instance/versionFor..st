querying
versionFor: package 
	^ self loadedVersions 
		at: package name
		ifPresent: #updated
		ifAbsent: [ self loadedVersions at: package put: package computeLoadedVersion ]
		
