Extension { #name : #TinyLogger }

{ #category : #'*MoreLogger-Extension' }
TinyLogger >> allLogger [

	<inspectorPresentationOrder: -1 title: 'All logers'>
	^ SpTablePresenter new
		  items: self loggers;
		  addColumn: (SpStringTableColumn
				   title: 'Kind'
				   evaluated: [ :leafLogger | leafLogger class name ]);
		  yourself
]
