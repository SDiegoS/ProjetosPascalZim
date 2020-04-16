program Diego_Diogo;
uses crt;

type tipo_inf = string;
		 tipo_inf2 = real;

    ptuf = ^municipios;
    municipios = record {lista de municípios;}
     	municipio: tipo_inf;
     	populacao,area:tipo_inf2;
     	proxuf,antuf:ptuf;
    end;

    ptnodo = ^elemento;
    elemento = record
      sigla_uf,descricao:tipo_inf;
      ante,prox:ptnodo;
      muni,munf:ptuf;
    end;


var li_estado,lf_estado:ptnodo;
    sigla,descri:tipo_inf;
    popu,area:tipo_inf2;
    op,cond:integer;




//Criar Lista		
		
Procedure Cria_Lista(Var listai,listaf:ptnodo);
Begin
	listai:=Nil;
	listaf:=Nil;
End;

//Procedimento Leitura
Procedure leitura(var inf,inf2:tipo_inf);

begin
    clrscr;
    write ('Digite a Sigla do Estado: ');
    readln (inf);
    write('Digite o Nome por Extenso: ');
    readln (inf2);
end;

//Procedimento para Incluir na Lista
Procedure inclui_lista (Var listai,listaf:ptnodo;inf,inf2:tipo_inf);
var aux,ant,aux2,auxl:ptnodo;

Begin
   new(aux);
   if aux=nil then
      writeln('Memoria cheia')
   else
      Begin
      	auxl:=listai;
        aux2:=listai;
        ant:=listai;
        aux^.sigla_uf:=inf;
        aux^.descricao:=inf2;
        aux^.muni:=nil;
        aux^.munf:=nil;
        while (auxl^.prox <> nil) and (auxl^.sigla_uf<> inf) do
        	auxl:=auxl^.prox;
        if auxl^.sigla_uf=inf then 
        	writeln('Estado Já Cadastrado')
        else   
        begin
					if listai=nil then begin
          	aux^.prox:=nil;
            aux^.ante:=nil;
            listai:=aux;
            listaf:=aux;
         	end
         	else
	     	 		begin
            	while (aux2^.sigla_uf<inf) and (aux2^.prox <> nil) do begin
              	ant:=aux2;
              	aux2:=aux2^.prox;
            	end;
            	if (listai^.sigla_uf>inf) or (listai=nil) then begin{Inlcui inicio}
            		aux^.prox:=listai;
              	aux^.ante:=nil;
              	listai^.ante:=aux;
              	listai:=aux;
            	end
            	else
            	if (aux2^.sigla_uf<inf) and (aux2^.prox=nil) then begin{Inclui Fim}
            		aux^.prox:=nil;
              	aux^.ante:=aux2;
              	aux2^.prox:=aux;
              	listaf:=aux;
            	end
            	else begin {Inclui Meio}
            		aux^.prox:=aux2;
              	aux^.ante:=ant;
              	aux2^.ante:=aux;
              	ant^.prox:=aux;
          		end;
          	end;	
       	end;
  		end;
  writeln ('');	     
  writeln('Clique para Sair');     
  readkey;
End;

//Procedimento para Incluir Município
Procedure Inclui_municipio (Var listai:ptnodo);
var aux_uf,aux2,aux3,ant,aux:ptuf;
    auxl,auxl2: ptnodo;
    inf,inf2:tipo_inf;
    inf3,inf4:tipo_inf2;

