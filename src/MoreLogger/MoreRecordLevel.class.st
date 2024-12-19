"
color nil mean no particular color
"
Class {
	#name : 'MoreRecordLevel',
	#superclass : 'Object',
	#instVars : [
		'level',
		'name',
		'color'
	],
	#classInstVars : [
		'existingLevels'
	],
	#category : 'MoreLogger',
	#package : 'MoreLogger'
}

{ #category : 'levels' }
MoreRecordLevel class >> debugLevel [

	^ existingLevels at: #debug ifAbsentPut: [ 
		  self new
			  name: #debug;
			  color: Color yellow;
			  level: 200;
			  yourself ]
]

{ #category : 'levels' }
MoreRecordLevel class >> errorLevel [

	^ existingLevels at: #error ifAbsentPut: [ 
		  self new
			  name: #error;
			  color: Color red;
			  level: 300;
			  yourself ]
]

{ #category : 'accessing' }
MoreRecordLevel class >> existingLevels [

	^ existingLevels
]

{ #category : 'levels' }
MoreRecordLevel class >> fatalLevel [

	^ existingLevels at: #fatal ifAbsentPut: [ 
		  self new
			  name: #fatal;
			  color: Color red;
			  level: 400;
			  yourself ]
]

{ #category : 'levels' }
MoreRecordLevel class >> infoLevel [

	^ existingLevels at: #info ifAbsentPut: [ 
		  self new
			  name: #info;
			  color: Color blue;
			  level: 100;
			  yourself ]
]

{ #category : 'initialization' }
MoreRecordLevel class >> initialize [

	super initialize.
	existingLevels := Dictionary new.
	self class methods
		select: [ :method | method protocol = #levels ]
		thenDo: [ :method | method valueWithReceiver: self arguments: #(  ) ]
]

{ #category : 'accessing' }
MoreRecordLevel >> color [

	^ color
]

{ #category : 'accessing' }
MoreRecordLevel >> color: anObject [

	color := anObject
]

{ #category : 'accessing' }
MoreRecordLevel >> level [

	^ level
]

{ #category : 'accessing' }
MoreRecordLevel >> level: anObject [

	level := anObject
]

{ #category : 'accessing' }
MoreRecordLevel >> name [

	^ name
]

{ #category : 'accessing' }
MoreRecordLevel >> name: anObject [

	name := anObject
]
