Class {
	#name : #MorePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'table'
	],
	#category : #'MoreLogger-Extension-Manifest'
}

{ #category : #examples }
MorePresenter class >> open [
	<example>
	
	^ self new open
]

{ #category : #examples }
MorePresenter class >> worldMenuSectionsOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Loggers)
		parent: #Tools;
		action: [ self open ];
		help: 'Manage image loggers';
		iconName: #smallDoIt;
		order: 1000
]

{ #category : #layout }
MorePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		  add: menu expand: false;
		  add: table;
		  yourself
]

{ #category : #layout }
MorePresenter >> initializePresenters [

	| tinyLogger |
	tinyLogger := TinyLogger default.
	menu := SpMenuBarPresenter new
		        addGroup: [ :group | 
			        group addItem: [ :item | 
					        item
						        name: nil;
						        description: 'Create Logger';
						        icon: (self iconNamed: #add);
						        action: [ self inform: 'Create new logger' ] ] ];
		        yourself.
	table := SpTablePresenter new
		         items: tinyLogger loggers;
		         addColumn: (SpStringTableColumn
				          title: 'Kind'
				          evaluated: [ :leafLogger | leafLogger class name ]);
		         addColumn:
			         (SpStringTableColumn
				          title: 'Path'
				          evaluated: [ :leafLogger | 
					          (leafLogger isKindOf: TinyFileLogger)
						          ifTrue: [ leafLogger fileReference pathString ]
						          ifFalse: [ '' ] ]);
		         addColumn: (SpLinkTableColumn
				          title: 'Clear logs'
				          evaluated: [ :anObject | 'Clear' ]
				          action: [ :leafLogger | 
					          (leafLogger isKindOf: TinyFileLogger)
						          ifTrue: [ 
							          leafLogger clearLog.
							          UIManager default inform: 'Cleared' ]
						          ifFalse: [ 
							          UIManager default alert:
									          'Only File Logger can be cleared' ] ]);
		         addColumn: (SpLinkTableColumn
				          title: 'Open'
				          evaluated: [ :anObject | 'Open' ]
				          action: [ :leafLogger | 
					          (leafLogger isKindOf: MoreFileLogger)
						          ifTrue: [ leafLogger open ]
						          ifFalse: [ 
							          UIManager default alert:
									          'Only More Logger can be openned' ] ]);
		         yourself
]

{ #category : #layout }
MorePresenter >> title [
	
	^ 'Loggers'
]
