Class {
	#name : 'BaselineOfKanbanBoard',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfKanbanBoard',
	#package : 'BaselineOfKanbanBoard'
}

{ #category : 'baselines' }
BaselineOfKanbanBoard >> baseline: spec [
  <baseline>

  spec for: #common do: [

    spec
      package: 'KanbanBoard';
      package: 'KanbanBoard-Tests' with: [
        spec requires: #('KanbanBoard')
      ].

    spec
      group: 'Core' with: #('KanbanBoard');
      group: 'Tests' with: #('KanbanBoard' 'KanbanBoard-Tests')
  ].
]
