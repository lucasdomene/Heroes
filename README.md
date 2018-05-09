# Marvel Heroes

![iOS](https://camo.githubusercontent.com/2381be1522a92165392579bdfeb1271418760fdc/687474703a2f2f696d672e736869656c64732e696f2f62616467652f706c6174666f726d2d696f732d626c75652e7376673f7374796c653d666c6174) ![Swift](https://camo.githubusercontent.com/f3bc68f8badf9ec1143275e35cba2114910b0522/687474703a2f2f696d672e736869656c64732e696f2f62616467652f6c616e67756167652d73776966742d627269676874677265656e2e7376673f7374796c653d666c6174)

## Overview

iOS Marvel app to browse Marvel characters.

### Heroes View
* Show list of characters fetched from Marvel API. It's possible to search for characters using the search bar and also setting characters as favorite. A favorite button is set on top, so the user can change between all or favorite characters.

![Home](https://image.ibb.co/b3Vs4S/Screen_Shot_2018_05_08_at_22_10_37.png)

### Hero Details
* Show character details: Comics, Events, Series and Stories. Every item is selectable, so the user can see more details about it.

![Hero](https://image.ibb.co/kuNiB7/Screen_Shot_2018_05_08_at_22_15_07.png)

### Item Details
* Show details for selected item.

![Details](https://image.ibb.co/dxvQPS/Screen_Shot_2018_05_08_at_22_15_19.png)

## Installation

Just clone the repo or download it in zip-file, Open the project in Xcode then test it on your iOS device or iOS simulator. No need to load external third libraries, since this project uses none.

## Project Files Structure

* **ViewControllers**:
	Contains all the view controllers. Protocols are conformed in extensions so it can be modular, easier to read and maintain.

* **Views**: 
	Contains views and xibs
    
* **Models**:
	Contains the models. As in *View Controllers*, the conformance of protocols are made in extension for simplicity.
    
* **Networking**:
	Contains an *HeroAPI* which is responsible for creating the full request for each endpoint and a *Request* which make the calls to the specified path.
    
* **Services**:
	Contains classes that work as data fetchers and persistence classes. Currently using FileManager as persistence and fetching data over Marvel API.
    
* **Protocols**:
	Contains all protocols. Every protocol is declared in it's own file so it's easier to maintain.
    
* **Helpers**:
	Contains classes to make actions that don't match any above. In this app case, only an extension of String is being used to create a md5 encrypted string.

## Architecture

Developed using MVC. Also, to keep *ViewControllers* short, I used the following strategies:
* Created extensions to conform to protocols.
* Created *Services* classes, which are responsible for fetching and persisting data, and that way making easier it's use on *ViewControllers*. Also parsed data on this services.
* In some cases, defined *Protocols* and extended it adding implementation, so it could be ready for use.

## Testing

Testing was made using XCTest framework.

#### Unit Testing

Tested the following parts:
* Networking
* Services
* ViewControllers
* Models

#### UI Testing

Tested the following cases:
* View loading (Heroes, Heroes Details and Item Details)
* Favorites (Adding and removing)
* Searching

## Considerations and extra tasks

*	Improve persistence for favorites. As for now, the performance isn't great, since it's saving and retrieving the entire characters array at once when saving or deleting. Also, could stop using FileManager and  use something more scalable, as CoreData.
*	Fix asynchronous tasks for details view. As it is, some conflicts are occurring.
*	Improving app layout, no need to say that.
