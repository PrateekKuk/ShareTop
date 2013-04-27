//
//  Friends.h
//  ShareTop
//
//  Created by Prateek Kukreja on 4/27/13.
//  Copyright (c) 2013 Prateek Kukreja. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Friends : NSManagedObject

@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSNumber * id;
@property (nonatomic, retain) NSManagedObject *friendsToProfile;

@end
