Class {
	#name : 'SignupPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'usernameField',
		'passwordField',
		'createButton'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'actions' }
SignupPresenter >> createAccount [

	| workspace user |

	usernameField text isEmpty ifTrue: [
		UIManager default inform: 'Username cannot be empty'.
		^ self
	].

	passwordField text isEmpty ifTrue: [
		UIManager default inform: 'Password cannot be empty'.
		^ self
	].

	workspace := WorkspacePresenter workspace.

	user := User new.
	user username: usernameField text.
	user setPassword: passwordField text.

	workspace user: user.
	workspace saveToFile.

	self window close.
	WorkspacePresenter new open.
]

{ #category : 'layout' }
SignupPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (self newLabel label: 'Create Username');
		add: usernameField;
		add: (self newLabel label: 'Create Password');
		add: passwordField;
		add: createButton;
		yourself
]

{ #category : 'initialization' }
SignupPresenter >> initialize [
	super initialize.
	self window ifNotNil: [ self window title: self title ].
]

{ #category : 'initialization' }
SignupPresenter >> initializePresenters [

	usernameField := self newTextInput.

	passwordField := self newTextInput.
	passwordField bePassword.

	createButton := self newButton.
	createButton label: 'Create Account'.
	createButton action: [ self createAccount ].
]

{ #category : 'initialization' }
SignupPresenter >> initializeWindow: aWindow [
	super initializeWindow: aWindow.
	aWindow title: self title.
]

{ #category : 'accessing - deprecated' }
SignupPresenter >> title [
	^ 'Create Account'
]
