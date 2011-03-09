//
//  LetraViewController.h
//  Discografia
//
//  Created by Weslley Hudson on 09/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Musicas;


@interface LetraViewController : UIViewController {
	
	Musicas *musicaEscolhida;
	
	IBOutlet UITextView *letraTxt;
}

@property (nonatomic, retain) UITextView *letraTxt;

@end
