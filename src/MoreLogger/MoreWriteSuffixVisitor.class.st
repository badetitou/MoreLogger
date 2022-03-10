Class {
	#name : #MoreWriteSuffixVisitor,
	#superclass : #OSPlatformVisitor,
	#instVars : [
		'category'
	],
	#category : #MoreLogger
}

{ #category : #accessing }
MoreWriteSuffixVisitor >> category [

	^ category
]

{ #category : #accessing }
MoreWriteSuffixVisitor >> category: anObject [

	category := anObject
]

{ #category : #visiting }
MoreWriteSuffixVisitor >> prefixFor: aCategory [

	^ self
		  category: aCategory;
		  visit
]
