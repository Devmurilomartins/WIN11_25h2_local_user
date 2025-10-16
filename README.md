# Script Para instalacao do usuario local no Windows 11 versao 25H2.  

## Requisitos
1. Imagem .ISO do windows de sua preferencia
2. editor de arquivos .ISO ( eu usei o [anybrun](https://www.anyburn.com/download.php)).
3. Copiar a pasta Script  ou somente o arquivo .cmd do repositorio para dentro arquivo .ISO da imagem do windows.

## Como fazer :  
1. Crie uma pasta "Script" e  depois faca download do arquivo [CreateUserAndFixOOBE.cmd](https://github.com/Devmurilomartins/WIN11_25h2_local_user/blob/main/script/CreateUserAndFixOOBE.cmd)
2. Abra com seu editor de .ISO [anybrun](https://www.anyburn.com/download.php) o arquivo .ISO da instalacao do windows, e adicione a pasta "Script"
3. Na tela de instalacao do windows abra o terminal como Administrador pressionando as teclas "shift + F10"
4. navegue ate a particao em que se encontra a instalacao do windows*(geralmente em D:\)* procure pela pasta "Script" e abra ela
5. Rode o script pelo terminal, digite seu usuario e senha e pronto, aguarde a reiniciar.  
  
   *(Apos reinicar ignore o erro de senha e login)*
   
## O Que o Script faz:

✅ Cria o usuário local (com senha pedida)  
✅ Adiciona ao grupo Administrators  
✅ Ativa o usuário e desativa o “Administrator”  
✅ Remove o usuário defaultUser0  
✅ Agenda a remoção da pasta C:\Users\defaultuser0 no próximo boot  
✅ Corrige as chaves de registro OOBE  
✅ Exibe mensagem e reinicia automaticamente após 3 segundos  
  
  


