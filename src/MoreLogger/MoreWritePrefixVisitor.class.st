Class {
	#name : #MoreWritePrefixVisitor,
	#superclass : #OSPlatformVisitor,
	#instVars : [
		'category'
	],
	#category : #MoreLogger
}

{ #category : #accessing }
MoreWritePrefixVisitor >> category [

	^ category
]

{ #category : #accessing }
MoreWritePrefixVisitor >> category: anObject [

	category := anObject
]

{ #category : #visiting }
MoreWritePrefixVisitor >> prefixFor: aCategory [

	^ self
		  category: aCategory;
		  visit
]

{ #category : #visiting }
MoreWritePrefixVisitor >> visitWindows: aPlatform [
	^ category name, '|'
]
