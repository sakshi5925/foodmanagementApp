import 'package:flutter/material.dart';
import '../models/task.dart';

class TasksTab extends StatefulWidget {
  @override
  _TasksTabState createState() => _TasksTabState();
}

class _TasksTabState extends State<TasksTab> {
  TaskStatus? _selectedStatus;
  String? _selectedLocation;
  List<String> _locations = ['All Locations', 'Downtown', 'Uptown', 'Midtown'];

  // Dummy data for demonstration
  final List<Task> _tasks = [
    Task(
      id: '1',
      title: 'Deliver Food to Community Center',
      description: 'Pick up meals from Hotel Grand and deliver to Downtown Community Center',
      deadline: DateTime.now().add(Duration(hours: 2)),
      location: 'Downtown',
      mealsCount: 50,
      assignedTime: '2 hours',
      status: TaskStatus.pending,
      progressPercentage: 0.0,
    ),
    Task(
      id: '2',
      title: 'Sort Donated Items',
      description: 'Sort and organize donated food items at the main warehouse',
      deadline: DateTime.now().add(Duration(hours: 4)),
      location: 'Midtown',
      mealsCount: 100,
      assignedTime: '3 hours',
      status: TaskStatus.inProgress,
      progressPercentage: 0.45,
    ),
    // Add more dummy tasks as needed
  ];

  List<Task> get filteredTasks {
    return _tasks.where((task) {
      if (_selectedStatus != null && task.status != _selectedStatus) {
        return false;
      }
      if (_selectedLocation != null && 
          _selectedLocation != 'All Locations' && 
          task.location != _selectedLocation) {
        return false;
      }
      return true;
    }).toList()
      ..sort((a, b) => a.deadline.compareTo(b.deadline));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildFilters(),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(16),
            itemCount: filteredTasks.length,
            itemBuilder: (context, index) {
              return _buildTaskCard(filteredTasks[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildFilters() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: DropdownButtonFormField<TaskStatus>(
              decoration: InputDecoration(
                labelText: 'Status',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: _selectedStatus,
              items: [
                DropdownMenuItem(
                  value: null,
                  child: Text('All Status'),
                ),
                ...TaskStatus.values.map((status) {
                  return DropdownMenuItem(
                    value: status,
                    child: Text(status.toString().split('.').last),
                  );
                }),
              ],
              onChanged: (value) {
                setState(() {
                  _selectedStatus = value;
                });
              },
            ),
          ),
          SizedBox(width: 16),
          Expanded(
            child: DropdownButtonFormField<String>(
              decoration: InputDecoration(
                labelText: 'Location',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              value: _selectedLocation ?? 'All Locations',
              items: _locations.map((location) {
                return DropdownMenuItem(
                  value: location,
                  child: Text(location),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  _selectedLocation = value;
                });
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTaskCard(Task task) {
    return Card(
      margin: EdgeInsets.only(bottom: 16),
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: InkWell(
        onTap: () => _showTaskDetails(task),
        borderRadius: BorderRadius.circular(12),
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Text(
                      task.title,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  _buildStatusChip(task.status),
                ],
              ),
              SizedBox(height: 8),
              Text(
                task.description,
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
              SizedBox(height: 8),
              Row(
                children: [
                  Icon(Icons.location_on, size: 16, color: Color(0xFF00796B)),
                  SizedBox(width: 4),
                  Text(task.location),
                  SizedBox(width: 16),
                  Icon(Icons.access_time, size: 16, color: Color(0xFF00796B)),
                  SizedBox(width: 4),
                  Text(
                    '${task.deadline.difference(DateTime.now()).inHours}h remaining',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStatusChip(TaskStatus status) {
    IconData icon;
    Color color;
    String label;

    switch (status) {
      case TaskStatus.pending:
        icon = Icons.schedule;
        color = Colors.red;
        label = 'Pending';
        break;
      case TaskStatus.inProgress:
        icon = Icons.rotate_right;
        color = Colors.orange;
        label = 'In Progress';
        break;
      case TaskStatus.completed:
        icon = Icons.check_circle;
        color = Colors.green;
        label = 'Completed';
        break;
    }

    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: color),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 16, color: color),
          SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(color: color),
          ),
        ],
      ),
    );
  }

  void _showTaskDetails(Task task) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _TaskDetailsSheet(task: task),
    );
  }
}

class _TaskDetailsSheet extends StatelessWidget {
  final Task task;

  const _TaskDetailsSheet({required this.task});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      padding: EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            task.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 16),
          _buildInfoRow(Icons.location_on, 'Location', task.location),
          SizedBox(height: 8),
          _buildInfoRow(Icons.restaurant, 'Meals', '${task.mealsCount} meals'),
          SizedBox(height: 8),
          _buildInfoRow(Icons.access_time, 'Time Assigned', task.assignedTime),
          SizedBox(height: 16),
          Text(
            'Progress',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 8),
          LinearProgressIndicator(
            value: task.progressPercentage,
            backgroundColor: Colors.grey[200],
            valueColor: AlwaysStoppedAnimation<Color>(Color(0xFF00796B)),
          ),
          Text(
            '${(task.progressPercentage * 100).toInt()}%',
            style: TextStyle(
              color: Color(0xFF00796B),
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            height: 50,
            child: ElevatedButton(
              onPressed: () {
                // Implement status update logic
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFF00796B),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              child: Text(
                task.status == TaskStatus.completed
                    ? 'Mark as Incomplete'
                    : 'Mark as Complete',
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(IconData icon, String label, String value) {
    return Row(
      children: [
        Icon(icon, size: 20, color: Color(0xFF00796B)),
        SizedBox(width: 8),
        Text(
          '$label: ',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(value),
      ],
    );
  }
} 