//
//  Musicas.m
//  Discografia
//
//  Created by Weslley Hudson on 09/03/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Musicas.h"
#import "Conexao.h"


@implementation Musicas

@synthesize idMusica;
@synthesize nomeMusica, letraMusica, cifraMusica;

//Método que busca todas as músicas
+(NSMutableArray*) getAllMusicas {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *db = [c getDatabase];
	[c release];
	
	NSMutableArray *todasMusicas = [[NSMutableArray alloc] init];
	
	if (db != nil) {
		
		const char *consultaSql = "SELECT idMusica, nomeMusica FROM musicas ORDER BY nomeMusica ASC";
		sqlite3_stmt *consultaCompilada;
			
		if (sqlite3_prepare_v2(db, consultaSql, -1, &consultaCompilada, NULL)  == SQLITE_OK) {
			
			Musicas *mus = nil;
			
			while (sqlite3_step(consultaCompilada) == SQLITE_ROW) {
				
				int *musicaIdAux = (int *) sqlite3_column_int(consultaCompilada, 0);
				NSString *nomeMusicaAux = [NSString stringWithUTF8String:(char *) sqlite3_column_text(consultaCompilada, 1)];
				
				mus = [[Musicas alloc] init];
				
				[mus setIdMusica:musicaIdAux];
				[mus setNomeMusica:nomeMusicaAux];
				
				[todasMusicas addObject:mus];
				
			}
		
		}
		sqlite3_finalize(consultaCompilada);
		sqlite3_close(db);
	}
	
	return todasMusicas;
	
}

//Método que busca uma música pelo ID
+(Musicas*) getMusicasWithIdMusica: (int*) idMusicaAux {
	
	Conexao *c = [[Conexao alloc] init];
	sqlite3 *db = [c getDatabase];
	[c release];
	
	Musicas *musicaEscolhida = nil;
	
	if (db != nil) {
		
		const char *consultaSql = "SELECT idMusica, nomeMusica, letraMusica FROM musicas WHERE idMusica = ?";
		
		sqlite3_stmt *consultaCompilada;
		
		if (sqlite3_prepare_v2(db, consultaSql, -1, &consultaCompilada, NULL)  == SQLITE_OK) {
			
			sqlite3_bind_int(consultaCompilada, 1, (int) idMusicaAux);
			
			while (sqlite3_step(consultaCompilada) == SQLITE_ROW) {
				
				int *musicaIdAux = (int *) sqlite3_column_int(consultaCompilada, 0);
				NSString *nomeMusicaAux = [NSString stringWithUTF8String:(char *) sqlite3_column_text(consultaCompilada, 1)];
				NSString *letraMusicaAux = [NSString stringWithUTF8String:(char *) sqlite3_column_text(consultaCompilada, 2)];
				
				musicaEscolhida = [[Musicas alloc] init];
				
				[musicaEscolhida setIdMusica:musicaIdAux];
				[musicaEscolhida setNomeMusica:nomeMusicaAux];
				[musicaEscolhida setLetraMusica:letraMusicaAux];
				
			}
			
		}
		sqlite3_finalize(consultaCompilada);
		sqlite3_close(db);
	}
	
	return musicaEscolhida;
	
	
}

@end