begin
	clrscr;
  new(aux_uf);
  if aux_uf=nil then begin
     writeln('Memoria cheia')
  end
  else
     Begin
        if listai = nil then 
          writeln('Lista de Estado está vazia')
        else begin
  	   		write('Digite a Sigla do Estado: ');
   				readln (inf);
        	auxl:=listai;
        	auxl2:=listai;
        	aux:=auxl2^.muni;
        	while (auxl^.prox <> nil) and (auxl^.sigla_uf<> inf) do
             auxl:=auxl^.prox;
          if auxl^.sigla_uf<>inf then 
            writeln('Estado não cadastrado')
          else begin
         		write('Digite o Municipio: ');
    				readln (inf2);
    				write('Digite a População: ');
    				readln (inf3);
    				write('Digite a Área: ');
    				readln (inf4);
    				while (aux^.proxuf <> nil) and (aux^.municipio <> inf2) do
             	aux:=aux^.proxuf;
          	if aux^.municipio=inf2 then
          		writeln('Município Já Cadastrado')
						else
						begin		
        	    aux2:=auxl2^.muni;
              aux3:=auxl2^.muni;
			        aux_uf^.municipio:=inf2;
			   	    aux_uf^.populacao:=inf3;
			 		    aux_uf^.area:=inf4;
				 		 	if auxl2^.muni=nil then begin
								auxl2^.muni:=aux_uf;
								auxl2^.munf:=aux_uf;
             		aux_uf^.proxuf:=nil;
             		aux_uf^.antuf:=nil;
         	   	end
         			else
	     	 				begin  
            			while (aux2^.municipio<inf2) and (aux2^.proxuf <> nil) do begin
               			ant:=aux2;
               			aux2:=aux2^.proxuf;
            			end;
            			if (aux3^.municipio>inf2) or (auxl2^.muni=nil) then begin{Inlcui inicio}
										aux_uf^.proxuf:=aux2;
										aux_uf^.antuf:=nil;
										aux2^.antuf:=aux_uf;
										auxl2^.muni:=aux_uf;
            			end
            			else if (aux2^.municipio<inf2) and (aux2^.proxuf=nil) then begin{Inclui Fim}
                 		aux_uf^.proxuf:=nil;
                 		aux_uf^.antuf:=aux2;
                 		aux2^.proxuf:=aux_uf;
                 		auxl2^.munf:=aux_uf;
             			end
             			else begin {Inclui Meio}
                    aux_uf^.proxuf:=aux2;
                    aux_uf^.antuf:=ant;
                    aux2^.antuf:=aux_uf;
                    ant^.proxuf:=aux_uf;
                  end;
       					end;
       			end;	
          end;
        end;
     End;
	writeln ('');	     
  writeln('Clique para Sair');     
  readkey;
end;

//Procedimento para Escrever a Lista de Estado e Município
procedure escreve_lista (var listai:ptnodo);
var aux:ptnodo;
		auxl,auxl2:ptuf;

begin 
	clrscr;
	aux:=listai;
	if aux= nil then
		begin
			writeln ('Lista de Estado e Municipio está vazia.');
		end
	else
	while aux <> nil do
		begin
			writeln ('<---------------------------------------------->');
			writeln ('');
			writeln('Estado:',aux^.descricao,'  ','UF:',aux^.sigla_uf,'.');
			writeln('');
			writeln('Lista Inicial:');
			auxl:=aux^.muni;
  	  if auxl=nil then
  	  	begin	
					writeln ('Lista de Municipio está vazia');
					writeln ('');
				end	
			else begin
				while auxl <> nil do
	 			begin
	 			  writeln('');
					writeln ('Município:',auxl^.municipio,'.');
					writeln ('População:',auxl^.populacao:0:0,'.');
					writeln ('Área:',auxl^.area:0:0,'.');
					writeln('');
					auxl:=auxl^.proxuf;
				end;		
			end;
			auxl2:=aux^.munf;
			writeln('');
			writeln('Lista Final:');
  	  if auxl2=nil then
  	  	begin	
					writeln ('Lista de Municipio está vazia');
					writeln ('');
				end	
			else begin
				while auxl2 <> nil do
	 			begin
	 			  writeln('');
					writeln ('Município:',auxl2^.municipio,'.');
					writeln ('População:',auxl2^.populacao:0:0,'.');
					writeln ('Área:',auxl2^.area:0:0,'.');
					writeln('');
					auxl2:=auxl2^.antuf;
				end;		
			end;	
			aux:=aux^.prox;
		end;
	writeln ('<---------------------------------------------->');	
	writeln ('');		
	writeln('Clique para Sair');	
	readkey;	
end;

//Procedimento para Escrever o Estado
procedure escreve_estado (var listai,listaf:ptnodo);
var aux,aux2:ptnodo;

