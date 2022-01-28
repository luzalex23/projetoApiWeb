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
        //nome
        const tdNome = document.createElement('td');
        tdNome.innerHTML = listaDeInvestimentos[i].nome;
        tableInvestimentos.appendChild(tdNome);

        //objetivo
        const tdObjetivo = document.createElement('td');
        tdObjetivo.innerHTML = listaDeInvestimentos[i].objetivo;
        tableInvestimentos.appendChild(tdObjetivo);

        //SaldoTotal
        const tdSaldoTotal = document.createElement('td');
        tdSaldoTotal.innerHTML = listaDeInvestimentos[i].saldoTotal;
        tableInvestimentos.appendChild(tdSaldoTotal);

        tableInvestimentos.appendChild(tr);
    }

}