<%--
  Created by IntelliJ IDEA.
  User: alex_
  Date: 26/01/2022
  Time: 19:37
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<meta http-equiv="Content-Type" content="text/xhtml; charset=UTF-8" />
<html lang="pt-br">
<head>
    <meta charset="UTF-8"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <title>AÇÕES</title>
</head>
<body>
<nav class="navbar navbar-light bg-secondary ">
    <a class="navbar-brand" href="/">SuperInvestr</a>
</nav>
<div class="container">
    <h1>Dados de Investimento</h1>
    <table class="table">
        <theader>
            <tr>
                <th>Nome</th>
                <th>Objetivo</th>
                <th>Saldo total</th>
            </tr>
            <tr>
                <td id="nome"></td>
                <td id="objetivo"></td>
                <td id="saldoTotal"></td>
            </tr>
        </theader>

        <tbody id="acoes">

        </tbody>
    </table>
</div>

<div class="container">
    <h1>Resgate</h1>
</div>

<div class="container">
    <table class="table">
        <theader>
            <th>Ação</th>
            <th id="saldoCumulado">Saldo acumulado</th>
            <th id="ValorAResgatar">Valor a resgatar</th>
        </theader>
        <tbody id="linhas">
        </tbody>
    </table>
</div>
<script>
    const investimentos = ${acoes}
    let { status, data} = investimentos.response
    let listaDeInvestimentos = data.listaInvestimentos
    const id = parseInt(location.search.match(/\d/g)[0])
    var {nome, objetivo, saldoTotal, indicadorCarencia, acoes} =  listaDeInvestimentos[id]
    //verifica retorno da api
    if(status !== '200'){
        document.body.innerHTML = `<div class='alert alert-danger'>
                                       <strong>Error de requisição! </strong>
                                       Foi encontrado um erro na sua requisição com a API.
                                    </div>`;
    }
    // getters tags
    const idNome = document.querySelector('#nome').innerHTML = nome
    const idObjetivo = document.querySelector('#objetivo').innerHTML = objetivo
    const idSaldoTotal = document.querySelector('#saldoTotal').innerHTML = saldoTotal.toLocaleString('pt-BR', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    })
    // iteração sobre ações
    const linhas = document.querySelector('#linhas')
    acoes.forEach((index, value) => {
        const row = document.createElement('tr')
        const nome = document.createElement('td')
        nome.innerHTML = index.nome
        const calc = document.createElement('td')
        calc.innerHTML = ((saldoTotal/100) * index.percentual).toLocaleString('pt-BR', {
            minimumFractionDigits: 2,
            maximumFractionDigits: 2
        })
        calc.classList.add('acumulado')
        const input = document.createElement('input')
        input.setAttribute('id', index.id)
        const div = document.createElement('div')
        div.setAttribute('class', 'input-group mb-3')
        const divDollar = document.createElement('div')
        divDollar.setAttribute('class','input-group-prepend')
        const spanDollar = document.createElement('span')
        spanDollar.setAttribute('class','input-group-text')
        spanDollar.innerHTML = 'R$'

        input.setAttribute('size', 40)
        input.setAttribute('class', 'form-control')

        div.appendChild(divDollar)
        div.appendChild(spanDollar)
        div.appendChild(input)
        row.appendChild(nome)
        row.appendChild(calc)
        row.appendChild(div)
        linhas.appendChild(row)

    })

    const inputs = document.querySelectorAll('input')
    let tds = document.querySelectorAll('.acumulado')
    const tam = inputs.length

    for (let i = 0; i < tam; i++){
        inputs[i].onkeyup = () => {
            $(function() {
                $('#'+inputs[i].id).maskMoney({decimal: ',', thousands: '.'});
                let number = parseFloat(tds[i].innerHTML.replace(/\.+/g,'').replace(/\,/g,'.'))
                let campo = parseFloat(inputs[i].value.replace(/\.+/g,'').replace(/\,/,'.'))
                console.log(campo, number)
                console.log(campo > number)
                if(campo > number){
                    let span = document.createElement('span')
                    span.style.color = 'red'
                    span.innerHTML =  `O valor a resgatar não pode ser maior que: `+ tds[i].innerHTML
                    tds[i].appendChild(span)
                }
            });
        }
    }

</script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="//ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="//plentz.github.io/jquery-maskmoney/javascripts/jquery.maskMoney.min.js"></script>

</body>
</html>