begin 
	clrscr;
	aux:=listai;
	aux2:=listaf;
	if aux= nil then
		begin
			writeln ('Lista de Estado e Municipio está vazia.');
		end
	else
	writeln ('<---------------------------------------------->');
	writeln('Lista Inicial:');
	while aux <> nil do
		begin
			
			writeln ('');
			writeln('Estado:',aux^.descricao,'  ','UF:',aux^.sigla_uf,'.');
			writeln('');
      aux:=aux^.prox;
		end;
	writeln ('<---------------------------------------------->');
	writeln('Lista Final:');	
	while aux2 <> nil do
		begin
			writeln ('');
			writeln('Estado:',aux2^.descricao,'  ','UF:',aux2^.sigla_uf,'.');
			writeln('');
      aux2:=aux2^.ante;
		end;
	writeln ('<---------------------------------------------->');	
	writeln ('');		
	writeln('Clique para Sair');	
	readkey;	
end;

//Procedimento para Escrever o Estado e a Lista de Município
procedure escreve (var listai:ptnodo);
var aux:ptnodo;
		auxl,auxl2:ptuf;
		inf:string;

begin 
	clrscr;
	aux:=listai;
	if aux= nil then
		begin
			writeln ('Lista de Estado e Municipio está vazia.');
		end
	else
		Begin
      if listai = nil then 
        writeln('Lista de Estado está vazia')
      else begin
  	  	write('Digite a Sigla do Estado: ');
   			readln (inf);
       	while (aux^.prox <> nil) and (aux^.sigla_uf<> inf) do
           aux:=aux^.prox;
        if aux^.sigla_uf<>inf then 
          writeln('Estado não cadastrado')
        else begin
					writeln ('<---------------------------------------------->');
					writeln ('');
					writeln('Estado:',aux^.descricao,'  ','UF:',aux^.sigla_uf,'.');
					writeln('');
					writeln('Lista Inicial:');
					auxl:=aux^.muni;
  			  if auxl=nil then
  	  			begin	
							writeln ('Lista de Municipio está vazia');
							writeln ('');
						end	
					else begin
						while auxl <> nil do
	 						begin
	 						  writeln('');
								writeln ('Município:',auxl^.municipio,'.');
								writeln ('População:',auxl^.populacao:0:0,'.');
								writeln ('Área:',auxl^.area:0:0,'.');
								writeln('');
								auxl:=auxl^.proxuf;
							end;		
					end;
					auxl2:=aux^.munf;
					writeln('');
					writeln('Lista Final:');
  			  if auxl2=nil then
  	  			begin	
							writeln ('Lista de Municipio está vazia');
							writeln ()
						end	
					else begin
						while auxl2 <> nil do
	 						begin
	 						  writeln('');
								writeln ('Município:',auxl2^.municipio,'.');
								writeln ('População:',auxl2^.populacao:0:0,'.');
								writeln ('Área:',auxl2^.area:0:0,'.');
								writeln('');
								auxl2:=auxl2^.antuf;
							end;		
					end;	
					aux:=aux^.prox;
				end;
			end;
		end;			
	writeln ('<---------------------------------------------->');
	writeln ('');		
	writeln('Clique para Sair');	
	readkey;	
end;

//Procedimento para Remover Estado
procedure remove_lista (var listai,listaf:ptnodo);
var aux,auxl,ant:ptnodo;
		inf:tipo_inf;

begin
  clrscr;
		if listai=Nil then
		writeln('Lista Vazia')  
	else 
		begin
	  	writeln('Digite a Sigla do Estado que Deseja Remover:');
			readln(inf);
      aux:=listai;
      while (aux^.prox <> nil) and (aux^.sigla_uf<> inf) do
      begin
        ant:=aux;
				aux:=aux^.prox;			
			end;
      if aux^.sigla_uf<>inf then
      	begin
					writeln ('');	
      		writeln('Não cadastrado')
      	end	
      else	
      	begin
					if aux=listai then //Exclui Inicio
      			begin
							listai:=listai^.prox;
							listai^.ante:=nil;
							dispose(aux);
							writeln ('');	
							writeln('Removido');
						end
					else if aux^.prox = nil then //Exclui Fim
						begin
							ant^.prox:=nil;
							listaf:=ant;
							dispose(aux);
							writeln ('');	
							writeln('Removido');
						end
					else  //Exclui meio
					  begin
					  	ant^.prox:=aux^.prox;
					  	auxl:=aux^.prox;
					  	auxl^.ante:=ant;
							dispose(aux);
							writeln ('');	
							writeln('Removido');																												    
					  end;		
				end;         				 	
		end;
	writeln ('');	
	writeln('Clique para Sair');		
	readkey;	           
