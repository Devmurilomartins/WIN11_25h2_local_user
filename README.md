# Script Para instalacao do usuario local no Windows 11 versao 25H2.  

## Requisitos
1. Imagem .ISO do windows de sua preferencia
2. editor de arquivos .ISO ( eu usei o [anybrun](https://www.anyburn.com/download.php)).
3 Copiar a pasta Script  ou somente o arquivo .cmd do repositorio para dentro arquivo .ISO da imagem do windows.

## Como fazer :  
1. Editar o arquivo .ISO da instalacao do windows, criar ou adicionar uma pasta com o nome *Script*, faca o download do arquivo CreateUserAndFixOOBE.cmd e coloque dentro da pasta.
ao acessar o terminal como adminstrador (shift+F10),
2. navegue ate a particao em que se encontra a instalacao do windows*(geralmente em D:\)*
3. Rode o script pelo terminal, digite seu usuario e senha e pronto, aguarde a reiniciar.  
  
   *(Apos reinicar ignore o erro de senha e login)*
   
## O Que o Script faz:

✅ Cria o usuário local (com senha pedida)  
✅ Adiciona ao grupo Administrators  
✅ Ativa o usuário e desativa o “Administrator”  
✅ Remove o usuário defaultUser0  
✅ Agenda a remoção da pasta C:\Users\defaultuser0 no próximo boot  
✅ Corrige as chaves de registro OOBE  
✅ Exibe mensagem e reinicia automaticamente após 3 segundos  
  
  


