abstract class AppStates {

}

class AppInitState extends AppStates {}

class AppChangeState extends AppStates {}

class AppChangeBottomNavBarState extends AppStates {}

class AppChangeBottomSheetState extends AppStates {}

class DatabaseConnectedState extends AppStates {}

class DatabaseInitializedState extends AppStates {}

class DatabaseOpenedState extends AppStates {}

class DatabaseExceptionState extends AppStates {
  DatabaseExceptionState(Function exception) {
    throw exception;
  }
}

class TaskAddedState extends AppStates {}

class TasksFetchedState extends AppStates {}

class TaskUpdatedState extends AppStates {}

class TaskDeletedState extends AppStates {}

class TaskStatusChangeState extends AppStates {}
