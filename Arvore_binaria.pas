program Arv;
  type apontador =^nodo;
   nodo =record 
      item :integer;            
      esq,dir: apontador;
    end;
var
 item,dado,contar,alturatotal:integer;
 op,num,alta,compara,conta,contador:integer;
 p,arv:apontador;

 var sMensagem: string;        
		 
// -----------------------------------------------------  
 
 procedure Inicia(var arvore:apontador);
    begin
      arvore:=nil;
    end;

//----------------------------------------------------
 
procedure Insere (x:integer;var p:apontador);
 
begin
	sMensagem := '';
	if(p=nil)then
  	begin
    	new(p);
    	p^.item:=x;
    	p^.esq:=nil;
    	p^.dir:=nil;
    end
    else if(x<p^.item) then
    	insere(x,p^.esq)
    else if(x>p^.item)then
      insere(x,p^.dir)
    else
    begin
     sMensagem:= 'O ITEM JÁ EXISTE';
		 write(sMensagem);
		end;
end;

//-----------------------------------------------------

procedure antecessor(q:apontador; var r:apontador);
begin
	if(r^.dir<>nil)then
    antecessor(q,r^.dir)
  else begin
   	q^.item:=r^.item;
    q:=r;
    r:=r^.esq;
  	dispose(q);
  end;
end;

//-----------------------------------------------------

procedure retira(x:integer;var p:apontador);
 var aux:apontador;

begin
	if(p=nil)then
  writeln('REGISTRO INEXISTENTE')
  else if(x<p^.item)then
  	retira(x,p^.esq)
  else if(x>p^.item)then
  	retira(x,p^.dir)
  else if(p^.dir=nil)then
  	begin
    	aux:=p;
      p:=p^.esq;
      dispose(aux);
      writeln('Removido!!');
    end                    
  else if(p^.esq=nil)then
  	begin
  	 	aux:=p;
      p:=p^.dir;
      dispose(aux);
      writeln('Removido!!');
    end 
  else antecessor(p,p^.esq);
end; 
//----------------------------------------------------------------------
   procedure preordem(var p:apontador);
     Begin
		if(p<>nil)then 	
			Begin
			 write('',p^.item,',');
			 preordem(p^.esq);
			 preordem(p^.dir);
			end;
     end;	
//----------------------------------------------------------------------

  procedure posordem(var p:apontador);
     Begin
      if(p<>nil)then
        begin 
           posordem(p^.esq);
           posordem(p^.dir);
           write('',p^.item,',');
        end;
     
     end;  
//---------------------------------------------------------------------- 
    
procedure inordem(var p:apontador);
Begin
    if (p<>nil) then
      Begin
        inordem(p^.esq);
        write('',p^.item,',');
        inordem(p^.dir);
      end;
end;
		
//----------------------------------------------------------------------

procedure altura(var p:apontador; aux: integer; alt:integer);
                                  
begin
   if (p^.esq = nil) and (p^.dir = nil) then
   begin
    if aux > alt then
      begin
         alt := aux;
      end;
      aux:= 0;
      alturatotal:=alt;
   end
   else
   begin
      aux:= aux + 1;
      if p^.esq <> nil then
      begin
         altura(p^.esq,aux,alt);
      end
			else if p^.dir <> nil then
      begin
         altura(p^.dir,aux,alt);
      end;
   end;
end;
//----------------------------------------------------------------------
procedure nivel_elemento(p: apontador;var dado: integer; nivel: integer);

begin	
   if dado = p^.item then
   begin
      writeln;
      writeln;
      writeln('*   O elemento ',dado,' está no nível ',nivel);
   end
   else
   begin
      nivel:= nivel + 1;
      if dado < p^.item then
      begin
         nivel_elemento(p^.esq,dado,nivel);
      end
      else
      begin
         nivel_elemento(p^.dir,dado,nivel);
      end;
   end;
end;
//----------------------------------------------------------------------

