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
**US5 – Additional Feature - Price Change Tracking**

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
