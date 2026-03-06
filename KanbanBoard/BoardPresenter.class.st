Class {
	#name : 'BoardPresenter',
	#superclass : 'SpPresenter',
	#instVars : [
		'board',
		'todoList',
		'progressList',
		'doneList',
		'addTaskButton',
		'moveToProgressButton',
		'moveToDoneButton',
		'deleteTaskButton'
	],
	#category : 'KanbanBoard',
	#package : 'KanbanBoard'
}

{ #category : 'accessing' }
BoardPresenter >> board [
	^ board
]

{ #category : 'accessing' }
BoardPresenter >> board: aBoard [
	(aBoard isKindOf: Board) ifFalse: [
		self error: 'Expected a Board object'
	].

	board := aBoard.
	self window ifNotNil: [ self window title: self title ].
	self refreshBoard.
]

{ #category : 'actions' }
BoardPresenter >> createTask [

	| title task priority |

	title := UIManager default request: 'Task title'.
	title ifNil: [ ^ self ].

	priority := UIManager default
		chooseFrom: #('High' 'Medium' 'Low')
		values: #(high medium low)
		title: 'Priority'.

	task := Task new.
	task title: title.
	task priority: priority.

	(board columnNamed: 'Todo') addTask: task.

	board save.
	self refreshBoard.
]

{ #category : 'layout' }
BoardPresenter >> defaultLayout [

	^ SpBoxLayout newTopToBottom
		add: (SpBoxLayout newLeftToRight
			add: (SpBoxLayout newTopToBottom
				add: (self newLabel label: 'TODO');
				add: todoList;
				add: moveToProgressButton;
				yourself);
			add: (SpBoxLayout newTopToBottom
				add: (self newLabel label: 'IN PROGRESS');
				add: progressList;
				add: moveToDoneButton;
				yourself);
			add: (SpBoxLayout newTopToBottom
				add: (self newLabel label: 'DONE');
				add: doneList;
				yourself);
			yourself);
		add: (SpBoxLayout newLeftToRight
			add: addTaskButton;
			add: deleteTaskButton;
			yourself);
		yourself
]

{ #category : 'actions' }
BoardPresenter >> deleteTask [

	| task |

	task := todoList selectedItem.
	task ifNotNil: [
		(board columnNamed: 'Todo') removeTask: task.
		board save.
		self refreshBoard.
		^ self
	].

	task := progressList selectedItem.
	task ifNotNil: [
		(board columnNamed: 'In Progress') removeTask: task.
		board save.
		self refreshBoard.
		^ self
	].

	task := doneList selectedItem.
	task ifNotNil: [
		(board columnNamed: 'Done') removeTask: task.
		board save.
		self refreshBoard.
	].
]

{ #category : 'initialization' }
BoardPresenter >> initialize [
    super initialize.
]

{ #category : 'initialization' }
BoardPresenter >> initializePresenters [

	todoList := self newList.
	progressList := self newList.
	doneList := self newList.
	
	"Display with priority color"
	todoList display: [ :task |
		Text string: task title
			attribute: (TextColor color: task color)
	].

	progressList display: [ :task |
		Text string: task title
			attribute: (TextColor color: task color)
	].

	doneList display: [ :task |
		Text string: task title
			attribute: (TextColor color: task color)
	].

	"Double-click actions"
	todoList whenActivatedDo: [ :task |
		self moveTaskFromTodo: task ].

	progressList whenActivatedDo: [ :task |
		self moveTaskFromProgress: task ].

	addTaskButton := self newButton.
	addTaskButton label: 'Add Task'.
	addTaskButton action: [ self createTask ].

	moveToProgressButton := self newButton.
	moveToProgressButton label: 'Move → In Progress'.
	moveToProgressButton action: [ self moveToProgress ].

	moveToDoneButton := self newButton.
	moveToDoneButton label: 'Move → Done'.
	moveToDoneButton action: [ self moveToDone ].

	deleteTaskButton := self newButton.
	deleteTaskButton label: 'Delete Task'.
	deleteTaskButton action: [ self deleteTask ].
]

{ #category : 'initialization' }
BoardPresenter >> initializeWindow: aWindow [
	super initializeWindow: aWindow.
	aWindow title: self title.
]

{ #category : 'actions' }
BoardPresenter >> moveTaskFromProgress: task [

	task ifNil: [ ^ self ].

	board moveTask: task from: 'In Progress' to: 'Done'.

	board save.

	self refreshBoard. 
]

{ #category : 'actions' }
BoardPresenter >> moveTaskFromTodo: task [

	task ifNil: [ ^ self ].

	board moveTask: task from: 'Todo' to: 'In Progress'.

	board save.

	self refreshBoard.
]

{ #category : 'actions' }
BoardPresenter >> moveToDone [

	| task |

	task := progressList selectedItem.
	task ifNil: [ ^ self ].

	board moveTask: task from: 'In Progress' to: 'Done'.

	board save.
	
	self refreshBoard.
]

{ #category : 'actions' }
BoardPresenter >> moveToProgress [

	| task |

	task := todoList selectedItem.
	task ifNil: [ ^ self ].

	board moveTask: task from: 'Todo' to: 'In Progress'.

	board save.
	
	self refreshBoard.
]

{ #category : 'updating' }
BoardPresenter >> refreshBoard [

	todoList items: (board columnNamed: 'Todo') tasks asArray.
	progressList items: (board columnNamed: 'In Progress') tasks asArray.
	doneList items: (board columnNamed: 'Done') tasks asArray.
]

{ #category : 'accessing - deprecated' }
BoardPresenter >> title [
	board ifNil: [ ^ 'Kanban Board' ].
	^ 'Kanban - ', board name
]
