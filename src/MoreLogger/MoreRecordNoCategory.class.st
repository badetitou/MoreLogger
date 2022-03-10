Class {
	#name : #MoreRecordNoCategory,
	#superclass : #MoreRecordCategory,
	#category : #MoreLogger
}

{ #category : #initialization }
MoreRecordNoCategory >> initialize [

	super initialize.
	self
		name: #no;
		level: 0;
		color: nil
]
