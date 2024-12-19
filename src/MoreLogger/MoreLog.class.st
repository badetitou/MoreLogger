Class {
	#name : 'MoreLog',
	#superclass : 'Object',
	#instVars : [
		'level',
		'categories',
		'object'
	],
	#category : 'MoreLogger',
	#package : 'MoreLogger'
}

{ #category : 'as yet unclassified' }
MoreLog class >> logOf: anObject at: aMoreRecordLevel [

	^ self new
		  object: anObject;
		  level: aMoreRecordLevel;
		  yourself
]

{ #category : 'accessing' }
MoreLog >> asMoreLog [
	^ self
]

{ #category : 'accessing' }
MoreLog >> categories [

	^ categories
]

{ #category : 'accessing' }
MoreLog >> categories: anObject [

	categories := anObject
]

{ #category : 'initialization' }
MoreLog >> initialize [

	super initialize.
	categories := Set new
]

{ #category : 'accessing' }
MoreLog >> level [

	^ level
]

{ #category : 'accessing' }
MoreLog >> level: anObject [

	level := anObject
]

{ #category : 'accessing' }
MoreLog >> logString [
	^ object fullPrintString
]

{ #category : 'accessing' }
MoreLog >> object [

	^ object
]

{ #category : 'accessing' }
MoreLog >> object: anObject [

	object := anObject
]

{ #category : 'initialization' }
MoreLog >> printPrefixOn: aStream [

	level printColorOn: aStream
]
