Class {
	#name : 'Column',
	#superclass : 'Object',
	#instVars : [
		'name',
		'tasks'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'tasks' }
Column >> addTask: aTask [
	(aTask isKindOf: Task)
		ifFalse: [ self error: 'Only Task objects allowed' ].
	tasks add: aTask.
]

{ #category : 'initialization' }
Column >> initialize [
	super initialize.
	tasks := OrderedCollection new.
]

{ #category : 'accessing' }
Column >> name [
	^ name
]

{ #category : 'accessing' }
Column >> name: aString [
	name := aString
]

{ #category : 'printing' }
Column >> printOn: aStream [
	aStream
		nextPutAll: 'Column(';
		nextPutAll: name;
		nextPutAll: ')'
]

{ #category : 'tasks' }
Column >> removeTask: aTask [
	tasks remove: aTask ifAbsent: [ nil ].
]

{ #category : 'accessing' }
Column >> tasks [
	^ tasks
]
