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
