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

	LibC runCommand: 'start powershell -noexit -noprofil -command "& { function Get-LogColor {
    Param([Parameter(Position=0)]
    [String]$LogEntry)

    process {
        if ($LogEntry.Contains(''info'')) {Return ''Green''}
        if ($LogEntry.Contains(''debug'')) {Return ''yellow''}
        if ($LogEntry.Contains(''error'')) {Return ''red''}
        else {Return ''White''}
    }
}; Get-Content -wait ', moreFileLogger fileReference pathString , '| ForEach {Write-Host -ForegroundColor (Get-LogColor $_) $_} }"'
]
