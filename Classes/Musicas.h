//
//  Musicas.h
//  Discografia
//
//  Created by Weslley Hudson on 09/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Musicas : NSObject {
	int *idMusica;
	NSString *nomeMusica;
	NSString *letraMusica;
	NSString *cifraMusica;
	

}

@property (nonatomic, assign) int *idMusica;
@property (nonatomic, retain) NSString *nomeMusica, *letraMusica, *cifraMusica;

//Método que busca todas as músicas
+(NSMutableArray*) getAllMusicas;

//Método que busca uma música pelo ID
+(Musicas*) getMusicasWithIdMusica: (int*) idMusicaAux;

@end
