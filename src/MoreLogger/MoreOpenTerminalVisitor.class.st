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

    process {
'.
			 (moreFileLogger categoriesByName reject: [ :category | 
				  category color isNil ]) withIndexDo: [ :category :index | 
				 stream
					 << '        ';
					 << (index = 1
							  ifTrue: [ 'if' ]
							  ifFalse: [ 'elseif' ]);
					 << ' ($LogEntry.Contains(''';
					 << category name;
					 << ''')) {Return ''';
					 << category color name;
					 << '''}';
					 << String crlf ].
			 stream
				 << '        else {Return ''White''}
    }
}; Get-Content -wait ';
				 << moreFileLogger fileReference pathString;
				 <<
					 ' | ForEach {Write-Host -ForegroundColor (Get-LogColor $_) $_} }"' ])
]
