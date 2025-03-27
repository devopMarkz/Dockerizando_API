package io.github.devopMarkz.dockerizando;

import org.springframework.beans.factory.annotation.Autowired;
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

    @Autowired
    private ConvidadosRepository convidadosRepository;

    @GetMapping
    public List<Convidado> getConvidados() {
        return convidadosRepository.findAll();
    }

}
