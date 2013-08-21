#import "Zuckerkeys.h"

static NSString *rootKey = @"Zuckerkit";

NSDictionary *rootDictionary()
{
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:rootKey];
}

NSString *ModeKey()
{
    BOOL isProduction = [[rootDictionary() objectForKey:@"Production"] boolValue];
    return isProduction ? @"Production" : @"Development";
}

BOOL isProduction()
{
    return [ModeKey() isEqualToString:@"Production"];
}

NSString *FacebookAppId()
{
    return rootDictionary()[@"Facebook"][ModeKey()][@"id"];
}

NSString *FacebookDisplayName()
{
    return rootDictionary()[@"Facebook"][ModeKey()][@"name"];
}
