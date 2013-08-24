#Zuckerkit

Zuckerkit is a wrapper around the Facebook SDK that makes common tasks easy. Things you can do:


Open session with basic info

``` objective-c
- (void)openSessionWithBasicInfo:(void(^)( NSError *error))completionBlock;
```

Request publish permissions

``` objective-c
- (void)requestPublishPermissions:(void(^)( NSError *error))completionBlock;
```

Get user info (name, email, id, etc)

``` objective-c
- (void)getUserInfo:(void(^)(id<FBGraphUser> user, NSError *error))completionBlock;
```

Open session with basic info then request publish permissions (Facebook mandates that you open a session with read permissions before requesting publish permissions. This sequences both for you.)

``` objective-c
- (void)openSessionWithBasicInfoThenRequestPublishPermissions:(void(^)(NSError *error))completionBlock;
```

Get friends
	
``` objective-c
- (void)getFriends:(void(^)(NSArray *friends, NSError *error))completionBlock;
```

Get app audience type (The visibility for the app, i.e Public, Friends, Only Me)

``` objective-c
- (void)getAppAudienceType:(void(^)(FacebookAudienceType audienceType, NSError *error))completionBlock;
```

Invite friend to app via request dialogue (sends a request to a friend to join the current app)
	
``` objective-c
- (void)showAppRequestDialogueWithMessage:(NSString*)message toUserId:(NSString*)userId;
```

#Usage
1. Create a dictionary entry in your app plist called Zuckerkit with the following format:

	Zuckerkit: (Dictionary)
	 - Production (Boolean)
	 - Development Keys (Dictionary)
	   - id (String)
	   - name (String)
	 - Production Keys (Dictionary)
	   - id (String)
	   - name (String)
	   
2. Also, as part of the normal FacebookSDK integration, register your Facebook App Id in your app's URL schemes:
	  
	  URL types: (Array)
 	  - Item 0 (Dictionary)
    	- URL Schemes (Array)
    		- Item 0 (String, set equal to your Facebook App Id)
    		
	   
3. In your AppDelegate.m, implement the following methods (or add to them if they already exist):

	``` objective-c
	- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
	   sourceApplication:(NSString *)sourceApplication annotation:(id)annotation
	{	
	    if([url.absoluteString rangeOfString:@"fb"].location != NSNotFound) {
	        return [[Zuckerkit sharedInstance] handleOpenUrl:url];
	    }
	    return NO;
	}
	
	- (void)applicationDidBecomeActive:(UIApplication *)application
	{
	    [[Zuckerkit sharedInstance] handleDidBecomeActive];
	}
	```


#Contribution
I've added methods to this kit as I've needed them, and haven't yet crossed path with all parts of the SDK. If you're familiar with various parts of the SDK and know of some methods that may be helpful, please feel free to contribute.