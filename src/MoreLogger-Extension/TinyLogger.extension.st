Extension { #name : #TinyLogger }

{ #category : #'*MoreLogger-Extension' }
TinyLogger >> allLogger [

	<inspectorPresentationOrder: -1 title: 'All logers'>
	^ SpTablePresenter new
		  items: self loggers;
		  addColumn: (SpStringTableColumn
				   title: 'Kind'
				   evaluated: [ :leafLogger | leafLogger class name ]);
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
