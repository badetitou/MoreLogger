Class {
	#name : 'MoreWritePrefixVisitor',
	#superclass : 'OSPlatformVisitor',
	#instVars : [
		'level'
	],
	#category : 'MoreLogger',
	#package : 'MoreLogger'
}

{ #category : 'visiting' }
MoreWritePrefixVisitor >> prefixFor: aLevel [

	level := aLevel.
	^ self visit
]

{ #category : 'visiting' }
MoreWritePrefixVisitor >> visitGeneric: aPlatform [

	^ ''
]

{ #category : 'visiting' }
MoreWritePrefixVisitor >> visitWindows: aPlatform [
	^ level name, '|'
]
