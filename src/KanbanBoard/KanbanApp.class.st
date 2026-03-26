Class {
	#name : 'KanbanApp',
	#superclass : 'Object',
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'opening' }
KanbanApp class >> open [

	self workspace user
		ifNil: [ SignupPresenter new open ]
		ifNotNil: [ LoginPresenter new open ].
]

{ #category : 'accessing' }
KanbanApp class >> workspace [
	^ WorkspacePresenter workspace
]
