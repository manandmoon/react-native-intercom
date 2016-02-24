# react-native-intercom
React Native wrapper for Intercom.io. Based off of [intercom-cordova](https://github.com/intercom/intercom-cordova)

### Installation

```bash
$ npm install react-native-intercom
```

This project ships with CocoaPods podspec you can use to have all native dependencies automatically installed. To do so, simply include the below somewhere within your Podfile.

```ruby
pod 'react-native-intercom', :path => '../node_modules/react-native-intercom'
```

**Note** You may need to update relative path to your node_modules folder in case you don't have Podfile right in the iOS folder.

In case you do not use CocoaPods, simply download Intercom, attach it to your project and link just like any other React Native library.

### Setup

Initialize Intercom in your `AppDelegate.m`
```
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Initialize Intercom
    [Intercom setApiKey:@"<#ios_sdk-...#>" forAppId:@"<#your-app-id#>"];
}
```

[Intercom's documentation](https://github.com/intercom/intercom-ios/blob/1fe2e92c4913e4ffef290b5b62dac5ecef74ea1d/Intercom.framework/Versions/A/Headers/Intercom.h#L65) suggests adding the following call in order to receive push notifications for new messages:
```
- (void)application:(UIApplication *)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData *)deviceToken {
     [Intercom setDeviceToken:deviceToken];
}
```

For any other things, refer to Intercom's documentation.

Usage
=====
### Require the module
```javascript
var Intercom = require('react-native-intercom');
```

### Log an event
```javascript
Intercom.logEvent('viewed_screen', { extra: 'metadata' });
```

### Register a Logged In user
```javascript
Intercom.registerIdentifiedUser({ userId: 'bob' });
```

### Register a Logged In user and post extra metadata
```javascript
Intercom.registerIdentifiedUser({ userId: 'bob' })
.then(() => {
	console.log('registerIdentifiedUser done');

	return Intercom.updateUser({
		email: 'email',
		name: 'name',
	});
})
.catch((err) => {
	console.log('registerIdentifiedUser ERROR', err);
});
```

### Sign Out
```javascript
Intercom.reset()
```

### Show Message Composer
```javascript
Intercom.displayMessageComposer();
```
