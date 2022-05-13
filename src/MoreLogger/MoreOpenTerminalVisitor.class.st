Class {
	#name : #MoreOpenTerminalVisitor,
	#superclass : #OSPlatformVisitor,
	#instVars : [
		'moreFileLogger'
	],
	#category : #MoreLogger
}

{ #category : #'as yet unclassified' }
MoreOpenTerminalVisitor class >> openTerminalForMoreLogger: aMoreLogger [

	aMoreLogger fileReference ensureCreateFile.

	^ self new
		  moreFileLogger: aMoreLogger;
		  visit;
		  yourself
]

{ #category : #accessing }
MoreOpenTerminalVisitor >> moreFileLogger [

	^ moreFileLogger
]

{ #category : #accessing }
MoreOpenTerminalVisitor >> moreFileLogger: anObject [

	moreFileLogger := anObject
]

{ #category : #accessing }
MoreOpenTerminalVisitor >> visitWindows: aPlatform [

	LibC runCommand: (String streamContents: [ :stream | 
			 stream
			 <<
				 'start powershell -noexit -noprofil -command "& { function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)

    process {'.
			 (moreFileLogger existingLevels reject: [ :levels | 
				  levels color isNil ]) withIndexDo: [ :level :index | 
				 stream
					 << 'if($LogEntry.Contains(''';
					 << level name;
					 << ''')) {Return ''';
					 << level color name;
					 << '''}' ].
			 stream
				 << 'Return ''White''
    }
}; Get-Content -wait ';
				 << moreFileLogger fileReference pathString;
				 <<
					 ' | ForEach {Write-Host -ForegroundColor (Get-LogColor $_) $_} }"' ])
]