end;
	
//Procedimento para Remover Município						
procedure remove_municipio (var listai:ptnodo);
var aux:ptnodo;
		auxl,auxm,aux2,auxp:ptuf;
		inf,inf2:tipo_inf; 
		i:integer;

begin
  clrscr;
		if listai=Nil then
		writeln('Lista Vazia')  
	else 
		begin
	  	writeln('Digite o Sigla do Estado:');
			readln(inf);
      aux:=listai;
      while (aux^.prox <> nil) and (aux^.sigla_uf<> inf) do
      	aux:=aux^.prox;
      	if (aux^.sigla_uf<>inf) then 
        	writeln('Estado não cadastrado')
        else
	      	begin
	      	  aux2:=aux^.muni;
						writeln('Digite o nome do Município:'); 
						readln(inf2);
						auxl:=aux^.muni;
  	  			if auxl=nil then
							writeln ('Lista de Município está vazia')
						else 
							begin                                                    
								while (auxl^.proxuf<>nil) and (auxl^.municipio<>inf2) do
									begin
										auxm:=auxl;
  				    			auxl:=auxl^.proxuf;
  				    			auxp:=auxl^.proxuf;
  				    		end;	
  				    	if auxl^.municipio<>inf2 then
									writeln	('Município não Cadastrado.')
								else
									begin
										if aux2^.municipio=inf2 then //Exclui Inicio
											begin
												if auxl^.proxuf = nil then
													begin
														aux^.muni:=nil;
														aux^.munf:=nil;
														writeln ('');
														writeln('Município Removido');
													end	
												else 
													begin
														auxp:=aux2^.proxuf;
														auxp^.antuf:=nil;
														aux^.muni:=auxp;
														dispose(auxl);
														writeln ('');
        										writeln('Município Removido');
        									end;	
        							end
										else if auxl^.proxuf = nil then //Exclui Fim
											begin
												auxm^.proxuf:=nil;
												aux^.munf:=auxm;
												dispose(auxl);
												writeln ('');
												writeln('Município Removido');
											end
										else
											begin  //Exclui Meio
					  						auxm^.proxuf:=auxp;
					  						auxp^.antuf:=auxm;
												dispose(auxl);
												writeln ('');
												writeln('Município Removido');																												    
					  					end;
									end;					
        			end;
					end;
		end;
	writeln ('');	
	writeln('Clique para Sair');		
	readkey;	
end;
	      
//Procedimento Menu

Procedure menu(var op:integer);
begin
  clrscr;
  writeln('|-----------------------------|');
  writeln('|(1) Cadastrar Estado         |');
  writeln('|-----------------------------|');
  writeln('|(2) Cadastrar Município      | ');
  writeln('|-----------------------------|');
  writeln('|(3) Listar Total             |');
  writeln('|-----------------------------|');
  writeln('|(4) Listar Estados           |');
  writeln('|-----------------------------|');
  writeln('|(5) Listar Estado/Municpios  |');
  writeln('|-----------------------------|');
  writeln('|(6) Remover Estado           |');
  writeln('|-----------------------------|');
  writeln('|(7) Remover Município        |');
  writeln('|-----------------------------|');
	writeln('|(8) Sair                     |');
	writeln('|-----------------------------|');
	writeln(''); 
  write(' Escolha: ');
  readln(op); 
end;

//Procedimento Sair 

Procedure sair(var cond : integer);
begin
  cond := 1; 
end;

// Programa Principal
begin
  Cria_Lista(li_estado,lf_estado);
	cond := 0;
  while cond=0 do 
	begin
		clrscr;
		menu(op);
		if op=1 then
			begin
				leitura (sigla,descri);
				inclui_lista(li_estado,lf_estado,sigla,descri);
			end	
		else if op=2 then	
				inclui_municipio(li_estado)
		else if op=3 then
      escreve_lista(li_estado)
    else if op=4 then
			escreve_estado(li_estado,lf_estado)
		else if op=5 then
			escreve (li_estado)  
		else if op=6 then
			remove_lista (li_estado,lf_estado)
		else if op=7 then
			remove_municipio(li_estado)
		else if op=8 then
		  sair(cond);
	end;
	writeln('Clique para Sair');
	readkey;
End.	