Extension { #name : 'TinyLogger' }

{ #category : '*MoreLogger' }
TinyLogger >> addMoreFileLoggerNamed: aString [

	| moreLogger |
	moreLogger := MoreFileLogger named: aString.
	self addLogger: moreLogger.
	^ moreLogger
]

{ #category : '*MoreLogger' }
TinyLogger >> ensureMoreFileLoggerNamed: aString [
	"Ensure a file logger to a file whose name is given as parameter is in the logger. In case one already exists, does nothing."

	^ self fileLoggers
		detect: [ :e | e fileName = aString ]
		ifNone: [ self addMoreFileLoggerNamed: aString ]
]

{ #category : '*MoreLogger' }
TinyLogger >> recordDebug: aString [ 
	self loggers do: [ :each | each recordDebug: aString ]
]

{ #category : '*MoreLogger' }
TinyLogger >> recordError: aString [ 
	self loggers do: [ :each | each recordError: aString ]
]

{ #category : '*MoreLogger' }
TinyLogger >> recordInfo: aString [ 
	self loggers do: [ :each | each recordInfo: aString ]
]
