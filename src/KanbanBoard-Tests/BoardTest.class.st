Class {
	#name : 'BoardTest',
	#superclass : 'TestCase',
	#category : 'KanbanBoard-Tests',
	#package : 'KanbanBoard-Tests'
}

{ #category : 'tests' }
BoardTest >> testBoardHasThreeColumns [

	| board |
	board := Board new.

	self assert: board columns size = 3.
	self assert: (board columnNamed: 'Todo') notNil.
	self assert: (board columnNamed: 'In Progress') notNil.
	self assert: (board columnNamed: 'Done') notNil.
]

{ #category : 'tests' }
BoardTest >> testCreateBoard [

	| workspace board |
	workspace := Workspace new.

	board := Board new.
	board name: 'Test'.

	workspace addBoard: board.

	self assert: workspace boards size = 1.
	self assert: (workspace boards first name = 'Test').
]

{ #category : 'tests' }
BoardTest >> testCreateTask [

	| board task |
	board := Board new.

	task := Task new.
	task title: 'Test Task'.

	(board columnNamed: 'Todo') addTask: task.

	self assert: (board columnNamed: 'Todo') tasks size = 1.
]

{ #category : 'tests' }
BoardTest >> testDeleteBoard [

	| workspace board |
	workspace := Workspace new.

	board := Board new.
	board name: 'Test'.

	workspace addBoard: board.
	workspace deleteBoard: board.

	self assert: workspace boards isEmpty.
]

{ #category : 'tests' }
BoardTest >> testDeleteTask [

	| board task |
	board := Board new.

	task := Task new.
	task title: 'Test'.

	(board columnNamed: 'Todo') addTask: task.
	(board columnNamed: 'Todo') removeTask: task.

	self assert: (board columnNamed: 'Todo') tasks isEmpty.
]

{ #category : 'tests' }
BoardTest >> testFindBoardByName [

	| workspace board |
	workspace := Workspace new.

	board := Board new.
	board name: 'Test'.

	workspace addBoard: board.

	self assert: (workspace boardNamed: 'Test') = board.
]

{ #category : 'tests' }
BoardTest >> testMoveTaskToDone [

	| board task |
	board := Board new.

	task := Task new.
	task title: 'Test'.

	(board columnNamed: 'Todo') addTask: task.
	board moveTask: task from: 'Todo' to: 'In Progress'.
	board moveTask: task from: 'In Progress' to: 'Done'.

	self assert: (board columnNamed: 'Done') tasks size = 1.
]

{ #category : 'tests' }
BoardTest >> testMoveTaskToProgress [

	| board task |
	board := Board new.

	task := Task new.
	task title: 'Test'.

	(board columnNamed: 'Todo') addTask: task.

	board moveTask: task from: 'Todo' to: 'In Progress'.

	self assert: (board columnNamed: 'Todo') tasks isEmpty.
	self assert: (board columnNamed: 'In Progress') tasks size = 1.
]

{ #category : 'tests' }
BoardTest >> testTaskPriority [

	| task |
	task := Task new.
	task priority: #high.

	self assert: task priority = #high.
]

{ #category : 'tests' }
BoardTest >> testWorkspaceSave [

	| workspace |
	workspace := Workspace new.

	workspace addBoard: (Board new name: 'Test'; yourself).
	workspace saveToFile.

	self assert: (FileLocator workingDirectory / 'kanban.ston') exists.
]
