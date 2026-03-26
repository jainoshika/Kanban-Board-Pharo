Class {
	#name : 'Workspace',
	#superclass : 'Object',
	#instVars : [
		'boards',
		'user'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'as yet unclassified' }
Workspace class >> loadFromFile [

	| file workspace |

	file := FileLocator workingDirectory / 'kanban.ston'.

	file exists ifFalse: [ ^ self new ].

	workspace := file readStreamDo: [ :stream |
		STON fromStream: stream ].

	workspace ifNil: [ workspace := self new ].

	workspace boards ifNil: [ workspace initialize ].

	^ workspace
]

{ #category : 'boards' }
Workspace >> addBoard: aBoard [
	boards add: aBoard
]

{ #category : 'boards' }
Workspace >> boardNamed: aString [
	^ boards detect: [ :b | b name = aString ] ifNone: [ nil ]
]

{ #category : 'accessing' }
Workspace >> boards [
	^ boards
]

{ #category : 'boards' }
Workspace >> deleteBoard: aBoard [
	boards remove: aBoard ifAbsent: [ ].
	self saveToFile.
]

{ #category : 'initialization' }
Workspace >> initialize [
	super initialize.
	boards := OrderedCollection new.
]

{ #category : 'boards' }
Workspace >> removeBoard: aBoard [
	boards remove: aBoard ifAbsent: [ ]
]

{ #category : 'persistence' }
Workspace >> saveToFile [

	| file |
	file := FileLocator workingDirectory / 'kanban.ston'.

	file writeStreamDo: [ :stream |
		STON put: self onStream: stream ].
]

{ #category : 'accessing' }
Workspace >> user [
	^ user
]

{ #category : 'accessing' }
Workspace >> user: aUser [
	user := aUser
]
