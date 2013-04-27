//
//  AppDelegate.m
//  ShareTop
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import "AppDelegate.h"
#import "Profile.h"
#import "Game.h"
#import "Friends.h"

@implementation AppDelegate

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

Profile *CurrProfile;


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
 //   [self create];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

- (void)saveContext
{
    NSError *error = nil;
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
             // Replace this implementation with code to handle the error appropriately.
             // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        } 
    }
}

#pragma mark - Core Data stack

// Returns the managed object context for the application.
// If the context doesn't already exist, it is created and bound to the persistent store coordinator for the application.
- (NSManagedObjectContext *)managedObjectContext
{
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (coordinator != nil) {
        _managedObjectContext = [[NSManagedObjectContext alloc] init];
        [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    }
    return _managedObjectContext;
}

// Returns the managed object model for the application.
// If the model doesn't already exist, it is created from the application's model.
- (NSManagedObjectModel *)managedObjectModel
{
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"ShareTop" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

// Returns the persistent store coordinator for the application.
// If the coordinator doesn't already exist, it is created and the application's store added to it.
- (NSPersistentStoreCoordinator *)persistentStoreCoordinator
{
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"ShareTop.sqlite"];
    
    NSError *error = nil;
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        /*
         Replace this implementation with code to handle the error appropriately.
         
         abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development. 
         
         Typical reasons for an error here include:
         * The persistent store is not accessible;
         * The schema for the persistent store is incompatible with current managed object model.
         Check the error message to determine what the actual problem was.
         
         
         If the persistent store is not accessible, there is typically something wrong with the file path. Often, a file URL is pointing into the application's resources directory instead of a writeable directory.
         
         If you encounter schema incompatibility errors during development, you can reduce their frequency by:
         * Simply deleting the existing store:
         [[NSFileManager defaultManager] removeItemAtURL:storeURL error:nil]
         
         * Performing automatic lightweight migration by passing the following dictionary as the options parameter:
         @{NSMigratePersistentStoresAutomaticallyOption:@YES, NSInferMappingModelAutomaticallyOption:@YES}
         
         Lightweight migration will only work for a limited set of schema changes; consult "Core Data Model Versioning and Data Migration Programming Guide" for details.
         
         */
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }    
    
    return _persistentStoreCoordinator;
}

#pragma mark - Application's Documents directory

