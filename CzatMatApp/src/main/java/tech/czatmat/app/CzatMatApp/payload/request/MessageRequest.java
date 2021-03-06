package tech.czatmat.app.CzatMatApp.payload.request;

import javax.validation.constraints.Size;

public class MessageRequest {


    @Size(max = 2048)
    private String text;

    @Override
    public String toString() {
        return "MessageRequest{" +
                ", text='" + text + '\'' +
                '}';
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }


}
