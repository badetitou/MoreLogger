Class {
	#name : #MoreRecordDebugCategory,
	#superclass : #MoreRecordCategory,
	#category : #MoreLogger
}

{ #category : #initialization }
MoreRecordDebugCategory >> initialize [

	super initialize.
	self
		name: #debug;
		level: 10;
		color: Color yellow
]
