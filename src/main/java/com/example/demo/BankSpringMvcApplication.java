package com.example.demo;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.example.demo.dao.ClientRepository;
import com.example.demo.dao.CompteRepository;
import com.example.demo.dao.OperationRepository;
import com.example.demo.entities.Client;
import com.example.demo.entities.Compte;
import com.example.demo.entities.CompteCourant;
import com.example.demo.entities.CompteEpargne;
import com.example.demo.entities.Retrait;
import com.example.demo.entities.Versement;

@SpringBootApplication
public class BankSpringMvcApplication implements CommandLineRunner {
	   @Autowired
	    public ClientRepository clientRepository;
	    @Autowired
	    public CompteRepository compteRepository;
	    @Autowired
	    public OperationRepository operationRepository;

	    @Autowired
	   // public IBankMetier iBankMetier;
	public static void main(String[] args) {
		 ApplicationContext ctx = SpringApplication.run(BankSpringMvcApplication.class, args);
	}

	@Override
	public void run(String... args) throws Exception {
		
		   Client c1 = clientRepository.save(new Client("KHALIL","Khalil@gmail.com"));
	        Client c2 = clientRepository.save(new Client("OUSSAMA","Oussa@gmail.com"));
	        Client c3 = clientRepository.save(new Client("NIYA","abdo@gmail.com"));

	        Compte cp1  = compteRepository.save(new CompteCourant("code1",new Date(),9000,c1,6000 ));
	        Compte cp2  = compteRepository.save(new CompteCourant("code2",new Date(),8000,c2,6000 ));
	        Compte cp3  = compteRepository.save(new CompteCourant("code3",new Date(),7000,c3,6000 ));

	        compteRepository.save(new CompteEpargne("code4",new Date(),5000,c1,5));
	       compteRepository.save(new CompteEpargne("code5",new Date(),4000,c2,6));
	        compteRepository.save(new CompteEpargne("code6",new Date(),3000,c3,7));

	       operationRepository.save(new Versement(new Date() , 3000 , cp1));
	         operationRepository.save(new Versement(new Date() , 3000 , cp1));
	        operationRepository.save(new Versement(new Date() , 3000 , cp1));
	       operationRepository.save(new Versement(new Date() , 3000 , cp1));
	        operationRepository.save(new Versement(new Date() , 3000 , cp1));
	         operationRepository.save(new Versement(new Date() , 3000 , cp1));
	       operationRepository.save(new Versement(new Date() , 3000 , cp1));
	        operationRepository.save(new Versement(new Date() , 3000 , cp1));
	        operationRepository.save(new Versement(new Date() , 3000 , cp1));
	        operationRepository.save(new Versement(new Date() , 3000 , cp1));
	         operationRepository.save(new Versement(new Date() , 2000 , cp2));
	        operationRepository.save(new Retrait(new Date() , 1000 , cp3));
		
	}

}
