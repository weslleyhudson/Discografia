//
//  Conexao.m
//  Discografia
//
//  Created by Weslley Hudson on 09/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Conexao.h"


@implementation Conexao

-(sqlite3 *) getDatabase {
	sqlite3 *database;
	NSString *path = [[NSBundle mainBundle] pathForResource:@"Discografia" ofType:@"sqlite"];
	if (sqlite3_open([path UTF8String], &database) == SQLITE_OK)  {
		return database;
	}
	return nil;
}

@end
