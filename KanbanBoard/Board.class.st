Class {
	#name : 'Board',
	#superclass : 'Object',
	#instVars : [
		'name',
		'columns'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'columns' }
Board >> columnNamed: aString [
	^ columns detect: [:c | c name = aString]
]

{ #category : 'accessing' }
Board >> columns [
	^ columns
]

{ #category : 'initialization' }
Board >> initialize [
	super initialize.

	columns := OrderedCollection new.

	columns add: (Column new name: 'Todo'; yourself).
	columns add: (Column new name: 'In Progress'; yourself).
	columns add: (Column new name: 'Done'; yourself).
]

{ #category : 'columns' }
Board >> moveTask: aTask from: sourceColumnName to: targetColumnName [

	| source target |

	source := self columnNamed: sourceColumnName.
	target := self columnNamed: targetColumnName.

	source removeTask: aTask.
	target addTask: aTask.
]

{ #category : 'accessing' }
Board >> name [
	^ name
]

{ #category : 'accessing' }
Board >> name: aString [
	name := aString
]

{ #category : 'printing' }
Board >> printOn: aStream [
	aStream
		nextPutAll: 'Board(';
		nextPutAll: (name ifNil: ['Unnamed']);
		nextPutAll: ')'.
]

{ #category : 'persistence' }
Board >> save [
	WorkspacePresenter workspace saveToFile
]
