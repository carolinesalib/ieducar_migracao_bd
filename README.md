# ieducar_migracao_bd

Olá!!
Neste repositório você irá encontrar scripts para atualizar sua base de dados do i-Educar [versão antiga](https://softwarepublico.gov.br/gitlab/i-educar/i-educar) para a [versão 2.0](https://github.com/portabilis/i-educar) lançada e atualmente mantida [Portabilis](https://portabilis.com.br/).

Caso você não tenha utilizado o i-Educar na versão anterior e/ou não necessita migrar seus dados para a versão nova, então você **não precisa** realizar nenhum dos processos abaixo.


### Como realizar a migração

Após ter instalado o i-Educar conforme recomendado no [README](https://github.com/portabilis/i-educar) do projeto:

1 - Restaurar a base que deseja migrar no postgresql (o mesmo utilizado pelo i-Educar)
2 - Alterar arquivos de configuração phinx e ieducar.ini para utilizar a sua base
3 - Rodar as migrações da pasta scripts desse repositório (deve respeitar a ordem)
4 - Rodar as migrações do phinx

```
php ieducar/vendor/bin/phinx migrate -e development
```

### Observações (leia antes de migrar)

Caso encontre um erro durante alguma das migrações, não de continuidade no processo!!! Crie uma issue nesse repositório para analisarmos o problema e corrigirmos e não correr riscos de falta de integridade na migração.
