A/B Test Name: Sort by Price vs. Sort by Distance for Gas Stations

User Story Number: US3 (View Nearby Gas Stations)

Metrics (HEART Framework):

Happiness: User satisfaction (measured via in-app rating prompt)
Engagement: Number of gas station clicks per session
Adoption: Percentage of users who perform a gas search
Retention: Returning users who search again within 7 days
Task Success: Number of users who select a gas station (proxy for intent to visit)

Problem
The main goal of SmartFuel is to help users quickly find the best gas station. However, users may have different priorities—some care more about the cheapest price, while others prioritize the closest location. Currently, if the default sorting method does not match user preference, users may need to manually switch filters or may become frustrated and leave the app.

The bottleneck occurs after users perform a gas search but before they select a station. If users do not immediately see relevant results, they may not interact further. This reduces engagement and task success, limiting the effectiveness of the app.

Hypothesis
If we change the default sorting method of gas stations, then user engagement and task success will improve. Specifically, we hypothesize that sorting by price will lead to more station selections compared to sorting by distance, because users are primarily motivated to save money on fuel.

Experiment
We will implement this test using Firebase A/B Testing with Remote Config.

Audience:

All users who perform a gas search
Users must have location services enabled

Traffic Allocation:

50% → Variation A (Sort by Distance)
50% → Variation B (Sort by Price)

A 50/50 split ensures both variations receive enough traffic to reach statistical significance efficiently.

Firebase Analytics Tracking:
We will track the following events:

gas_search – when a user searches for gas stations
station_view – when a user clicks on a station
station_selected – when a user chooses a station (e.g., for navigation)
filter_changed – if users manually switch sorting method

HEART Metrics Mapping:

Engagement → station_view
Adoption → gas_search
Retention → repeat gas_search over time
Task Success → station_selected
Happiness → optional in-app feedback prompt

Variations

Variation A (Control): Sort by Distance

Gas stations are displayed starting with the closest location
User flow:
Search → View nearest stations → Select station

Variation B (Experimental): Sort by Price

Gas stations are displayed starting with the cheapest price
User flow:
Search → View cheapest stations → Select station