procedure mostra_folha(p: apontador; var cont: integer);
{procedimento que verifica se folha, mostra as mesmas e caminha na arvore}
begin
   if (p^.esq = nil) and (p^.dir = nil) then
   begin
      write(p^.item,' ');
      cont:= cont + 1;
      contador:=cont;
   end                
   else               
   if p^.esq <> nil then     
   begin
      mostra_folha(p^.esq,cont);
   end;

   if p^.dir <> nil then
   begin
      mostra_folha(p^.dir,cont);
   end;
end;
//----------------------------------------------------------------------
function conta_nos(tree: apontador; var cont: integer):integer;

begin
   if tree <> nil then
   begin
      cont:= cont + 1;
      conta_nos:=conta_nos(tree^.esq,cont);
      conta_nos:=conta_nos(tree^.dir,cont);
      conta_nos:= cont;
   end;
end;
//----------------------------------------------------------------------

procedure completa(p:apontador ; qtd: integer; alt: integer);
var expo: real;
    x: real;

begin
   alta:= 0;
   compara:= 0;
   expo:= 0;

   altura(p,alta,compara);   
   alt:= alturatotal;
   qtd:= conta_nos(p, conta);

   expo:= Round(Exp((alt+1) * Ln(2)) - 1);              


   if  (expo = qtd) then
   begin
      writeln('Arvore Completa !!!');
   end
   else
   begin
      writeln('Arvore Incompleta!!!');
   end;
end;
//----------------------------------------------------------------------

procedure menu(var op:integer);
 
begin
 	 clrscr;
   writeln('|--------------MENU--------------|');
   writeln('|01-Iniciar Árvore               |');
   writeln('|02-Inserir Número               |');
   writeln('|03-Retirar Número               |');
   writeln('|04-pre-ordem                    |');
   writeln('|05-pos-ordem                    |');
   writeln('|06-In-ordem                     |');
   writeln('|07-Altura da árvore             |');
   writeln('|08-Nivel do elemento            |');
   writeln('|09-Verifica se Árvore é completa|');
   writeln('|10-Mostrar Folhas               |');
   writeln('|11-Sair                         |');
   writeln('|--------------------------------|');	
   writeln('O que deseja realizar?');
  readln(op);      
end;

//----------------------------------------------------------------------  

begin 
  clrscr;
  op:=0;
  num:=1;
  contar:=0;
  while op <> 11 do
  	begin
   		menu(op);   	
   		if op =1 then 
				Begin 
      		Inicia(p);
      		writeln('Arvore Iniciada com sucesso!!');
      		readkey;
      		clrscr;
   	  	end; 
   		if op =2 then
		 		Begin
   	   		writeln('digite um número: ');
   	   		readln(item);
   	   		Insere(item,p);
   	   		if(sMensagem = '') then
   	   		writeln('item inserido com sucesso');
   	   		readkey;
   	  	end;  
   		if op =3 then
				begin
   	  		writeln('Digite o número que deseja retirar');
   	     	readln(item);
   	     	retira(item,p);
   	   		readkey;
   	  	end;
   	 	if op =4 then
				begin
   	      write('pre-ordem: ');
   	      preordem(p);
   	      readkey;
   	    end;    	 
   	 	if op =5 then
				begin
   	     	write('Pos-ordem: ');
   	     	posordem(p);
					readkey;   
   	  	end;  
   	 	if op =6 then
				begin
   	    	write('In-ordem: ');
   	      inordem(p);
   	    	readkey;
   	    end;
			if op =7 then
				begin
   	    	write('Altura: ');
   	      altura(p,num,num);
   	      write(alturatotal);
   	    	readkey;
   	    end;
			if op =8 then
				begin
					writeln('Informe o Elemento:');
	 				read (dado);	
   	    	write('Nivel: ');
   	      nivel_elemento(p,dado,num);
   	    	readkey;
   	    end;
			if op =9 then
				begin	
   	    	write('A Arvore é: ');
   	      completa(p,num,num);
   	    	readkey;
   	    end;
			if op =10 then
				begin	
   	    	write('Folhas: ');
   	      mostra_folha(p,contar);
   	      writeln('Quantidade: ',contador);
   	    	readkey;
   	    end;	 	    
   	end;	
end.