"
I am a TinyLogger with colors
"
Class {
	#name : #MoreFileLogger,
	#superclass : #TinyFileLogger,
	#instVars : [
		'existingLevels',
		'moreWritePrefix'
	],
	#category : #MoreLogger
}

{ #category : #accessing }
MoreFileLogger >> existingLevels [

	^ existingLevels
]

{ #category : #logging }
MoreFileLogger >> fileStreamDo: aBlock [

	"For now we re-open the file all the time to avoid problems when we change its image of computer/OS or if the user delete the file. Maybe later we can find a better solution but in any case we should test such weird behaviors."

	[ self fileReference ensureCreateFile ]
		on: CannotDeleteFileException
		do: [ self inform: 'logger file might not be well created' ].
	self fileReference writeStreamDo: [ :s | 
		s setToEnd.
		aBlock value: s ]
]

{ #category : #initialization }
MoreFileLogger >> initialize [

	super initialize.
	existingLevels := MoreRecordLevel existingLevels.
	moreWritePrefix := MoreWritePrefixVisitor new.

]

{ #category : #acccessing }
MoreFileLogger >> open [
	MoreOpenTerminalVisitor openTerminalForMoreLogger: self
]

{ #category : #logging }
MoreFileLogger >> record: aMoreLog [

	[ 
	self fileStreamDo: [ :aStream | 
		aStream << (moreWritePrefix prefixFor: aMoreLog asMoreLog level).
		self record: aMoreLog asMoreLog logString on: aStream ] ]
		on: CannotDeleteFileException
		do: [ :err | err pass ]
]

{ #category : #logging }
MoreFileLogger >> recordDebug: aString [

	self record: (MoreLog logOf: aString at: MoreRecordLevel debugLevel)
]

{ #category : #logging }
MoreFileLogger >> recordError: aString [

	self record: (MoreLog logOf: aString at: MoreRecordLevel errorLevel)
]

{ #category : #logging }
MoreFileLogger >> recordInfo: aString [

	self record: (MoreLog logOf: aString at: MoreRecordLevel infoLevel)
]
