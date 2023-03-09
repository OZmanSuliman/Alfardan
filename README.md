# AlFardan App

## Environments
The project contains 3 enviroments:
- Development
- Staging
- Release

each environment of these has its own specific configuratuin.
to switch between environments just change scheme in XCode.
Environment is been controlled at the run time by the EnvironmentManager.

##Unit Tests & UITest


##Architecture
VIPER architecture is applied on this project

####Flows/view:
 show what presenter ask to show and send to presenter user actions
####Flows/Interactor:
 hold business logic
####Flows/Presenter:
 format data which passed by the interactor, control the router, responds to user feedback by requesting more information or returning it to the interactor
####Entity:
 data structures
####Router:
 assemble the components and manage the navigation


## Data Source


#### remote

### local



## Memory Management :
All entities are value types, which prevents it from any retain cycles 

## Thread Safety:
A concurrent queue added to the AppState Singleton class to manage the usage of the class properties


## CI/CD
Using fastlane and Github Actions, pipeline runs on one of the 3 environments depending on the destination branch.

## Multi Orientation
The app provide Landscape and portrait modes




cheers 🍻
