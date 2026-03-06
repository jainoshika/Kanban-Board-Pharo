Class {
	#name : 'LoginPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'usernameField',
		'passwordField',
		'loginButton'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'layout' }
LoginPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (self newLabel label: 'Username');
		add: usernameField;
		add: (self newLabel label: 'Password');
		add: passwordField;
		add: loginButton;
		yourself
]

{ #category : 'initialization' }
LoginPresenter >> initialize [
	super initialize.
	self window ifNotNil: [ self window title: self title ].
]

{ #category : 'initialization' }
LoginPresenter >> initializePresenters [

	usernameField := self newTextInput.

	passwordField := self newTextInput.
	passwordField bePassword.

	loginButton := self newButton.
	loginButton label: 'Login'.
	loginButton action: [ self login ].
]

{ #category : 'initialization' }
LoginPresenter >> initializeWindow: aWindow [
	super initializeWindow: aWindow.
	aWindow title: self title.
]

{ #category : 'actions' }
LoginPresenter >> login [

	| user workspace |

	workspace := WorkspacePresenter workspace.
	user := workspace user.

	(user authenticate: passwordField text)
		ifTrue: [
			self window close.
			WorkspacePresenter new open
		]
		ifFalse: [
			UIManager default inform: 'Invalid password'
		].
]

{ #category : 'accessing - deprecated' }
LoginPresenter >> title [
	^ 'Login'
]
