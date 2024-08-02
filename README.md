# Aplicativo de Login com Firebase Authentication

Este aplicativo demonstra a implementação de um sistema de login básico utilizando o `firebase_auth` no Flutter. Ele oferece duas opções de autenticação: via Google e via e-mail/senha. Além disso, o aplicativo permite que novos usuários criem uma conta.

## Funcionalidades Principais

- **Login com Google**: Permite que os usuários façam login utilizando suas contas do Google.
- **Login com E-mail e Senha**: Permite que os usuários façam login utilizando um e-mail e senha previamente cadastrados.
- **Cadastro de Novos Usuários**: Os usuários podem criar uma nova conta fornecendo um e-mail e senha.

## Como Utilizar

### Login com Google

1. Abra o aplicativo.
2. Clique no botão "Login com Google".
3. Escolha a conta Google que deseja usar para o login.
4. Após a autenticação bem-sucedida, você será redirecionado para a página principal do aplicativo.

### Login com E-mail e Senha

1. Abra o aplicativo.
2. Insira seu e-mail e senha nos campos apropriados.
3. Clique no botão "Login".
4. Após a autenticação bem-sucedida, você será redirecionado para a página principal do aplicativo.

### Criar uma Conta

1. Abra o aplicativo.
2. Clique no link ou botão "Criar Conta" ou "Registrar".
3. Insira seu e-mail e escolha uma senha segura.
4. Clique no botão "Registrar".
5. Após a criação da conta, você pode fazer login utilizando o método de e-mail e senha.

## Pré-requisitos

- Conta no Firebase com `firebase_auth` configurado.
- Conta Google para autenticação.
- Flutter SDK instalado.

## Configuração

1. **Configurar Firebase no seu Projeto Flutter**:
   - Adicione o `firebase_auth` e o `google_sign_in`  ao seu arquivo `pubspec.yaml`.
   - Configure o Firebase no seu projeto seguindo as [instruções oficiais](https://firebase.google.com/docs/flutter/setup).

2. **Configuração de Autenticação no Firebase**:
   - Habilite os provedores de autenticação desejados no console do Firebase.

## Notas

- Certifique-se de lidar com erros de autenticação apropriadamente para melhorar a experiência do usuário.
- Mantenha suas dependências atualizadas para garantir a segurança e a compatibilidade.
