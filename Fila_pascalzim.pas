Program Diego_Diogo ;
Uses crt;
Type 
  fila = record 
		 v1: array[1..10] of integer;     
	   qtd_at,qtd_rec,qtd,s:integer;
	end;   
Var
  fila_mono,fila_color,fila_ploter:fila;   
  escolha,cond  : integer;
	n1,n2,n3:string; 

//Procedimento Menu
Procedure menu(var escolha : integer);
begin
  clrscr;
  writeln('(1) Pegar Senha Fila Mono');
  writeln('(2) Pegar Senha Fila Color');
  writeln('(3) Pegar Senha Fila Ploter');
  writeln('(4) Retirar Pessoa na Fila Mono');
  writeln('(5) Retirar Pessoa na Fila Color');
  writeln('(6) Retirar Pessoa na Fila Ploter');
  writeln('(7) Mostrar Status Fila Mono');
  writeln('(8) Mostrar Status Fila Color');
  writeln('(9) Mostrar Status Fila Ploter');
  writeln('(10) Relatório');
  writeln('(11) Sair');
	writeln();
  write('Escolha: ');
  readln(escolha);  
end;

//Procedimento Inserir Mono, Color, Ploter
Procedure insere(var f:fila;qtd:integer);
 
begin
  clrscr;
	if f.qtd=qtd then
		begin
			writeln('Fila Cheia');
			writeln();			
			writeln('Clique para Sair');
			f.qtd_rec:= f.qtd_rec+1;
		end	
	else
		begin
			f.qtd:=f.qtd+1;
			f.s:=f.s+1;
			f.v1[f.qtd]:=f.s;
			Writeln('Seu código:',f.s);
			writeln ('Clique para sair');
		end;	                 
  readkey;
end;

//Prcedimento para Escrever Mono, Color, Ploter
procedure escreve(var f:fila;n:string;r:integer);
var i,q:integer;
	
begin
	if (r=1) or (r=3) then
		clrscr;
	if f.qtd=0 then
		begin
			writeln('Fila ',n,': Fila Vazia');
			writeln('');
		end
	else
		begin
			write ('Fila ',n,':');
			writeln ('Contem os seguintes dados:');
			writeln ('Quantidade na Fila:');
			q:=f.qtd;
			for i:=1 to q do
				writeln(f.v1[i]);
			writeln('<-------------------->');
			writeln('Quantidadde de atendidos:',f.qtd_at);
			writeln('Quantidadde de recusados:',f.qtd_rec);			
			writeln('<-------------------->');
			writeln ('');
		end;
	if (r=2) or (r=3) then
  	begin
			writeln('Clique para sair');
			readkey;
		end	
end;	 

//Procedimento Remover da Fila Mono, Color, Ploter
Procedure remover(var f:fila);
var i,q:integer;
	
begin
  clrscr;
	if f.qtd=0 then
		begin
			writeln('Fila Vazia');
			writeln();
			writeln('Clique para Sair');
		end	
	else
		begin
			f.qtd:=f.qtd-1;
			f.qtd_at:=f.qtd_at+1;
			q:=f.qtd;
			for i:=1 to q do
				f.v1[i]:=f.v1[i+1];
			writeln ('Removido com Sucesso');
			writeln ('Clique para sair');			
		end;
		readkey;
end;

// Procedimento Sair
Procedure sair(var cond : integer);
begin
  cond :=0; 
end;


Begin
	n1:='Mono';
	n2:='Color';
	n3:='Ploter';
  escolha := 0; 
  cond := 1;
  while cond>0 do 
  begin
    menu(escolha);
		if escolha = 1 then 
		  insere(fila_mono,10)
		else if escolha = 2 then
		  insere(fila_color,5) 
		else if escolha = 3 then 
		  insere(fila_ploter,3)
		else if escolha =4 then
		  remover(fila_mono)
		else if escolha = 5 then
		  remover(fila_color)	  
		else if escolha = 6 then 
		  remover(fila_ploter)
		else if escolha = 7 then 
		  escreve(fila_mono,n1,3)
		else if escolha = 8 then 
		  escreve(fila_color,n2,3)
		else if escolha = 9 then 
		  escreve(fila_ploter,n3,3)                 
		else if escolha = 10 then
			begin
				escreve(fila_mono,n1,1);
				escreve(fila_color,n2,0);
				escreve(fila_ploter,n3,2);
			end	  
		else if escolha = 11 then
			sair(cond);       
  end;
	writeln();
  writeln('Clique para Sair');
  readkey;  
End.