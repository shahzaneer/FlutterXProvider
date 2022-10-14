# State Management

## Why to use State Management?
- Normal `setState()` of stateful widget calls the build method to build itself once again.
- Whereas we are interested in rebuilding only that part of the UI which is changing its state actually
- In realtime `setState()` puts a lot of pressure on RAM of your Device and eventually it effects the performance.
- Therefore we use State management Techniques to cater this problem.

