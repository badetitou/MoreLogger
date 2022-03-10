"
I am a TinyLogger with colors
"
Class {
	#name : #MoreFileLogger,
	#superclass : #TinyFileLogger,
	#instVars : [
		'categoriesByName',
		'moreWritePrefix',
		'moreWriteSuffix'
	],
	#category : #MoreLogger
}

{ #category : #acccessing }
MoreFileLogger >> addRecordCategory: aMoreRecordCategory [
	categoriesByName at: aMoreRecordCategory name put: aMoreRecordCategory
]

{ #category : #initialization }
MoreFileLogger >> initialize [

	super initialize.
	categoriesByName := Dictionary new.
	moreWriteSuffix := MoreWriteSuffixVisitor new.
	moreWritePrefix := MoreWritePrefixVisitor new.
	MoreRecordCategory allSubclassesDo: [ :subclass | 
		| category |
		category := subclass new.
		categoriesByName at: category name put: category ]
]

{ #category : #acccessing }
MoreFileLogger >> open [
	MoreOpenTerminalVisitor openTerminalForMoreLogger: self
]

{ #category : #logging }
MoreFileLogger >> record: aString [
	self record: aString withCategory: (categoriesByName at: #no)
]

{ #category : #logging }
MoreFileLogger >> record: aString withCategory: aRecordCategory [

	self fileStreamDo: [ :aStream | 
		aStream << (moreWritePrefix prefixFor: aRecordCategory).
		self record: aString on: aStream ]
]

{ #category : #logging }
MoreFileLogger >> recordDebug: aString [
	self record: aString withCategory: (categoriesByName at: #debug)
]

{ #category : #logging }
MoreFileLogger >> recordError: aString [

	self record: aString withCategory: (categoriesByName at: #error)
]

{ #category : #logging }
MoreFileLogger >> recordInfo: aString [
	self record: aString withCategory: (categoriesByName at: #info)
]
