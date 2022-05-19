Extension { #name : #TinyLogger }

{ #category : #'*MoreLogger-Extension' }
TinyLogger >> allLogger [

	<inspectorPresentationOrder: -1 title: 'All logers'>
	^ SpTablePresenter new
		  items: self loggers;
		  addColumn: (SpStringTableColumn
				   title: 'Kind'
				   evaluated: [ :leafLogger | leafLogger class name ]);
		  addColumn:
			  (SpStringTableColumn title: 'Path' evaluated: [ :leafLogger | 
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
							   UIManager default alert: 'Only File Logger can be cleared' ] ]);
		  addColumn: (SpLinkTableColumn
				   title: 'Open'
				   evaluated: [ :anObject | 'Open' ]
				   action: [ :leafLogger | 
					   (leafLogger isKindOf: MoreFileLogger)
						   ifTrue: [ leafLogger open ]
						   ifFalse: [ 
							   UIManager default alert: 'Only More Logger can be openned' ] ]);
		  yourself
]

{ #category : #'*MoreLogger-Extension' }
TinyLogger class >> worldMenuSectionsOn: aBuilder [

	<worldMenu>
	(aBuilder item: #Loggers)
		parent: #Tools;
		action: [ TinyLogger default inspect ];
		help: 'Manage image loggers';
		iconName: #smallDoIt;
		order: 1000
]
