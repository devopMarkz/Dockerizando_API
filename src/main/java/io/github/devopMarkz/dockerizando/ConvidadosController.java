package io.github.devopMarkz.dockerizando;

import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.ArrayList;
import java.util.List;

@RestController
@RequestMapping("/")
@CrossOrigin("*")
public class ConvidadosController {

    @GetMapping
    public List<Convidado> getConvidados() {
        List<Convidado> convidados = new ArrayList<>();
        convidados.add(new Convidado("Marcos", "18274635263"));
        convidados.add(new Convidado("Vitor", "82736459657"));
        return convidados;
    }

}
