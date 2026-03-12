A/B Test Name: Single-Tap Google Sign-Up vs. Standard Email Registration

User Story Number: US1 (Account Creation)

Metrics: Adoption (registration rate) and Engagement (active use of app after account creation)

Hypothesis: State your hypothesis for this A/B test

The bottleneck in the conversion funnel is at the account creation screen. Typing out a valid email address, conceptualizing a strong password, and confirming that password takes time and mental effort, especially for commuters who are likely on their phones and in a hurry. This friction leads to users abandoning the app before they ever reach the main dashboard.

If we introduce a "Continue with Google" button alongside the standard email/password fields, then the overall registration rate  will increase. This is because utilizing an existing Google session reduces the time and physical taps required to sign up from over a dozen down to just one or two, allowing users to instantly access the app's core fuel-saving features.

Experiment - We will execute this using Firebase A/B Testing linked with Remote Config. We will target 50% of our new, unauthenticated users for this experiment. A 50/50 split is ideal here because adding a new authentication method is a significant UI change, and we want to reach statistical significance quickly.

Using Firebase Analytics, we will track the events sign_up_screen_viewed and sign_up_success. Crucially, to test our hypothesis about speed, we will log a custom timestamp parameter when the screen opens and another when the registration completes to calculate the average time spent on the screen. We will also log the sign_up_method parameter (email vs. google) to see which one the test group prefers.

Variations - Control (Variation A): The sign-up screen displays the standard text fields for "Email," "Password," and "Confirm Password," followed by a primary "Sign Up" button.

Test (Variation B): The sign-up screen includes the native FlutterFlow "Continue with Google" authentication button prominently placed at the top of the form, separated by an "OR" divider from the standard email/password input fields below it.

# A/B Test: Gas Price Drop Notifications vs No Notifications

## User Story Number
**US4 – Golden Path**

---

## Metrics (HEART Framework)

- **Engagement:** Number of gas searches performed in the app  
- **Adoption:** Number of users enabling notifications  
- **Retention:** Daily Active Users (DAU)  
- **Task Success:** Notification click-through rate  

---

## Hypothesis

Many SmartFuel users only open the app when they remember to check gas prices manually. This creates a problem where users may forget to check the app regularly, resulting in lower engagement and fewer daily active users.

If users are not reminded when prices change, they may rely on other apps or simply go to their usual gas station.

Our hypothesis is that **if users receive notifications when cheaper gas is available nearby, they will be more likely to open the SmartFuel app and search for gas stations**, improving overall retention and usage.

---

## Experiment

To test this hypothesis, we will conduct an **A/B test using Firebase A/B Testing with Firebase Remote Config and Firebase Cloud Messaging (FCM)**.

Users will be randomly assigned to two experiment groups. The experiment will target **users who have location services enabled**, since the notification system depends on nearby gas stations.

### Traffic Allocation

- **50% of eligible users → Version A**
- **50% of eligible users → Version B**

### Firebase Analytics Tracking

We will track the following events:

- `notification_sent`
- `notification_opened`
- `gas_search`
- `app_open`

### HEART Metrics Tracking

| Metric | Firebase Event |
|------|------|
| Engagement | `gas_search` |
| Adoption | `notification_enabled` |
| Retention | `app_open` |
| Task Success | `notification_opened` |

---

## Variations

### Version A (Control)

Users **do not receive gas price drop notifications**.

They must manually open the SmartFuel app to check nearby gas prices.

**User Flow**

Open App → Search Nearby Gas Stations → View Prices

---

### Version B (Experimental)

Users **receive push notifications when gas prices drop near their location**.

**Example Notification**

> "Gas price dropped to $3.15 near you! Tap to find the station."

When users click the notification, they are taken directly to the gas station list or map.

**User Flow**

Notification → Open SmartFuel → View Cheapest Nearby Gas


Problem

The problem we are trying to solve is that new users may leave the app before using its main feature because they are required to create an account first. Many users who quickly want to find nearby gas stations may not want to spend time signing up or entering personal information. If users are forced to create an account before accessing the app, they may abandon the app before discovering its usefulness.

The impact of this problem is that it reduces adoption and early engagement. If users cannot immediately search for nearby gas stations, they may uninstall the app or never return. Since the core value of the app is helping drivers quickly locate affordable gas stations, any friction before reaching this feature could significantly lower the number of users who successfully use the app.
The bottleneck in the conversion funnel occurs between opening the app for the first time and successfully performing the first gas station search. If users drop off during the sign-up process, they never reach the core functionality of the app.


Hypothesis

Our hypothesis is that allowing users to continue using the app without signing in will increase adoption and early engagement. If users can immediately access the gas station search feature, they will be more likely to try the app and understand its value.
By removing the sign-in requirement initially, we expect more users will successfully search for nearby gas stations during their first session. This should increase the number of users who experience the core functionality of the app and improve adoption rates.
Experiment
The experiment will be implemented using Firebase A/B Testing and tracked with Firebase Analytics.


Audience

The experiment will include new users who open the app for the first time. These users will be randomly divided into two groups:
50% of users will see the control version (sign-in required).
50% of users will see the variant version (guest mode allowed).
This ensures that both variations receive an equal number of users so we can accurately compare results.

Tracking

Using Firebase Analytics, we will track key events related to the HEART framework metrics:

Adoption metrics:
first_open – when a user opens the app for the first time
gas_station_search – when a user searches for nearby gas stations

Retention metrics:
returning users
repeat gas station searches
By comparing how many users complete a gas station search in each variation, we can determine whether removing the sign-in requirement improves adoption.

Variations

Variation A (Control)
Users are required to create an account or sign in before using the app. The login screen appears immediately when the app opens. Users must sign in with an account before they can search for nearby gas stations.

Variation B (Experiment)
Users are given the option to continue as a guest. When the app opens, they can immediately search for nearby gas stations without signing in. Users may still choose to create an account later if they want to submit gas prices or save preferences.
This variation reduces friction during onboarding and allows users to experience the app’s main feature immediately.

