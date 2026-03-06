Class {
	#name : 'WorkspacePresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'workspace',
		'boardList',
		'newBoardButton'
	],
	#classVars : [
		'CurrentWorkspace'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'initialization' }
WorkspacePresenter class >> resetWorkspace [
    CurrentWorkspace := nil
]

{ #category : 'accessing' }
WorkspacePresenter class >> workspace [
	CurrentWorkspace ifNil: [
		CurrentWorkspace := Workspace loadFromFile
	].
	^ CurrentWorkspace
]

{ #category : 'actions' }
WorkspacePresenter >> createBoard [

	| name board |

	name := UIManager default request: 'Board name'.
	name ifNil: [ ^ self ].

	board := Board new.
	board name: name.

	workspace addBoard: board.
	workspace saveToFile.

	self refreshBoards.
]

{ #category : 'layout' }
WorkspacePresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: boardList;
		add: newBoardButton;
		yourself
]

{ #category : 'initialization' }
WorkspacePresenter >> initialize [
	super initialize.
	workspace := self class workspace.
	self refreshBoards.
]

{ #category : 'initialization' }
WorkspacePresenter >> initializePresenters [

    boardList := self newList.

    boardList display: [ :board | board name ].

    boardList whenActivatedDo: [ :selection |
        self openBoard: selection selectedItem ].

    newBoardButton := self newButton.
    newBoardButton label: 'New Board'.
    newBoardButton action: [ self createBoard ].
]

{ #category : 'initialization' }
WorkspacePresenter >> initializeWindow: aWindow [
	super initializeWindow: aWindow.
	aWindow title: self title.
]

{ #category : 'actions' }
WorkspacePresenter >> openBoard: aBoard [

	| presenter |

	presenter := BoardPresenter new.
	presenter board: aBoard.

	presenter open.
]

{ #category : 'updating' }
WorkspacePresenter >> refreshBoards [

	boardList items: workspace boards.
]

{ #category : 'accessing' }
WorkspacePresenter >> title [
	^ 'Kanban Boards'
]

{ #category : 'actions' }
WorkspacePresenter >> workspace [
	CurrentWorkspace ifNil: [
		CurrentWorkspace := Workspace loadFromFile
	].
	^ CurrentWorkspace
]

{ #category : 'accessing' }
WorkspacePresenter >> workspace: aWorkspace [
	workspace := aWorkspace
]
