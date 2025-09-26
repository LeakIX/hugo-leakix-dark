#!/usr/bin/env python3
"""
Example Python module demonstrating various features
for the LeakIX Dark Theme code highlighting showcase.
"""

import asyncio
import json
import logging
from dataclasses import dataclass, field
from datetime import datetime, timedelta
from typing import List, Optional, Dict, Any
from enum import Enum

# Configure logging
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(levelname)s - %(message)s')
logger = logging.getLogger(__name__)


class TaskStatus(Enum):
    """Enumeration for task statuses"""
    PENDING = "pending"
    IN_PROGRESS = "in_progress"
    COMPLETED = "completed"
    FAILED = "failed"
    CANCELLED = "cancelled"


@dataclass
class Task:
    """Represents a task in our system"""
    id: str
    title: str
    description: str
    status: TaskStatus = TaskStatus.PENDING
    priority: int = 1
    created_at: datetime = field(default_factory=datetime.now)
    updated_at: datetime = field(default_factory=datetime.now)
    metadata: Dict[str, Any] = field(default_factory=dict)
    
    def to_dict(self) -> Dict[str, Any]:
        """Convert task to dictionary representation"""
        return {
            'id': self.id,
            'title': self.title,
            'description': self.description,
            'status': self.status.value,
            'priority': self.priority,
            'created_at': self.created_at.isoformat(),
            'updated_at': self.updated_at.isoformat(),
            'metadata': self.metadata
        }
    
    def update_status(self, new_status: TaskStatus) -> None:
        """Update task status and timestamp"""
        self.status = new_status
        self.updated_at = datetime.now()
        logger.info(f"Task {self.id} status updated to {new_status.value}")


class TaskManager:
    """Manages a collection of tasks"""
    
    def __init__(self):
        self.tasks: Dict[str, Task] = {}
        self._task_counter = 0
    
    def create_task(self, title: str, description: str, **kwargs) -> Task:
        """Create a new task"""
        self._task_counter += 1
        task_id = f"TASK-{self._task_counter:04d}"
        
        task = Task(
            id=task_id,
            title=title,
            description=description,
            **kwargs
        )
        
        self.tasks[task_id] = task
        logger.info(f"Created task: {task_id}")
        return task
    
    def get_task(self, task_id: str) -> Optional[Task]:
        """Retrieve a task by ID"""
        return self.tasks.get(task_id)
    
    def list_tasks(self, status: Optional[TaskStatus] = None) -> List[Task]:
        """List all tasks, optionally filtered by status"""
        tasks = list(self.tasks.values())
        
        if status:
            tasks = [t for t in tasks if t.status == status]
        
        return sorted(tasks, key=lambda t: (t.priority, t.created_at))
    
    async def process_task(self, task_id: str) -> bool:
        """Process a task asynchronously"""
        task = self.get_task(task_id)
        if not task:
            logger.error(f"Task {task_id} not found")
            return False
        
        try:
            task.update_status(TaskStatus.IN_PROGRESS)
            
            # Simulate processing time
            await asyncio.sleep(2)
            
            # Simulate random success/failure
            import random
            if random.random() > 0.8:
                raise Exception("Random failure for demonstration")
            
            task.update_status(TaskStatus.COMPLETED)
            return True
            
        except Exception as e:
            logger.error(f"Task {task_id} failed: {e}")
            task.update_status(TaskStatus.FAILED)
            return False
    
    def export_tasks(self, filename: str) -> None:
        """Export all tasks to a JSON file"""
        tasks_data = [task.to_dict() for task in self.tasks.values()]
        
        with open(filename, 'w') as f:
            json.dump(tasks_data, f, indent=2, default=str)
        
        logger.info(f"Exported {len(tasks_data)} tasks to {filename}")
    
    def get_statistics(self) -> Dict[str, Any]:
        """Get statistics about tasks"""
        stats = {
            'total': len(self.tasks),
            'by_status': {},
            'by_priority': {},
            'avg_age_hours': 0
        }
        
        for task in self.tasks.values():
            # Count by status
            status_key = task.status.value
            stats['by_status'][status_key] = stats['by_status'].get(status_key, 0) + 1
            
            # Count by priority
            priority_key = f"priority_{task.priority}"
            stats['by_priority'][priority_key] = stats['by_priority'].get(priority_key, 0) + 1
        
        # Calculate average age
        if self.tasks:
            now = datetime.now()
            total_age = sum((now - t.created_at).total_seconds() for t in self.tasks.values())
            stats['avg_age_hours'] = round(total_age / len(self.tasks) / 3600, 2)
        
        return stats


async def main():
    """Main entry point for the application"""
    manager = TaskManager()
    
    # Create sample tasks
    tasks = [
        manager.create_task("Setup environment", "Install required dependencies", priority=1),
        manager.create_task("Write documentation", "Create comprehensive docs", priority=2),
        manager.create_task("Run tests", "Execute test suite", priority=1),
        manager.create_task("Deploy application", "Deploy to production", priority=3),
    ]
    
    # Process tasks concurrently
    results = await asyncio.gather(
        *[manager.process_task(task.id) for task in tasks],
        return_exceptions=True
    )
    
    # Display statistics
    stats = manager.get_statistics()
    print("\n=== Task Statistics ===")
    print(f"Total tasks: {stats['total']}")
    print(f"By status: {stats['by_status']}")
    print(f"By priority: {stats['by_priority']}")
    print(f"Average age: {stats['avg_age_hours']} hours")
    
    # Export results
    manager.export_tasks("tasks_export.json")


if __name__ == "__main__":
    asyncio.run(main())