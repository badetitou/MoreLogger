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

	self fileStreamDo: [ :aStream | 
		aStream << (moreWritePrefix prefixFor: aMoreLog asMoreLog level).
		self record: aMoreLog asMoreLog logString on: aStream ]
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
