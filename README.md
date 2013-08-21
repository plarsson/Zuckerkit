#Zuckerkit

Zuckerkit is a wrapper around the SDK that makes common tasks easy. Things you can do:

``` objective-c
- (void)openSessionWithBasicInfo:(void(^)( NSError *error))completionBlock;
- (void)requestPublishPermissions:(void(^)( NSError *error))completionBlock;
- (void)getUserInfo:(void(^)(id<FBGraphUser> user, NSError *error))completionBlock;
- (void)openSessionWithBasicInfoThenRequestPublishPermissions:(void(^)(NSError *error))completionBlock;
- (void)openSessionWithBasicInfoThenRequestPublishPermissionsAndGetAudienceType:(void(^)(NSError *error, FacebookAudienceType))completionBlock;

- (void)getFriends:(void(^)(NSArray *friends, NSError *error))completionBlock;
- (void)getAppAudienceType:(void(^)(FacebookAudienceType audienceType, NSError *error))completionBlock;
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
	   
Also, as part of the normal FacebookSDK integration, register your Facebook App Id in your app's URL schemes:
	   
	URL types: (Array)
    	- Item 0 (Dictionary)
    		- URL Schemes (Array)
    			- Item 0 (String, set equal to your Facebook App Id)
	   
In your AppDelegate.m, implement the following methods (or add to them if they already exist):

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
I've added methods to this kit as I needed them, and I haven't yet crossed path with all parts of the SDK. If you're familiar with various parts of the SDK and know of some methods that may be helpful, please feel free to contribute.