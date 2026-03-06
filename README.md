# Kanban Board (Pharo)

A simple **Kanban board desktop application** built using **Pharo** and the **Spec2 UI framework**.  
The project demonstrates object-oriented design, authentication, task management, and data persistence using **STON**.

### Demo

https://github.com/user-attachments/assets/66837456-769b-4014-8d9e-c7d1e0e33e4c

## Key Functionalities

### Authentication

The application begins with a login and signup interface. Users can create accounts and authenticate before accessing the workspace.

### Workspace and Boards

After login, users access a workspace that contains multiple Kanban boards. Each board represents a project or task collection.
Users can:
- Create, open and delete boards
- Manage tasks within each board
- Track progress across workflow stages

### Task Workflow Management

Each board follows a standard Kanban structure with three columns: ```Todo → In Progress → Done```
Users can:
- Create new tasks
- Move tasks between columns
- Delete completed or unnecessary tasks
The interface updates automatically when tasks are modified.

### Task Priorities

Tasks support priority levels which are visually represented using colors. This allows users to quickly identify important work.
- 🔴 High
- 🟡 Medium
- 🟢 Low

### Data Persistence

The application uses **STON (Smalltalk Object Notation)** for local data persistence. The system automatically:
- Saves workspace state when tasks or boards change
- Restores data when the application starts again
All data is stored in a local `kanban.ston` file.

## Technical Specifications

Development Environment: **Pharo 14**  
User Interface: **Spec2 Framework**  
Data Format: **STON (Local File System)**  
Architecture: **Model–Presenter Pattern**

## Installation and Usage

1. Import the `KanbanBoard` package into a **Pharo 14** image.
2. Open a Playground and run:
  ```smalltalk
    KanbanApp open
  ```
3. Default Credentials:
  - Admin: `admin123`  
  - Password: `admin123`
