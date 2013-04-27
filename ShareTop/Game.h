//
//  Game.h
//  ShareTop
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Game : NSManagedObject

@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * status;
@property (nonatomic, retain) NSString * gameDescript;
@property (nonatomic, retain) NSString * system;
@property (nonatomic, retain) NSNumber * currentId;
@property (nonatomic, retain) NSManagedObject *gameToProfile;

@end
