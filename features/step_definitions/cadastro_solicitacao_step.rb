Dado('que estou na página de cadastro de solicitacao') do
  end
  
  Quando('preencho com infomações válidas nome/email/assunto/tipo de arquivo') do
    pending 
  end
  
  Quando('clico em salvar') do
    click_on 'Salvar Solicitação'
  end
  
  Então('a solicitacao deve ter sido salva no banco de dados') do
    pending # salvar solicitacao no banco e deverei ser redirecionado a página Home
  end
  
  Quando('preencho tudo mas não o nome') do
    fill_in 'Nome', :with =>''
  end
  
  Então('deverei ver uma mensagem de erro sobre obrigatoriedade do nome') do
    expect(page).to have_content('É obrigatório informar seu nome!')
  end
  
  Quando('preencho tudo mas não o email') do
    fill_in 'Email', :with =>''
  end
  
  Então('deverei ver uma mensagem de erro sobre obrigatoriedade do email') do
    expect(page).to have_content('É obrigatório informar seu email!')
  end
  
  Quando('preencho tudo mas não o assunto') do
    fill_in 'Assunto', :with =>''
  end
  
  Então('deverei ver uma mensagem de erro sobre obrigatoriedade do assunto') do
    expect(page).to have_content('É obrigatório informar o assunto desejado!')
  end
  
  Quando('preencho o campo de e-mail com um e-mail inválido pelo formato ou dominio') do
    pending # verificar formato email
  end
  
  Então('deverei ver uma mensagem de erro sobre email não válido') do
    expect(page).to have_content('É obrigatório informar um email válido com domínio USP!')
  end