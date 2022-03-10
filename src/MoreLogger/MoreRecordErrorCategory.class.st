Class {
	#name : #MoreRecordErrorCategory,
	#superclass : #MoreRecordCategory,
	#category : #MoreLogger
}

{ #category : #initialization }
MoreRecordErrorCategory >> initialize [

	super initialize.
	self
		name: #error;
		level: 100;
		color: Color red
]
