Class {
	#name : #BaselineOfMoreLogger,
	#superclass : #BaselineOf,
	#category : #BaselineOfMoreLogger
}

{ #category : #baselines }
BaselineOfMoreLogger >> baseline: spec [
	<baseline>
	spec
		for: #common
		do: [ 
			self defineDependencies: spec.
			self definePackages: spec.
			self defineGroups: spec ]
]

{ #category : #baselines }
BaselineOfMoreLogger >> defineDependencies: spec [

	spec baseline: 'TinyLogger' with: [ spec repository: 'github://jecisc/TinyLogger:v1.x.x/src' ].
]

{ #category : #baselines }
BaselineOfMoreLogger >> defineGroups: spec [
]

{ #category : #baselines }
BaselineOfMoreLogger >> definePackages: spec [

	spec package: 'MoreLogger' with: [ spec requires: #( 'TinyLogger' ) ]
]
