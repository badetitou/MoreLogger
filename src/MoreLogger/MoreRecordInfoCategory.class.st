Class {
	#name : #MoreRecordInfoCategory,
	#superclass : #MoreRecordCategory,
	#category : #MoreLogger
}

{ #category : #initialization }
MoreRecordInfoCategory >> initialize [

	super initialize.
	self
		name: #info;
		level: 0;
		color: Color blue
]
