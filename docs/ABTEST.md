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