Class {
	#name : 'User',
	#superclass : 'Object',
	#instVars : [
		'username',
		'passwordHash'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'authentication' }
User >> authenticate: aPassword [
	^ passwordHash = (self hashPassword: aPassword)
]

{ #category : 'authentication' }
User >> hashPassword: aPassword [
	^ SHA256 hashMessage: aPassword
]

{ #category : 'initialization' }
User >> initialize [
	super initialize.
]

{ #category : 'accessing' }
User >> passwordHash [
	^ passwordHash
]

{ #category : 'accessing' }
User >> passwordHash: aHash [
	passwordHash := aHash
]

{ #category : 'authentication' }
User >> setPassword: aPassword [
	passwordHash := self hashPassword: aPassword
]

{ #category : 'accessing' }
User >> username [
	^ username
]

{ #category : 'accessing' }
User >> username: aString [
	username := aString
]
