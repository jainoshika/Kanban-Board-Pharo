# Kanban Board

A simple **Kanban board desktop application** built using **Pharo** and the **Spec2 UI framework**. The project demonstrates object-oriented design, authentication, task management, and data persistence using **STON**.

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

### Task Workflow Management

Each board follows a standard Kanban structure with three columns: ```Todo → In Progress → Done```
Users can:
- Create new tasks
- Move tasks between columns
- Delete completed or unnecessary tasks

### Task Priorities

Tasks support priority levels which are visually represented using colors. This allows users to quickly identify important work.
- 🔴 High
- 🟡 Medium
- 🟢 Low

### Data Persistence

The application uses **STON (Smalltalk Object Notation)** for local data persistence. The system automatically:
- Saves workspace state when tasks or boards change
- Restores data when the application starts again

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
    
## LLM Support

LLM (ChatGPT) was used during the development of this project mainly to learn the Pharo environment and explore possible approaches.
- It helped generate an initial example for the `Task` class.
- It was used to understand Pharo syntax and the design of frontend classes such as `WorkspacePresenter`.
- It helped in understanding how STON serialization works.
- It was also used while exploring how the priority color feature could be implemented.

After understanding these patterns, most of the remaining classes and features were implemented by following the same structure. Once the design was clear, implementing the backend models (Task, Column, Board, etc.) and the presenters became fairly repetitive.

LLM support was mainly used as a learning aid while getting familiar with the Pharo ecosystem.
