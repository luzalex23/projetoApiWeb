package br.com.model;

public class Resposta {

    private String status;
    private ResponseData data;

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public ResponseData getData() {
        return data;
    }

    public void setData(ResponseData data) {
        this.data = data;
    }

    @Override
    public String toString() {
        return "Response{" +
                "status='" + status + '\'' +
                ", data=" + data +
                '}';
    }
}
