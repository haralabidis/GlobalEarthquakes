# GlobalEarthquakes
A simple test app that displays earthquake locations on a map

## App Requirements

Requirements:

1. App is to integrate with an API to fetch earthquake information, link below.
1. Map screen plotting the earthquake locations. 
1. When the user taps on an annotation it is to display the location and date/time in the callout.
1. Listing screen listing the locations with pull to refresh.
1. Tapping on a list item will open the map screen with the selected earthquake in focus.


Details of the earthquake API can be found here: [https://earthquake.usgs.gov/earthquakes/feed/v1.0/]()

## UI Design
Minimal UI design was applied in order to keep this app clean and simple.

No app icons were generated as this was beyod the point of this exersice.

The app contains a landing page that can be used for potential initialisation of required data in the future.
A tab bar navigation was used with a tab for the list view and a tab for the map view.

## Code Structure

### Networking
A Network / service class for fetching API data and serialising into models.
The class utilises protocol delegation instead of closures.
This was selected to provide clarity in the code, and because the class may be used under different contexts.

All models are codable and networking was performed with the use of URLSession to avoid any dependencies on third party libraries.

### View models
All service models were transormed to view model that match the app requirements.

### Data Store
Data is stored in memenory within a datasource class that also enables delegation via protocol.

### Mapping

Utilised MapKit to display the map and plot annotations for the data.
A custom pin was generated but I opted to not create a completed custom callout view since I could meet the requirements by simply adding a multiline value for the calout detail that can acommodate long location names.

### List view
A simple table view utilising an activity indicator.

### UI Layout

Auto layout :)

## Testing
I added a couple of unit and UI tests in the app, code coverage is quie low but I wanted to keep this exercise short.
I created mock classes for Networking tests.

Please let me know if you would like me to extend these.



