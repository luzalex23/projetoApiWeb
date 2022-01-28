<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
   const tableInvestimentos = document.querySelector('#investimentos');

   for (let i = 0; i <= investimentos.length; i++) {
        const tr = document.createElement('tr');
        //nome
        const tdNome = document.createElement('td');
        tdNome.innerHTML = investimentos[i].nome;
        tableInvestimentos.appendChild(tdNome);

        //objetivo
        const tdObjetivo = document.createElement('td');
        tdObjetivo.innerHTML = investimentos[i].objetivo;
        tableInvestimentos.appendChild(tdObjetivo);

        //SaldoTotal
        const tdSaldoTotal = document.createElement('td');
        tdSaldoTotal.innerHTML = investimentos[i].saldoTotal;
        tableInvestimentos.appendChild(tdSaldoTotal);

        tableInvestimentos.appendChild(tr);

   }


  </script>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 </body>
</html>
