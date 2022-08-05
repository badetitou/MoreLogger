Class {
	#name : #MorePresenter,
	#superclass : #SpPresenter,
	#instVars : [
		'menu',
		'table',
		'tinyLogger'
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

	tinyLogger := TinyLogger default.
	menu := SpMenuBarPresenter new
		        addGroup: [ :group | 
			        group addItem: [ :item | 
					        item
						        name: nil;
						        description: 'Create Logger';
						        icon: (self iconNamed: #add);
						        action: [ 
							        | chosenFile |
							        chosenFile := UIManager default
								                      chooseExistingFileReference:
									                      'Select log file'
								                      extensions:
									                      { 'log' } asOrderedCollection
								                      path: FileLocator home asPath.
							        chosenFile ifNotNil: [ 
									        tinyLogger ensureMoreFileLoggerNamed:
											        chosenFile pathString.
									        self refreshTable ] ] ] ];
		        yourself.
	table := SpTablePresenter new
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
		         addColumn: (SpLinkTableColumn
				          title: 'Remove'
				          evaluated: [ :anObject | 'Remove' ]
				          action: [ :leafLogger | 
					          tinyLogger removeLogger: leafLogger.
					          self refreshTable ]);
		         yourself.
	self refreshTable
]

{ #category : #layout }
MorePresenter >> refreshTable [
	 table items: tinyLogger loggers
]

{ #category : #layout }
MorePresenter >> title [
	
	^ 'Loggers'
]
