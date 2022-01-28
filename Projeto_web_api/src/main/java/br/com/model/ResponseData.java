package br.com.model;

import java.util.List;

public class ResponseData {
    private List<Investimento> listaInvestimentos;

    public List<Investimento> getListaInvestimentos() {
        return listaInvestimentos;
    }

    public void setListaInvestimentos(List<Investimento> listaInvestimentos) {
        this.listaInvestimentos = listaInvestimentos;
    }
}
