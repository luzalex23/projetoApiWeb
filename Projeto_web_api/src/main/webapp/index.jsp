<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
<html lang="pt-br">
 <head>
  <meta charset="UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
  <title>BEM VINDO</title>
 </head>
 <body>
  <div class="p-5 bg-primary text-white text-center">
   <h1>Bem vindo a SuperInvest </h1>
   <p>Sua carteira digital de investimentos.</p>
  </div>
   <table class="table table-striped table-hover mt-5 text-center">
       <theader><tr> <th>Nome</th> <th>Objetivo</th> <th>Saldo Total</th> </tr></theader>
       <tbody id="investimentos"></tbody>
   </table>


  <script>

   const investimentos = ${investimento};
   let tableInvestimentos = document.querySelector('#investimentos');
   let { status, data} = investimentos.response
   let listaDeInvestimentos = data.listaInvestimentos
   if(status !== '200'){
    tableInvestimentos.innerHTML = `<div class='alert alert-danger'>
                                                     <strong>Error de requisição! </strong>
                                                     Foi encontrado um erro na sua requisição com a API.
                                         </div>`;
   }
   if(status === '200') {
    for (let i = 0; i < listaDeInvestimentos.length; i++) {
     const tr = document.createElement('tr');
     const id = i
     tr.setAttribute('id', id)
     if(listaDeInvestimentos[i].indicadorCarencia !== 'N')tr.style.backgroundColor = 'gray'
     //nome
     const tdNome = document.createElement('td');
     tdNome.innerHTML = listaDeInvestimentos[i].nome;
     tr.appendChild(tdNome);

     //objetivo
     const tdObjetivo = document.createElement('td');
     tdObjetivo.innerHTML = listaDeInvestimentos[i].objetivo;
     tr.appendChild(tdObjetivo);

     //SaldoTotal
     const tdSaldoTotal = document.createElement('td');
     tdSaldoTotal.innerHTML = listaDeInvestimentos[i].saldoTotal.toLocaleString('pt-BR', {
      minimumFractionDigits: 2,
      maximumFractionDigits: 2
     });
     tr.appendChild(tdSaldoTotal);

     tableInvestimentos.appendChild(tr);
    }

   }
   const getRequisicao = (param) => {
         if(listaDeInvestimentos[param].indicadorCarencia !== 'N') return;
         return window.location = '/acoes?id='+param
   }
   tableInvestimentos.addEventListener('click', (e) => {
     let getId = e.target.parentElement.id
     getRequisicao(getId)
   })


  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 </body>
</html>
