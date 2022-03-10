"
color nil mean no particular color
"
Class {
	#name : #MoreRecordCategory,
	#superclass : #Object,
	#instVars : [
		'level',
		'name',
		'color'
	],
	#category : #MoreLogger
}

{ #category : #accessing }
MoreRecordCategory >> color [

	^ color
]

{ #category : #accessing }
MoreRecordCategory >> color: anObject [

	color := anObject
]

{ #category : #accessing }
MoreRecordCategory >> level [

	^ level
]

{ #category : #accessing }
MoreRecordCategory >> level: anObject [

	level := anObject
]

{ #category : #accessing }
MoreRecordCategory >> name [

	^ name
]

{ #category : #accessing }
MoreRecordCategory >> name: anObject [

	name := anObject
]
