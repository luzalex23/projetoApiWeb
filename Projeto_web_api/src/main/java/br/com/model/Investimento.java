package br.com.model;

import java.util.List;

public class Investimento {
    private String nome;
    private String objetivo;
    private Double saldoTotal;
    private String indicadorCarencia;
    private List<Acao> acoes;

    public Investimento(String nome, String objetivo, Double saldoTotal, String indicadorCarencia, List<Acao> acoes) {
        this.nome = nome;
        this.objetivo = objetivo;
        this.saldoTotal = saldoTotal;
        this.indicadorCarencia = indicadorCarencia;
        this.acoes = acoes;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getObjetivo() {
        return objetivo;
    }

    public void setObjetivo(String objetivo) {
        this.objetivo = objetivo;
    }

    public Double getSaldoTotal() {
        return saldoTotal;
    }

    public void setSaldoTotal(Double saldoTotal) {
        this.saldoTotal = saldoTotal;
    }

    public String getIndicadorCarencia() {
        return indicadorCarencia;
    }

    public void setIndicadorCarencia(String indicadorCarencia) {
        this.indicadorCarencia = indicadorCarencia;
    }

    public List<Acao> getAcoes() {
        return acoes;
    }

    public void setAcoes(List<Acao> acoes) {
        this.acoes = acoes;
    }
}
