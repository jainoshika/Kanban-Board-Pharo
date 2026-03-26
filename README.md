## A Kanban Board Built Using Pharo & Spec2 UI Framework

### Why this Project?

I built this to:
- Master Pharo's syntax and environment through practical implementation
- Demonstrate test-driven development
- Showcase my ability to deliver complete, documented solutions

### Demo

https://github.com/user-attachments/assets/66837456-769b-4014-8d9e-c7d1e0e33e4c

### Core Implementation

- User authentication with login and signup flow
- Workspace supporting multiple Kanban boards which can be created, opened and deleted
- Task management across columns: Todo → In Progress → Done
- Ability to create, move, and delete tasks
- Task prioritization using color indicators (High 🔴, Medium 🟡, Low 🟢)
- Automatic data persistence using STON

### Technical Specifications

- Development Environment: Pharo 14
- User Interface: Spec2 Framework
- Data Format: STON
- Architecture: Model–Presenter Pattern

### Installation

**Option 1: Using Metacello (Recommended)**

Run the following in a Pharo Playground:
```
Metacello new
  baseline: 'KanbanBoard';
  repository: 'github://jainoshika/Kanban-Board-Pharo:main/src';
  load.
```
**Option 2: Manual Import**

- Clone the repository
- Open it using Iceberg in Pharo
- Load the KanbanBoard package

### Running the Application

Open a Playground and run:
`KanbanApp open.`

### Default Credentials:
  - Admin: `admin123`  
  - Password: `admin123`
    
### LLM Support

LLM was mainly used as a learning aid while getting familiar with the Pharo ecosystem. It helped in understanding Pharo syntax, the design of frontend classes such as `WorkspacePresenter`, how STON serialization works and solving errors.
