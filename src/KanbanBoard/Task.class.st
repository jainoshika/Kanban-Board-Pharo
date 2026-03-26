Class {
	#name : 'Task',
	#superclass : 'Object',
	#instVars : [
		'title',
		'description',
		'priority',
		'createdAt'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'ui' }
Task >> color [

	priority = #high ifTrue: [ ^ Color red ].
	priority = #medium ifTrue: [ ^ Color yellow ].
	priority = #low ifTrue: [ ^ Color green ].

	^ Color black
]

{ #category : 'accessing' }
Task >> description [
	^ description
]

{ #category : 'accessing' }
Task >> description: aString [
	description := aString
]

{ #category : 'initialization' }
Task >> initialize [
	super initialize.
	createdAt := DateAndTime now.
]

{ #category : 'printing' }
Task >> printOn: aStream [
	aStream nextPutAll: title
]

{ #category : 'accessing' }
Task >> priority [
	^ priority
]

{ #category : 'accessing' }
Task >> priority: aSymbol [
	priority := aSymbol
]

{ #category : 'accessing' }
Task >> title [
	^ title
]

{ #category : 'accessing' }
Task >> title: aString [
	title := aString
]
