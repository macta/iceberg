*Iceberg-Adapters
getOrCreateIcebergRepository
	| origin |
	origin := self scpUrl.
	^ IceRepository registry 
		detect: [ :repo | repo origin url = origin ]
		ifNone: [
			(IceRepository origin: self scpUrl) 
				branchName: self projectVersion; 
				subdirectory: self repoPath;
				register;
				yourself ]