// Returns the URL to the application's Documents directory.
- (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (void) create {
    // Grab the context
    NSManagedObjectContext *context = [self managedObjectContext];
    
    // Grab the Label entity
    Profile *profile = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
    
    // Set label name
    profile.fullName = @"Bob Stevens";
    
    // Set User name
    profile.userName = @"bstevens";
    
    
    
    // Set the user id numnber
    NSNumber *userId  = [[NSNumber alloc]initWithInt:1];
    profile.id = userId;
    
    // Grab the Label entity
    Profile *profile2 = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
    
    // Set label name
    profile2.fullName = @"Jon Wall";
    
    // Set User name
    profile2.userName = @"jwall";
    
    // Set the user id numnber
    NSNumber *userId2  = [[NSNumber alloc]initWithInt:2];
    profile2.id = userId;
    
    // Grab the Label entity
    Profile *profile3 = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
    
    // Set label name
    profile3.fullName = @"John Doe";
    
    // Set User name
    profile3.userName = @"jdoe";
    
    // Set the user id numnber
    NSNumber *userId3  = [[NSNumber alloc]initWithInt:3];
    profile3.id = userId3;
    // Grab the Label entity
   
    Profile *profile4 = [NSEntityDescription insertNewObjectForEntityForName:@"Profile" inManagedObjectContext:context];
    
    // Set label name
    profile4.fullName = @"Mike Smith";
    
    // Set User name
    profile4.userName = @"msmith";
    
    // Set the user id numnber
    NSNumber *userId4  = [[NSNumber alloc]initWithInt:4];
    profile4.id = userId4;
    
    
    
    //Create Friend
    Friends *friend = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:context];
    friend.id = userId;
    friend.userName = @"bstevens";
    
    //Create Friend
    Friends *friend2 = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:context];
    friend2.id = userId2;
    friend2.userName = @"jwall";
    //Create Friend
    Friends *friend3 = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:context];
    friend3.id = userId3;
    friend3.userName = @"jdoe";
    
    //Create Friend
    Friends *friend4 = [NSEntityDescription insertNewObjectForEntityForName:@"Friends" inManagedObjectContext:context];
    friend4.id = userId4;
    friend4.userName = @"msmith";
    
    
    //Games Time!!!
    Game *halo = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    halo.status = @"available";
    halo.gameDescript = @"First Person Shooter";
    NSNumber *gameId1  = [[NSNumber alloc]initWithInt:1];
    halo.id = gameId1;
    halo.system = @"xbox";
    
    Game *cod = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    cod.status = @"available";
    cod.gameDescript = @"First Person Shooter";
    NSNumber *gameId2  = [[NSNumber alloc]initWithInt:2];
    cod.id = gameId2;
    cod.system = @"xbox";
    
    Game *madden = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    madden.status = @"borrowed";
    madden.gameDescript = @"Sports Game";
    NSNumber *gameId3  = [[NSNumber alloc]initWithInt:3];
    madden.id = gameId3;
    madden.system = @"ps3";
    
    Game *pong = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    pong.status = @"available";
    pong.gameDescript = @"old school game";
    NSNumber *gameId4  = [[NSNumber alloc]initWithInt:4];
    pong.id = gameId4;
    pong.system = @"ps3";
    
    Game *fifa = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    fifa.status = @"notAvailable";
    fifa.gameDescript = @"sports game";
    NSNumber *gameId5  = [[NSNumber alloc]initWithInt:5];
    fifa.id = gameId5;
    fifa.system = @"ps3";
    
    Game *uncharted = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    uncharted.status = @"available";
    uncharted.gameDescript = @"adventure game";
    NSNumber *gameId6  = [[NSNumber alloc]initWithInt:6];
    uncharted.id = gameId6;
    uncharted.system = @"ps3";
    
    Game *coolBoarders= [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    coolBoarders.status = @"available";
    coolBoarders.gameDescript = @"Snowboarding game";
    NSNumber *gameId7  = [[NSNumber alloc]initWithInt:7];
    coolBoarders.id = gameId7;
    coolBoarders.system = @"ps2";
    
    Game *marioKart = [NSEntityDescription insertNewObjectForEntityForName:@"Game" inManagedObjectContext:context];
    marioKart.status = @"available";
    marioKart.gameDescript = @"racing game";
    NSNumber *gameId8  = [[NSNumber alloc]initWithInt:8];
    marioKart.id = gameId8;
    marioKart.system = @"n64";
    
    // Set relationships
    [profile addProfileToGameObject:uncharted];
    [profile addProfileToGameObject:fifa];
    [profile addProfileToGameObject:pong];
    [profile2 addProfileToGameObject:madden];
    [profile2 addProfileToGameObject:cod];
    [profile2 addProfileToGameObject:halo];
    [profile3 addProfileToGameObject:marioKart];
    [profile4 addProfileToGameObject:coolBoarders];
    
    [profile addProfileToFriendsObject:friend2];
    [profile2 addProfileToFriendsObject:friend];
    [profile2 addProfileToFriendsObject:friend3];
    [profile2 addProfileToFriendsObject:friend4];
    [profile3 addProfileToFriendsObject:friend2];
    [profile4 addProfileToFriendsObject:friend2];

    
    // Save everything
    NSError *error = nil;
    if ([context save:&error]) {
        NSLog(@"The save was successful!");
    } else {
        NSLog(@"The save wasn't successful: %@", [error userInfo]);
    }
}

- (int )getCurrentUserId
{
    return 1;
}

@end
