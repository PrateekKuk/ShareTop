//
//  Profile.h
//  ShareTop
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class Friends, Game;

@interface Profile : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * fullName;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSSet *profileToFriends;
@property (nonatomic, retain) NSSet *profileToGame;
@end

@interface Profile (CoreDataGeneratedAccessors)

- (void)addProfileToFriendsObject:(Friends *)value;
- (void)removeProfileToFriendsObject:(Friends *)value;
- (void)addProfileToFriends:(NSSet *)values;
- (void)removeProfileToFriends:(NSSet *)values;

- (void)addProfileToGameObject:(Game *)value;
- (void)removeProfileToGameObject:(Game *)value;
- (void)addProfileToGame:(NSSet *)values;
- (void)removeProfileToGame:(NSSet *)values;

@end
