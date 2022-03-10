Extension { #name : #Object }

{ #category : #'*MoreLogger' }
Object >> recordDebug [
	self recordDebug: self asString
]

{ #category : #'*MoreLogger' }
Object >> recordDebug: aString [
	TinyCurrentLogger value recordDebug: aString
]

{ #category : #'*MoreLogger' }
Object >> recordError [
	self recordError: self asString
]

{ #category : #'*MoreLogger' }
Object >> recordError: aString [
	TinyCurrentLogger value recordError: aString
]

{ #category : #'*MoreLogger' }
Object >> recordInfo [
	self recordInfo: self asString
]

{ #category : #'*MoreLogger' }
Object >> recordInfo: aString [
	TinyCurrentLogger value recordInfo: aString
]
